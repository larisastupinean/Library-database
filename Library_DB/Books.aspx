<%@ Page Title="Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Library_DB.Books" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="jumbotron">
        <p>
            <asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT bo.BookID,bo.Title,aut.Name AS Author,gen.Name AS Genre,bo.NoPages
FROM Books bo INNER JOIN Genres gen ON bo.GenreID=gen.GenreID
	            INNER JOIN Authors aut ON bo.AuthorID=aut.AuthorID">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT * FROM [Authors]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGenres" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT * FROM [Genres]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Label9" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="BookID"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxBookID" runat="server" Font-Size="Smaller" Height="20px" Width="30px"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="Label3" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Author"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListAuthors" runat="server" DataSourceID="SqlDataSourceAuthors" DataTextField="Name" DataValueField="Name" Height="25px" Width="300px" AutoPostBack="True" Font-Size="Smaller">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Title"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxTitle" runat="server" Font-Size="Small" Height="25px" Width="300px"></asp:TextBox>
        </p>
        <p dir="ltr">
            <asp:Label ID="Label10" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Genre"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownListGenres" runat="server" DataSourceID="SqlDataSourceGenres" DataTextField="Name" DataValueField="Name" Height="25px" Width="300px" AutoPostBack="True" Font-Size="Smaller">
            </asp:DropDownList>
            &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p dir="ltr">
            &nbsp;<asp:Label ID="Label11" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Number of Pages"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxNoPages" runat="server" Font-Size="Small" Height="25px" Width="50px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p dir="ltr">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="InsertButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Size="Small" Height="25px" OnClick="InsertButton_Click" Text="Insert Book" Width="150px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Size="Small" Height="25px" Text="Delete Book" Width="150px" OnClick="DeleteButton_Click" />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="BookID" DataSourceID="SqlDataSourceBooks" HorizontalAlign="Center" Width="1000px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" SortExpression="BookID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    <asp:BoundField DataField="NoPages" HeaderText="NoPages" SortExpression="NoPages" />
                </Columns>
                <EditRowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </p>
    </div>

</asp:Content>
