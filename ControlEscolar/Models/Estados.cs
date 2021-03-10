using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Estados
    {
        public Estados()
        {
            Municipio = new HashSet<Municipio>();
        }

        public int IdEstados { get; set; }
        public int Clave { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Municipio> Municipio { get; set; }
    }
}
