<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="a_book_iss.aspx.cs" Inherits="WebApplicationLibrary.a_book_i" %>

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
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img src="img/bookkk.png" width="100px" />
                                            </div>
                                            <div class="col-md-10 m-auto">
                                                <center>
                                                    <h3 class="mt-2 ">Book Issuing</h3>
                                                </center>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label for="TextBox2" class="form-label">Member ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="memberidTxt" runat="server" placeholder="Member ID"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="TextBox1" class="form-label">Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="bookidTxt" runat="server" placeholder="Book ID"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="getBtn" runat="server" Text="Get" OnClick="getBtn_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mt-3">
                                    <label for="TextBox3" class="form-label">Member Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="membernameTxt" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="TextBox4" class="form-label">Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="booknameTxt" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row ">
                                <div class="col-md-6 mt-3">
                                    <label for="TextBox5" class="form-label">Start Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="startdateTxt" runat="server" placeholder="Member Name" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <label for="TextBox6" class="form-label">End Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="enddateTxt" runat="server" placeholder="Book Name" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 mt-4">
                                    <div class="d-grid gap-2">
                                        <asp:Button class="btn btn-primary" ID="issueBtn" runat="server" Text="Issue" OnClick="issueBtn_Click" />
                                    </div>
                                </div>
                                <div class="col-6 mt-4">
                                    <div class="d-grid gap-2">
                                        <asp:Button class="btn btn-success" ID="returnBtn" runat="server" Text="Return" OnClick="returnBtn_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Right column -->
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img src="img/check.png" width="100px" />
                                            </div>
                                            <div class="col-md-10 m-auto">
                                                <center>
                                                    <h3 class="mt-2 ">Issued Book list</h3>
                                                </center>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id"></asp:BoundField>
                                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name"></asp:BoundField>
                                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id"></asp:BoundField>
                                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date"></asp:BoundField>
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date"></asp:BoundField>
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
