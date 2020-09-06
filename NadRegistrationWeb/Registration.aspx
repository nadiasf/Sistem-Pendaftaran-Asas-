<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="NadRegistrationWeb.Registration" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>
        <strong>Register Page</strong>
    </h1>
    <hr />
    <div class="row">
        <div class="col-md-8">
            <div id="RegisterForm">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="col-md-2 control-label">User Name:</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox1UN" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1UN" ErrorMessage="User name required" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">E-email:</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="You must enter the valid email ID" CssClass="text-danger" ControlToValidate="TextBoxEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Password:</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox3Pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3Pass" ErrorMessage="Message is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Confirm Password</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox4ConPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4ConPass" ErrorMessage="Confirm password is required" CssClass="text-danger" Display="Dynamic">
                            </asp:RequiredFieldValidator><br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both password must be same" ControlToCompare="TextBox3Pass" ControlToValidate="TextBox4ConPass" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Country:</label>
                        <div class="col-md-5">
                            <asp:DropDownList ID="DropDownList1Country" runat="server" CssClass="form-control">
                                <asp:ListItem>Select Country</asp:ListItem>
                                <asp:ListItem>USA</asp:ListItem>
                                <asp:ListItem>UK</asp:ListItem>
                                <asp:ListItem>Malaysia</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1Country" ErrorMessage="Country is required" CssClass="text-danger" InitialValue="Select Country"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="btn btn-primary" />
                            <input id="Reset1" type="reset" value="reset" class="btn btn-danger" />
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>
    <div>
    </div>

</asp:Content>


