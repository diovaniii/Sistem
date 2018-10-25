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
    public static class SvcFornecedor
    {
        private static bancoviagemEntities db = new bancoviagemEntities();

        public static List<DtoFornecedor> ListarFornecedor()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = Mapeador.ListaFornecedor(db.fornecedor.ToList().FindAll(a => a.Status == 0));
                return result;
            }
        }

        public static fornecedor AlteraSalvaFornecedor(fornecedor fornecedor)
        {
            using (var ContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var existeFornecedor = db.fornecedor.Find(fornecedor.Id);

                    using (var db = new bancoviagemEntities())
                    {

                        if (existeFornecedor == null)
                        {
                            db.Entry(fornecedor).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(fornecedor).State = EntityState.Modified;
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
            return fornecedor;
        }

        public static int Excluir(int id)
        {
            fornecedor fornecedor = new fornecedor();
            using (var db = new bancoviagemEntities())
            {
                var y = db.fornecedor.Find(id);
                y.Status = 1;
                fornecedor = y;
            }
            using (var db = new bancoviagemEntities())
            {
                db.Entry(fornecedor).State = EntityState.Modified;
                db.SaveChanges();
            }
            return id;
        }

        public static fornecedor BuscarFornecedores(int pIdFornecedor)
        {
            bancoviagemEntities db = new bancoviagemEntities();
            var fornecedor = db.fornecedor.ToList().Find(a => a.Id == pIdFornecedor);
            return fornecedor;
        }
    }
}
