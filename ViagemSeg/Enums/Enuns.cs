using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViagemSeg.Enums
{
    public static class Enuns
    {
        public enum tipos
        {

            [Description("Carro")]
            Carro = 10,
            [Description("Van")]
            Van = 11,
            [Description("Onibus")]
            Onibus = 12

        }

        //public enum quantidade
        //{
        //    [Description("0")]
        //    Nenhum = 10,
        //    [Description("1")]
        //    um = 11,
        //    [Description("2")]
        //    dois = 12,
        //    [Description("3")]
        //    trez = 13,
        //    [Description("4")]
        //    Nenhum = 10,
        //    [Description("5")]
        //    um = 11,
        //    [Description("6")]
        //    dois = 12,
        //    [Description("")]
        //    trez = 13

        //}


    }
}
