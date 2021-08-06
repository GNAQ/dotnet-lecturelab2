<%@ Page Title="图书归还" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookChkin.aspx.cs" Inherits="asplab.BookChkin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: Title %></h2>
    <hr />
    
    <asp:GridView ID="GVmain_chkin" runat="server"
        AutoGenerateColumns="False" CssClass="grid-center table table-hover"
        OnRowCommand="GVmain_chkin_rowcmd">
        <Columns>  
                <asp:TemplateField HeaderText="ISBN">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_ISBNLabel" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="申请日期">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_dateTextBox" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="借书时长">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_dateTextBox" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_dateLabel" runat="server" Text='<%# Bind("time") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="还书"> 
                    <ItemTemplate>  
                        <asp:Button ID="submitBtn1" runat="server" Text="还书" CssClass="btn btn-default"
                            CausesValidation="false" CommandName="ReturnBook" CommandArgument='<%# Eval("id") %>'/>
                    </ItemTemplate>  
                </asp:TemplateField> 
            </Columns>


    </asp:GridView>



</asp:Content>

