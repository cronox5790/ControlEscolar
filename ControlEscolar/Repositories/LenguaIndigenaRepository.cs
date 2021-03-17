using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ControlEscolar.Models;

namespace ControlEscolar.Repositories
{
    public class LenguaIndigenaRepository:Repository<Lenguaindigena>
    {
        public LenguaIndigenaRepository(sieContext context)
        {
            Context = context;
        }
        public Lenguaindigena InsertLenguaIndigena(Lenguaindigena lengua)
        {
            if (string.IsNullOrWhiteSpace(lengua.Descripcion))
            {
                throw new ArgumentException("Debe especificarse una descripción.");
            }
            if (string.IsNullOrWhiteSpace(lengua.NombreCorto))
            {
                throw new ArgumentException("Debe especificarse un nombre corto.");
            }
            if (lengua.Clave<=0)
            {
                throw new ArgumentException("La clave no puede ser negativa.");
            }
            var lenguas = GetAll();
            if (lenguas.Any(x=>x.Descripcion.Trim().ToUpper()==
                                lengua.Descripcion.Trim().ToUpper()))
            {
                throw new ArgumentException("Ya está registrada una lengua con esa descripcion.");
            }
            if (lenguas.Any(x => x.NombreCorto.Trim().ToUpper() ==
                                lengua.NombreCorto.Trim().ToUpper()))
            {
                throw new ArgumentException("Ya está registrada una lengua con ese nombre corto.");
            }
            Insert(lengua);
            return lengua;
        }

        /// <summary>
        /// Método para realizar una búsqueda por el nombre corto
        /// de la lengua indígena
        /// </summary>
        /// <param name="nombre">Nombre a buscar</param>
        /// <returns></returns>
        public IEnumerable<Lenguaindigena> FindLenguaIndigenaByNombre(string nombre)
        {
            return GetAll().Where(x => x.NombreCorto.Contains(nombre));
        }

        public void DeleteLenguaIndigena(Lenguaindigena lengua)
        {
            Delete(lengua);
            Save();
        }
        public void DeleteLenguaById(int id)
        {
            Delete(GetAll().Where(x => x.Id == id).First()) ;
            Save();
        }
    }
}
