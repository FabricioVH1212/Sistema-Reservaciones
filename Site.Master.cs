using Sistema_Reservaciones.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Reservaciones
{
    /*
       Autor: Fabricio Vindas Hernandez

       Descripción: En esta clase viene toda la lógica del sitio maestro de la página
       Historial de modificaciones

       Fecha			Nombre					Resumen de Revisión
       --------		--------------			---------------------
       09/11/2021	  Fabricio Vindas 	        Creación del archivo
   */ 
    public partial class SiteMaster : MasterPage
    {
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función de carga del inicio de la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DSC_NOMBRE"] != null){
                    lnk_bienvenida.Text = "Bienvenido/a " + Session["DSC_NOMBRE"].ToString();
                    lnk_cerrarSesion.Visible = true;

                    if ((bool)Session["DSC_NIVEL"] == true){
                        lnk_gestionarReservaciones.Visible = true;
                        lnk_habitaciones.Visible = true;
                    }else{
                        lnk_misReservaciones.Visible = true;
                    }
                }
            }
         }
        /*  Autor: Fabricio Vindas Hernandez
          Descripción: Función para cerrar la sesión*/
        protected void lnk_cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}