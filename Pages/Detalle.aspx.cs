using Sistema_Reservaciones.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Reservaciones.Pages
{
    /*
     Autor: Fabricio Vindas Hernandez

     Descripción: En esta clase viene toda la lógica de la página para ver el detalle de reservacones
     Historial de modificaciones

     Fecha			Nombre					Resumen de Revisión
     --------		--------------			---------------------
     09/11/2021		Fabricio Vindas 	    Creación del archivo
 */
    public partial class DetalleReservacion : System.Web.UI.Page
    {
        //Declaración de variables
        string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        Bitacora bitacora = new Bitacora();
        Reservacion reservacion = new Reservacion();

        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función inicial al cargarse la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                //Validación de la existencia de una sesión activa por parte del usuario que quiere usar el sistema
                if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null) {
                    Response.Redirect("~/Pages/Login.aspx");
                }

                reservacion.idReservacion = int.Parse(Request.QueryString["id"]);
                //Consulto el estado
                using (var db = new SistemaReservacionEntities()){
                    reservacion.estado = db.proc_ConsultarEstadoReservacion(reservacion.idReservacion).FirstOrDefault();
                    var fechaDB = db.proc_ConsultarFecha(reservacion.idReservacion).FirstOrDefault();
                    if (fechaDB != null){
                        reservacion.fechaEntrada = fechaDB.fechaEntrada;
                        reservacion.fechaSalida = fechaDB.fechaSalida;
                    }
                }
                TablaReservacion();
                TablaBitacora();
                //Reglas de restricción botones
                // **Boton de Editar reservación**
                if ((bool)Session["DSC_NIVEL"] == false){
                    if (reservacion.estado == "A" && reservacion.fechaEntrada > DateTime.Today){
                        lnk_editar.Visible = true;
                    }else{
                        lnk_editar.Visible = false;
                    }
                }
                else if ((bool)Session["DSC_NIVEL"] == true){
                    if (reservacion.estado == "A" && reservacion.fechaSalida > DateTime.Today){
                        lnk_editar.Visible = true;
                    }else{
                        lnk_editar.Visible = false;
                    }
                }
                //**Boton de Cancelar reservación * *
                    if (reservacion.estado == "A" && reservacion.fechaEntrada > DateTime.Today){
                        btn_eliminar.Visible = true;
                    }else{
                        btn_eliminar.Visible = false;
                    }
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
          Descripción: Función para cargar la tabla donde viene los detalles de la reservación */
        protected void TablaReservacion()
        {
            using (var db = new SistemaReservacionEntities()) {
                var reservacionDB = db.proc_ConsultarDetalleReservacion(reservacion.idReservacion).FirstOrDefault();

                if (reservacionDB != null) {
                    tbc_idReservacion.Text = reservacionDB.idReservacion.ToString();
                    tbc_numeroHabitacion.Text = reservacionDB.numeroHabitacion.ToString();
                    tbc_cliente.Text = reservacionDB.nombre;
                    tbc_fecEntrada.Text = reservacionDB.fechaEntrada.ToString();
                    tbc_fecSalida.Text = reservacionDB.fechaSalida.ToString();
                    tbc_diasReserva.Text = reservacionDB.totalDiasReservacion.ToString();
                    tbc_numeroNinos.Text = reservacionDB.numeroNinhos.ToString();
                    tbc_numeroAdultos.Text = reservacionDB.numeroAdultos.ToString();
                    tbc_costos.Text = reservacionDB.costoTotal.ToString();
                }
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
         Descripción: Función para cargar la tabla donde viene los detalles de la bitacora */
        protected void TablaBitacora()
        {
            try {
                using (var db = new SistemaReservacionEntities()) {
                    var listaBitacora = db.proc_ConsultarDetalleBitacora(reservacion.idReservacion).ToList();

                    grd_Bitacora.DataSource = listaBitacora;
                    grd_Bitacora.DataBind();
                }
            } catch {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al activar los datos!', 'error') </script>");
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función para cancelar una reservación*/
        protected void Eliminar(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                try
                {
                    using (SistemaReservacionEntities db = new SistemaReservacionEntities())
                    {
                        //Edición de reservación
                        db.proc_CancelarReservacion(reservacion.idReservacion);
                        //Creación de bitacora
                        db.proc_CancelarBitacora(reservacion.idReservacion, (int)Session["IDE_PERSONA"]);

                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                        "<script> swal({title: 'Éxito'," +
                        "text: ' Los datos de la reservación se han guardado satisfactoriamente!'," +
                        "type: 'success',confirmButtonColor: '#DD6B55',confirmButtonText: 'Continuar!'," +
                        "closeOnConfirm: false}," +
                        "function() {window.location.href = 'Default/success.aspx';}); </script>");
                    }
                }
                catch{
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al cancelar la reservación!', 'error') </script>");
                }
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
    }
}