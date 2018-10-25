using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using ViagemSeg;


namespace ViagemSeg.Comuns
{
    public class Comun
    {
        public static string FormatarCpfCnpj(string strCpfCnpj)
        {
            if (strCpfCnpj.Length <= 11)
            {
                MaskedTextProvider mtpCpf = new MaskedTextProvider(@"000\.000\.000-00");
                mtpCpf.Set(ZerosEsquerda(strCpfCnpj, 11));
                return mtpCpf.ToString();
            }
            else
            {
                MaskedTextProvider mtpCnpj = new MaskedTextProvider(@"00\.000\.000/0000-00");
                mtpCnpj.Set(ZerosEsquerda(strCpfCnpj, 11));
                return mtpCnpj.ToString();
            }
        }
        public static string ZerosEsquerda(string strString, int intTamanho)
        {
            string strResult = "";

            for (int intCont = 1; intCont <= (intTamanho - strString.Length); intCont++)
            {
                strResult += "0";
            }
            return strResult + strString;
        }

        public static string FormatarTelefone(string strTelefone)
        {
            if (strTelefone.Length >= 11)
            {
                MaskedTextProvider mtpTelefone = new MaskedTextProvider(@"(00) 00000-0000");
                mtpTelefone.Set(ZerosEsquerda(strTelefone, 11));
                return mtpTelefone.ToString();
            }
            else
            {
                MaskedTextProvider mtpTelefone = new MaskedTextProvider(@"(00) 0000-0000");
                mtpTelefone.Set(ZerosEsquerda(strTelefone, 10));
                return mtpTelefone.ToString();
            }
        }
        public static string ApenasNumeros(string str)
        {
            var apenasDigitos = new Regex(@"[^\d]");
            return apenasDigitos.Replace(str, "");
        }

        public static SortedList GetEnumForBind(Type enumeration)
        {
            string[] names = Enum.GetNames(enumeration);
            Array values = Enum.GetValues(enumeration);
            SortedList sl = new SortedList();
            for (int i = 0; i < names.Length; i++)
            {
                sl.Add(Convert.ToInt32(values.GetValue(i)).ToString(), names[i]);
            }
            return sl;
        }
    }
}
