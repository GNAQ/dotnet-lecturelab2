<%@ Page Title="图书查询" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookQry.aspx.cs" Inherits="asplab.BookQry" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    <hr />

    <h2>查询指定</h2>
    <div class="hold-place">

    </div>

    <div class="row-layout">
        <div class="column-layout">
            <asp:DropDownList ID="BookDropList1" runat="server" CssClass="BookDropList btn btn-primary dropdown-toggle">
                <asp:ListItem >ISBN</asp:ListItem>
                <asp:ListItem Value="name">书名</asp:ListItem>
                <asp:ListItem Value="author">作者</asp:ListItem>
                <asp:ListItem Value="subauthor">副作者</asp:ListItem>
                <asp:ListItem Value="press">出版社</asp:ListItem>
                <asp:ListItem Value="libcode">图书馆编码</asp:ListItem>
                <asp:ListItem Value="pressdate">出版日期</asp:ListItem>
                <asp:ListItem Value="count">总册数</asp:ListItem>
                <asp:ListItem Value="countinlib">在馆册数</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="column-layout input-wider-div">
            <asp:TextBox ID="queryBox" runat="server" CssClass="form-control input-wider" placeholder="请输入..."></asp:TextBox>
        </div>
        <div class="column-layout">
            <asp:Button ID="searchBtn" runat="server" Text="查询！" CssClass="btn btn-default" OnClick="searchBtn_Clicked" CausesValidation="False"/>
        </div>
        <div class="column-layout">
            <asp:Button ID="resetBtn" runat="server" Text="重置" CssClass="btn btn-default" OnClick="resetBtn_Clicked" CausesValidation="False"/>
        </div>
    </div>
    
    
    <hr />
    <h2>查询结果</h2>

    <div style="width: 100%; max-width: none;">
        <asp:GridView ID="GridView1" runat="server" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" CssClass="grid-center table table-hover">
            <Columns>  
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
                        <asp:Label ID="GVcol_nameLabel" runat="server" Text='<%# Bind("name") %>'></asp:Label>  
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
                <asp:TemplateField HeaderText="副作者">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_subauthorTextBox" runat="server" Text='<%# Bind("subauthor") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_subauthorLabel" runat="server" Text='<%# Bind("subauthor") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="图书馆编码">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_libcodeTextBox" runat="server" Text='<%# Bind("libcode") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_libcodeLabel" runat="server" Text='<%# Bind("libcode") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="出版社">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_pressTextBox" runat="server" Text='<%# Bind("press") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_pressLabel" runat="server" Text='<%# Bind("press") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="出版日期">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_pressdateTextBox" runat="server" Text='<%# Bind("pressdate") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_pressdateLabel" runat="server" Text='<%# Bind("pressdate") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="总册数">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_countTextBox" runat="server" Text='<%# Bind("count") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_countLabel" runat="server" Text='<%# Bind("count") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="在馆册数">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="GVcol_countinlibTextBox" runat="server" Text='<%# Bind("countinlib") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="GVcol_countinlibLabel" runat="server" Text='<%# Bind("countinlib") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
