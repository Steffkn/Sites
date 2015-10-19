<%@ Page Title="CreateNewArticle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewArticle.aspx.cs" Inherits="PersonalSite.NewArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create new article</h2>
    <p>
        <asp:ValidationSummary runat="server" ForeColor="Red" />
    </p>
    <div>
        <div>
            <asp:Label runat="server" AssociatedControlID="DropDownListCategoryList">Select Category</asp:Label>
            <asp:DropDownList ID="DropDownListCategoryList" runat="server" 
                ItemType="PersonalSite.Models.Category"
                AutoPostBack="false"
                DataTextField="Name"
                DataValueField="ID"
                SelectMethod="DropDownListCategoryList_GetData" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownListCategoryList"
                ErrorMessage="The category is required." ForeColor="Red" />
        </div>

        <div>
            <asp:Label runat="server" AssociatedControlID="NewArticleTitle">Title</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="NewArticleTitle" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewArticleTitle"
                    ErrorMessage="The title field is required." ForeColor="Red" />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="NewArticleDescription">Description</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="NewArticleDescription" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewArticleDescription"
                    ErrorMessage="The description field is required." ForeColor="Red" />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="NewArticleTitleContent">Content</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="NewArticleTitleContent" TextMode="MultiLine" Rows="3" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewArticleTitleContent"
                    ErrorMessage="The content field is required." ForeColor="Red" />
            </div>
        </div>
        <asp:Button runat="server" OnClick="CreateArticle_Click" Text="Create" CssClass="btn" />
    </div>
</asp:Content>
