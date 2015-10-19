<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="PersonalSite.ArticlesOfType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="articles">
        <asp:ListView runat="server" ID="ListViewArticles"
            ItemType="PersonalSite.Models.Article"
            SelectMethod="ListViewArticles_GetData"
            InsertItemPosition="LastItem">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="article">
                    <h2><%#: Item.Title %></h2>
                    <p>
                        Author: 
                        <asp:HyperLink runat="server" CssClass="author"
                            NavigateUrl='<%#: string.Format("~/user?id={0}", Item.AuthorID)%>'
                            Text="<%#: this.dBContext.Users.FirstOrDefault(u => u.Id == Item.AuthorID).UserName%>" />
                        created on: <time><%#: Item.DateCreated %></time>
                        <div>Category: <span><%#: Item.Category.Name %></span></div>
                        <div>Description: <%#: Item.Description %></div>
                    </p>
                    <p class="articleContent"><%#: Item.Content %></p>
                </div>
            </ItemTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
