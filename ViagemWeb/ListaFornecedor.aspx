<%@ Page Title="Lista de Fornecedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaFornecedor.aspx.cs" Inherits="ViagemWeb.ListaFornecedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Lista de Fornecedores</legend>
            <asp:UpdatePanel ID="uppGridViewFornecedor" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <p />
                        <div class="panel panel-default">
                            <div class="panel-body">
                                
                                    <div >
                                        <%--<asp:Button ID="btnCadastro" runat="server" Text="+ Cadastrar" Class=" btn btn-cadastro-lista" OnClick="btnCadastro_Click" />--%>
                                        <asp:LinkButton runat="server" ID="btnCadastroFornecedor"
                                            CssClass="btn-cadastro-lista btn btn-default"
                                            OnClick="btnCadastroFornecedor_Click" style=" margin-bottom: 10px">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Cadastrar
                                        </asp:LinkButton>
                                        
                                    </div>

                                <asp:GridView
                                    ID="grpListaDeFornecedor"
                                    runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table table-hover"
                                    GridLines="None"
                                    AllowPaging="True"
                                    DataKeyNames="FornecedorId"
                                    PageSize="10">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField
                                            DataField="FornecedorNome"
                                            HeaderText="Nome"
                                            SortExpression="FornecedorNome" />
                                        <asp:BoundField
                                            DataField="FornecedorServico"
                                            HeaderText="Descricao"
                                            SortExpression="FornecedorServico" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("FornecedorId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("FornecedorId")%>' ToolTip="Editar">
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
