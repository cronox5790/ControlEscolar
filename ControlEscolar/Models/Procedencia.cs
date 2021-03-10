using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Procedencia
    {
        public Procedencia()
        {
            Alumno = new HashSet<Alumno>();
        }

        public int IdProcedencia { get; set; }
        public int? Bachillerato { get; set; }
        public short? AñoEgreso { get; set; }
        public int? AreaEgreso { get; set; }
        public float? PromedioBachillerato { get; set; }
        public int? Exani { get; set; }
        public int? Egel { get; set; }
        public int? Toefl { get; set; }
        public int MunicipioIdMunicipio { get; set; }
        public int MunicipioEstadosIdEstados { get; set; }

        public virtual Municipio Municipio { get; set; }
        public virtual ICollection<Alumno> Alumno { get; set; }
    }
}
