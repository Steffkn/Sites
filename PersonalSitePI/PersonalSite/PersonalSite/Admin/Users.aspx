<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="PersonalSite.Users" %>

<asp:Content ID="UsersContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>List of all users</h1>
        <p>A table of all users that you can play with!</p>
        <asp:GridView runat="server" ID="GridViewOfAllUsers"
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="UsersDBSorce"
            PageSize="5" DataKeyNames="Id">
            <Columns>
                <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RegistrationDate" SortExpression="RegistrationDate">
                    <ItemTemplate>
                        <asp:Label ID="lblRegistrationDate" runat="server" Text='<%# Bind("RegistrationDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discriminator" SortExpression="Discriminator">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Discriminator") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="UsersDBSorce" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PersonalSiteDBConnectionString %>" 
            SelectCommand="SELECT * FROM [AspNetUsers]" 
            ConflictDetection="CompareAllValues"  
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [AspNetUsers] SET [UserName] = @UserName, [PasswordHash] = @original_PasswordHash, [SecurityStamp] = @original_SecurityStamp, [Email] = @Email, [RegistrationDate] = @original_RegistrationDate, [Discriminator] = @Discriminator WHERE [Id] = @original_Id AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([PasswordHash] = @original_PasswordHash) OR ([PasswordHash] IS NULL AND @original_PasswordHash IS NULL)) AND (([SecurityStamp] = @original_SecurityStamp) OR ([SecurityStamp] IS NULL AND @original_SecurityStamp IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([RegistrationDate] = @original_RegistrationDate) OR ([RegistrationDate] IS NULL AND @original_RegistrationDate IS NULL)) AND [Discriminator] = @original_Discriminator">
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="RegistrationDate" Type="DateTime" />
                <asp:Parameter Name="Discriminator" Type="String" />
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_PasswordHash" Type="String" />
                <asp:Parameter Name="original_SecurityStamp" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_RegistrationDate" Type="DateTime" />
                <asp:Parameter Name="original_Discriminator" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
