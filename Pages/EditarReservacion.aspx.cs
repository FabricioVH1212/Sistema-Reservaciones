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

        Descripción: En esta clase viene toda la lógica de la página de editar reservación 

        Fecha			Nombre					Resumen de Revisión
        --------		--------------			---------------------
        09/11/2021		Fabricio Vindas         Creación del archivo
    */
    public partial class EditarReservacion : System.Web.UI.Page
    {
        //Declaración de variables
        Reservacion reservacion = new Reservacion();
        Habitacion habitacion = new Habitacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validación de la existencia de una sesión activa por parte del usuario que quiere usar el sistema
            if (Session["DSC_NOMBRE"] == null && Session["IDE_PERSONA"] == null && Session["DSC_NIVEL"] == null){
                Response.Redirect("~/Pages/Login.aspx");
            }

            reservacion.idReservacion = int.Parse(Request.QueryString["id"]);
           
            //Consulto la fecha de salida
            using (var db = new SistemaReservacionEntities()){
                var fechaDB = db.proc_ConsultarFecha(reservacion.idReservacion).FirstOrDefault();
                if (fechaDB != null){
                    reservacion.fechaEntrada = fechaDB.fechaEntrada;
                    reservacion.fechaSalida = fechaDB.fechaSalida;
                }
            }
            //Reglas de restricción del formulario
            if (reservacion.estado == "Inactivo"){
                // Si el estado de la habitación a editar es “I” los usuarios que no sean empleados deben de ser redireccionados
                // a la sección conocida como “Mis reservaciones”, y los usuarios que sean empleados deben de ser redirigidos a la sección
                // conocida como “Gestionar reservaciones”.
                Redireccionar(sender, e);
            }
            else if (reservacion.fechaSalida <= DateTime.Today){
                //Si la fecha de salida de la reservación es menor o igual a la fecha actual de la máquina en la que se está
                //ejecutando la aplicación, los usuarios que no sean empleados deben de ser redireccionados a la sección
                //conocida como “Mis reservaciones”, y los usuarios que sean empleados deben de ser redirigidos a la
                //sección conocida como “Gestionar reservaciones”
                Redireccionar(sender, e);
            }
            else if (reservacion.fechaEntrada <= DateTime.Today && reservacion.fechaSalida > reservacion.fechaEntrada){
                //Si la fecha de entrada es menor o igual a la fecha actual y la fecha de salida es mayor a la fecha actual,
                //los usuarios que no sean empleados deben de ser redireccionados a la sección conocida como “Mis
                //reservaciones”, y los usuarios que sean empleados deben de ser redirigidos a la sección conocida como 
                //“Gestionar reservaciones”
                Redireccionar(sender, e);
            }
            else{
                //Como no cumple ninguna de las dos condiciones entonces si se puede ver el detalle..
                CargarReservacion();
            }

            //**Boton de Cancelar reservación * *
            if (reservacion.estado == "A" && reservacion.fechaEntrada > DateTime.Today){
                btn_eliminar.Visible = true;
            }else{
                btn_eliminar.Visible = false;
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
            Descripción: Función para cargar los datos de la habitación de la base de datos*/
        protected void CargarReservacion()
        {
            try{

                using (var db = new SistemaReservacionEntities()){
                    var reservacionDB = db.proc_ConsultarReservacionPorID(reservacion.idReservacion).FirstOrDefault();

                    if(reservacionDB != null){
                        hdn_idReservacion.Value = reservacionDB.idReservacion.ToString();
                        habitacion.idHotel = reservacionDB.idHotel;
                        txt_hotel.Text = reservacionDB.nombre;
                        txt_numeroHabitacion.Text = reservacionDB.numeroHabitacion.ToString();
                        txt_cliente.Text = reservacionDB.nombreCompleto;
                        txt_fecEntrada.Text = reservacionDB.fechaEntrada.ToString("dd/MM/yyyy");
                        txt_fecSalida.Text = reservacionDB.fechaSalida.ToString("dd/MM/yyyy");
                        txt_numeroAdultos.Text = reservacionDB.numeroAdultos.ToString();
                        txt_numeroNinos.Text = reservacionDB.numeroNinhos.ToString();
                    }
                }
            }
            catch{
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al cargar los datos!', 'error') </script>");
            }
           
            if(hdn_idReservacion.Value == ""){
                Response.Redirect("Detalle.aspx");
            }
        }
        /*  Autor: Fabricio Vindas Hernandez
           Descripción: Función para actualizar los datos de la habitación de la base de datos*/
        protected void ActualizarReservacion(object sender, EventArgs e)
        {
            if (Page.IsValid == true){
                try{
                    //Parseo de variables
                    reservacion.fechaEntrada = DateTime.Parse(txt_fecEntrada.Text);
                    reservacion.fechaSalida = DateTime.Parse(txt_fecSalida.Text);
                    reservacion.numeroNinhos = int.Parse(txt_numeroNinos.Text);
                    reservacion.numeroAdultos = int.Parse(txt_numeroAdultos.Text);

                    //Calculo del total de dias de reservación
                    if (txt_fecEntrada.Text == txt_fecSalida.Text){
                        reservacion.totalDiasReservacion = 1;
                    }
                    else{
                        TimeSpan dias = reservacion.fechaEntrada.Subtract(reservacion.fechaSalida);
                        reservacion.totalDiasReservacion = dias.Days;
                    }
                    //Calculo de costos y parseo
                    using (SistemaReservacionEntities db = new SistemaReservacionEntities()){
                        var hotelDB = db.proc_ConsultarHotelPorId(habitacion.idHotel).FirstOrDefault();

                        if (hotelDB != null){
                            reservacion.costoPorCadaAdulto = hotelDB.costoPorCadaAdulto;
                            reservacion.costoPorCadaNinho = hotelDB.costoPorCadaNinho;

                            //Calculo del costo total
                            reservacion.costoTotal = reservacion.totalDiasReservacion * (reservacion.numeroAdultos * reservacion.costoPorCadaAdulto) + (reservacion.numeroNinhos * reservacion.costoPorCadaNinho);
                        }
                        //Edición de la reservación
                        db.proc_EditarReservacion(reservacion.idReservacion,
                                                  reservacion.fechaEntrada,
                                                  reservacion.fechaSalida,
                                                  reservacion.numeroAdultos,
                                                  reservacion.numeroNinhos,
                                                  reservacion.totalDiasReservacion,
                                                  reservacion.costoPorCadaAdulto,
                                                  reservacion.costoPorCadaNinho,
                                                  reservacion.costoTotal
                                                  );
                        //Creación de la bitacora
                        db.proc_CorregirBitacora(reservacion.idReservacion, (int?)Session["IDE_PERSONA"]);

                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje",
                         "<script> swal({title: 'Éxito'," +
                         "text: ' Los datos se han actualizado satisfactoriamente!'," +
                         "type: 'success',confirmButtonColor: '#DD6B55',confirmButtonText: 'Continuar!'," +
                         "closeOnConfirm: false}," +
                         "function() {window.location.href = 'Default/success.aspx';}); </script>");
                    }
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Hubo un error!', 'Hubo un error al actualizar los datos!', 'error') </script>");
                }
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
                catch
                {
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
            }else if ((bool)Session["DSC_NIVEL"] == false){
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