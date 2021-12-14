﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sistema_Reservaciones.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- begin container --%>
    <div class="container">
        <%-- begin row --%>
        <div class="row text-center login-page">
            <div class="col-md-12 login-form">
                <div class="row">
                    <div class="col-md-12 login-from-row">
                        <svg version="1.1" width="148" height="44" viewBox="0 0 102 32" class="hero__logo" aria-labelledby="header-hero-logo-id" role="img" focusable="false" tabindex="-1">
                            <title id="header-hero-logo-id">trivago</title>
                            <path class="logo-svg-path" d="M33.706,6.989h5.441l4.133,11.149h0.066l3.83-11.149h5.071L45.8,23.377h-5.34" fill="#FC9E15"></path>
                            <path class="logo-svg-path" d="M13.971,11.018H9V16.5c0,0.93.082,2.119,0.959,2.655a4.649,4.649,0,0,0,2.9.283,2.242,2.242,0,0,0,1.107-.386v4.2a10.114,10.114,0,0,1-1.938.4c-3.556.359-8.54-.253-8.54-4.838v-7.8H0V6.988H3.492V2.153H9V6.989h4.97v4.03Zm14.1-4.03h4.97V23.377h-4.97V6.989Zm-0.2-4.311a2.676,2.676,0,1,1,5.351,0,2.677,2.677,0,0,1-5.353,0" fill="#1391D2"></path>
                            <path class="logo-svg-path" d="M90.124,15.195c0,2.215,1.289,4.13,3.648,4.13s3.647-1.915,3.647-4.131-1.287-4.133-3.647-4.133-3.647,1.917-3.648,4.134m-4.556,0a8.224,8.224,0,0,1,14.711-5.43,9.491,9.491,0,0,1,.687,9.766,8.214,8.214,0,0,1-15.4-4.336" fill="#E3403D"></path><path class="logo-svg-path" d="M80.24,6.973v2.2H80.164a3.041,3.041,0,0,0-.574-0.613c-3.254-2.8-8.812-2.238-10.915,1.679a11.506,11.506,0,0,0-.924,6.812c0.283,2.077,1.05,4.275,2.879,5.478a7.739,7.739,0,0,0,6.936.71,4.8,4.8,0,0,0,2.075-1.572H79.7v1.588a3.9,3.9,0,0,1-.984,2.881c-1.449,1.493-4.218,1.4-6.079.894a9.223,9.223,0,0,1-2.914-1.307l-2.451,3.6a11.307,11.307,0,0,0,3.906,1.9c3.583,0.949,8.543.928,11.312-1.921,1.561-1.606,2.2-3.96,2.2-7.06V6.971H80.242ZM78.984,18.2a3.707,3.707,0,0,1-5.4,0,5.013,5.013,0,0,1,0-6,3.707,3.707,0,0,1,5.4,0,5.011,5.011,0,0,1,0,6c-0.639.763,0.641-.763,0,0v0Z" fill="#E3403D"></path><path class="logo-svg-path" d="M15.314,6.989h5.105V9.675h0.051A5.715,5.715,0,0,1,22.384,7.4a6.338,6.338,0,0,1,4.482-.6v4.6c-1.029-.278-3.2-0.715-4.717.211-0.96.586-1.731,1.288-1.731,4.929v6.839H15.313V6.989h0Z" fill="#1391D2"></path><path class="logo-svg-path" d="M56.992,16.844c-1,.62-1.683,1.829-0.763,2.775,0.9,0.922,2.522.829,3.632,0.441a2.98,2.98,0,0,0,2.2-2.784V16.258c0.017,0-3.794-.208-5.069.585h0Zm5.07,4.518H61.969a5.079,5.079,0,0,1-2.232,1.852c-3.563,1.464-8.748-.019-8.75-4.492,0-4.655,5.07-5.606,8.784-5.712,0.817-.021,1.572-0.034,2.267-0.034a2.62,2.62,0,0,0-.957-2.132,4.243,4.243,0,0,0-4.535-.268A6.2,6.2,0,0,0,54.716,12L52.028,9.248A9.255,9.255,0,0,1,55.32,7.282a11.844,11.844,0,0,1,7.044-.27,5.625,5.625,0,0,1,3.952,4.437,17.479,17.479,0,0,1,.314,3.61v8.317H62.063V21.362h0Z" fill="#FC9E15"></path>
                        </svg>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 login-from-row">
                        <div class="form-group row m-b-15">
                            <asp:Label ID="lbl_email" runat="server" CssClass="col-form-label col-md-3" Text="Correo electr&oacute;nico"></asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox ID="txt_email" runat="server" CssClass="form-control m-b-5" placeholder="Ingrese el correo electr&oacute;nico"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 login-from-row">
                        <div class="form-group row m-b-15">
                            <asp:Label ID="lbl_password" runat="server" CssClass="col-form-label col-md-3" Text="Contrase&ntilde;a"></asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox ID="txt_password" TextMode="Password" runat="server" CssClass="form-control m-b-5" placeholder="*******"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 login-from-row">
                        <asp:Button ID="btn_ingresar" CssClass="btn btn-info" runat="server" Text="Ingresar al sistema" OnClick="IngresarUsuario" /><br />
                        <asp:Button ID="btn_mostrar" runat="server" class="text-info" Text="¿No tiene cuenta? Haz clic para registrarse?" />
                    </div>
                    <br />
                </div>
            </div>
        </div>
        <%-- end row --%>
    </div>
    <%-- end container --%>
    <script src="../Scripts/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>
