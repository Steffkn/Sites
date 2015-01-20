<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PersonalSite.Master" Inherits="System.Web.Mvc.ViewPage<PersonalSite.Models.UserDBContext>" %>

<script runat="server">

    void GridViewUsers_RowEditing(Object sender, GridViewEditEventArgs e)
    {
    }
</script>


<asp:Content ID="UsersTitle" ContentPlaceHolderID="TitleContent" runat="server">Users</asp:Content>

<asp:Content ID="ContentUsers" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Users</h2>
    <asp:GridView ID="GridViewUsers" runat="server"
        AllowPaging="True"
        AllowSorting="True"
        DataSourceID="SqlDataUsers" AutoGenerateColumns="true"
        DataKeyNames="ID" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RegistrationDate" HeaderText="RegistrationDate" SortExpression="RegistrationDate" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataUsers" runat="server"
        ConnectionString="<%$ ConnectionStrings:PersonalSiteConnectionString %>"
        OnSelecting="SqlDataSource1_Selecting"
        ProviderName="<%$ ConnectionStrings:PersonalSiteConnectionString.ProviderName %>"
        SelectCommand="SELECT [ID], [UserName], [Email], [RegistrationDate] FROM [Users] ORDER BY [ID]"
        DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [Users] ([UserName], [Email], [RegistrationDate]) VALUES (@UserName, @Email, @RegistrationDate)"
        UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [Email] = @Email, [RegistrationDate] = @RegistrationDate WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="RegistrationDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="RegistrationDate" Type="DateTime" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
