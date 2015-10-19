<%@ Page Title="Article" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="PersonalSite.Article" %>

<asp:Content ID="ArticleContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView runat="server" ID="FormViewArticle"
        ItemType="PersonalSite.Models.Article" 
        SelectMethod="FormViewArticle_GetItem"
        >
        <ItemTemplate>
            <div class="article">
                <h2><%#: Item.Title %></h2>
                <p>
                    Author: 
                        <asp:HyperLink runat="server" CssClass="author"
                            NavigateUrl='<%#: string.Format("~/user?id={0}", Item.AuthorID)%>'
                            Text="<%#: this.dBContext.Users.FirstOrDefault(u => u.Id == Item.AuthorID).UserName%>" />
                    created on: <time><%#: Item.DateCreated %></time>
                    <div>category: <span><%#: Item.Category.Name %></span></div>
                </p>
                <p class="articleContent"><%#: Item.Content %></p>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
