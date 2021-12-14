using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Reservaciones.Pages.Default
{
    /*
    Autor: Fabricio Vindas Hernandez

    Descripción: En esta clase viene toda la lógica de la interfaz success
    Historial de modificaciones

    Fecha			Nombre					Resumen de Revisión
    --------		--------------			---------------------
    05/12/2021		Fabricio Vindas Hernandez			    Creación del archivo
    */
    public partial class success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null){
                Response.Redirect("~/Pages/Login.aspx");
            }

            Redireccionar(sender,e);
        }
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función de redireccionamiento dependiendo el tipo de sesión abierto*/
        protected void Redireccionar(object sender, EventArgs e)
        {
            if ((bool)Session["DSC_NIVEL"] == true){
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }else{
                Response.Redirect("~/Pages/MisReservaciones.aspx");
            }
        }
    }
}