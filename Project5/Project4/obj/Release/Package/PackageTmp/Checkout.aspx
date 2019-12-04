<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Project4.Checkout" MasterPageFile="~/Site.Master" Title="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <!-- Modification Log
___________________________
12/3/2019: 
Creation
12/4/2019:
Added finishing touches:
        Joined tables to make checkout log more Semantic
        Added error handling to page

12/4/2019:
Added Comments for readability
    -->

<!-- First two sql data sources -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryIWConnectionString %>" SelectCommand="SELECT [borrower_id], [borrower_fname], [borrower_lname] FROM [current_borrower] ORDER BY [borrower_id]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryIWConnectionString %>" SelectCommand="select CD_id,CD_name from CD where status_id = 0 order by CD_id"></asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="borrowed_date" DataSourceID="SqlDataSource3" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
           
            <tr style="color:black" class="btn-danger">
                <td>
                   
                     
                </td>
                <td>
                    <asp:Label ID="borrower_fnameLabel" runat="server" Text='<%# Eval("borrower_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_lnameLabel" runat="server" Text='<%# Eval("borrower_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                </td>
                <td>
                    <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                </td>
            </tr>
            
        </AlternatingItemTemplate>
       
        <EditItemTemplate>
             <!--EditItemTemplate is not utilized in this application, only exists because it causes errors when deleted-->

            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="borrower_fnameTextBox" runat="server" Text='<%# Bind("borrower_fname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="borrower_lnameTextBox" runat="server" Text='<%# Bind("borrower_lname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CD_nameTextBox" runat="server" Text='<%# Bind("CD_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowed_dateLabel1" runat="server" Text='<%# Eval("borrowed_date") %>' />
                </td>
                <td>
                    <asp:TextBox ID="returned_dateTextBox" runat="server" Text='<%# Bind("returned_date") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        
        <EmptyDataTemplate>
            <!--Returns a message if the server fails to send back any rows of data-->
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
         
        <InsertItemTemplate>
            <!--Insert Items include dropdowns for selecting checkout parameters-->
                  <asp:Label ID="Label2" runat="server" Text="Select a Disk"></asp:Label><br />
    <asp:DropDownList ID="dropCD" runat="server" DataSourceID="SqlDataSource1" DataTextField="CD_name" DataValueField="CD_id" SelectedValue='<%# Bind("diskID")%>'> 
    </asp:DropDownList>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Select a Borrower"></asp:Label>
    <br />
    <asp:DropDownList ID="dropBorrower" runat="server" DataSourceID="SqlDataSource2" DataTextField="borrower_fname" DataValueField="borrower_id" SelectedValue='<%# Bind("borrowerID")%>'>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="CheckoutButton" CommandName="Insert" runat="server" Text="Checkout" CssClass="btn btn-danger focus" ForeColor="Black" />
      
      
      </InsertItemTemplate>
        <ItemTemplate>
            <tr style="color:black" class="btn-danger">
                <td>
                </td>
                <td>
                    <asp:Label ID="borrower_fnameLabel" runat="server" Text='<%# Eval("borrower_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_lnameLabel" runat="server" Text='<%# Eval("borrower_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                </td>
                <td>
                    <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                </td>
            </tr>
        <!-- Item and layout templates below-->
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">borrower_fname</th>
                                <th runat="server">borrower_lname</th>
                                <th runat="server">CD_name</th>
                                <th runat="server">borrowed_date</th>
                                <th runat="server">returned_date</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                
                                
                                
                                
                                
                                
                                <asp:NumericPagerField />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="color:black" class="btn-danger">
                <td>
                </td>
                <td>
                    <asp:Label ID="borrower_fnameLabel" runat="server" Text='<%# Eval("borrower_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_lnameLabel" runat="server" Text='<%# Eval("borrower_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                </td>
                <td>
                    <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <!--final datasource-->
    <!--Select, Update, Insert, and Delete commands and parameters below-->
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryIWConnectionString %>"
        
        SelectCommand="select borrower_fname, borrower_lname, CD_name, borrowed_date, returned_date
from disk_has_borrower
join CD on CD.CD_id = disk_has_borrower.CD_id
join current_borrower on current_borrower.borrower_id = disk_has_borrower.borrower_id" 
        UpdateCommand="exec sp_returnDisk @borrower_id, @CD_id,@borrowed_date" 
        InsertCommand="exec sp_insCheck @borrowerID, @diskID"
        DeleteCommand="exec sp_returnDisk @borrower_id, @CD_id,@borrowed_date">
        <InsertParameters>
            <asp:Parameter Name="borrowerID" Type="Int32" />
            <asp:Parameter Name="diskID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
            <asp:Parameter Name="CD_id" Type="Int32" />
            <asp:Parameter Name="borrowed_date" Type="Datetime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
            <asp:Parameter Name="CD_id" Type="Int32" />
            <asp:Parameter Name="borrowed_date" Type="Datetime" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>