<%@ Page Title="UserHome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="OTManager.UserHome" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <h1><%: Title %>.</h1>
        <div id="RegistrationListTitle" runat="server" class="ContentHead"><h1>Current Registrations</h1></div>
        <asp:GridView ID="RegistrationList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="OTManager.Models.Registration" SelectMethod="GetUserRegistrations" 
        CssClass="table table-striped table-bordered" >   
        <Columns>
        <asp:BoundField DataField="Event.EventName" HeaderText="Name" SortExpression="Event" />        
        <asp:BoundField DataField="Event.StartTime" HeaderText="Start Time" />        
        <asp:BoundField DataField="Event.EndTime" HeaderText="End Time"/>     
        <asp:TemplateField HeaderText="Delete Registration">            
                <ItemTemplate>
                    <asp:CheckBox id="Delete" runat="server"></asp:CheckBox>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
        </asp:GridView>
        <p class="lead"></p>
</asp:Content>
