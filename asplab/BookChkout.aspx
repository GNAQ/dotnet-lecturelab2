<%@ Page Title="图书借阅" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookChkout.aspx.cs" Inherits="asplab.BookChkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: Title %></h2>
    <hr />
    
    <div class="search-widget-div">
        <p><span style="font-size: 28px; text-align:center; margin-bottom: 15px;">请输入借阅书目的<b>图书馆编码</b>或<b>ISBN</b>码</span></p>
        <div style="width: 50%; margin-bottom: 15px;">
            <input id="searchBox" type="text" class="form-control input-wider" placeholder="请输入..."/>
        </div>
        <div style="margin-bottom: 15px;">
            <asp:Button ID="submitBtn" runat="server" Text="提交借阅申请" CssClass="btn btn-default"/>
        </div>
        <div style="margin-bottom: 15px;">
            <asp:Button ID="queryBtn" runat="server" Text="还不知道？跳转查询" CssClass="btn btn-default"/>
        </div>
    </div>



</asp:Content>

