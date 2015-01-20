<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PersonalSite.Master" Inherits="System.Web.Mvc.ViewPage<PersonalSite.Models.User>" %>

<asp:Content ID="LoginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Login
</asp:Content>

<asp:Content ID="ContentLogin" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Login</h2>
    <asp:Login ID="Login" runat="server">
</asp:Login>

</asp:Content>
