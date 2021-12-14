using Sistema_Reservaciones.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Reservaciones.Pages
{
    /*
      Autor: Fabricio Vindas Hernandez

      Descripción: En esta clase viene toda la lógica de la página para gestionar las reservaciones
      Historial de modificaciones

      Fecha			Nombre					Resumen de Revisión
      --------		--------------			---------------------
      15/11/2021	Fabricio Vindas	    Creación del archivo
  */
    public partial class ListaHabitaciones : System.Web.UI.Page
    {
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función inicial al cargarse la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validación de la existencia de una sesión activa por parte del usuario que quiere usar el sistema
            if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null){
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (!IsPostBack){
                LlenarHabitacion();
            }

        }
        /*  Autor: Fabricio Vindas Hernandez
       Descripción: Función para llenar los datos de la habitación en la tabla*/
        protected void LlenarHabitacion ()
        {
            try{
                using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                    var listaHabitaciones = db.proc_ConsultarHabitaciones().ToList();

                    grd_Habitaciones.DataSource = listaHabitaciones;
                    grd_Habitaciones.DataBind();
                }
            }catch{
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al cargar las habitaciones!', 'error') </script>");
            }
        }
    }
}