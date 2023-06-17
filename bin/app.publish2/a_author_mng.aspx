<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="a_author_mng.aspx.cs" Inherits="WebApplicationLibrary.a_author_mng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
          // });
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('#GridView1').DataTable();
      });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:cadetblue" class="min-vh-100">
    <div class="container pt-5">
        <div class="row ">
            <!-- left column -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col" >
                                <center>
                                    <div class="row">
                                        <div class="col-md-2">
                                        <img src="img/id-card.png" width="100px" />
                                        </div>
                                        <div class="col-md-10 m-auto">
                                        <center>
                                            <h3 class="mt-2 ">Author Info</h3>
                                        </center>
                                        </div>
                                    </div>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="TextBox1" class="form-label">Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="authorid" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="getButton" runat="server" Text="Get" OnClick="getButton_Click"  />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label for="TextBox2" class="form-label">Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="authorName" runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <asp:Button class="btn btn-success" ID="addButton" runat="server" Text="Add" OnClick="addButton_Click"  />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <asp:Button class="btn btn-warning" ID="updateButton" runat="server" Text="Update" OnClick="updateButton_Click" />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <asp:Button class="btn btn-danger" ID="deleteButton" runat="server" Text="Delete" OnClick="deleteButton_Click" />
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
                            <div class="col" >
                                <center>
                                    <div class="row">
                                        <div class="col-md-2">
                                        <img src="img/check.png" width="100px" />
                                        </div>
                                        <div class="col-md-10 m-auto">
                                        <center>
                                            <h3 class="mt-2 ">Author list</h3>
                                        </center>
                                        </div>
                                    </div>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered table-hover"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
