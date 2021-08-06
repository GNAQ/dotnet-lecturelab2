<%@ Page Title="图书续借与归还" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookChkin.aspx.cs" Inherits="asplab.BookChkin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: Title %></h2>
    <hr />
    
    <asp:GridView ID="GVmain_chkin" runat="server"
        AutoGenerateColumns="False" CssClass="grid-center table table-hover"
        OnRowCommand="GVmain_chkin_rowcmd">
        <Columns> 
                <asp:TemplateField HeaderText="ISBN">  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_ISBNLabel" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="书名">  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_nameLabel" runat="server" Text='<%# Bind("name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="作者">  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_authorLabel" runat="server" Text='<%# Bind("author") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="申请日期">  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="借书时长">  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_timeLabel" runat="server" Text='<%# Bind("time") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="续借"> 
                    <ItemTemplate>  
                        <asp:Button ID="renewBtn" runat="server" Text="续借" CssClass="btn btn-default"
                            CausesValidation="false" CommandName="RenewBook" CommandArgument='<%# Eval("id") %>'/>
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="还书"> 
                    <ItemTemplate>  
                        <asp:Button ID="returnBtn" runat="server" Text="还书" CssClass="btn btn-default"
                            CausesValidation="false" CommandName="ReturnBook" CommandArgument='<%# Eval("id") %>'/>
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="事件类型" Visible="False"> 
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_typeLabel" runat="server" Text='<%# Bind("type") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
        </Columns>
    </asp:GridView>


</asp:Content>

