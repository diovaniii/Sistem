using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViagemSeg.Dto;
using ViagemSeg.Mapping;

namespace ViagemSeg.Svc
{
    public static class SvcVendaCliente
    {
        private static bancoviagemEntities db = new bancoviagemEntities();

        public static List<DtoVendaCliente> ListarVendaCliente()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = Mapeador.ListaVenda(db.vendacliente.ToList().FindAll(a => a.Status == 0));
                return result;
            }
        }

        public static List<viagem> ListarViagem()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = db.viagem.ToList().FindAll(a => a.Status == 0);
                return result;
            }
        }

        public static vendacliente AlteraSalva(vendacliente vendaCliente)
        {
            using (var ContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var existeVendaCliente = db.vendacliente.Find(vendaCliente.VendaId);


                    using (var db = new bancoviagemEntities())
                    {

                        if (existeVendaCliente == null)
                        {
                            db.Entry(vendaCliente).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(vendaCliente).State = EntityState.Modified;
                        }
                        db.SaveChanges();
                    }

                    ContextTransaction.Commit();
                }
                catch (Exception ex)
                {

                    ContextTransaction.Rollback();
                    throw ex;
                }
            }
            return vendaCliente;
        }

        public static List<vendacliente> PesquisaViagem(int idViagem)
        {
            using (var db = new bancoviagemEntities())
            {
                var viagens = db.vendacliente.Where(a => a.Status == 0)
                                         .Where(a => a.VendaIdViagem == idViagem);

                return viagens.ToList();
            }
        }

        public static List<DtoVendaCliente> Pesquisa(vendacliente pVendaCliente)
        {
            using (var db = new bancoviagemEntities())
            {
                var VendaCliente = db.vendacliente.Where(a => a.Status == 0)
                                         .Where(a => pVendaCliente.VendaIdCliente.Equals(0) ? true : a.VendaIdCliente.ToString().Contains(pVendaCliente.VendaIdCliente.ToString()))
                                         .Where(a => pVendaCliente.VendaIdViagem.Equals(0) ? true : a.VendaIdViagem.ToString().Contains(pVendaCliente.VendaIdViagem.ToString()));
                return Mapeador.ListaVenda(VendaCliente.ToList());
            }
        }

        public static int Excluir(int id)
        {
            vendacliente vendaCliente = new vendacliente();
            using (var db = new bancoviagemEntities())
            {
                var y = db.vendacliente.Find(id);
                y.Status = 1;
                vendaCliente = y;
            }
            using (var db = new bancoviagemEntities())
            {
                db.Entry(vendaCliente).State = EntityState.Modified;
                db.SaveChanges();
            }
            return id;
        }
    }
}
