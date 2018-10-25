<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ViagemWeb._Default" %>
<%@ Register Src="~/Form/Porcentagem.ascx" TagPrefix="sis" TagName="Porcentagem" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <fieldset>
        <div id="container"></div>
    </fieldset>


    <div class="panel-body">

        <fieldset style="float: left; height: 70%; width: 70%;">
            <legend>Statistica Viagem</legend>
             <asp:UpdatePanel ID="uppGridViewViagem" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <p />
                        <div class="panel panel-default">
                            <div class="panel-body">
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
                                        <%--<asp:TemplateField>
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
                                        </asp:TemplateField>--%>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Left" />
                                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" />
                                </asp:GridView>
        
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                 </asp:UpdatePanel>
            </fieldset>
        <fieldset style="float: right;  height: 30%; width: 30%;">
            <div style="margin-left: 50px;" >
                <legend>Porcentagem</legend>
                <div >
                    <label>
                        Valor Total:
                        <br>
                        <asp:TextBox ID="txbValorTotal" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
                <div>
                    <label>
                        Valor Pago:
                        <br>
                        <asp:TextBox ID="txbValorPago" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>

                <div>
                    <label>
                        Valor Despesa:
                        <br>
                        <asp:TextBox ID="txbValorDespesa" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
                <div>
                    <label>
                        Valor Lucro:
                        <br>
                        <asp:TextBox ID="txbValorLucro" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
            </div>
        </fieldset>
    </div>

    <input type="hidden" id="ChartLucro" runat="server" clientidmode="static" />
    <input type="hidden" id="ChartDespesa" runat="server" clientidmode="static" />
    <input type="hidden" id="ChartTotal" runat="server" clientidmode="static" />
    <input type="hidden" id="Porcent" runat="server" clientidmode="static" />

    <script>
        window.onload = function () {

            Highcharts.chart('container', {

                title: {
                    text: 'Solar Employment Growth by Sector, 2010-2016'
                },

                subtitle: {
                    text: 'Source: thesolarfoundation.com'
                },

                yAxis: {
                    title: {
                        text: 'Number of Employees'
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 2010
                    }
                },

                series: [{
                    name: 'Lucro',
                    data: [0, parseFloat(document.getElementById("ChartLucro").value)]
                }, {
                    name: 'Total',
                    data: [parseFloat(document.getElementById("ChartTotal").value), parseFloat(document.getElementById("ChartTotal").value)]
                }, {
                    name: 'Despesa',
                    data: [0, parseFloat(document.getElementById("ChartDespesa").value)]
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }

            });
        }


        // PORCENTAGEM
        var gaugeOptions = {

            chart: {
                type: 'solidgauge'
            },

            title: null,

            pane: {
                center: ['50%', '85%'],
                size: '70%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },

            tooltip: {
                enabled: false
            },

            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#55BF3B'], // green
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#DF5353'] // red
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };

        // The speed gauge
        var chartSpeed = Highcharts.chart('container-speed', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: '%'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: '%',
                data: [parseFloat(document.getElementById("Porcent").value)],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                        '<span style="font-size:12px;color:silver">km/h</span></div>'
                },
                tooltip: {
                    valueSuffix: ' %'
                }
            }]

        }));


        // Bring life to the dials
        //setInterval(function () {
        //    // Speed
        //    var point,
        //        newVal,
        //        inc;

        //    if (chartSpeed) {
        //        point = chartSpeed.series[0].points[0];
        //        inc = Math.round((Math.random() - 0.5) * 100);
        //        newVal = point.y + inc;

        //        if (newVal < 0 || newVal > 200) {
        //            newVal = point.y - inc;
        //        }

        //        point.update(parseFloat(document.getElementById("Porcent").value));
        //    }

        //}, 2000);
    </script>
   <%-- <div>
        <sis:Porcentagem runat="server" ID="Porcentagem"/>
    </div>
    <div>
        <p />
        <div class="panel panel-default">
            <div class="panel-body">
                <h3>Lista de clientes</h3>
                <asp:GridView
                    ID="grpListaDeClientes"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table"
                    GridLines="None"
                    DataKeyNames="ClienteId">
                    <Columns>
                        <asp:BoundField
                            DataField="ClienteNome"
                            HeaderText="Nome"
                            SortExpression="ClienteNome" />
                        <asp:BoundField
                            DataField="ClienteTelefone"
                            HeaderText="Telefone"
                            SortExpression="ClienteTelefone" />
                        <asp:BoundField
                            DataField="ClienteCpf"
                            HeaderText="Cpf"
                            SortExpression="ClienteCpf" />
                        <asp:BoundField
                            DataField="ClienteDataNascimento"
                            HeaderText="Data Nascimento"
                            SortExpression="ClienteDataNascimento" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>--%>

</asp:Content>
