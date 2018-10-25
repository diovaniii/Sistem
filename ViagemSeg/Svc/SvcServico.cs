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
    public static class SvcServico
    {
        private static bancoviagemEntities db = new bancoviagemEntities();

        public static List<DtoServico> ListarServico()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = Mapeador.ListaServico(db.pestacaoservico.ToList().FindAll(a => a.Status == 0));
                return result;
            }
        }

        public static pestacaoservico AlteraSalvaServico(pestacaoservico servico)
        {
            using (var ContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var existeServico = db.pestacaoservico.Find(servico.Id);

                    using (var db = new bancoviagemEntities())
                    {

                        if (existeServico == null)
                        {
                            db.Entry(servico).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(servico).State = EntityState.Modified;
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
            return servico;
        }

        public static int Excluir(int id)
        {
            pestacaoservico servico = new pestacaoservico();
            using (var db = new bancoviagemEntities())
            {
                var y = db.pestacaoservico.Find(id);
                y.Status = 1;
                servico = y;
            }
            using (var db = new bancoviagemEntities())
            {
                db.Entry(servico).State = EntityState.Modified;
                db.SaveChanges();
            }
            return id;
        }

        public static pestacaoservico BuscarServico(int pIdServico)
        {
            bancoviagemEntities db = new bancoviagemEntities();
            var servico = db.pestacaoservico.ToList().Find(a => a.Id == pIdServico);
            return servico;
        }
    }
}
