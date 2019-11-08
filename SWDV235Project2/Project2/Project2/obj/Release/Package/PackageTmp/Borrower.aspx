<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" Inherits="Project2.Borrower" MasterPageFile="~/Site1.Master" Title="Borrower" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <br />
    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
    <asp:TextBox ID="borrowerFirstName" runat="server" BorderStyle="Solid" BorderWidth="2px"></asp:TextBox>
    <br />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="borrowerFirstName" ErrorMessage="Please enter your first name."></asp:RequiredFieldValidator>
     <br />
     <br />
    <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
    <asp:TextBox ID="borrowerLastName" runat="server" BorderStyle="Solid" BorderWidth="2px"></asp:TextBox>
    <br />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="borrowerLastName" ErrorMessage="Please enter your last name."></asp:RequiredFieldValidator>
     <br />
     <br />

    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="borrowerEmail" runat="server" BorderStyle="Solid" BorderWidth="2px" OnTextChanged="borrowerEmail_TextChanged"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="borrowerEmail" ErrorMessage="Please enter an email."></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="borrowerEmail" ErrorMessage="Please enter a valid email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <br />
    <asp:Button ID="borrowerSubmit" runat="server" Text="Button" CssClass="btn btn-danger active focus" ForeColor="Black" OnClick="borrowerSubmit_Click" />
    <br />
     <asp:Label ID="confirm" runat="server" Text=""></asp:Label>
        

</asp:Content>
