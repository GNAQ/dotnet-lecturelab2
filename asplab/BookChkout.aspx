<%@ Page Title="图书借阅" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookChkout.aspx.cs" Inherits="asplab.BookChkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: Title %></h2>
    <hr />
    
    <div class="search-widget-div">
        <p><span style="font-size: 28px; text-align:center; margin-bottom: 15px;">请输入借阅书目的<b>ISBN</b>码</span></p>
        <div style="width: 50%; margin-bottom: 15px;">
            <asp:TextBox ID="searchBox" runat="server" CssClass="form-control input-wider" placeholder="请输入..."></asp:TextBox>
        </div>
        <div style="margin-bottom: 15px;">
            <asp:Button ID="submitBtn" runat="server" Text="提交借阅申请" CssClass="btn btn-default" OnClick="submitBtnClicked"/>
        </div>
        <div style="margin-bottom: 15px;">
            <asp:Button ID="queryBtn" runat="server" Text="还不知道？跳转查询" CssClass="btn btn-default" OnClick="queryBtnClicked"/>
        </div>
        <div>
            <asp:GridView ID="GVmain_chkin" runat="server"
                AutoGenerateColumns="False" CssClass="grid-center table table-hover" Visible="false">
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
                <asp:TemplateField HeaderText="事件类型"> 
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_typeLabel" runat="server" Text='<%# Bind("type") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="ID"> 
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_idLabel" runat="server" Text='<%# Bind("Id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                </Columns>
            </asp:GridView>
        </div>
    </div>



</asp:Content>

