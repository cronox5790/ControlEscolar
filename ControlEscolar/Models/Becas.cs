using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Becas
    {
        public Becas()
        {
            Alumno = new HashSet<Alumno>();
        }

        public int Id { get; set; }
        public int Clave { get; set; }
        public string Descripcion { get; set; }
        public string NombreCorto { get; set; }

        public virtual ICollection<Alumno> Alumno { get; set; }
    }
}
