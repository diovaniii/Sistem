using System;

namespace ViagemSeg
{
    [Serializable]
    public partial class endereco
    {
        public bool IsEmpty
        {
            get
            {
                if (!string.IsNullOrEmpty(Estado))
                {
                    return false;
                }
                if (!string.IsNullOrEmpty(Cidade))
                {
                    return false;
                }
                if (!string.IsNullOrEmpty(Bairro))
                {
                    return false;
                }
                if (!string.IsNullOrEmpty(Rua))
                {
                    return false;
                }
                if (!string.IsNullOrEmpty(Numero))
                {
                    return false;
                }
                return true;
            }
        }
    }
}
