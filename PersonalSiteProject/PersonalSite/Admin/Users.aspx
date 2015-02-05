<%@ Page Title="Users page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="PersonalSite.Admin.Users" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView runat="server" ID="ListViewUsers"
        ItemType="PersonalSite.Models.AppUser"
        DataKeyNames="ID"
        SelectMethod="ListViewUsers_GetData"
        UpdateMethod="ListViewUsers_UpdateItem"
        DeleteMethod="ListViewUsers_DeleteItem">
        <LayoutTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            <asp:LinkButton Text="Name" runat="server" ID="LinkButtonSordByName"
                                CommandName="Sort" CommandArgument="UserName" />
                        </th>
                        <th>
                            <asp:LinkButton Text="Email" runat="server" ID="LinkButtonSordByEmail"
                                CommandName="Sort" CommandArgument="Email" />
                        </th>
                        <th>
                            <asp:LinkButton Text="Registration Date" runat="server" ID="LinkButtonSorByRegistrationDate"
                                CommandName="Sort" CommandArgument="RegistrationDate" />
                        </th>
                        <th>Edit / Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4">
                            <asp:DataPager runat="server" ID="DataPagerUsers"
                                PagedControlID="ListViewUsers" PageSize="10">
                                <Fields>
                                    <asp:NumericPagerField />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </LayoutTemplate>

        <ItemTemplate>
            <tr>
                <td><%#: Item.UserName %></td>
                <td><%#: Item.Email %></td>
                <td><%#: Item.RegistrationDate %></td>
                <td>
                    <asp:LinkButton ID="ButtonEdint" Text="Edit" runat="server" CommandName="Edit" />
                    <asp:LinkButton ID="ButtonDelete" Text="Delete" runat="server" CommandName="Delete" />
                </td>
            </tr>
        </ItemTemplate>

        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxUserName" Text="<%#: BindItem.UserName %>" />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxEmail" Text="<%#: BindItem.Email %>" />
                </td>
                <td>
                    <asp:Literal Text="<%#: Item.RegistrationDate %>" runat="server" ID="LiteralRegistrationDate"/>
                </td>
                <td>
                    <asp:LinkButton ID="ButtonSave" Text="Save" runat="server" CommandName="Update" />
                    <asp:LinkButton ID="ButtonCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
