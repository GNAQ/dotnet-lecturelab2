<%@ Page Title="登录" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="asplab.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: Title %></h2>
    <hr />
    
    <div class="search-widget-div">
        <p><span style="font-size: 28px; text-align:center; margin-bottom: 15px;">学生用户登录</span></p>
        <div style="width: 50%; margin-bottom: 15px;">
            <asp:TextBox ID="usernameBox" runat="server" CssClass="form-control input-wider" placeholder="请输入学号"></asp:TextBox>
        </div>
        <div style="width: 50%; margin-bottom: 15px;">
            <asp:TextBox ID="pswdBox" runat="server" CssClass="form-control input-wider" placeholder="请输入密码" TextMode="Password"></asp:TextBox>
        </div>
        <div style="margin-bottom: 15px;">
            <asp:Button ID="submitBtn" runat="server" Text="登录" CssClass="btn btn-default" OnClick="submitBtnClicked"/>
        </div>
    </div>



</asp:Content>
