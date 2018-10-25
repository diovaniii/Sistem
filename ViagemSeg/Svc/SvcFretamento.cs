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
    public static class SvcFretamento
    {
        private static bancoviagemEntities db = new bancoviagemEntities();

        public static List<DtoFretamento> ListarFretamento()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = Mapeador.ListaFretamento(db.fretamento.ToList().FindAll(a => a.Status == 0));
                return result;
            }
        }

        public static fretamento AlteraSalvaFretamento(fretamento fretamento)
        {
            using (var ContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var existeFretamento = db.fretamento.Find(fretamento.Id);

                    using (var db = new bancoviagemEntities())
                    {

                        if (existeFretamento == null)
                        {
                            db.Entry(fretamento).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(fretamento).State = EntityState.Modified;
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
            return fretamento;
        }

        public static int Excluir(int id)
        {
            fretamento fretamento = new fretamento();
            using (var db = new bancoviagemEntities())
            {
                var y = db.fretamento.Find(id);
                y.Status = 1;
                fretamento = y;
            }
            using (var db = new bancoviagemEntities())
            {
                db.Entry(fretamento).State = EntityState.Modified;
                db.SaveChanges();
            }
            return id;
        }

        public static fretamento BuscarFretamento(int pIdFretamento)
        {
            bancoviagemEntities db = new bancoviagemEntities();
            var fretamento = db.fretamento.ToList().Find(a => a.Id == pIdFretamento);
            return fretamento;
        }
    }
}
