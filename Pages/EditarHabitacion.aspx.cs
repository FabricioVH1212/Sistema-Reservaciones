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

     Descripción: En esta clase viene toda la lógica de la página para editar las habitaciones
     Historial de modificaciones

     Fecha			Nombre					Resumen de Revisión
     --------		--------------			---------------------
     19/11/2021		Fabricio Vindas 			    Creación del archivo
 */
    public partial class EditarHabitacion : System.Web.UI.Page
    {
        //Declaración de variables
        Habitacion habitacion = new Habitacion();
        Reservacion reservacion = new Reservacion();

        /*  Autor: Fabricio Vindas Hernandez
        Descripción: Función inicial al cargarse la página*/
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validación de la existencia de una sesión activa por parte del usuario que quiere usar el sistema
            if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null)
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            habitacion.idHabitacion = int.Parse(Request.QueryString["id"]);
            habitacion.estado = Request.QueryString["ide_estado"];
            //Consulto la fecha de salida
            using (var db = new SistemaReservacionEntities()){ 
                var fechaDB = db.proc_ConsultarFechaReservacion(habitacion.idHabitacion).FirstOrDefault();
                    if(fechaDB != null){
                        reservacion.fechaSalida = fechaDB.fechaSalida;
                    }
            }
            //Reglas de restricción del formulario
            if (habitacion.estado == "Inactivo") {
               // Si el estado de la habitación a editar es “I” los usuarios la habitación no puede ser modificada debido a que está inactiva

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                    "<script> swal({title: 'Hubo un error'," +
                    "text: 'La habitación no puede ser modificada debido a que se encuentra inactiva.! Vuelva a la lista de habitaciones y seleccione una activa'," +
                    "type: 'error',confirmButtonColor: '#DD6B55',confirmButtonText: 'Volver a la lista de habitaciones!'," +
                    "closeOnConfirm: false}," +
                    "function() {window.location.href = 'ListaHabitaciones.aspx';}); </script>");

            } else if (habitacion.estado == "Activo" && reservacion.fechaSalida > DateTime.Today) {
                //Si el estado de la habitación a editar es “A”, y dicha habitación tiene reservaciones asociadas en el estado
                //“A” con fecha de salida mayor a la fecha actual de la máquina la habitación no puede ser modificada debido a que existen reservaciones “En proceso” o “En espera” asociadas a la habitación
              
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                    "<script> swal({title: 'Hubo un error'," +
                    "text: ' La habitación no puede ser modificada debido a que existen reservaciones “En proceso” o “En espera” asociadas a la habitación'," +
                    "type: 'error',confirmButtonColor: '#DD6B55',confirmButtonText: 'Volver a la lista de habitaciones!'," +
                    "closeOnConfirm: false}," +
                    "function() {window.location.href = 'ListaHabitaciones.aspx';}); </script>");

            } else {
                //Como no cumple ninguna de las dos condiciones entonces si se puede editar la reservación..
                CargarHabitacion();
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
            Descripción: Función para cargar los datos de la habitación de la base de datos*/
        protected void CargarHabitacion()
        {
            try{
                if (IsPostBack == false){
                    
                    using (var db = new SistemaReservacionEntities()){
                        var habitacionDB = db.proc_ConsultarHabitacionPorId(habitacion.idHabitacion).FirstOrDefault();
                      
                              if (habitacionDB != null){
                                hdn_idHabitacion.Value = habitacionDB.idHabitacion.ToString();
                                txt_hotel.Text = habitacionDB.nombre.ToString();
                                txt_numero.Text = habitacionDB.numeroHabitacion.ToString();
                                txt_capacidad.Text = habitacionDB.capacidadMaxima.ToString();
                                txt_descripcion.Text = habitacionDB.descripcion;
                            }
                     }
                }
            }
            catch{
                Response.Redirect("Error.aspx");
            }

            if (hdn_idHabitacion.Value == ""){
                Response.Redirect("ListaHabitaciones.aspx");
            }
        }
        /*  Autor:  Fabricio Vindas Hernandez
            Descripción: Función para actualizar los datos de la habitación de la base de datos*/
        protected void ActualizarHabitacion(object sender, EventArgs e)
        {
            if (Page.IsValid == true){
                try{
                    habitacion.idHabitacion = int.Parse(hdn_idHabitacion.Value);
                    habitacion.numeroHabitacion = txt_numero.Text;
                    habitacion.capacidadMaxima = int.Parse(txt_capacidad.Text);
                    habitacion.descripcion = txt_descripcion.Text;

                    using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                        db.proc_EditarHabitacion(habitacion.idHabitacion, habitacion.numeroHabitacion, habitacion.capacidadMaxima, habitacion.descripcion);
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                         "<script> swal({title: 'Éxito'," +
                         "text: ' Los datos se han guardado satisfactoriamente!'," +
                         "type: 'success',confirmButtonColor: '#DD6B55',confirmButtonText: 'Volver a la lista de habitaciones!'," +
                         "closeOnConfirm: false}," +
                         "function() {window.location.href = 'ListaHabitaciones.aspx';}); </script>");
                    }
                }
                catch{
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al insertar los datos!', 'error') </script>");
                }
            }

        }
        /*  Autor: Fabricio Vindas Hernandez
           Descripción: Función para inactivar una habitación*/
        protected void Inactivar(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                try{
                    habitacion.idHabitacion = int.Parse(hdn_idHabitacion.Value);
              
                    using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                        db.proc_Inactivar(habitacion.idHabitacion);
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                         "<script> swal({title: 'Éxito'," +
                         "text: ' El proceso de inactivación se realizó sin problemas'," +
                         "type: 'success',confirmButtonColor: '#DD6B55',confirmButtonText: 'Volver a la lista de habitaciones!'," +
                         "closeOnConfirm: false}," +
                         "function() {window.location.href = 'ListaHabitaciones.aspx';}); </script>");
                    }
                }catch{
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al activar los datos!', 'error') </script>");
                }
            }
        }
    }
}