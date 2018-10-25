<%@ Page Title="Venda de Viagem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendaViagem.aspx.cs" Inherits="ViagemWeb.VendaViagem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <fieldset>
            <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <panel runat="server">
                <p />
                
                    <legend>Venda de Viagem</legend>
                    
                        <div class="col-md-3">
                            <label>
                                Viagem:
                        <br>
                                <asp:DropDownList ID="ddlViagem" runat="server" DataTextField="ViagemNome" DataValueField="ViagemId" OnSelectedIndexChanged="ddlViagem_SelectedIndexChanged" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Cliente:
                        <br>
                                <asp:DropDownList ID="ddlCliente" runat="server" DataTextField="ClienteNome" DataValueField="ClienteId" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
            </panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="col-md-3">
                <label>
                    Quantidade:
                        <br>
                    <input id="Quant" type='text' class="form-control" autocomplete="off" />
                </label>
            </div>


            <div class="col-md-3">
                <label>

                    <br>
                    <asp:Button runat="server" ID="salvarQuantidade" Text="Ok" class="btn" OnClick="salvarQuantidade_Click" />
                </label>
            </div>

        </fieldset>
        <asp:UpdatePanel runat="server" ID="uppPanel" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label runat="server" ID="lblTeste" Visible="false" Text="" ClientIDMode="static"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div>
            <fieldset>
                <asp:UpdatePanel runat="server" ID="uppGridView" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView
                            ID="grpVendaCliente"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table table-hover"
                            GridLines="None"
                            AllowPaging="True"
                            DataKeyNames="VendaId"
                            OnRowDataBound="grpVendaCliente_RowDataBound"
                            PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cliente">
                                    <ItemTemplate>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlCliente1" runat="server" DataValueField="ClienteId" Class="form-control js-example-basic-single"></asp:DropDownList>
                                        </div>
                                        <button class="btn" type="button" data-toggle="collapse" data-target="#Cadastro<%# Container.DataItemIndex + 1 %>" aria-expanded="false" aria-controls="collapseExample">
                                            <i aria-hidden="true" class="glyphicon glyphicon-plus"></i>
                                        </button>

                                        <div class="collapse" id="Cadastro<%# Container.DataItemIndex + 1 %>">
                                            <div class="card card-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>
                                                            Nome:
                        <br>
                                                            <asp:TextBox ID="txtNome" runat="server" Class="form-control"></asp:TextBox>
                                                        </label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>
                                                            Cpf:
                        <br>
                                                            <asp:TextBox ID="txtCpf" runat="server" Class="form-control"></asp:TextBox>
                                                        </label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>
                                                            Data de nascimento:
                        <br>
                                                            <asp:TextBox ID="txtDataNascimento" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                                                        </label>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField
                                    DataField="FaixaEtaria"
                                    HeaderText="Faixa Etaria"
                                    SortExpression="FaixaEtaria" />
                                <asp:BoundField
                                    DataField="Viagem.Valor"
                                    HeaderText="Valor"
                                    SortExpression="Viagem.Valor" />
                                <asp:TemplateField HeaderText="Valor Desconto R$">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="ValorDesconto" type='text' class="form-control" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pagamento Total">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ckbPago" runat="server" CssClass="pago"></asp:CheckBox>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Valor Pago">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="ValorPago" type='text' CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server"
                                            ValidationGroup="validador"
                                            ForeColor="Red"
                                            ControlToValidate="ValorPago"
                                            ErrorMessage="Campo obrigatório" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assento">
                                    <ItemTemplate>
                                        <asp:TextBox ID="poltrona" runat="server" Style="width: 45px" class="form-control poltrona" ClientIDMode="static" />
                                        <asp:RequiredFieldValidator runat="server"
                                            ValidationGroup="validador"
                                            ForeColor="Red"
                                            ControlToValidate="poltrona"
                                            ErrorMessage="Campo obrigatório" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <p>
                                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#Div<%# Container.DataItemIndex + 1 %>" aria-expanded="false" aria-controls="collapseExample">
                                                Assento
                                            </button>
                                        </p>
                                        <div class="collapse" id="Div<%# Container.DataItemIndex + 1 %>">
                                            <div class="card card-body">
                                                <div id="holder">
                                                    <ul id="place" class="assento">
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </fieldset>
        </div>

    </div>

    <input type="hidden" id="quantidadeAdulto" runat="server" clientidmode="static" />
    <input type="hidden" id="quantidadeAdolecente" runat="server" clientidmode="static" />
    <input type="hidden" id="quantidadeCrianca" runat="server" clientidmode="static" />
    <input type="hidden" id="quantidadeBebe" runat="server" clientidmode="static" />
    <input type="hidden" id="ListaAssento" runat="server" clientidmode="static" />
    <input type="hidden" id="Diferenca" runat="server" clientidmode="static" />
    <input type="hidden" id="QuantidadeAssento" runat="server" clientidmode="static" />
    <input id="valorTotal" runat="server" class="form-control" clientidmode="static" />
    <div class="col-md-3">
        <label>
            <br>
            <asp:Button runat="server" ID="salvarVenda" Text="Finalizar Venda" class="btn" OnClick="salvarVenda_Click" ValidationGroup="validador" />
        </label>
    </div>


    <script type="text/javascript">


        var settings = {
            rows: 4,
            cols: parseInt(document.getElementById("QuantidadeAssento").value),
            rowCssPrefix: 'row-',
            colCssPrefix: 'col-',
            seatWidth: 35,
            seatHeight: 35,
            seatCss: 'seat',
            selectedSeatCss: 'selectedSeat',
            selectingSeatCss: 'selectingSeat',
            brancoSeatCss: 'brancoSeat',
            tempSelectedSeatCss: 'tempSelectedSeat'
        };

        var quantidadeMaxima = 0;
        var quantidadeSelecionados = 0;
        var init = function (reservedSeat, branco) {
            var str = [], seatNo, className;
            for (i = 0; i < settings.rows; i++) {
                for (j = 0; j < settings.cols; j++) {
                    seatNo = (i + j * settings.rows + 1);
                    className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                    if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                        className += ' ' + settings.selectedSeatCss;
                    }
                    if ($.inArray(seatNo, branco) == -1) {
                       str.push('<li class="' + className + '"' +
                        'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                        '<a title="' + seatNo + '">' + seatNo + '</a>' +
                        '</li>');
                    }
                }
            }
            $('.assento').html(str.join(''));
        };
        //case I: Show from starting
        //init();

        //Case II: If already booked
        //var bookedSeats = [5, 10, 25];
        var bookedSeats = JSON.parse("[" + document.getElementById("ListaAssento").value + "]");
        var branco = JSON.parse("[" + document.getElementById("Diferenca").value + "]");
        var bookedSeatsSelected = [];
        init(bookedSeats, branco);



        $('.' + settings.seatCss).click(function () {
            if ($(this).hasClass(settings.selectedSeatCss)) {
                alert('esse assento ja esta reservado.');
            }
            else if ($(this).hasClass(settings.tempSelectedSeatCss)) {
                alert('Assento ja reservado por este cliente.');
            }
            else {
                const elementoPoltronaSelecionada = $('.poltrona', $(this).parent().parent().parent().parent().parent().parent());
                //guarda valor da poltrona ja celecionada
                var teste = elementoPoltronaSelecionada.val();
                //remove ele mesmo apos selecionar outra poltrona
                $(this).parent().children().filter('.' + settings.selectingSeatCss).removeClass(settings.selectingSeatCss);
                //seleciona nos outros componentes o temporario
                $('.assento .seat a[title="' + $(this).children('a').attr('title') + '"]').parent().addClass('tempSelectedSeat');
                //remove do seu componente o temporario
                $(this).removeClass('tempSelectedSeat');
                //seleciona no componente a poltrona 
                $(this).addClass(settings.selectingSeatCss);
                
                const seatSelected = $(this).text();
                var seatFound = bookedSeatsSelected.filter(e => e == seatSelected);
                if (seatFound.length == 0) {
                    var index = bookedSeatsSelected.indexOf(teste);
                    if (index > -1) {
                        bookedSeatsSelected.splice(index, teste);
                        //apaga dos outros componentes os temporarios quando muda
                        $('.assento .seat a[title="' + teste + '"]').parent().removeClass('tempSelectedSeat');
                    }
                    //apaga dos outros componentes os temporarios quando muda
                    $('.assento .seat a[title="' + teste + '"]').parent().removeClass('tempSelectedSeat');
                    bookedSeatsSelected.push(seatSelected);
                } else {
                    $(this).removeClass('selectingSeat');
                    var index = bookedSeatsSelected.indexOf(teste);
                    if (index > -1) {
                        bookedSeatsSelected.splice(index, teste);
                        //apaga dos outros componentes os temporarios quando muda
                        $('.assento .seat a[title="' + teste + '"]').parent().removeClass('tempSelectedSeat');
                    }
                }
                debugger;
                //envia valor da poltrona selecionada para a label 
                elementoPoltronaSelecionada.val(seatSelected);

            }
        });


        var valorCalculado = 0;
        $('.pago').on('click', function () {
            if ($(this).children('input:checked').length == 1) {
                var valor = parseFloat($(this).parent().prev().prev().text(), 10).toFixed(2).replace(',', '.');
                var desconto = $(this).parent().prev().children()[0].value.replace(',', '.');
                var soma = parseFloat(valor, 10) - parseFloat(desconto, 10);
                soma = parseFloat(soma).toFixed(2);
                if (desconto == "") {
                    $(this).parent().next().children('input').val(valor.replace('.', ','));
                    valorCalculado += parseFloat(valor);
                } else {
                    // Formata o resultado como moeda.
                    $(this).parent().next().children('input').val(soma.replace('.', ','));
                    valorCalculado += parseFloat(soma);
                }
            }
            else {
                valorCalculado -= ($(this).parent().next().children('input').val()).replace(',', '.');
                $(this).parent().next().children('input').val('')
                $(this).parent().prev().children().val('')
            }
            document.getElementById("valorTotal").value = (valorCalculado.toFixed(2)).replace('.', ',');
        });


        //var valorCalculado = 0;
        //$(".valorPago").each(function () {
        //    valorCalculado += parseInt($(this).text());
        //});
        //$("#valorTotal").text(valorCalculado);

        $('.checked').on('keyup', function () {
            if (this.checked == true) {
                var test = $(this).next()
                var test2 = $(test).next('input');
                test2.focus();
            }
        });

        $('#ValorPago').on('keyup', function () {
            function getListOfInput(grpVendaCliente, ValorPago) {
                var children = grpVendaCliente.getElementsByTagName('INPUT');
                for (var i = 0; i < children.length; i++) {
                    var child = children[i];
                    child.value = ValorPago
                }
                return valorTotal;
            }
        });

    </script>

</asp:Content>
