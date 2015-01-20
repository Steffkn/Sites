<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="PersonalWebSite.Login" %>

<asp:Content ID="LoginHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Table ID="LoginTable" runat="server" CssClass="loginTable" Width="238px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="UserNameLabel" runat="server"
                    Text="User name"
                    ToolTip="User's log in name" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox runat="server" ID="username" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="PasswordLabel" runat="server"
                    Text="Password"
                    ToolTip="User's log in password" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox runat="server" ID="password"
                    TextMode="Password"
                    ToolTip="Enter password" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="RegisterBtn" runat="server"
                    Text="Register" />
            </asp:TableCell><asp:TableCell>
                <asp:Button ID="Submit" runat="server"
                    OnClick="Submit_Click"
                    Text="Log in" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server"
        ConnectionString="<%$ ConnectionStrings:DataConnectionString %>"
        ProviderName="<%$ ConnectionStrings:DataConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM [Users]">
        <!--InsertCommand="INSERT INTO Users (ID,accountName,password,email,registrationDate) VALUES (@CoName,@Phone)">
        <InsertParameters>
            <asp:FormParameter Name="CoName" FormField="CompanyNameBox" />
            <asp:FormParameter Name="Phone" FormField="PhoneBox" />
        </InsertParameters>-->
    </asp:SqlDataSource>
</asp:Content>
