<%@ Page Title="Crear Reservación" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearReservacion.aspx.cs" Inherits="Sistema_Reservaciones.Pages.CrearReservacion" %>

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
                <h4 class="panel-title" style="color: #FFFFFF">Reservaci&oacute;n</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col">
                        <asp:Label Text="Hotel" runat="server" CssClass="col-form-label"></asp:Label>
                        <asp:DropDownList ID="cmb_hotel" runat="server" CssClass="default-select2 form-control select2-hidden-accessible"></asp:DropDownList>
                        <asp:RequiredFieldValidator id="rfv_hotel"  runat="server" InitialValue="0" ControlToValidate="cmb_hotel" ErrorMessage="Campo requerido" CssClass="alert alert-danger"/>
                    </div>
                    <div class="col">
                        <label class="col-form-label">Cliente</label>
                        <asp:DropDownList ID="cmb_cliente" runat="server" CssClass="default-select2 form-control select2-hidden-accessible" Enabled="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator id="rfv_cliente"  runat="server" InitialValue="0" ControlToValidate="cmb_cliente" ErrorMessage="Campo requerido" CssClass="alert alert-danger"/>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="col-form-label">Fecha entrada</label>
                            <div class="">
                                <asp:TextBox ID="txt_fecEntrada" runat="server" CssClass="form-control" placeholder="dd/MM/yy" type="date"></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="rfv_fecEntrada" runat="server" ErrorMessage="Campo requerido"
                                    ControlToValidate="txt_fecEntrada" Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cv_fecEntrada" runat="server" ErrorMessage="La fecha de entrada no puede ser menor a la fecha actual"
                                    ControlToValidate="txt_fecEntrada" OnServerValidate="cv_fecEntrada_ServerValidate" Display="Dynamic" CssClass="alert alert-danger"></asp:CustomValidator>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-form-label">Fecha salida</label>
                            <div class="">
                                <asp:TextBox ID="txt_fecSalida" runat="server" CssClass="form-control" placeholder="dd/MM/yy" type="date"></asp:TextBox>
                              <%--  <asp:RequiredFieldValidator ID="rfv_fecSalida" runat="server" ErrorMessage="Campo requerido"
                                    ControlToValidate="txt_fecSalida" Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cv_Salida" runat="server" ErrorMessage="La fecha de salida no puede ser menor a la fecha de entrada"
                                    ControlToValidate="txt_fecSalida" OnServerValidate="cv_fecSalida_ServerValidate" Display="Dynamic" CssClass="alert alert-danger"></asp:CustomValidator>--%>
                            </div>
                        </div>
                        <hr />
                        <div class="col-md-6">
                            <label class="col-form-label">N&uacute;mero de adultos</label>
                            <asp:TextBox ID="txt_numeroAdultos" runat="server" CssClass="form-control m-b-5" type="number" value="1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_numeroAdultos" runat="server" ErrorMessage="Campo requerido"
                                ControlToValidate="txt_numeroAdultos" Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rv_numeroAdultos" runat="server" ErrorMessage="El número de adultos debe de estar de 1 en adelante"
                                Type="Integer" MinimumValue="1" MaximumValue="10" ControlToValidate="txt_numeroAdultos" Display="Dynamic" CssClass="alert alert-danger"></asp:RangeValidator>
                        </div>
                        <hr />
                        <div class="col-md-6">
                            <label class="col-form-label">N&uacute;mero de ni&ntilde;os</label>
                            <asp:TextBox ID="txt_numeroNinos" runat="server" CssClass="form-control m-b-5" type="number" value="0"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_numeroNinos" runat="server" ErrorMessage="Campo requerido"
                                ControlToValidate="txt_numeroNinos" Display="Dynamic" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rv_numeroNinos" runat="server" ErrorMessage="El número de niños debe de estar de 0 en adelante"
                                Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txt_numeroNinos" Display="Dynamic" CssClass="alert alert-danger"></asp:RangeValidator>
                        </div>
                    </div>
                    <hr />
                    <div class="float-left">
                        <button runat="server" id="btn_guardar" onserverclick="GuardarReservacion" class="btn btn-primary" title="Guardar"><i class="fa fa-save"></i>&nbsp;Guardar</button>
                        <button runat="server" ID="btn_regresar" onserverclick="Redireccionar" class="btn btn-danger" title="Regresar"><i class="fa fa-arrow-circle-left"></i>&nbsp;Regresar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end #panel inverse -->
    </div>
    <!-- end #content -->
    <script src="../Scripts/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>
