<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="a_usrmng.aspx.cs" Inherits="WebApplicationLibrary.a_usrmng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: cadetblue" class="min-vh-100">
        <div class="container-fluid pt-4">
            <div class="row">
                <!-- left column -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img src="img/edit profile.png" width="100px" />
                                            </div>
                                            <div class="col-md-10 m-auto">
                                                <center>
                                                    <h3 class="mt-2 ">Member Details</h3>
                                                </center>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="TextBox1" class="form-label">Member ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="memberid" runat="server" placeholder="ID"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="getbutton" runat="server" Text="Get" OnClick="getbutton_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="TextBox2" class="form-label">Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="nametxt" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <label for="TextBox7" class="form-label">Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="statustxt" runat="server" ReadOnly="True"></asp:TextBox>
                                            <asp:LinkButton class="btn btn-success" runat="server" ID="activatebutton" OnClick="activatebutton_Click"><i class="fa-solid fa-square-check"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-warning" ID="pendingbutton" runat="server" OnClick="pendingbutton_Click"><i class="fa-solid fa-circle-pause"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-danger" ID="deactivatebutton" runat="server" OnClick="deactivatebutton_Click"><i class="fa-solid fa-square-xmark"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 mt-3">
                                    <label for="TextBox8" class="form-label">DOB</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="birthtxt" runat="server" TextMode="Date" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox9" class="form-label">Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="numbertxt" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5 mt-3">
                                    <label for="TextBox7" class="form-label">Email ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="emailtxt" runat="server" ReadOnly="True" TextMode="Email"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox11" class="form-label">State</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="statetxt" runat="server" placeholder="Select" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox12" class="form-label">City</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="citytxt" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox13" class="form-label">Pin Code</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="pincodetxt" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mt-3">
                                    <label for="TextBox3" class="form-label">Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="addresstxt" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col mt-4">
                                    <div class="d-grid gap-2">
                                        <asp:Button class="btn btn-primary btn-danger" ID="deletebutton" runat="server" Text="Delete User Permanently" OnClick="deletebutton_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Right column -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img src="img/add-contact.png" width="100px" />
                                            </div>
                                            <div class="col-md-10 m-auto">
                                                <center>
                                                    <h3 class="mt-2 ">Member List</h3>
                                                </center>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                            <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact no" SortExpression="contact_no" />
                                            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
