<%@ Page Title="User Roles Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="PersonalSite.Admin.Roles" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Manage Roles By User</h3>

    <p>
        <b>Select a User:</b>
        <asp:DropDownList ID="DropDownListUserList" runat="server" AutoPostBack="true"
            ItemType="PersonalSite.Models.AppUser"
            DataTextField="UserName" 
            DataValueField="ID"
            SelectMethod="DropDownListUserList_GetData"
            OnSelectedIndexChanged="DropDownListUserList_SelectedIndexChanged">
        </asp:DropDownList>
    </p>
    <p>
        <asp:Repeater ID="UsersRoleList" runat="server" 
            ItemType="Microsoft.AspNet.Identity.EntityFramework.IdentityRole" 
            SelectMethod="UsersRoleList_GetData">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true"
                    Text='<%# Item.Name %>' 
                    OnCheckedChanged="RoleCheckBox_CheckChanged" />
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </p>
</asp:Content>
