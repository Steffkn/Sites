<%@ Page Title="Article" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="PersonalSite.Article" %>

<asp:Content ID="ArticleContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView runat="server" ID="FormViewArticle"
        ItemType="PersonalSite.Models.Article" SelectMethod="FormViewArticle_GetItem">
        <ItemTemplate>
            <h2><%#: Item.Title %></h2>
            <div>
                <asp:HyperLink NavigateUrl='<%#: string.Format("~/user?id=", Item.AuthorID) %>' runat="server" />
                <p>Author: <%#: this.dBContext.Users.FirstOrDefault(u => u.Id == Item.AuthorID).UserName%>
                    created on: <time><%#: Item.DateCreated %></time>
                    <span>category: <%#: Item.Category.Name %></span>
                </p>
            </div>
            <p><%#: Item.Content %></p>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
