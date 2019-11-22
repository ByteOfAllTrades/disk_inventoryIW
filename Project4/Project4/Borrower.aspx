<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" Inherits="Project4.Borrower" MasterPageFile="~/Site.Master" Title="Borrower" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <!-- Modification Log
___________________________
11/22/2019: 
Copied from project 3 with some modifications.
    -->

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="borrower_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="borrower_lnameLabel" runat="server" Text='<%# Eval("borrower_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_phone_numberLabel" runat="server" Text='<%# Eval("borrower_phone_number") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_fnameLabel" runat="server" Text='<%# Eval("borrower_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-danger focus" ForeColor="Black" ValidationGroup="edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:TextBox ID="borrower_lnameTextBox" runat="server" Text='<%# Bind("borrower_lname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_lnameTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_phone_numberTextBox" runat="server" Text='<%# Bind("borrower_phone_number") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_phone_numberTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_fnameTextBox" runat="server" Text='<%# Bind("borrower_fname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_fnameTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-danger focus" ForeColor="Black" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:TextBox ID="borrower_lnameTextBox" runat="server" Text='<%# Bind("borrower_lname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_lnameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_phone_numberTextBox" runat="server" Text='<%# Bind("borrower_phone_number") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_phone_numberTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="borrower_fnameTextBox" runat="server" Text='<%# Bind("borrower_fname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_fnameTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="borrower_idTextBox" runat="server" Text='<%# Bind("borrower_id") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrower_idTextBox"></asp:RequiredFieldValidator>

                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="borrower_lnameLabel" runat="server" Text='<%# Eval("borrower_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_phone_numberLabel" runat="server" Text='<%# Eval("borrower_phone_number") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_fnameLabel" runat="server" Text='<%# Eval("borrower_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">borrower_lname</th>
                                <th runat="server">borrower_phone_number</th>
                                <th runat="server">borrower_fname</th>
                                <th runat="server">borrower_id</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                            <Fields>
                                
                                <asp:NumericPagerField />
                                
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="borrower_lnameLabel" runat="server" Text='<%# Eval("borrower_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_phone_numberLabel" runat="server" Text='<%# Eval("borrower_phone_number") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_fnameLabel" runat="server" Text='<%# Eval("borrower_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>        

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryIWConnectionString %>" 
        DeleteCommand="execute sp_DelBorrower @borrower_id" 
        InsertCommand="execute sp_InsBorrower @borrower_id,  @borrower_fname, @borrower_phone_number, @borrower_lname " 
        SelectCommand="SELECT [borrower_lname], [borrower_phone_number], [borrower_fname], [borrower_id] FROM [current_borrower] ORDER BY [borrower_lname], [borrower_fname]" 
        UpdateCommand="execute sp_UpdBorrower @borrower_id, @borrower_fname, @borrower_phone_Number, @borrower_lname">
        <DeleteParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="borrower_lname" Type="String" />
            <asp:Parameter Name="borrower_phone_number" Type="Int32" />
            <asp:Parameter Name="borrower_fname" Type="String" />
            <asp:Parameter Name="borrower_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="borrower_lname" Type="String" />
            <asp:Parameter Name="borrower_phone_number" Type="Int32" />
            <asp:Parameter Name="borrower_fname" Type="String" />
            <asp:Parameter Name="borrower_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
