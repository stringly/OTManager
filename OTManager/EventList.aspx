<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="OTManager.EventList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div id="EventListTitle" runat="server" class="ContentHead"><h1>Available Overtime Events</h1></div>
        <asp:GridView ID="ActiveEventList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="OTManager.Models.Event" SelectMethod="GetAvailableEvents" 
        CssClass="table table-striped table-bordered" OnRowDataBound="ActiveEventList_RowDataBound" >   
        <Columns>
        <asp:BoundField DataField="EventName" HeaderText="Name" SortExpression="Event" />        
        <asp:BoundField DataField="StartTime" HeaderText="Start Time" />        
        <asp:BoundField DataField="EndTime" HeaderText="End Time" />
        <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />     
        <asp:TemplateField HeaderText="Register" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">            
                <ItemTemplate>
                    <asp:Button id="Register" runat="server" Text="Register" CausesValidation="false" OnCommand="Register_Command" CssClass="btn btn-default" CommandArgument='<%# Eval("EventID") %>'></asp:Button>
                </ItemTemplate>        
        </asp:TemplateField>         
        </Columns>    
        </asp:GridView>
        <p class="lead"></p>
</asp:Content>
