<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="OTManager.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
  <h2>Create Overtime Event</h2>
  <script src="../Scripts/jquery-3.1.1.min.js" type="text/javascript"></script>
  <script src="../Scripts/jquery-ui-1.12.1.min.js" type="text/javascript"></script>
  <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
  <link href="../Content/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />
  <script src="../Scripts/jquery-ui-timepicker-addon.min.js"></script>
  <script type="text/javascript">
    $(function () {
        $("[id$=StartDate]").datetimepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: 'mm/dd/yy',
            controlType: 'select',
            timeFormat: 'HH:mm'
        });
    });
    $(function () {
        $("[id$=EndDate]").datetimepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: 'mm/dd/yy',
            controlType: 'select',
            timeFormat: 'HH:mm'
        });
    });
    $(function () {
        $("[id$=RegPeriodStartDate]").datetimepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: 'mm/dd/yy',
            controlType: 'select',
            timeFormat: 'HH:mm'
        });
    });
    $(function() {
        $("#<%= StartsOnDate.ClientID %>").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: 'mm/dd/yy',
            controlType: 'select'
        });
    });
  </script>
  <script type="text/javascript">
      function DateTimeValidate(sender, args) {
          var start = document.getElementById('<%= StartDate.ClientID %>').value;
          var end = document.getElementById('<%= EndDate.ClientID %>').value;
          var dt1 = start.split(/[/\/ :/]/).map(Number);
          var dt2 = end.split(/[/\/ :/]/).map(Number);
          var sd = new Date(dt1[2], dt1[0], dt1[1], dt1[3], dt1[4]);
          var ed = new Date(dt2[2], dt2[0], dt2[1], dt2[3], dt2[4]);
          args.IsValid = (sd < ed);          
      };
      function RepeatDateValidate(sender, args) {
          var start = document.getElementById('<%= StartDate.ClientID %>').value;
          var end = document.getElementById('<%= StartsOnDate.ClientID %>').value;
          var dt1 = start.split(/[/\/ :/]/).map(Number);
          var dt2 = end.split(/[/\/ :/]/).map(Number);
          var sd = new Date(dt1[2], dt1[0], dt1[1]);
          var ed = new Date(dt2[2], dt2[0], dt2[1]);
          args.IsValid = (sd <= ed);          
      };
    function RepeatChange()
    {
        console.log("Repeat was called");
        var choice = document.getElementById('<%= RepeatDropDown.ClientID %>').value;
        console.log("Choice is: " + choice);
        switch (choice) {
            case "0":
                console.log("Choice 0 switch fired");
                document.getElementById('<%=DailyDropdownControlGroup.ClientID%>').style.display = "block";
                document.getElementById('<%=StartsOnDateControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=DaySelectorControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=MonthlyDropDownControlGroup.ClientID%>').style.display = "none";
                break;
            case "1":
                document.getElementById('<%=DailyDropdownControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=StartsOnDateControlGroup.ClientID%>').style.display = "block";
                document.getElementById('<%=DaySelectorControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=MonthlyDropDownControlGroup.ClientID%>').style.display = "none";
                break;
            case "2":
                document.getElementById('<%=DailyDropdownControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=StartsOnDateControlGroup.ClientID%>').style.display = "block";
                document.getElementById('<%=DaySelectorControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=MonthlyDropDownControlGroup.ClientID%>').style.display = "none";
                break;
            case "3":
                document.getElementById('<%=DailyDropdownControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=StartsOnDateControlGroup.ClientID%>').style.display = "block";
                document.getElementById('<%=DaySelectorControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=MonthlyDropDownControlGroup.ClientID%>').style.display = "none";
                break;
            case "4":
                document.getElementById('<%=DailyDropdownControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=StartsOnDateControlGroup.ClientID%>').style.display = "block";
                document.getElementById('<%=DaySelectorControlGroup.ClientID%>').style.display = "block";
                document.getElementById('<%=MonthlyDropDownControlGroup.ClientID%>').style.display = "none";
                break;
            case "5":
                document.getElementById('<%=DailyDropdownControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=StartsOnDateControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=DaySelectorControlGroup.ClientID%>').style.display = "none";
                document.getElementById('<%=MonthlyDropDownControlGroup.ClientID%>').style.display = "block";
                break;

        }
        
    }
  </script>

  <p></p>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">                
                <h4>Name of Event</h4>  
                <div class="form-group col-md-6 col-sm-6">
                                                           
                    <asp:label runat="server" CssClass="text-primary" for="EventName">Event/Shift Name:</asp:label><br />
                    <asp:TextBox ID="EventName" runat="server" CssClass="form-control" /><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EventName" 
                        CssClass="text-danger" ErrorMessage="A shift name is required." />
                </div>
            </div> 
            <div class="col-md-6">
                <h4>Time Frame:</h4>
                <div class="form-group col-md-6 col-sm-3"> 
                                                                        
                    <asp:label runat="server" CssClass="text-primary" for="StartDate">Start Date:</asp:label><br />
                    <asp:TextBox ID="StartDate" runat="server" CssClass="form-control" TextMode="DateTime"/><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="StartDate" 
                        CssClass="text-danger" ErrorMessage="A start date/time is required." Display="Dynamic" />
                    <asp:CustomValidator ID="CustomValidator3" runat="server"
                        OnServerValidate="DateValidate"
                        ControlToValidate="StartDate"                       
                        ErrorMessage="Start Date/Time must be before End Date/Time."
                        CssClass="text-danger" 
                        Display="Dynamic" />                  
                    <asp:CustomValidator ID="CustomValidator4" runat="server" 
                        ControlToValidate = "StartDate"
                        ErrorMessage = "Start Date/Time must be before End Date/Time."
                        ClientValidationFunction="DateTimeValidate"
                        CssClass="text-danger"/> 
                </div>
                        <div class="form-group col-md-6 col-sm-3"> 
                          <asp:label runat="server" CssClass="text-primary" for="EndDate">End Date:</asp:label><br />
                          <asp:TextBox ID="EndDate" runat="server" CssClass="form-control" TextMode="DateTime"/><br />
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="EndDate" 
                                CssClass="text-danger" ErrorMessage="A end date/time is required." Display="Dynamic" />
                          <asp:CustomValidator ID="CustomValidator1" runat="server"
                                OnServerValidate="DateValidate"
                                ControlToValidate="EndDate"                       
                                ErrorMessage="Start Date/Time must be before End Date/Time."
                                CssClass="text-danger"
                                Display="Dynamic" />                   
                          <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                ControlToValidate = "EndDate"
                                ErrorMessage = "Start Date/Time must be before End Date/Time."
                                ClientValidationFunction="DateTimeValidate"
                                CssClass="text-danger" />                      
                        </div>
               </div>
            </div>
        <div class="row">
             <div class="col-md-6 col-sm-6">
                  <h4>Staffing Requirements:</h4>            
                        <div class="form-group col-md-3 col-sm-3">                    
                            <asp:label runat="server" CssClass="text-primary" for="MaxStaff">Maximum</asp:label><br />
                            <asp:TextBox ID="MaxStaff" runat="server" CssClass="form-control" style="width:75px"/><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="MaxStaff" 
                                CssClass="text-danger" ErrorMessage="Max Staffing is required." Display="Dynamic" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="MaxStaff" ValidationExpression="^[1-9]\d*$"
                                CssClass="text-danger" ErrorMessage="Must be a positive whole number value." />
                        </div>        
                        <div class="form-group col-md-3 col-sm-3">                    
                            <asp:label runat="server" CssClass="text-primary" for="MinStaff">Minimum</asp:label><br />
                            <asp:TextBox ID="MinStaff" runat="server" CssClass="form-control" style="width:75px"/><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="MinStaff" 
                                CssClass="text-danger" ErrorMessage="Min Staffing is required." Display="Dynamic"  />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="MinStaff" ValidationExpression="^[1-9]\d*$"
                                CssClass="text-danger" ErrorMessage="Must be a positive whole number value." />
                        </div>
                        <div class="form-group col-md-3 col-sm-3">                    
                            <asp:label runat="server" CssClass="text-primary" for="SuperStaff">Supervisors</asp:label><br />
                            <asp:TextBox ID="SuperStaff" runat="server" CssClass="form-control" style="width:75px"/><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="SuperStaff" 
                                CssClass="text-danger" ErrorMessage="Supervisor Staffing is required." Display="Dynamic" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="SuperStaff" ValidationExpression="^[1-9]\d*$"
                                CssClass="text-danger" ErrorMessage="Must be a positive whole number value." />
                        </div>
                </div>
                <div class="col-md-6 col-sm-6">

                    <h4>Funding Information</h4>
                        <div class="form-group col-md-6 col-sm-6">                    
                            <asp:label runat="server" CssClass="text-primary" for="Fund Center">Fund:</asp:label><br />
                            <asp:TextBox ID="FundCenter" runat="server" CssClass="form-control"/><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="FundCenter" 
                                CssClass="text-danger" ErrorMessage="FundCenter is required."  />
                        </div>
                        <div class="form-group col-md-6 col-sm-6">                    
                            <asp:label runat="server" CssClass="text-primary" for="LocationCode">Location:</asp:label><br />
                            <asp:TextBox ID="LocationCode" runat="server" CssClass="form-control"/><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="LocationCode" 
                                CssClass="text-danger" ErrorMessage="Location code is required." />
                        </div>
                    </div>
        </div>
    <div class="row">
        <div class="form-inline">
            <div class="col-md-6">
                <h4>Registration RuleSet</h4>
                    <div class="form-group col-md-6">
                    <asp:label runat="server" CssClass="text-primary" for="StartDate">Registration Start Date:</asp:label><br />
                    <asp:TextBox ID="RegPeriodStartDate" runat="server" CssClass="form-control" TextMode="DateTime"/><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="StartDate" 
                        CssClass="text-danger" ErrorMessage="Registration start date/time is required." Display="Dynamic" />
                    </div>
                    <div class="form-group col-md-6">
                    <asp:label runat="server" CssClass="text-primary" for="RegistrationAutomationOptions">Registration Selection:</asp:label><br />
                    <asp:RadioButtonList runat="server" ID="RegistrationAutomationOptions" CssClass="radio">
                        <asp:ListItem>First Come, First Serve</asp:ListItem>
                        <asp:ListItem>Weighted Selection</asp:ListItem>
                        <asp:ListItem>Manual Selection</asp:ListItem>
                    </asp:RadioButtonList>
                    </div>
            </div>     
        </div>

            <div class="form col-md-6">
                <h4>Clone Event</h4>
                    <div class="form-group col-md-6 col-sm-6">
                        <asp:Label runat="server" CssClass="text-primary" for="RepeatDropdown">Repeats:</asp:Label>
                        <asp:DropDownList ID="RepeatDropDown" runat="server" CssClass="form-control" onchange="RepeatChange()">
                            <asp:ListItem Value="0">Daily</asp:ListItem>
                            <asp:ListItem Value="1">Every weekday (Monday to Friday)</asp:ListItem>
                            <asp:ListItem Value="2">Every Monday, Wednesday, and Friday</asp:ListItem>
                            <asp:ListItem Value="3">Every Tuesday and Thursday</asp:ListItem>
                            <asp:ListItem Value="4">Weekly</asp:ListItem>
                            <asp:ListItem Value="5">Monthly</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        <div runat="server" class="checkboxlist form-group col-md-6 col-sm-6" id="DaySelectorControlGroup" style="display:none">                    
                            <asp:Label runat="server" CssClass="text-primary" for="DaySelector">Repeat on:</asp:Label><br />
                            <asp:CheckBoxList runat="server" ID="DaySelector" CssClass="checkbox checkbox-inline" RepeatDirection="Horizontal" TextAlign="Left">
                                <asp:ListItem Value="0">S</asp:ListItem>
                                <asp:ListItem Value="1">M</asp:ListItem>
                                <asp:ListItem Value="2">T</asp:ListItem>
                                <asp:ListItem Value="3">W</asp:ListItem>
                                <asp:ListItem Value="4">T</asp:ListItem>
                                <asp:ListItem Value="5">F</asp:ListItem>
                                <asp:ListItem Value="7">S</asp:ListItem>                        
                            </asp:CheckBoxList>
                        </div>
                <div runat="server" class="form-group" ID="MonthlyDropDownControlGroup" style="display:none"><br />
                    <asp:Label runat="server" CssClass="text-primary" for="MonthlyDropDown">Repeat every:</asp:Label>
                    <asp:DropDownList ID="MonthlyDropDown" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>
                    </asp:DropDownList>
                    <label>months</label>
                </div>
                <div runat="server" class="form-group col-md-6 col-sm-6" ID="DailyDropdownControlGroup" style="display:block">
                    <asp:Label runat="server" CssClass="text-primary" for="DailyDropDown">Repeat every:</asp:Label>
                    <asp:DropDownList ID="DailyDropDown" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>
                    </asp:DropDownList>
                    <label>days</label>
                </div>
                <div runat="server" class="form-group col-md-6 col-sm-6" ID="StartsOnDateControlGroup" style="display:none">
                    <asp:Label runat="server" CssClass="text-primary" for="StartsOnDate">Starts on:</asp:Label>
                    <asp:TextBox ID="StartsOnDate" runat="server" CssClass="form-control" TextMode="DateTime"/><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="StartsOnDate" 
                        CssClass="text-danger" ErrorMessage="A start date/time is required." Display="Dynamic" />
                    <asp:CustomValidator ID="CustomValidator5" runat="server" 
                        ControlToValidate = "StartsOnDate"
                        ErrorMessage = "Repeat Start Date must be after Event Start Date/Time."
                        ClientValidationFunction="RepeatDateValidate"
                        CssClass="text-danger" />  
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <asp:Label runat="server" for="StopDate" CssClass="text-primary">Repeat until:</asp:Label>
                    <asp:TextBox runat="server" ID="StopDate" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            </div> 
 
        </div>
    </div>

    <div class="row"><br />
        <div class="form-inline">
            <div class="form-group col-md-6"> 
                <asp:Button ID="CreateButton" runat="server" Text="Create" CssClass="btn btn-default" OnClick="Unnamed_Click" CausesValidation="True" />
            </div>
        </div>
    </div>
</div>



</asp:Content>
