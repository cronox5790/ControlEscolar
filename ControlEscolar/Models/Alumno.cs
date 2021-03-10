using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class Alumno
    {
        public int IdAlumno { get; set; }
        public string NumControl { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Curp { get; set; }
        public string Rfc { get; set; }
        public int Sexo { get; set; }
        public int ProcedenciaIdProcedencia { get; set; }
        public int ProcedenciaMunicipioIdMunicipio { get; set; }
        public int ProcedenciaMunicipioEstadosIdEstados { get; set; }
        public int? DomicilioIdDomicilio { get; set; }
        public int? ServicioMedicoIdServicioMedico { get; set; }
        public int? LenguaIndigenaId { get; set; }
        public int? BecasId { get; set; }
        public int? ClaveAccesoInternet { get; set; }
        public int? Foto { get; set; }

        public virtual Becas Becas { get; set; }
        public virtual Domicilio DomicilioIdDomicilioNavigation { get; set; }
        public virtual Lenguaindigena LenguaIndigena { get; set; }
        public virtual Procedencia Procedencia { get; set; }
        public virtual Serviciomedico ServicioMedicoIdServicioMedicoNavigation { get; set; }
    }
}
