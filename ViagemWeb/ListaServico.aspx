<%@ Page Title="Lista de Serviços" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaServico.aspx.cs" Inherits="ViagemWeb.ListaServico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Lista de Serviços</legend>
            <asp:UpdatePanel ID="uppGridViewServico" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <p />
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div>
                                    <%--<asp:Button ID="btnCadastro" runat="server" Text="+ Cadastrar" Class=" btn btn-cadastro-lista" OnClick="btnCadastro_Click" />--%>
                                    <asp:LinkButton runat="server" ID="btnCadastroServico"
                                        CssClass="btn-cadastro-lista btn btn-default"
                                        OnClick="btnCadastroServico_Click">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Cadastrar
                                    </asp:LinkButton>
                                </div>
                                <asp:GridView
                                    ID="grpListaDeServico"
                                    runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table table-hover"
                                    GridLines="None"
                                    AllowPaging="True"
                                    DataKeyNames="ServicoId"
                                    PageSize="10">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField
                                            DataField="ServicoIdFornecedor"
                                            HeaderText="Fornecedor"
                                            SortExpression="ServicoIdFornecedor" />
                                        <asp:BoundField
                                            DataField="Servico"
                                            HeaderText="Descricao"
                                            SortExpression="Servico" />
                                        <asp:BoundField
                                            DataField="ServicoValor"
                                            HeaderText="Valor"
                                            SortExpression="ServicoValor" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("ServicoId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("ServicoId")%>' ToolTip="Editar">
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
        </fieldset>
    </asp:Panel>
</asp:Content>
