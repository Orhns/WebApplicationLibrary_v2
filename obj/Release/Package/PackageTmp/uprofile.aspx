<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="uprofile.aspx.cs" Inherits="WebApplicationLibrary.uprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container min-vh-100 mt-2">
        <div class="row">
            <!-- left column -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                    <img src="img/edit profile.png" width="100px" />
                            </div>
                            <div class="col-md-10 m-auto">
                                <center>
                                    <h4 class="mt-2 ">Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label ID="Label1" runat="server" Text="Your Status" class="badge rounded-pill text-bg-success"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col-md-6">
                                <label for="TextBox1" class="form-label">Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="nameTxt" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="TextBox2" class="form-label">Birth Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="birthdateTxt" runat="server" placeholder="Birth Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label for="TextBox3" class="form-label">Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="numberTxt" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="TextBox4" class="form-label">Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="emailTxt" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label for="DropDownList1" class="form-label" id="dropdownstate">State</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="stateDropDown" runat="server" TabIndex="0">
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
                                    <asp:TextBox CssClass="form-control" ID="cityTxt" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="TextBox7" class="form-label">Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="pincodeTxt" runat="server" placeholder="Pin code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label for="Textbox8" class="form-label">Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="addressTxt" runat="server" placeholder="Enter your address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <center>
                                <div class="col-md-3">
                                    <div class="form-group d-grid gap-2 mb-2 mt-3">
                                        <span class="badge rounded-pill text-bg-danger">Change Password</span>
                                    </div>
                                </div>
                            </center>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label for="TextBox5" class="form-label">User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="userIDTxt" runat="server" placeholder="User ID" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="TextBox9" class="form-label">Old password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="oldpassTxt" runat="server" placeholder="Password" Enabled="False" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="TextBox10" class="form-label">New password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="newpassTxt" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="d-grid gap-2 mt-3">
                                    <asp:Button class="btn btn-success" ID="updateBtn" runat="server" Text="Apply Changes" OnClick="updateBtn_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- right column -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                    <img src="img/bookkk.png" width="100px" />
                            </div>
                            <div class="col-md-10 m-auto">
                                <center>
                                    <h4 class="mt-2 ">Your Books</h4>
                                    <div class="row mb-2">
                                        <center>
                                            <asp:Label ID="Label2" runat="server" Text="Informations" class="badge rounded-pill text-bg-success"></asp:Label>
                                        </center>
                                    </div>
                                </center>
                            </div>
                        </div>
                        <hr />
                        
                        <div class="row">
                            <div class="col table-responsive">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
    </div>

</asp:Content>
