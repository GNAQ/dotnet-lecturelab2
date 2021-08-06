<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="asplab.UserInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="userinfo-widget-div">
    <div class="row-layout" >
        <div class="column-layout" style="margin-bottom: 15px;">
            <asp:Label ID="Label_name" runat="server" Text="姓名" style="font-size: 16px;margin-right:20px"></asp:Label>
        </div>
        <div class="column-layout input-wider-div">
            <div style="margin-bottom: 15px;">
                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row-layout">
        <div class="column-layout" style="margin-bottom: 15px;">
            <asp:Label ID="Label_Id1" runat="server" Text="学号" style="font-size: 16px;margin-right:20px"></asp:Label>
        </div>
        <div class="column-layout" style="margin-bottom: 15px;">
            <asp:Label ID="Label_Id2" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row-layout">
        <div class="column-layout" style="margin-bottom: 15px;">
           <asp:Label ID="Label_password_new" runat="server" Text="新密码" style="font-size: 16px;margin-right:20px"></asp:Label>
        </div>
        <div class="column-layout" style="margin-bottom: 15px;">
            <asp:TextBox ID="TextBoxPassNew" runat="server"></asp:TextBox>
        </div>
    </div>
   <div class="row-layout">
        <div class="column-layout" style="margin-bottom: 15px;">
           <asp:Label ID="Label_password_confirm" runat="server" Text="确认密码" style="font-size: 16px;margin-right:20px"></asp:Label>
        </div>
        <div class="column-layout" style="margin-bottom: 15px;">
            <asp:TextBox ID="TextBoxPassConfirm" runat="server" ></asp:TextBox>
        </div>
    </div>

    <div class="row-layout">
        <div class="column-layout" style=" margin-bottom: 15px;">
           <asp:Button ID="Button_password_change" runat="server" Text="保存并修改" CssClass="btn btn-default" OnClick="Button_password_change_Click"/>
        </div>
    </div>
</div>
    <hr />
    <div class="row-layout">
        <div class="column-layout" style="margin-bottom: 15px;">
           <asp:Label ID="Label_CheckInOut" runat="server" Text="借书还书记录" style="font-size: 28px;"/>
        </div>
    </div>
    
     <div style="width: 100%; max-width: none;">
        <asp:GridView ID="GridViewCheckInOut" runat="server" 
           AutoGenerateColumns="False" CssClass="grid-center table table-hover">
            <Columns>  
                <asp:TemplateField HeaderText="学号">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_numberTextBox" runat="server" Text='<%# Bind("number") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_numberLabel" runat="server" Text='<%# Bind("number") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ISBN">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_ISBNLabel" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="书名">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_nameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_authorLabel" runat="server" Text='<%# Bind("name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="作者">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_authorTextBox" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_authorLabel" runat="server" Text='<%# Bind("author") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="日期">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_dateTextBox" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="持续时间">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_timeTextBox" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_timeLabel" runat="server" Text='<%# Bind("time") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="类型">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_typeTextBox" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_typeLabel" runat="server" Text='<%# Bind("type") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
