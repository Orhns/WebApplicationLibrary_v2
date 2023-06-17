<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="usignup.aspx.cs" Inherits="WebApplicationLibrary.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div style="background-image: url('img/background2.jpg'); background-size:cover"; class="min-vh-100">
    <div class="container" style="min-height:max-content">
        <div class="row">
            <div class="col-md-8 mt-4 mx-auto">
                <div class="card">
                    <div class="card-body" style="background-color:lightgray;">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <div class="row">
                                        <div class="col-md-4">
                                    <img src="img/add-user.png" width="100px" />
                                        </div>
                                        <div class="col-md-8 m-auto">
                                    <h4 class="mt-1 text-lg-start">Member Signup Form</h4>
                                        </div>
                                    </div>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label for="TextBox1" class="form-label">Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="fullname" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="TextBox2" class="form-label">Birth Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="birthdate" runat="server" placeholder="Birth Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label for="TextBox3" class="form-label">Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="number" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="TextBox4" class="form-label">Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label for="DropDownList1" class="form-label">State</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1state" runat="server" TabIndex="0">
                                        <asp:ListItem Text="Select" Value="0" Enabled="True" />
                                        <asp:ListItem Text="Turkey" Value="Turkey" />
                                        <asp:ListItem Text="Bulgaria" Value="Bulgaria" />
                                        <asp:ListItem Text="Greece" Value="Greece" />
                                        <asp:ListItem Text="France" Value="France" />
                                        <asp:ListItem Text="Lithuania" Value="Lithuania" />
                                        <asp:ListItem Text="Germany" Value="Germany" />
                                        <asp:ListItem Text="Russia" Value="Russia" />
                                        <asp:ListItem Text="Netherlands" Value="Netherlands" />
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="TextBox6" class="form-label">City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="city" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="TextBox7" class="form-label">Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="pincode" runat="server" placeholder="Pin code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label for="Textbox8" class="form-label">Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="fulladdress" runat="server" placeholder="Enter your address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <center>
                                <div class="col-md-3">
                                    <div class="form-group d-grid gap-2 mb-2 mt-3">
                                        <span class="badge rounded-pill text-bg-info">Login credits</span>
                                    </div>
                                </div>
                            </center>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label for="TextBox5" class="form-label">Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="memberid" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="TextBox9" class="form-label">Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group d-grid gap-2 mb-2 mt-3">
                                    <asp:Button class="btn btn-success " ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
    </div>
   

</asp:Content>
