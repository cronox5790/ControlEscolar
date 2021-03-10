using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Municipio
    {
        public Municipio()
        {
            Domicilio = new HashSet<Domicilio>();
            Procedencia = new HashSet<Procedencia>();
        }

        public int IdMunicipio { get; set; }
        public sbyte Municipio1 { get; set; }
        public string Nombre { get; set; }
        public int EstadosIdEstados { get; set; }

        public virtual Estados EstadosIdEstadosNavigation { get; set; }
        public virtual ICollection<Domicilio> Domicilio { get; set; }
        public virtual ICollection<Procedencia> Procedencia { get; set; }
    }
}
