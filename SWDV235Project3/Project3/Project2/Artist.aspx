<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="Project2.Artist" MasterPageFile="~/Site1.Master" Title="Artist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="artist_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_fnameLabel" runat="server" Text='<%# Eval("artist_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_lnameLabel" runat="server" Text='<%# Eval("artist_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_typeLabel" runat="server" Text='<%# Eval("artist_type") %>' />
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
                    <asp:Label ID="artist_idLabel1" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artist_fnameTextBox" runat="server" Text='<%# Bind("artist_fname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="edit" ControlToValidate="artist_fnameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="artist_lnameTextBox" runat="server" Text='<%# Bind("artist_lname") %>' />

                </td>
                <td>
                    <asp:TextBox ID="artist_typeTextBox" runat="server" Text='<%# Bind("artist_type") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="edit" ControlToValidate="artist_typeTextBox"></asp:RequiredFieldValidator>
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
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black" />
                </td>
                <td>
                    <asp:TextBox ID="artist_idTextBox" runat="server" Text='<%# Bind("artist_id") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="artist_idTextBox"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="artist_fnameTextBox" runat="server" Text='<%# Bind("artist_fname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="artist_fnameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="artist_lnameTextBox" runat="server" Text='<%# Bind("artist_lname") %>' />

                </td>
                <td>
                    <asp:TextBox ID="artist_typeTextBox" runat="server" Text='<%# Bind("artist_type") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="artist_typeTextBox"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_fnameLabel" runat="server" Text='<%# Eval("artist_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_lnameLabel" runat="server" Text='<%# Eval("artist_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_typeLabel" runat="server" Text='<%# Eval("artist_type") %>' />
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
                                <th runat="server">artist_id</th>
                                <th runat="server">artist_fname</th>
                                <th runat="server">artist_lname</th>
                                <th runat="server">artist_type</th>
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
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_fnameLabel" runat="server" Text='<%# Eval("artist_fname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_lnameLabel" runat="server" Text='<%# Eval("artist_lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_typeLabel" runat="server" Text='<%# Eval("artist_type") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryIWConnectionString %>" 
        DeleteCommand="execute sp_DelArtist @artist_id" 
        InsertCommand="execute sp_InsArtist @artist_id, @artist_fname, @artist_type, @artist_lname" 
        SelectCommand="SELECT [artist_id], [artist_fname], [artist_lname], [artist_type] FROM [artist] ORDER BY [artist_lname], [artist_fname]" 
        UpdateCommand="execute sp_UpdArtist @artist_id, @artist_fname,@artist_type, @artist_lname">
        <DeleteParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
            <asp:Parameter Name="artist_fname" Type="String" />
            <asp:Parameter Name="artist_lname" Type="String" />
            <asp:Parameter Name="artist_type" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="artist_fname" Type="String" />
            <asp:Parameter Name="artist_lname" Type="String" />
            <asp:Parameter Name="artist_type" Type="Int32" />
            <asp:Parameter Name="artist_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>