<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Disk.aspx.cs" Inherits="Project2.Disk" MasterPageFile="~/Site1.Master" Title="Disk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="CD_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <tr style="color:black;" class="btn-danger">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="type_idLabel" runat="server" Text='<%# Eval("type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="CD_idLabel" runat="server" Text='<%# Eval("CD_id") %>' />
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
                    <asp:TextBox ID="CD_nameTextBox" runat="server" Text='<%# Bind("CD_name") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="CD_nameTextBox" ValidationGroup="edit" Display="Dynamic"></asp:RequiredFieldValidator>
                     
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="genre_idTextBox" Display="Dynamic" ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be between 0-6" ControlToValidate="genre_idTextBox" MaximumValue="6" MinimumValue="0" Type="Integer" Display="Dynamic" ValidationGroup="edit"></asp:RangeValidator>
                   
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="status_idTextBox" Display="Dynamic" ValidationGroup="edit"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="must be between 0-2" ControlToValidate="status_idTextBox" MaximumValue="2" MinimumValue="0" Type="Integer" Display="Dynamic" ValidationGroup="edit"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="type_idTextBox" runat="server" Text='<%# Bind("type_id") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="type_idTextBox" Display="Dynamic" ValidationGroup="edit"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="must be between 0-2" ControlToValidate="type_idTextBox" MaximumValue="2" MinimumValue="0" Type="Integer" Display="Dynamic" ValidationGroup="edit"></asp:RangeValidator>
                </td>
                <td>
                    <asp:Label ID="CD_idLabel1" runat="server" Text='<%# Eval("CD_id") %>' />
                    
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
            <tr style="color:black" class="btn-danger">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-danger focus" ForeColor="Black"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="false" CssClass="btn btn-danger focus" ForeColor="Black"/>
                </td>
                <td>
                    <asp:TextBox ID="CD_nameTextBox" runat="server" Text='<%# Bind("CD_name") %>' />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="CD_nameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="genre_idTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be between 0-6" ControlToValidate="genre_idTextBox" MaximumValue="6" MinimumValue="0" Type="Integer" Display="Dynamic"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="status_idTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="must be between 0-2" ControlToValidate="status_idTextBox" MaximumValue="2" MinimumValue="0" Type="Integer" Display="Dynamic"></asp:RangeValidator>

                </td>
                <td>
                    <span><asp:TextBox ID="type_idTextBox" runat="server" Text='<%# Bind("type_id") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="type_idTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="must be between 0-2" ControlToValidate="type_idTextBox" MaximumValue="2" MinimumValue="0" Type="Integer" Display="Dynamic"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="CD_idTextBox" runat="server" Text='<%# Bind("CD_id") %>' />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="CD_idTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="type_idLabel" runat="server" Text='<%# Eval("type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="CD_idLabel" runat="server" Text='<%# Eval("CD_id") %>' />
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
                                <th runat="server">CD_name</th>
                                <th runat="server">genre_id</th>
                                <th runat="server">status_id</th>
                                <th runat="server">type_id</th>
                                <th runat="server">CD_id</th>
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
                    <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                   
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />

                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="type_idLabel" runat="server" Text='<%# Eval("type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="CD_idLabel" runat="server" Text='<%# Eval("CD_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryIWConnectionString %>" 
        DeleteCommand="execute sp_DelCD @CD_id" 
        InsertCommand="execute sp_InsCD @CD_id, @CD_name, @status_id, @genre_id, @type_id" 
        SelectCommand="SELECT [CD_name], [genre_id], [status_id], [type_id], [CD_id] FROM [CD] ORDER BY [CD_name]" 
        UpdateCommand="execute sp_UpdCD @CD_id, @CD_name, @genre_id, @status_id, @type_id ">
        <DeleteParameters>
            <asp:Parameter Name="CD_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CD_name" Type="String" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="type_id" Type="Int32" />
            <asp:Parameter Name="CD_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CD_name" Type="String" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="type_id" Type="Int32" />
            <asp:Parameter Name="CD_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>