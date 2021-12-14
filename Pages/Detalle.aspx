<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Sistema_Reservaciones.Pages.DetalleReservacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <h1 class="page-header" style="color: #FFFFFF"><%: Title %> de reservaci&oacute;n</h1>
        <!-- end page-header -->
        <!-- begin panel -->
        <div class="panel panel-inverse">
            <div class="panel-heading" style="background-color: #293339;">
                <h4 class="panel-title" style="color: #FFFFFF">Reservaciones</h4>
            </div>
            <div class="panel-body">
                <!-- begin container -->
                <div class="container justify-content-center">
                    <!-- begin table -->
                    <asp:Table ID="tbl_datalle" runat="server" CssClass="table-bordered">
                        <asp:TableRow>
                            <asp:TableCell><b># reservaci&oacute;n</b></asp:TableCell>
                            <asp:TableCell ID="tbc_idReservacion" Width="500px"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>N&uacute;mero habitaci&oacute;n</b></asp:TableCell>
                            <asp:TableCell ID="tbc_numeroHabitacion" Width="500px"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>Cliente</b></asp:TableCell>
                            <asp:TableCell ID="tbc_cliente"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>Fecha de entrada</b></asp:TableCell>
                            <asp:TableCell ID="tbc_fecEntrada"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>Fecha de salida</b></asp:TableCell>
                            <asp:TableCell ID="tbc_fecSalida"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>D&iacute;as de la reserva</b></asp:TableCell>
                            <asp:TableCell ID="tbc_diasReserva"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>N&uacute;mero de adultos</b></asp:TableCell>
                            <asp:TableCell ID="tbc_numeroAdultos"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>N&uacute;mero de ni&ntilde;os</b></asp:TableCell>
                            <asp:TableCell ID="tbc_numeroNinos"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><b>Costos</b></asp:TableCell>
                            <asp:TableCell ID="tbc_costos"></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <!-- end table -->
                </div>
                <!-- end container -->
            </div>
            <!-- begin panel footer -->
            <div class="panel-footer" style="background-color: #293339;">
                <asp:LinkButton ID="lnk_editar" runat="server" CssClass="btn btn-primary" PostBackUrl="~/Pages/EditarReservacion.aspx" CommandArgument='id=<%# Eval("idReservacion") %>' Visible="false"><i class="fa fa-pencil"></i>&nbsp;Editar reservaci&oacute;n</asp:LinkButton>
                <button runat="server" id="btn_eliminar" onserverclick="Eliminar" OnClientClick="javascript:if(!confirm('¿Desea cancelar la reservación?'))return false" class="btn btn-primary" title="Cancelar" visible="false"><i class="fa fa-ban"></i>&nbsp;Cancelar Reservaci&oacute;n</button>
                <button id="btn_regresar" runat="server" onserverclick="Redireccionar" class="btn btn-danger" title="Regresar"><i class="fa fa-arrow-circle-left"></i>&nbsp;Regresar</button>
            </div>
            <!-- end panel footer -->
            <asp:GridView ID="grd_Bitacora" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-responsive" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="fechaDeLaAccion" HeaderText="Fecha" ItemStyle-CssClass="th">
                        <ItemStyle CssClass="th"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="accionRealizada" HeaderText="Acción realizada"></asp:BoundField>
                    <asp:BoundField DataField="nombreCompleto" HeaderText="Realizada por" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
        <!-- end #panel inverse -->
    </div>
    <!-- end #content -->
    <script src="../Scripts/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>
