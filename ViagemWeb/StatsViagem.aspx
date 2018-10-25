<%@ Page Title="Statistica Viagem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StatsViagem.aspx.cs" Inherits="ViagemWeb.StatsViagem" %>

<%@ Register Src="~/Form/Porcentagem.ascx" TagPrefix="sis" TagName="Porcentagem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel-body">

        <fieldset style="float: left; height: 70%; width: 70%;">
            <legend>Statistica Viagem</legend>
            <div class="row">
                <div class="col-md-4">
                    <label>
                        Viagem:
                        <br>
                        <asp:TextBox ID="txtViagem" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
                <div class="col-md-4">
                    <label>
                        Local:
                        <br>
                        <asp:TextBox ID="txtLocal" runat="server" Class="form-control" MaxLength="15"></asp:TextBox>
                    </label>
                </div>

                <div class="col-md-4">
                    <label>
                        Estado:
                        <br>
                        <select id="txtEstado" runat="server" class="form-control" font-bold="false">
                            <option value=""></option>
                            <option value="IN">INTERNACIONAL</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label>
                        Valor:
                        <br>
                        <asp:TextBox ID="txtValor" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
                <div class="col-md-4">
                    <label>
                        Data Inicio:
                                <br>
                        <asp:TextBox ID="txtDataInicio" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                    </label>
                </div>

                <div class="col-md-4">
                    <label>
                        Data Fim:
                                <br>
                        <asp:TextBox ID="txtDataFim" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label>
                        Veiculo:
                        <br>
                        <asp:DropDownList ID="ddlVeiculo" runat="server" DataTextField="VeiculoIdentificacao" DataValueField="VeiculoId" Class="form-control" />
                    </label>
                </div>
                <div class="col-md-4">
                    <label>
                        Assentos:
                        <br>
                        <asp:TextBox ID="txtAssento" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>

                <div class="col-md-6">
                    <label>
                        Descrição:
                        <br>
                        <asp:TextBox ID="txtDescricao" runat="server" Class="form-control descricao " Rows="8" TextMode="MultiLine"></asp:TextBox>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label>
                        Valor Total:
                        <br>
                        <asp:TextBox ID="txbValorTotal" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
                <div class="col-md-4">
                    <label>
                        Valor Pago:
                        <br>
                        <asp:TextBox ID="txbValorPago" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>

                <div class="col-md-4">
                    <label>
                        Valor Despesa:
                        <br>
                        <asp:TextBox ID="txbValorDespesa" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
                <div class="col-md-4">
                    <label>
                        Valor Lucro:
                        <br>
                        <asp:TextBox ID="txbValorLucro" runat="server" Class="form-control"></asp:TextBox>
                    </label>
                </div>
            </div>
        </fieldset>
        <fieldset style="float: right; height: 30%; width: 30%;">
            <legend>Porcentagem</legend>
            <div>
                <div id="container-speed"></div>
            </div>
            <div>
                <div id="container"></div>
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
</asp:Content>
