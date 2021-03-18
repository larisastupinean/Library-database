<%@ Page Title="Authors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="Library_DB.Authors" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <h2><%: Title %></h2>
    <div class="jumbotron">
        <p>
            <asp:SqlDataSource ID="SqlDataSourceAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db_library_connection %>" SelectCommand="SELECT * FROM [Authors]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Authors] WHERE [AuthorID] = @original_AuthorID AND [Name] = @original_Name" InsertCommand="INSERT INTO [Authors] ([AuthorID], [Name]) VALUES (@AuthorID, @Name)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Authors] SET [Name] = @Name WHERE [AuthorID] = @original_AuthorID AND [Name] = @original_Name">
                <DeleteParameters>
                    <asp:Parameter Name="original_AuthorID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AuthorID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="original_AuthorID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Label9" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="AuthorID"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxAuthorID" runat="server" Font-Size="Smaller" Height="20px" Width="30px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="Large" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBoxName" runat="server" Font-Size="Small" Height="25px" Width="300px"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="InsertButton" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Size="Small" Height="25px" OnClick="InsertButton_Click1" Text="Insert" Width="100px" />
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="AuthorID" DataSourceID="SqlDataSourceAuthors" HorizontalAlign="Left" Width="500px" Height="200px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" ReadOnly="True" SortExpression="AuthorID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
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
    </div>
</asp:Content>

