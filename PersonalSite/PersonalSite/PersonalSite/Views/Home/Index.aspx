<%@ Page Title="Home" Language="C#" MasterPageFile="~/Views/Shared/PersonalSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="HomeTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home
</asp:Content>


<asp:Content ID="ContentHome" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SQLDataSourceArticle" runat="server"
        ConnectionString="<%$ ConnectionStrings:PersonalSiteConnectionString %>"
        SelectCommand="SELECT Users.ID AS Expr1, Users.UserName, Articles.* FROM Articles INNER JOIN Users ON Articles.Author = Users.ID"
        ProviderName="<%$ ConnectionStrings:PersonalSiteConnectionString.ProviderName %>"></asp:SqlDataSource>

    <asp:Repeater ID="RepeaterArticles" runat="server"
        DataSourceID="SQLDataSourceArticle">
        <ItemTemplate>
            <article class="post">
                <header>
                    <!-- Add the id of the article and send it to article page for more details (Article/ID) Eval(Container.DataItem ,"ID") -->
                    <h2>
                        <asp:HyperLink ID="HyperLinkTitle" runat="server" NavigateUrl="~/Views/Home/Index.aspx"><%#: DataBinder.Eval(Container.DataItem ,"Title") %></asp:HyperLink>
                    </h2>
                </header>
                <footer>
                    <p>Created by <asp:HyperLink ID="HyperLinkAuthor" runat="server" DataSourceID="SqlDataSourceUsers" NavigateUrl="~/Views/Home/Index.aspx"><%#: DataBinder.Eval(Container.DataItem ,"UserName") %></asp:HyperLink> on <time><%#: DataBinder.Eval(Container.DataItem, "CreationDate") %></time>
                    </p>
                </footer>
                <p><%#: DataBinder.Eval(Container.DataItem ,"Content") %></p>
            </article>
        </ItemTemplate>
    </asp:Repeater>


   <!-- <article class="post">
        <header>
            <h2><a href="#">Second title</a></h2>
        </header>
        <footer>
            <p>Created by <a href="#">Steff</a> on <time>22.05.2014</time></p>
        </footer>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non porta enim, ac fermentum nulla. Proin cursus dignissim velit ut dapibus. Donec faucibus semper suscipit. Cras ultricies nisi elit, in viverra nisl fringilla non. Suspendisse tristique nunc at vehicula congue. Morbi gravida arcu id scelerisque ultrices. Suspendisse consequat commodo cursus. Nullam cursus, nisl ac condimentum placerat, quam odio aliquet felis, varius ultrices leo risus in tellus. Nunc cursus risus sed orci interdum, quis condimentum nibh facilisis. Nulla facilisi. Nullam ultricies urna sed rutrum malesuada. Sed et mauris mattis, ornare diam in, pellentesque est.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non porta enim, ac fermentum nulla. Proin cursus dignissim velit ut dapibus. Donec faucibus semper suscipit. Cras ultricies nisi elit, in viverra nisl fringilla non. Suspendisse tristique nunc at vehicula congue. Morbi gravida arcu id scelerisque ultrices. Suspendisse consequat commodo cursus. Nullam cursus, nisl ac condimentum placerat, quam odio aliquet felis, varius ultrices leo risus in tellus. Nunc cursus risus sed orci interdum, quis condimentum nibh facilisis. Nulla facilisi. Nullam ultricies urna sed rutrum malesuada. Sed et mauris mattis, ornare diam in, pellentesque est.</p>
    </article> -->
</asp:Content>
