<%@ Page Title="Lista de Contas a Pagar e Receber" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaContaPagarReceber.aspx.cs" Inherits="ViagemWeb.ListaContaPagarReceber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel runat="server">
                <p />
                <fieldset>
                    <legend>Lista de Contas a Pagar e Receber</legend>
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
                        <div class="col-md-3">
                            <label>
                                Cpf:
                                <br>
                                <asp:TextBox ID="txtCpf" runat="server" Class="form-control" MaxLength="14"></asp:TextBox>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Data de nascimento:
                                <br>
                                <asp:TextBox ID="txtDataNascimento" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton runat="server" ID="btnBuscar"
                                CssClass="btn-buscar btn btn-default"
                                OnClick="btnBuscar_Click">
                                <i class="glyphicon glyphicon-search sat-icon-with-text" style="margin-right: 3px;"></i>
                                Buscar
                            </asp:LinkButton>
                        </div>
                    </div>
                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="uppGridView" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <p />
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="panel panel-centralizar">
                            <div>
                                <%--<asp:Button ID="btnCadastro" runat="server" Text="+ Cadastrar" Class=" btn btn-cadastro-lista" OnClick="btnCadastro_Click" />--%>
                                <asp:LinkButton runat="server" ID="btnCadastro"
                                    CssClass="btn-cadastro-lista btn btn-default"
                                    OnClick="btnCadastro_Click">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Cadastrar
                                </asp:LinkButton>
                                <h3>Lista de Contas Pagar e Receber</h3>
                            </div>
                        </div>
                        <asp:GridView
                            ID="grpListaContas"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table table-hover"
                            GridLines="None"
                            AllowPaging="True"
                            DataKeyNames="ContaId"
                            PageSize="10"
                            OnPageIndexChanging="grpListaContas_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField
                                    DataField="ContaCliente"
                                    HeaderText="Cliente"
                                    SortExpression="ContaCliente" />
                                <asp:BoundField
                                    DataField="ContaIndentificador"
                                    HeaderText="Tipo"
                                    SortExpression="ContaIndentificador" />
                                <asp:BoundField
                                    DataField="ContaDataVencimento"
                                    HeaderText="Data Vencimento"
                                    SortExpression="ContaDataVencimento" />
                                <asp:BoundField
                                    DataField="ContaValor"
                                    HeaderText="Valor"
                                    SortExpression="ContaValor" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("ContaId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("ContaId")%>' ToolTip="Editar">
                                <i aria-hidden="true" class="glyphicon glyphicon-edit"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" />
                        </asp:GridView>
                        <div>
                            <asp:Label ID="lblQuantidade" runat="server" CssClass="label label-f" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
