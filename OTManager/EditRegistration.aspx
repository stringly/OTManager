<%@ Page Title="Edit User Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRegistration.aspx.cs" Inherits="OTManager.EditRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <asp:Label ID="userName" runat="server" />
                    <h4>Please edit any fields that need to be updated.</h4> 
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Rank_List" CssClass="col-md-2 control-label">Rank</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="Rank_List" runat="server" CssClass="form-control">
                                <asp:ListItem Selected="True" Value="P/O"> P/O </asp:ListItem>
                                <asp:ListItem Value="POFC"> POFC </asp:ListItem>
                                <asp:ListItem Value="Cpl."> Cpl. </asp:ListItem>
                                <asp:ListItem Value="Sgt."> Sgt. </asp:ListItem>
                                <asp:ListItem Value="Lt."> Lt. </asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Rank_List" CssClass="text-danger" ErrorMessage="Please select a Rank." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="First_Name" CssClass="col-md-2 control-label">First Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="First_Name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="First_Name" CssClass="text-danger" ErrorMessage="First Name is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Last_Name" CssClass="col-md-2 control-label">Last Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Last_Name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Last_Name" CssClass="text-danger" ErrorMessage="Last Name is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ID_Number" CssClass="col-md-2 control-label">ID Number</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ID_Number" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ID_Number" CssClass="text-danger" ErrorMessage="ID Number is required." />
                            <asp:RangeValidator runat="server"  ControlToValidate="ID_Number" CssClass="text-danger" MinimumValue="500" MaximumValue="4999" Type="Integer" ErrorMessage="Please enter a valid PGPD ID Number" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label">Phone Number</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Phone" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Phone" CssClass="text-danger" ErrorMessage="Contact Number is required." />
                            <asp:RegularExpressionValidator runat="server"  ControlToValidate="Phone" CssClass="text-danger" ErrorMessage="Please enter a valid 10-digit phone number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" />
                        </div>
                    </div>
                    <!-- <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div> -->
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Update_Click" Text="Update" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>

                <!--<p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p> -->
            </section>
        </div>
    </div>
</asp:Content>
