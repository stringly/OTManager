﻿<%@ Page Title="UserHome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="OTManager.UserHome" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div id="RegistrationListTitle" runat="server" class="ContentHead"><h1>Current Registrations</h1></div>
        <asp:GridView ID="RegistrationList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="OTManager.Models.Registration" SelectMethod="GetUserRegistrations" 
        CssClass="table table-striped table-bordered" >   
        <Columns>
        <asp:BoundField DataField="Event.EventName" HeaderText="Name" SortExpression="Event" />        
        <asp:BoundField DataField="Event.StartTime" HeaderText="Start Time" />        
        <asp:BoundField DataField="Event.EndTime" HeaderText="End Time"/>     
        <asp:TemplateField HeaderText="Delete Registration" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">            
                <ItemTemplate>
                    <asp:Button id="Delete" runat="server" Text="Delete" CausesValidation="false" OnCommand="Delete_Command" CssClass="btn btn-default" CommandArgument='<%# Eval("RegistrationID") %>'></asp:Button>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
        </asp:GridView>
        <p class="lead"></p>
</asp:Content>
