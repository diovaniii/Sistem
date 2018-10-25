<%@ Page Title="Lista de Viagem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaViagem.aspx.cs" Inherits="ViagemWeb.ListaViagem" %>

<asp:Content ID="BodyViagem" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Lista de Viagem</legend>
            <asp:UpdatePanel ID="uppGridViewViagem" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <p />
                        <div class="panel panel-default">
                            <div class="panel-body">

                                <div>
                                    <asp:LinkButton runat="server" ID="btnCadastroViagem"
                                        CssClass="btn-cadastro-lista btn btn-default"
                                        OnClick="btnCadastroViagem_Click" style=" margin-bottom: 10px">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Cadastrar
                                    </asp:LinkButton>

                                </div>

                                <asp:GridView
                                    ID="grpListaDeViagem"
                                    runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table table-hover"
                                    GridLines="None"
                                    AllowPaging="True"
                                    DataKeyNames="ViagemId"
                                    PageSize="10">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField
                                            DataField="ViagemNome"
                                            HeaderText="Viagem"
                                            SortExpression="ViagemNome" />
                                        <asp:BoundField
                                            DataField="ViagemDataInicio"
                                            HeaderText="Inicio"
                                            SortExpression="ViagemDataInicio" />
                                        <asp:BoundField
                                            DataField="ViagemDataFim"
                                            HeaderText="Fim"
                                            SortExpression="ViagemDataFim" />
                                        <asp:BoundField
                                            DataField="ViagemValor"
                                            HeaderText="Valor"
                                            SortExpression="ViagemValor" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkStats" runat="server" CssClass="btn btn-Lista" OnCommand="Stats" CommandArgument='<%# Eval("ViagemId")%>' ToolTip="Stats">
                                <i aria-hidden="true" class="glyphicon glyphicon-stats"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("ViagemId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("ViagemId")%>' ToolTip="Editar">
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
