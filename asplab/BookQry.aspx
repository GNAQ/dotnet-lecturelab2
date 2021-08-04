<%@ Page Title="图书查询" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookQry.aspx.cs" Inherits="asplab.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    <hr />

    <h2>查询指定</h2>
    <div class="hold-place">

    </div>
    <div class="row-layout">
        <div class="column-layout input-wider-div">
            <input id="searchBox" type="text" class="form-control input-wider" placeholder="请输入..."/>
        </div>
        <div class="column-layout">
            <asp:Button ID="searchButton" runat="server" Text="查询！" CssClass="btn btn-default" OnClick="searchBtn_Clicked" />
        </div>
    </div>
    
    <hr />
    <h2>查询结果</h2>

    <div style="width: 100%; max-width: none;">
        <asp:GridView ID="GridView1" runat="server" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" CssClass="grid-center">
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        
    </div>
</asp:Content>
