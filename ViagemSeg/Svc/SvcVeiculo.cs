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
    public static class SvcVeiculo
    {
        private static bancoviagemEntities db = new bancoviagemEntities();

        public static List<DtoVeiculo> ListarTodosVeiculos()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = Mapeador.ListaVeiculos(db.veiculo.ToList().FindAll(a => a.Status == 0));
                return result;
            }
        }

        public static veiculo AlteraSalvaVeiculo(veiculo veiculo)
        {
            using (var ContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var existeVeiculo = db.viagem.Find(veiculo.Id);

                    using (var db = new bancoviagemEntities())
                    {

                        if (existeVeiculo == null)
                        {
                            db.Entry(veiculo).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(veiculo).State = EntityState.Modified;
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
            return veiculo;
        }

        public static int Excluir(int id)
        {
            veiculo veiculo = new veiculo();
            using (var db = new bancoviagemEntities())
            {
                var y = db.veiculo.Find(id);
                y.Status = 1;
                veiculo = y;
            }
            using (var db = new bancoviagemEntities())
            {
                db.Entry(veiculo).State = EntityState.Modified;
                db.SaveChanges();
            }
            return id;
        }

        public static veiculo BuscarVeiculo(int pIdVeiculo)
        {
            bancoviagemEntities db = new bancoviagemEntities();
            var veiculo = db.veiculo.ToList().Find(a => a.Id == pIdVeiculo);
            return veiculo;
        }

    }
}
