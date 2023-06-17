<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplicationLibrary.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Showcase -->
    <div id="homepg_bg" class="min-vh-100" >
    <section class=" text-light p-lg-0 pt-lg-1 text-center text-sm-start" id="showcaseSec">
        <div class="container justify-content-center">
            <div class="row d-sm-flex align-items-center justify-content-center">
                <div class="col-4 d-none d-sm-block">
                    <div class="d-sm-flex ">
                        <img  class="img-fluid " src="/img/flyinbooks.png" alt="">
                    </div>
                </div>
                <div class="col-8">
                    <div class="m-lg-5">
                    <h1>Welcome to<span class="text-warning"> library management system! </span></h1>
                    <p class="my-4">We're excited to have you join us on this platform designed to simplify your library operations. With our user-friendly interface and powerful features, you'll be able to effortlessly manage your library, streamline workflows, and provide a seamless experience for your patrons. Get ready to explore and make the most of our system's capabilities. We're here to support you every step of the way. Welcome, and happy library management!</p>
                    <div class="d-grid d-md-flex justify-content-md-end">
                        <button class="btn btn-primary btn-lg me-md-2" data-bs-toggle="modal" data-bs-target="#enroll">Search for the books.</button>
                    </div>
                    </div>
                </div>    
            </div>
        </div>
    </section>
    <section class="">
    <div class="container ">
    <h2 class="text-center mb-4 text-light">Frequently Asked Questions</h2>
    <!--accordeon flush-->
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                How do I create an account with the online library?
                </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">To create an account with the online library, visit their website or mobile app and look for the "Sign Up" or "Create Account" option. Follow the prompts to provide your personal information, such as name, email address, and sometimes a library card number. Once you submit the required details, your account will be created, and you can start accessing the library's resources.</div>
            </div>
            </div>
            <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                How do I search for books or materials in the online library?
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Searching for books or materials in the online library is typically easy. On the library's website or app, look for a search bar or a "Search" button. Enter keywords, book titles, authors, or any other relevant information related to the material you're looking for. Press enter or click the search button, and the system will display the search results with relevant books or materials matching your query.</div>
            </div>
            </div>
            <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                Can I access an online library from different devices?
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Yes, most online libraries offer cross-device accessibility. You can access the online library from various devices, including computers, smartphones, tablets, and e-readers, as long as you have an internet connection.</div>
            </div>
            </div>
        </div>
    </div>
</section> 

    </div>  

        <!-- Modal 
    <div class="modal fade" id="enroll" tabindex="-1" aria-labelledby="enrollLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="lead">Fill out that form and we will get back to you.</p>
                <form>
                    <div class="mb-3">
                        <label for="first-name" class="col-form-label">
                            First Name:
                        </label>
                        <input type="text" class="form-control" id="first-name">
                    </div>
                    <div class="mb-3">
                        <label for="last-name" class="col-form-label">
                            Last Name:
                        </label>
                        <input type="text" class="form-control" id="last-name">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="col-form-label">
                            E-mail:
                        </label>
                        <input type="email" class="form-control" id="email">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="col-form-label">
                            Tel:
                        </label>
                        <input type="tel" class="form-control" id="phone">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Submit</button>
            </div>
        </div>
        </div>
    </div>
            -->
</asp:Content>
