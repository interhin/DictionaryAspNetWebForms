<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestDictionary.Pages.Contacts.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView
        ID="ContactsGridView"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="contacts-grid"
        BackColor="White"
        BorderColor="#CCCCCC"
        BorderStyle="None"
        BorderWidth="1px"
        CellPadding="4"
        ForeColor="Black"
        DataKeyNames="Id"
        GridLines="Horizontal" OnRowCancelingEdit="ContactsGridView_RowCancelingEdit" OnRowDeleting="ContactsGridView_RowDeleting" OnRowEditing="ContactsGridView_RowEditing" OnRowUpdating="ContactsGridView_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="true" EditText="Изменить" ShowDeleteButton="true" ItemStyle-Width="150">
                <ItemStyle Width="150px"></ItemStyle>
            </asp:CommandField>
            <asp:TemplateField HeaderText="ФИО" ItemStyle-Width="400">
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="editFioTextBox" Text='<%# Bind("Fio") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="requiredfioValidator"
                        ControlToValidate="editFioTextBox"
                        runat="server"
                        ErrorMessage="Заполните поле ФИО!"
                        ForeColor="Red"
                        Text="*"
                        Display="Dynamic" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Fio") %>' ID="fioLabel"></asp:Label>
                </ItemTemplate>

                <ItemStyle Width="400px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Телефон">
                <EditItemTemplate>
                    <asp:TextBox ID="editPhoneTextBox" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="requiredPhoneValidator"
                        ControlToValidate="editPhoneTextBox"
                        runat="server"
                        ErrorMessage="Заполните поле Телефон!"
                        ForeColor="Red"
                        Text="*"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="editPhoneValidator" runat="server" ControlToValidate="editPhoneTextBox"
                        ForeColor="Red" ValidationExpression="^\d{11}$" Text="!" ErrorMessage="Некорректный номер телефона!" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="400px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail">
                <EditItemTemplate>
                    <asp:TextBox ID="editEmailTextBox" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="requiredEmailValidator"
                        ControlToValidate="editEmailTextBox"
                        runat="server"
                        ErrorMessage="Заполните поле Email!"
                        ForeColor="Red"
                        Text="*"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="editEmailValidator" runat="server" ControlToValidate="editEmailTextBox"
                        ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                        Text="!" ErrorMessage="Некорректный Email!" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="400px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:ValidationSummary runat="server" ForeColor="Red" />
    <div style="margin-top: 20px;">
        <asp:Label runat="server" Text="ФИО" />
        <asp:TextBox runat="server" ID="fioTextBox" />
        <asp:Label runat="server" Text="Телефон" />
        <asp:TextBox runat="server" ID="phoneTextBox" />
        <asp:Label runat="server" Text="Email" />
        <asp:TextBox runat="server" ID="emailTextBox" />
        <asp:Button ValidationGroup="addValidation" runat="server" Text="Добавить" ID="addBut" OnClick="addBut_Click" />
    </div>
    <div class="valid-errors">
        <asp:RequiredFieldValidator
            ValidationGroup="addValidation"
            ID="requiredfioValidator"
            ControlToValidate="fioTextBox"
            runat="server"
            ErrorMessage="Заполните поле ФИО!"
            ForeColor="Red"
            Display="Dynamic" />
        <asp:RequiredFieldValidator
            ValidationGroup="addValidation"
            ID="requiredPhoneValidator"
            ControlToValidate="phoneTextBox"
            runat="server"
            ErrorMessage="Заполните поле Телефон!"
            ForeColor="Red"
            Display="Dynamic" />
        <asp:RequiredFieldValidator
            ValidationGroup="addValidation"
            ID="requiredEmailValidator"
            ControlToValidate="emailTextBox"
            runat="server"
            ErrorMessage="Заполните поле Email!"
            ForeColor="Red"
            Display="Dynamic" />
        <asp:RegularExpressionValidator ValidationGroup="addValidation" ID="emailValidator" runat="server" ControlToValidate="emailTextBox"
            ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
            Display="Dynamic" ErrorMessage="Некорректный Email!" />
        <asp:RegularExpressionValidator ValidationGroup="addValidation" ID="phoneValidator" runat="server" ControlToValidate="phoneTextBox"
            ForeColor="Red" ValidationExpression="^\d{11}$"
            Display="Dynamic" ErrorMessage="Некорректный номер телефона!" />
    </div>
</asp:Content>
