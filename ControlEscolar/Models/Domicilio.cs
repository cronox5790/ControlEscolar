using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Domicilio
    {
        public Domicilio()
        {
            Alumno = new HashSet<Alumno>();
        }

        public int IdDomicilio { get; set; }
        public string Calle { get; set; }
        public int? Numero { get; set; }
        public string Colonia { get; set; }
        public int CodigoPostal { get; set; }
        public int MunicipioIdMunicipio { get; set; }
        public int MunicipioEstadosIdEstados { get; set; }
        public string Ciudad { get; set; }
        public string Telefono { get; set; }
        public string Celular { get; set; }
        public string CorreoElectronico { get; set; }
        public string Facebook { get; set; }
        public string Twitter { get; set; }

        public virtual Municipio Municipio { get; set; }
        public virtual ICollection<Alumno> Alumno { get; set; }
    }
}
