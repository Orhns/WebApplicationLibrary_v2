<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="a_publisher_mng.aspx.cs" Inherits="WebApplicationLibrary.a_publisher_mng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:cadetblue" class="min-vh-100">
    <div class="container pt-4">
        <div class="row">
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
                                            <h3 class="mt-2 ">Publisher Details</h3>
                                        </center>
                                        </div>
                                    </div>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="TextBox1" class="form-label">Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="publisherid" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="getbutton" runat="server" Text="Get" OnClick="getbutton_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label for="TextBox2" class="form-label">Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="publishername" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <asp:Button class="btn btn-success" ID="addbutton" runat="server" Text="Add" OnClick="addbutton_Click"  />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <asp:Button class="btn btn-warning" ID="updatebutton" runat="server" Text="Update" OnClick="updatebutton_Click" />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <asp:Button class="btn btn-danger" ID="deletebutton" runat="server" Text="Delete" OnClick="deletebutton_Click" />
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
                                            <h3 class="mt-2 ">Publisher list</h3>
                                        </center>
                                        </div>
                                    </div>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
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
