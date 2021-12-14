<%@ Page Title="Editar habitación" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarHabitacion.aspx.cs" Inherits="Sistema_Reservaciones.Pages.EditarHabitacion" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <h1 class="page-header" style="color: #FFFFFF"><%: Title %>.</h1>
        <!-- end page-header -->
        <!-- begin panel -->
        <div class="panel panel-inverse">
            <div class="panel-heading" style="background-color: #293339;">
                <h4 class="panel-title" style="color: #FFFFFF">Habitaci&oacute;n</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <asp:HiddenField ID="hdn_idHabitacion" runat="server" />
                    <div class="col">
                        <label class="col-form-label">Hotel</label>
                        <asp:TextBox ID="txt_hotel" runat="server" CssClass="form-control m-b-5" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="col">
                        <label class="col-form-label">N&uacute;mero de habitaci&oacute;n</label>
                        <asp:TextBox ID="txt_numero" runat="server" CssClass="form-control m-b-5"></asp:TextBox>
                    </div>
                    <div class="col">
                        <label class="col-form-label">Capacidad m&aacute;xima</label>
                         <asp:RequiredFieldValidator ID="rfv_capacidad" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txt_capacidad" Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                         <asp:RangeValidator ID="rgv_capacidad" runat="server" ErrorMessage="La capacidad deber de estar entre 1 y 8" Type="Integer" MinimumValue="1" MaximumValue="8" ControlToValidate="txt_capacidad" Display="Dynamic"  CssClass="alert alert-danger"></asp:RangeValidator>
                        <asp:TextBox ID="txt_capacidad" runat="server" type="number" CssClass="form-control m-b-5" value="1"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:RequiredFieldValidator ID="rfv_descripcion" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txt_descripcion" Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                        <label class="col-form-label">Descripci&oacute;n</label>
                        <asp:TextBox ID="txt_descripcion" runat="server" TextMode="MultiLine" CssClass="form-control" MaxLength="500"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="float-left">
                        <button runat="server" id="btn_guardar" onserverclick="ActualizarHabitacion" class="btn btn-primary" title="Guardar"><i class="fa fa-save"></i>&nbsp;Guardar</button>
                        <button runat="server" id="btn_inactivar" onserverclick="Inactivar" class="btn btn-primary" title="Inactivar"><i class="fa fa-ban"></i>&nbsp;Inactivar</button>
                        <a href="ListaHabitaciones" class="btn btn-danger"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;Regresar</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end #panel inverse -->
    </div>
    <!-- end #content -->
    <link href="../Content/sweetalert.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>
