<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="a_book_iss.aspx.cs" Inherits="WebApplicationLibrary_v2.a_book_i" %>

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
                                                    <h3 class="mt-2 ">Reading Stats</h3>
                                                </center>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                               <div class="col">
                                   <asp:Chart ID="Chart1" runat="server" Width="650px" >
                                       <Series>
                                           <asp:Series Name="Series1" ChartType="StackedBar" YValuesPerPoint="4"></asp:Series>
                                       </Series>
                                       <ChartAreas>
                                           <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                       </ChartAreas>
                                   </asp:Chart>
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
                                            <div class="col-md-8 m-auto">
                                                <center>
                                                    <h3 class="mt-2 ">Issued Book list</h3>
                                                </center>
                                            </div>
                                            <div class="col-md-2 mt-2">
                                                <div class="d-grid gap-2">
                                                    <asp:Button class="btn btn-success" ID="returnBookBtn" runat="server" Text="Return" OnClick="returnBookBtn_Click" OnClientClick="return confirm('are you sure?')" Enabled="False" />
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:webappLibraryDB_v2ConnectionString %>' SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                <div class="col table-responsive" >
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:BoundField DataField="transaction_id" HeaderText="ID" InsertVisible="False" SortExpression="transaction_id" />
                                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
                                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name"></asp:BoundField>
                                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id"></asp:BoundField>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id"></asp:BoundField>
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date"></asp:BoundField>
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date"></asp:BoundField>
                                            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                        </Columns>
                                        <SelectedRowStyle BackColor="#3399FF" />
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
