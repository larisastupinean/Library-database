<%@ Page Title="Borrows" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library_DB.Borrows" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 style="border-style: inset; background-color: #FFFFFF; color: #660066; font-variant: normal; font-style: oblique; font-weight: bold; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;" dir="ltr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Library Database</h1>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Borrows" Font-Underline="True"></asp:Label>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSourceBorrows" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT * FROM [View_Borrows]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT [StudentID], [Name] FROM [Students]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT * FROM [Authors]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT [BookID], [Title], [AuthorID] FROM [Books] WHERE ([AuthorID] = @AuthorID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAuthors" Name="AuthorID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Label9" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="BorrowID"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxBorrowID" runat="server" Font-Size="Smaller" Height="20px" Width="30px"></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="Label3" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Student"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListStudents" runat="server" DataSourceID="SqlDataSourceStudents" DataTextField="Name" DataValueField="StudentID" Height="25px" Width="300px" AutoPostBack="True" Font-Size="Smaller">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Author"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListAuthors" runat="server" DataSourceID="SqlDataSourceAuthors" DataTextField="Name" DataValueField="AuthorID" Height="25px" Width="300px" AutoPostBack="True" Font-Size="Smaller">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Book"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListBooks" runat="server" DataSourceID="SqlDataSourceBooks" DataTextField="Title" DataValueField="BookID" Height="25px" Width="300px" AutoPostBack="True" Font-Size="Smaller">
            </asp:DropDownList>
        </p>
        <p dir="ltr">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
&nbsp;&nbsp; </p>
        <p>
            <asp:Label ID="Label6" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Borrow Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxBorrowDate" runat="server" Font-Size="Smaller" Height="25px" Width="150px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Due Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxDueDate" runat="server" Font-Size="Smaller" Height="25px" Width="150px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label8" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Return Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxReturnDate" runat="server" Font-Size="Smaller" Height="25px" Width="150px"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="InsertButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Size="Smaller" Height="26px" OnClick="InsertButton_Click" Text="Insert New Borrow" Width="200px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdateButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Size="Smaller" Height="26px" OnClick="UpdateButton_Click" Text="Update Return Date" Width="200px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Italic="False" Font-Size="Smaller" ForeColor="Black" Height="26px" OnClick="DeleteButton_Click" Text="Delete Borrow" Width="200px" />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="BorrowID" DataSourceID="SqlDataSourceBorrows" Height="194px" HorizontalAlign="Left" Width="1100px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="BorrowID" HeaderText="BorrowID" ReadOnly="True" SortExpression="BorrowID" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="BookTitle" HeaderText="BookTitle" SortExpression="BookTitle" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="BorrowDate" HeaderText="BorrowDate" SortExpression="BorrowDate" />
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" />
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
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </div>

</asp:Content>
