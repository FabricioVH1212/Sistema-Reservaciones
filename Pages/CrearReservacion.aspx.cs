using Sistema_Reservaciones.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Reservaciones.Pages
{
    /*
      Autor: Fabricio Vindas Hernandez

      Descripción: En esta clase viene toda la lógica de la página para crear las reservaciones
      Historial de modificaciones

      Fecha			Nombre					Resumen de Revisión
      --------		--------------			---------------------
      09/11/2021    Fabricio Vindas		     Creación del archivo
  */
    public partial class CrearReservacion : System.Web.UI.Page
    {
        //Declaración de variables
        string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter sqlDa;
        DataSet ds;
        Reservacion reservacion;
        Habitacion habitacion;

        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función inicial al cargarse la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validación de la existencia de una sesión activa por parte del usuario que quiere usar el sistema
            if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null){
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (!IsPostBack){
                LlenarHotel();
                LlenarCliente();
            }

            if ((bool)Session["DSC_NIVEL"] == true){
                cmb_cliente.Enabled = true;
            }else{
                cmb_cliente.Enabled = false;
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
      Descripción: Función para llenar los datos del cliente en el combobox
      */
        protected void LlenarCliente()
        {
            var listaDB = new List<ListItem>();
           
            using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                var sql = (from Persona in db.proc_ConsultarCliente()
                           select new ListItem{
                               Text = Persona.nombreCompleto,
                               Value = Persona.idPersona.ToString()
                           }).ToList();

                listaDB.AddRange(sql);
            }
            cmb_cliente.DataSource = listaDB;
            cmb_cliente.DataTextField = "Text";
            cmb_cliente.DataValueField = "Value";
            cmb_cliente.DataBind();
            cmb_cliente.Items.Insert(0, new ListItem("<Seleccione un cliente>", "0"));
            //Si el usuario es cliente, selecciono su id con la sesión del mismo
            if ((bool)Session["DSC_NIVEL"] == false){
                Persona persona = new Persona();
                persona.idPersona = int.Parse((Session["IDE_PERSONA"].ToString()));
                cmb_cliente.Items.FindByValue(persona.idPersona.ToString()).Selected = true;
            }  
        }
        /*  Autor: Fabricio Vindas Hernandez
       Descripción: Función para llenar los datos del hotel en el combobox
       */
        protected void LlenarHotel()
        {
            SqlConnection sqlConectar = new SqlConnection(conectar);
            cmd = new SqlCommand("proc_ConsultarHotel", sqlConectar)
            { CommandType = CommandType.StoredProcedure };
            sqlDa = new SqlDataAdapter(cmd.CommandText, sqlConectar);
            ds = new DataSet();
            sqlDa.Fill(ds);

            cmb_hotel.DataSource = ds;
            cmb_hotel.DataTextField = "nombre";
            cmb_hotel.DataValueField = "idHotel";
            cmb_hotel.DataBind();
            cmb_hotel.Items.Insert(0, new ListItem("<Seleccione un hotel>", "0"));
        }
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función para insertar los datos de la habitación a la base de datos*/
        protected void GuardarReservacion(object sender, EventArgs e)
        {
            try
            {
                //Parseo de variables
                habitacion = new Habitacion();
                reservacion = new Reservacion();
                Random random = new Random();
                habitacion.idHotel = int.Parse(cmb_hotel.Text);
                reservacion.idPersona = int.Parse(cmb_cliente.Text);
                reservacion.fechaEntrada = DateTime.Parse(txt_fecEntrada.Text);
                reservacion.fechaSalida = DateTime.Parse(txt_fecSalida.Text);
                reservacion.numeroNinhos = int.Parse(txt_numeroNinos.Text);
                reservacion.numeroAdultos = int.Parse(txt_numeroAdultos.Text);

                //Definir habitación del hotel
                reservacion.idHabitacion = random.Next(1, 40);

                //Calculo del total de dias de reservación
                if (txt_fecEntrada.Text == txt_fecSalida.Text)
                {
                    reservacion.totalDiasReservacion = 1;
                }
                else
                {
                    TimeSpan dias = reservacion.fechaEntrada.Subtract(reservacion.fechaSalida);
                    reservacion.totalDiasReservacion = dias.Days;
                }

                //Calculo de costos y parseo
                using (SistemaReservacionEntities db = new SistemaReservacionEntities())
                {

                    reservacion.idReservacion = (int)db.proc_ConseguirID().FirstOrDefault(); //Hagarro el último ID existente y le sumo 1
                    var hotelDB = db.proc_ConsultarHotelPorId(habitacion.idHotel).FirstOrDefault();

                    if (hotelDB != null)
                    {
                        reservacion.costoPorCadaAdulto = hotelDB.costoPorCadaAdulto;
                        reservacion.costoPorCadaNinho = hotelDB.costoPorCadaNinho;

                        //Calculo del costo total
                        reservacion.costoTotal = reservacion.totalDiasReservacion * (reservacion.numeroAdultos * reservacion.costoPorCadaAdulto) + (reservacion.numeroNinhos * reservacion.costoPorCadaNinho);
                    }
                    //Creación de la reservación 
                    db.proc_CrearReservacion(reservacion.idPersona,
                                             reservacion.idHabitacion,
                                             reservacion.fechaEntrada,
                                             reservacion.fechaSalida,
                                             reservacion.numeroAdultos,
                                             reservacion.numeroNinhos,
                                             reservacion.totalDiasReservacion,
                                             reservacion.costoPorCadaAdulto,
                                             reservacion.costoPorCadaNinho,
                                             reservacion.costoTotal);
                    //Creación de la bitacora
                    db.proc_CrearBitacora(reservacion.idReservacion, (int?)Session["IDE_PERSONA"]);

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                         "<script> swal({title: 'Éxito'," +
                         "text: ' Los datos se han guardado satisfactoriamente!'," +
                         "type: 'success',confirmButtonColor: '#DD6B55',confirmButtonText: 'Continuar!'," +
                         "closeOnConfirm: false}," +
                         "function() {window.location.href = 'Default/success.aspx';}); </script>");
                }
            }catch{
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al insertar los datos!', 'error') </script>");
            }            
        }
        /*  Autor: Fabricio Vindas Hernandez
          Descripción: Función de redireccionamiento dependiendo el tipo de sesión abierto*/
        protected void Redireccionar(object sender, EventArgs e)
        {
            if ((bool)Session["DSC_NIVEL"] == true){
                Response.Redirect("GestionarReservaciones.aspx");
            }
            else if ((bool)Session["DSC_NIVEL"] == false){
            Response.Redirect("MisReservaciones.aspx");
            }else{
                Response.Redirect("Login.aspx");
            }
         
        }
        /* ¡¡Funciones de validación de formularios!! */
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Validación de la fecha de entrada que sea menor o igual a la actual*/
        protected void cv_fecEntrada_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try{
                args.IsValid = false;

                if (args.Value != null){
                    if (DateTime.Parse(args.Value) <= DateTime.Today){
                        args.IsValid = true;
                    }
                }
            }
            catch{
                args.IsValid = false;
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Validación de la fecha de salida que sea menor o igual a la de entrada*/
        protected void cv_fecSalida_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try{
                args.IsValid = false;

                if (args.Value != null){
                    if (DateTime.Parse(args.Value) < DateTime.Parse(txt_fecEntrada.Text)){
                        args.IsValid = true;
                    }
                }
            }
            catch{
                args.IsValid = false;

            }
        }
    }
}