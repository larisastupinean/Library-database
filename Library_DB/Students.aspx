<%@ Page Title="Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="Library_DB.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="jumbotron">
        <p>
        <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT * FROM [Students]" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @original_StudentID AND [Name] = @original_Name AND [Birthdate] = @original_Birthdate AND [Class] = @original_Class" InsertCommand="INSERT INTO [Students] ([StudentID], [Name], [Birthdate], [Class]) VALUES (@StudentID, @Name, @Birthdate, @Class)" UpdateCommand="UPDATE [Students] SET [Name] = @Name, [Birthdate] = @Birthdate, [Class] = @Class WHERE [StudentID] = @original_StudentID AND [Name] = @original_Name AND [Birthdate] = @original_Birthdate AND [Class] = @original_Class">
            <DeleteParameters>
                <asp:Parameter Name="original_StudentID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter DbType="Date" Name="original_Birthdate" />
                <asp:Parameter Name="original_Class" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StudentID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter DbType="Date" Name="Birthdate" />
                <asp:Parameter Name="Class" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter DbType="Date" Name="Birthdate" />
                <asp:Parameter Name="Class" Type="String" />
                <asp:Parameter Name="original_StudentID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter DbType="Date" Name="original_Birthdate" />
                <asp:Parameter Name="original_Class" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceClass" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT DISTINCT Class FROM Students"></asp:SqlDataSource>
        </p>
        <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="StudentID"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxStudentID" runat="server" Font-Size="Smaller" Height="20px" Width="30px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBoxName" runat="server" Font-Size="Small" Height="25px" Width="300px"></asp:TextBox>
        </p>
        <p>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Birthdate"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxBirthdate" runat="server" Font-Size="Small" Height="25px" Width="150px"></asp:TextBox>
        </p>
        <p>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="Class"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonListClass" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceClass" DataTextField="Class" DataValueField="Class" Height="10px" RepeatColumns="3" Width="200px">
        </asp:RadioButtonList>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="InsertButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Text="Insert" OnClick="InsertButton_Click" Font-Size="Small" Height="25px" Width="100px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;</p>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="StudentID" DataSourceID="SqlDataSourceStudents" GridLines="Horizontal" Height="200px" HorizontalAlign="Left" Width="500px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate" />
            <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
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
