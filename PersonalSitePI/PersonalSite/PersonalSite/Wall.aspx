<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wall.aspx.cs" Inherits="PersonalSite.Wall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>The Wall</h1>
        <p>A place where u can leave a comment about the site :)</p>
        <asp:Repeater runat="server" ID="WallMessages">
            <ItemTemplate>
                <asp:Panel runat="server" ID="PanelWallMessage" CssClass="wallMessage">
                    <asp:Panel runat="server" ID="PanelSender" CssClass="sender">Sender</asp:Panel>
                    <asp:Panel runat="server" ID="PanelMessage" CssClass="wallMessage">Message</asp:Panel>
                </asp:Panel>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>
        <div id="sendMessage">
            <asp:TextBox ID="Message" runat="server"></asp:TextBox>
            <asp:Button runat="server" ID="ButtonSendMSG" OnClick="ButtonSendMSG_Click" Text="Send"/>
        </div>
    </div>
</asp:Content>
