<%@ Page Title="User Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="PersonalSite.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="FormViewAppUser"
        ItemType="PersonalSite.Models.AppUser"
        SelectMethod="FormViewAppUser_GetItem">
        <ItemTemplate>
            <h2>Details for user: <%#: Item.UserName %></h2>
            <div>
                <p><%#: Item.RegistrationDate %></p>
                <p><%#: Item.Roles.Count %></p>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
