<%@ Page Title="Lista de habitaciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaHabitaciones.aspx.cs" Inherits="Sistema_Reservaciones.Pages.ListaHabitaciones" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <h1 class="page-header" style="color: #FFFFFF">Lista de habitaciones</h1>
        <!-- end page-header -->
        <!-- begin panel -->
        <div class="panel panel-inverse">
            <div class="panel-heading" style="background-color: #293339;">
                <h4 class="panel-title" style="color: #FFFFFF">Habitaciones</h4>
                <a class="btn btn-xl btn-primary m-r-5" href="CrearHabitacion"><i class="fa fa-plus"></i>&nbsp;Crear habitaci&oacute;n</a>
            </div>
            <div class="panel-body">
                <div style="overflow-y: scroll; height: 500px; width: 1100px;">
                    <asp:GridView ID="grd_Habitaciones" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="idHabitacion" HeaderText="ID" />
                            <asp:BoundField DataField="nombre" HeaderText="Hotel" />
                            <asp:BoundField DataField="numeroHabitacion" HeaderText="Número habitación" />
                            <asp:BoundField DataField="capacidadMaxima" HeaderText="Capacidad máxima" />
                            <asp:BoundField DataField="estado" HeaderText="Estado" />
                            <asp:TemplateField HeaderText="Opciones">
                                <ItemTemplate>
                                    <a class="btn btn-warning" href="EditarHabitacion.aspx?id=<%# Eval("idHabitacion") %>&&ide_estado=<%# Eval("estado") %>"><i class="fa fa-pencil"></i></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>

            </div>
            <!-- end panel -->
        </div>
    </div>
    <!-- end #content -->
    <link href="../Content/sweetalert.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>
