<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Users.aspx.cs" Inherits="NadRegistrationWeb.Users" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Users Page
    </h1>
    <hr />
    <div class="row">
        <div class="col-md-6">

            <asp:Label ID="Label_welcome" runat="server" Text="Welcome User  "></asp:Label>
            <div class="table-responsive">
                <asp:GridView ID="GridViewUser" runat="server" ShowHeaderWhenEmpty="false" AutoGenerateColumns="False" CellPadding="3" GridLines="Vertical" DataKeyNames="ID"
                    CssClass="table table-bordered table-hover table-condensed table-striped"
                    OnRowEditing="gvUser_RowEditing" OnRowCancelingEdit="gvUser_RowCancelingEdit"
                    OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting">

                    <%-- <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />--%>

                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("UserName") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUserName" Text='<%# Eval("UserName") %>' runat="server" />
                            </EditItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" Text='<%# Eval("Email") %>' runat="server" />

                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEmailFooter" runat="server" />

                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Email") %>' runat="server" />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Pictures/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/Pictures/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ImageUrl="~/Pictures/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/Pictures/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                            </EditItemTemplate>

                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
            <br />
            <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>

    <asp:Button ID="Button_Logout" runat="server" OnClick="Button_Logout_Click" Text="Logout" CssClass="btn btn-warning" />
</asp:Content>
