<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContaPagarReceber.aspx.cs" Inherits="ViagemWeb.ContaPagarReceber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Cadastro Fornecedor</legend>
            <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            <label>
                                Tipo:
                        <br>
                                <asp:DropDownList ID="ddlTípo" runat="server" DataTextField="TipoNome" DataValueField="TipoId" AutoPostBack="True" OnSelectedIndexChanged="ddlTípo_SelectedIndexChanged" Class="form-control" />
                            </label>
                        </div>
                        <div class="col-md-4">
                            <asp:Label runat="server" ID="lblCliente">Cliente:
                        <br>
                                <asp:DropDownList ID="ddlCliente" runat="server" Class="form-control js-example-basic-single" />
                            </asp:Label>
                        </div>
                        <%--<div class="col-md-4">
                    <asp:Label runat="server" ID="lblFornecedor">Fornecedor:
                        <br>
                        <asp:DropDownList ID="ddlFornecedor" runat="server" DataTextField="FornecedorNome" DataValueField="FornecedorId" Class="form-control js-example-basic-single" />
                    </asp:Label>
                </div>--%>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            <label>
                                Viagem:
                        <br>
                                <asp:DropDownList ID="ddlViagem" runat="server" DataTextField="ViagemNome" DataValueField="ViagemId" OnSelectedIndexChanged="ddlViagem_SelectedIndexChanged" Class="form-control js-example-basic-single" />
                            </label>
                        </div>

                        <div class="col-md-4">
                            <label>
                                Data Recebido:
                                <br>
                                <asp:TextBox ID="txtDataRecebido" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtDataRecebido"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            <label>
                                Parcelar:
                        <br>
                                <asp:TextBox ID="txtParcelar" runat="server" Class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtParcelar"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label>
                                Valor Total:
                        <br>
                                <asp:TextBox ID="txtValorTotal" runat="server" Class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtValorTotal"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="btnOk" runat="server" Text="Ok" Class=" btn btn-cadastro" Font-Bold="true" OnClick="Ok_Click" ValidationGroup="validador" />
            <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="limpar_Click" />
        </fieldset>
    </asp:Panel>
    <div>
        <fieldset>
            <asp:UpdatePanel runat="server" ID="uppGridView" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView
                        ID="grpConta"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-hover"
                        OnRowDataBound="grpConta_RowDataBound"
                        GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField
                                DataField="Parcelas"
                                HeaderText="Parcelas"
                                SortExpression="Parcelas" />
                            <asp:TemplateField HeaderText="Data Vencimento">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" ID="txtDataVencimento" TextMode="Date" class="form-control" />
                                    <asp:RequiredFieldValidator runat="server"
                                        ValidationGroup="validador1"
                                        ForeColor="Red"
                                        ControlToValidate="txtDataVencimento"
                                        ErrorMessage="Campo obrigatório" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valor">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" ID="txtValor" type='text' class="form-control" />
                                    <asp:RequiredFieldValidator runat="server"
                                        ValidationGroup="validador1"
                                        ForeColor="Red"
                                        ControlToValidate="txtValor"
                                        ErrorMessage="Campo obrigatório" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </fieldset>
    </div>
    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Class="btn" OnClick="Salvar_Click" ValidationGroup="validador1" />

    <%--<div>
        <asp:TextBox ID="txtCodParcela" runat="server" Class="form-control"></asp:TextBox>
     <asp:TextBox ID="txtDataParcela" runat="server" Class="form-control"></asp:TextBox>
    <asp:Button ID="Salvar" runat="server" Text="Ok" Class=" btn btn-cadastro" Font-Bold="true" OnClick="Salvar_Click" />
    </div>--%>
</asp:Content>
