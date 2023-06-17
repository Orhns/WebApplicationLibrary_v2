<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="a_book_inventory.aspx.cs" Inherits="WebApplicationLibrary.a_book_inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

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
                                                <img src="img/book.png" width="100px" />
                                            </div>
                                            <div class="col-md-10 m-auto">
                                                <center>
                                                    <h3 class="mt-2 ">Book Details</h3>
                                                </center>
                                            </div>
                                        </div>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label for="TextBox1" class="form-label">Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="bookIDtxt" runat="server" placeholder="ID"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="getBtn" runat="server" Text="Get" OnClick="getBtn_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <label for="TextBox2" class="form-label">Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="bookNametxt" runat="server" placeholder="Book Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col mt-3">
                                            <label for="TextBox8" class="form-label">Language</label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:DropDownList class="form-control" ID="DropDownLanguage" runat="server">
                                                        <asp:ListItem Text="English" Value="English" />
                                                        <asp:ListItem Text="Türkçe" Value="Türkçe" />
                                                        <asp:ListItem Text="German" Value="German" />
                                                        <asp:ListItem Text="Fransızca" Value="Fransızca" />
                                                        <asp:ListItem Text="Rusça" Value="Rusça" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col mt-3">
                                            <label for="TextBox4" class="form-label">Publisher Name</label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:DropDownList class="form-control" ID="DropDownPublishers" runat="server">
                                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col mt-3">
                                            <label for="DropDownList3" class="form-label">Author Name</label>
                                            <div class="form-group">
                                                <asp:DropDownList class="form-control" ID="DropDownAuthors" runat="server">
                                                    <asp:ListItem Text="Author1" Value="Author1" />
                                                    <asp:ListItem Text="Author2" Value="Author2" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col mt-3">
                                            <label for="TextBox5" class="form-label">Publish Date</label>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="publishDatetxt" runat="server" placeholder="" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="col mt-3">
                                        <label for="TextBox7" class="form-label">Genre</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:ListBox class="form-control" ID="ListBoxGenre" runat="server" SelectionMode="Multiple" Rows="5">
                                                    <asp:ListItem Text="Action" Value="Action" />
                                                    <asp:ListItem Text="Adventure" Value="Adventure" />
                                                    <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                                    <asp:ListItem Text="Motivation" Value="Motivation" />
                                                    <asp:ListItem Text="Classics" Value="Classics" />
                                                    <asp:ListItem Text="Wellness" Value="Wellness" />
                                                    <asp:ListItem Text="Crime" Value="Crime" />
                                                    <asp:ListItem Text="Horror" Value="Horror" />
                                                    <asp:ListItem Text="Poetry" Value="Poetry" />
                                                    <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                                    <asp:ListItem Text="Romance" Value="Romance" />
                                                    <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                                    <asp:ListItem Text="Art" Value="Art" />
                                                    <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                                    <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                                    <asp:ListItem Text="Health" Value="Health" />
                                                    <asp:ListItem Text="History" Value="History" />
                                                    <asp:ListItem Text="Math" Value="Math" />
                                                    <asp:ListItem Text="Science" Value="Science" />
                                                    <asp:ListItem Text="Travel" Value="Travel" />
                                                </asp:ListBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox11" class="form-label">Edition</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="editiontxt" runat="server" placeholder="1st"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox12" class="form-label">Book Cost</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="bookcosttxt" runat="server" placeholder="100" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox13" class="form-label">Pages</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="pagestxt" runat="server" placeholder="312" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox3" class="form-label">Actual Stock</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="actualstocktxt" runat="server" placeholder="13" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox12" class="form-label">Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="currentstocktxt" runat="server" placeholder="12" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-3">
                                    <label for="TextBox7" class="form-label">Issued Books</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="issuedbookstxt" runat="server" placeholder="1" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="description" class="form-label">Description</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="description" runat="server" placeholder="13" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-4">
                                    <div class="d-grid gap-2">
                                        <asp:Button class="btn btn-success" ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" />
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="d-grid gap-2">
                                        <asp:Button class="btn btn-primary" ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click" />
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="d-grid gap-2">
                                        <asp:Button class="btn btn-danger" ID="deleteBtn" runat="server" Text="Delete" OnClick="deleteBtn_Click" />
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id">


                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>


                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-10">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Author -
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                        &nbsp;| Genre -
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                        &nbsp;| Language -
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Publisher -
                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                        &nbsp;| Publish Date -
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                        &nbsp;| Pages -
                                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                        &nbsp;| Edition -
                                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Cost -
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                        &nbsp;| Actual Stock -
                                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                        &nbsp;| Available -
                                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Description -
                                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("book_description") %>'></asp:Label>

                                                                    </div>
                                                                </div>



                                                            </div>
                                                            <div class="col-lg-2">
                                                                <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>



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

    <!-- BOOK INVENTORY GRIDVİEW CANCELED OBJECTS
                                            <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                            <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                                            <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                            <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                            <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                                            <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                                            <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                                            <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                                            <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                                            <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                                            <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                                            <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                                            <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />-->

</asp:Content>
