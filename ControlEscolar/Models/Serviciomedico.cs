using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Serviciomedico
    {
        public Serviciomedico()
        {
            Alumno = new HashSet<Alumno>();
        }

        public int IdServicioMedico { get; set; }
        public int Tipo { get; set; }
        public string Institucion { get; set; }
        public string Afiliacion { get; set; }
        public string TipoSangre { get; set; }
        public string AfiliacionSs { get; set; }

        public virtual ICollection<Alumno> Alumno { get; set; }
    }
}
