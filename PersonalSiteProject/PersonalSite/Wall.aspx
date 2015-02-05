<%@ Page Title="Wall" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wall.aspx.cs" Inherits="PersonalSite.Wall" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <div class="messages">
        <asp:ListView runat="server" ID="ListViewWallMassages"
            ItemType="PersonalSite.Models.WallMessage"
            SelectMethod="ListViewWallMassages_GetData"
            InsertMethod="ListViewWallMassages_InsertItem"
            InsertItemPosition="LastItem">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="messagebox">
                    By 
                    <asp:HyperLink NavigateUrl='<%#: string.Format("~/user?id={0}", Item.AuthorID) %>' runat="server" Text="<%#: Item.AuthorName %>" />
                     on <time><%#: Item.DatePosted %></time>
                    <div class="message">
                       <p><%#: Item.Message %></p>
                    </div>
                </div>
            </ItemTemplate>
            <InsertItemTemplate>
                <div class="newMessage">
                    <label>Your thoughts?</label>
                    <asp:TextBox runat="server" ID="TextBoxMessage" TextMode="MultiLine" Rows="3" Text="<%#: BindItem.Message %>" />
                    <asp:LinkButton runat="server" ID="ButtonInsert" Text="Send" CommandName="Insert" CssClass="btn" />
                </div>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
