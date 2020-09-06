<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NadRegistrationWeb.LoginPage" MasterPageFile="~/MasterPage.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>
        <strong>Login Page</strong>
    </h1>
    <hr />

    <div class="row">
        <div class="col-md-8">
            <div id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <p>
                        <a href="Registration.aspx" class="btn btn-primary">Register as a new user</a>
                    </p>
                    <hr />

                    <div class="form-group">
                        <label class="col-md-2 control-label">UserName</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please Enter Username" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Password</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please Enter Password" CssClass="text-danger"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login " CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>


            </div>
        </div>


    </div>
</asp:Content>
