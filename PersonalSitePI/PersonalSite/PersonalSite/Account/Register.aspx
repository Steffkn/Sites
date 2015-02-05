<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PersonalSite.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p>
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div>
        <h4>Create a new account.</h4>
        <hr />
        <asp:ValidationSummary runat="server" ForeColor="Red" />
        <div>
            <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="UserName" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    ErrorMessage="The user name field is required." ForeColor="Red" />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    ErrorMessage="The password field is required." ForeColor="Red" />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    Display="Dynamic" ErrorMessage="The confirm password field is required." ForeColor="Red" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ForeColor="Red" />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="Email" ToolTip="Email for even more spam">E-mail address</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="Email" />
            </div>
        </div>
        <div>
            <div>
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" />
            </div>
        </div>
    </div>
</asp:Content>
