using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using Sistema_Reservaciones.Data;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Sistema_Reservaciones.Pages
{
    /*
       Autor: Fabricio Vindas Hernandez

       Descripción: En esta clase viene toda la lógica de la página para gestionar las reservaciones
       Historial de modificaciones

       Fecha			Nombre					Resumen de Revisión
       --------		--------------			---------------------
       09/11/2021	  Fabricio Vindas         Creación del archivo
   */
    public partial class GestionarReservaciones : System.Web.UI.Page
    {
        //Declaración de variables
        string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter sqlDa;
        DataSet ds;

        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función inicial al cargarse la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validación de la existencia de una sesión activa por parte del usuario que quiere usar el sistema
            if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null)
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                LLenarCliente();
                LlenarReservacion();
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función para llenar los datos de la reservación en la tabla*/
        protected void LlenarReservacion()
        {
            try{
                using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                    var listaReservaciones = db.proc_ConsultarReservaciones().ToList();

                    grd_Reservaciones.DataSource = listaReservaciones;
                    grd_Reservaciones.DataBind();
                }
            }catch{

            }
        }
        /*  Autor: Fabricio Vindas Hernandez
       Descripción: Función para llenar los datos del cliente en el combobox*/
        protected void LLenarCliente()
        {
            SqlConnection sqlConectar = new SqlConnection(conectar);
            cmd = new SqlCommand("proc_ConsultarCliente", sqlConectar)
            { CommandType = CommandType.StoredProcedure };
            sqlDa = new SqlDataAdapter(cmd.CommandText, sqlConectar);
            ds = new DataSet();
            sqlDa.Fill(ds);

            cmb_cliente.DataSource = ds;
            cmb_cliente.DataTextField = "nombreCompleto";
            cmb_cliente.DataValueField = "idPersona";
            cmb_cliente.DataBind();
            cmb_cliente.Items.Insert(0, new ListItem("<Seleccione una persona>", "0"));
        }
        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función para filtrar reservación con los datos del formulario */
        private void FiltrarReservacion()
        {
            try{
                SqlConnection sqlConectar = new SqlConnection(conectar);
                cmd = new SqlCommand("proc_FiltroReservaciones", sqlConectar)
                { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add("@P_idPersona", SqlDbType.Int).Value = cmb_cliente.SelectedValue;
                cmd.Parameters.Add("@P_fechaEntrada", SqlDbType.DateTime).Value = txt_fecEntrada.Text;
                cmd.Parameters.Add("@P_fechaSalida", SqlDbType.DateTime).Value = txt_fecSalida.Text;
                cmd.Connection = sqlConectar;
                sqlConectar.Open();
                grd_Reservaciones.DataSource = cmd.ExecuteReader();
                grd_Reservaciones.DataBind();
            }
            catch{
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error en las consultas!', 'error') </script>");
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
       Descripción: Botón de acción para filtrar los campos */
        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            FiltrarReservacion();
        }
      }
}