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

        Descripción: En esta clase viene toda la lógica de la página login para ingresar al sistema
        Historial de modificaciones

        Fecha			Nombre					Resumen de Revisión
        --------		--------------			---------------------
        09/11/2021		Fabricio Vindas 	    Creación del archivo
    */
    public partial class Login : System.Web.UI.Page
    {
        //Declaración de variables
        string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter sqlDa;
        DataTable dt;
        Persona persona;
        int fila;

        /*  Autor: Fabricio Vindas Hernandez
         Descripción: Función de carga del inicio de la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        /*  Autor: Fabricio Vindas Hernandez
          Descripción: Función para ingresar los datos del usuario*/
        protected void IngresarUsuario(object sender, EventArgs e)
        {
            //Inicialización de variables
            SqlConnection sqlConectar = new SqlConnection(conectar);
            cmd = new SqlCommand("proc_ValidarUsuario", sqlConectar)
            { CommandType = CommandType.StoredProcedure };
            sqlDa = new SqlDataAdapter(cmd.CommandText, sqlConectar);
            dt = new DataTable();
            persona = new Persona();
            sqlDa.Fill(dt);
            fila = dt.Rows.Count;

            //Recorrido de elementos
            for (int i = 0; i < fila; i++){
                //Asignación de elementos
                persona.idPersona = (int)dt.Rows[i]["idPersona"];
                persona.nombreCompleto = dt.Rows[i]["nombreCompleto"].ToString();
                persona.email = dt.Rows[i]["email"].ToString();
                persona.clave = dt.Rows[i]["clave"].ToString();
                persona.esEmpleado = (bool)dt.Rows[i]["esEmpleado"];

                if (persona.email == txt_email.Text && txt_password.Text == persona.clave){
                    //Creación de sesiones
                    Session["IDE_PERSONA"] = persona.idPersona;
                    Session["DSC_NOMBRE"] = persona.nombreCompleto;
                    Session["DSC_NIVEL"] = persona.esEmpleado;

                    //Indicador de registro
                    if ((bool)dt.Rows[i]["esEmpleado"] == true){
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Bienvenido!', 'Acceso correcto, pronto ser&aacute; redireccionado!', 'success') </script>");
                        Response.Redirect("GestionarReservaciones.aspx");
                    }else if ((bool)dt.Rows[i]["esEmpleado"] == false){
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Bienvenido!', 'Acceso correcto, pronto ser&aacute; redireccionado!', 'success') </script>");
                        Response.Redirect("MisReservaciones.aspx");
                    }else{
                        Session.RemoveAll();
                        Response.Redirect("Login.aspx");
                    }
                }
                else{
                    //Verificación
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al introducir el usuario o contraseña!', 'error') </script>");
                }
            }
        }

    }
}