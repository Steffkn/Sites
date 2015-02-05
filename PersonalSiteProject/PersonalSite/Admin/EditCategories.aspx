<%@ Page Title="Edit Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCategories.aspx.cs" Inherits="PersonalSite.Admin.EditCategories" %>
<asp:Content ID="ContentEditCategories" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:ListView runat="server" ID="ListViewCategories" 
        ItemType="PersonalSite.Models.Category"
        DataKeyNames="ID"
        SelectMethod="ListViewCategories_GetData"
        UpdateMethod="ListViewCategories_UpdateItem"
        DeleteMethod="ListViewCategories_DeleteItem"
        InsertMethod="ListViewCategories_InsertItem"
        InsertItemPosition="LastItem">
        <LayoutTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            <asp:LinkButton Text="Category name" runat="server" ID="LinkButtonSordByCategory"
                                CommandName="Sort" CommandArgument="Name"/>
                        </th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <asp:DataPager runat="server" ID="DataPagerCategories"
                                PagedControlID="ListViewCategories" PageSize="10">
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
                <td><%#: Item.Name %></td>
                <td>
                    <asp:LinkButton ID="ButtonEdint" Text="Edit" runat="server" CommandName="Edit"/>
                    <asp:LinkButton ID="ButtonDelete" Text="Delete" runat="server" CommandName="Delete"/>
                </td>
            </tr>
        </ItemTemplate>

        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>"/></td>
                <td>
                    <asp:LinkButton ID="ButtonSave" Text="Save" runat="server" CommandName="Update"/>
                    <asp:LinkButton ID="ButtonCancel" Text="Cancel" runat="server" CommandName="Cancel"/>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>"/></td>
                <td>
                    <asp:LinkButton ID="ButtonInsert" Text="Insert" runat="server" CommandName="Insert"/>
                    <asp:LinkButton ID="ButtonCancel" Text="Cancel" runat="server" CommandName="Cancel"/>
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>
