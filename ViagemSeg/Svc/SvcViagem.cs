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
    public static class SvcViagem
    {
        private static bancoviagemEntities db = new bancoviagemEntities();

        public static List<DtoViagem> ListarTodasViagens()
        {
            using (var db = new bancoviagemEntities())
            {
                var result = Mapeador.ListaViagens(db.viagem.ToList().FindAll(a => a.Status == 0));
                return result;
            }
        }


        public static viagem AlteraSalva(viagem viagem)
        {
            using (var ContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var existeViagem = db.viagem.Find(viagem.Id);

                    using (var db = new bancoviagemEntities())
                    {

                        if (existeViagem == null)
                        {
                            db.Entry(viagem).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(viagem).State = EntityState.Modified;
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
            return viagem;
        }

        //EXCLUI O CLIENTE FAZENDO APENAS A ALTERAÇÃO DO STATUS
        public static int Excluir(int id)
        {
            viagem viagem = new viagem();
            using (var db = new bancoviagemEntities())
            {
                var y = db.viagem.Find(id);
                y.Status = 1;
                viagem = y;
            }
            using (var db = new bancoviagemEntities())
            {
                db.Entry(viagem).State = EntityState.Modified;
                db.SaveChanges();
            }
            return id;
        }

        public static viagem BuscarViagem(int pIdViagem)
        {
            bancoviagemEntities db = new bancoviagemEntities();
            var viagem = db.viagem.ToList().Find(a => a.Id == pIdViagem);
            return viagem;
        }
    }
}
