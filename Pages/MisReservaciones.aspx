<%@ Page Title="Mis reservaciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisReservaciones.aspx.cs" Inherits="Sistema_Reservaciones.Pages.MisReservaciones" %>

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
                <h4 class="panel-title" style="color: #FFFFFF">Reservaciones</h4>
                <a class="btn btn-xl btn-primary m-r-5" href="CrearReservacion"><i class="fa fa-plus"></i>&nbsp;Nueva reservaci&oacute;n</a>
            </div>
            <div class="panel-body">
                <div style="overflow-y: scroll; height: 500px; width: 1100px;">
                    <asp:GridView ID="grd_Reservaciones" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="idReservacion" HeaderText="# reservacion" ItemStyle-CssClass="th" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" CssClass="th"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="nombre" HeaderText="Hotel" />
                            <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha entrada" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="fechaSalida" HeaderText="Fecha salida" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="costoTotal" HeaderText="Costo" ItemStyle-HorizontalAlign="Right">
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="estado" HeaderText="Estado" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Opciones">
                                <ItemTemplate>
                                    <a class="btn btn-warning" href="Detalle.aspx?id=<%# Eval("idReservacion") %>"><i class="fa fa-eye"></i></a>
                                    <a class="btn btn-info" href="EditarReservacion.aspx?id=<%#Eval("idReservacion") %>"><i class="fa fa-pencil"></i></a>
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
</asp:Content>
