﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ControlEscolar.Models;

namespace ControlEscolar.Repositories
{
    
    public abstract class Repository<T> where T : class
    {
        public sieContext Context { get; set; }
        public Repository()
        {

        }
        public Repository(sieContext context)
        {
            Context = context;
        }

        public void Insert<T> (T entidad)
        {
            Context.Add(entidad);
            Save();
        }

        public IEnumerable<T> GetAll()
        {
            return Context.Set<T>();
        }
        public T GetById(object id)
        {
            return Context.Find<T>(id);
        }

        public void Update(T entidad)
        {
            Context.Update(entidad);
            Save();
        }

        public void Delete(T entidad)
        {
            Context.Remove(entidad);
            Save();
        }

        public void Save()
        {
            Context.SaveChanges();
        }
    }
}
