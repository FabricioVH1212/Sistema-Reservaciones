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

      Descripción: En esta clase viene toda la lógica de la página para crear las habitaciones
      Historial de modificaciones

      Fecha			Nombre					Resumen de Revisión
      --------		--------------			---------------------
      15/11/2021    Fabricio Vindas 	  Creación del archivo
  */
    public partial class CrearHabitacion : System.Web.UI.Page
    {
        //Declaración de variables
        string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter sqlDa;
        DataSet ds;
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
            }
        }

        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función para llenar los datos del hotel en el combobox*/
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
        protected void GuardarHabitacion(object sender, EventArgs e)
        {
            try
            {
                habitacion = new Habitacion();
                habitacion.idHotel = int.Parse(cmb_hotel.Text);
                habitacion.numeroHabitacion = txt_numero.Text;
                habitacion.capacidadMaxima = int.Parse(txt_capacidad.Text);
                habitacion.descripcion = txt_descripcion.Text;

                using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                    db.proc_CrearHabitacion(habitacion.idHotel, habitacion.numeroHabitacion, habitacion.capacidadMaxima, habitacion.descripcion);
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                         "<script> swal({title: 'Éxito'," +
                         "text: ' Los datos se han guardado satisfactoriamente!'," +
                         "type: 'success',confirmButtonColor: '#DD6B55',confirmButtonText: 'Volver a la lista de habitaciones!'," +
                         "closeOnConfirm: false}," +
                         "function() {window.location.href = 'ListaHabitaciones.aspx';}); </script>");
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al insertar los datos!', 'error') </script>");
            }
        }
        /* ¡¡Funciones de validación de formularios!! */
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Validación de que el número existe en la base de datos*/
        protected void cv_numero_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try{
                args.IsValid = false;
                if (IsPostBack == false){
                     using (var db = new SistemaReservacionEntities()){
                        var habitacionDB = db.proc_ConsultarHabitaciones().FirstOrDefault();

                        if (habitacionDB != null){
                             habitacion.numeroHabitacion = habitacionDB.numeroHabitacion.ToString();
                            if(habitacion.numeroHabitacion == txt_numero.Text){
                                args.IsValid = true;
                            }else{
                                args.IsValid = false;
                            }
                        }
                    }
                }
            }
            catch{
                args.IsValid = false;
            }
        }
     }
}