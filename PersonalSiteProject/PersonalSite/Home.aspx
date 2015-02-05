﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PersonalSite.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewCategories"
        ItemType="PersonalSite.Models.Category" SelectMethod="ListViewCategories_GetData"
        GroupItemCount="3">
        <GroupTemplate>
            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </GroupTemplate>
        <ItemTemplate>
            <div class="categoryPreview">
                <h2><%#: Item.Name %></h2>
                <asp:ListView runat="server" ID="ListViewArticles"
                    ItemType="PersonalSite.Models.Article"
                    DataSource="<%# Item.Articles %>">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink NavigateUrl='<%#: string.Format("~/Article?id={0}",Item.Id) %>' runat="server"
                                Text="<%#: Item.Title %>" />
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p class="empty">No articles in this category.</p>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
