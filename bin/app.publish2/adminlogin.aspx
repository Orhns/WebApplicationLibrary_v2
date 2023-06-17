<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplicationLibrary.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bg-dark min-vh-100">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <div class="row">
                                        <div class="col-md-4">
                                        <img src="img/admin login.png" width="100px" />
                                        </div>
                                        <div class="col-md-8 m-auto">
                                        <h3 class="mt-2 text-lg-start">Admin Login</h3>
                                        </div>
                                    </div>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="TextBox1" class="form-label">Admin ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="adminid" runat="server" placeholder=""></asp:TextBox>
                                </div>
                                <label for="TextBox2" class="form-label">Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="apassword" runat="server" placeholder="" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group d-grid gap-2 mb-2 mt-3">
                                    <asp:Button class="btn btn-success " ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    </section>
</asp:Content>
