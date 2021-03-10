using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ControlEscolar.Models
{
    public partial class sieContext : DbContext
    {
        public sieContext()
        {
        }

        public sieContext(DbContextOptions<sieContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Alumno> Alumno { get; set; }
        public virtual DbSet<Becas> Becas { get; set; }
        public virtual DbSet<Domicilio> Domicilio { get; set; }
        public virtual DbSet<Efmigrationshistory> Efmigrationshistory { get; set; }
        public virtual DbSet<Estados> Estados { get; set; }
        public virtual DbSet<Lenguaindigena> Lenguaindigena { get; set; }
        public virtual DbSet<Municipio> Municipio { get; set; }
        public virtual DbSet<Procedencia> Procedencia { get; set; }
        public virtual DbSet<Serviciomedico> Serviciomedico { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseMySql("server=localhost;port=3306;user id=root;password=root;database=sie", x => x.ServerVersion("8.0.18-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Alumno>(entity =>
            {
                entity.HasKey(e => e.IdAlumno)
                    .HasName("PRIMARY");

                entity.ToTable("alumno");

                entity.HasIndex(e => e.BecasId)
                    .HasName("fk_Alumno_Becas1_idx");

                entity.HasIndex(e => e.DomicilioIdDomicilio)
                    .HasName("fk_Alumno_Domicilio1_idx");

                entity.HasIndex(e => e.LenguaIndigenaId)
                    .HasName("fk_Alumno_LenguaIndigena1_idx");

                entity.HasIndex(e => e.NumControl)
                    .HasName("NumControl_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.ServicioMedicoIdServicioMedico)
                    .HasName("fk_Alumno_ServicioMedico1_idx");

                entity.HasIndex(e => new { e.ProcedenciaIdProcedencia, e.ProcedenciaMunicipioIdMunicipio, e.ProcedenciaMunicipioEstadosIdEstados })
                    .HasName("fk_Alumno_Procedencia1_idx");

                entity.Property(e => e.IdAlumno)
                    .HasColumnName("idAlumno")
                    .HasColumnType("int(11)");

                entity.Property(e => e.ApellidoMaterno)
                    .IsRequired()
                    .HasColumnName("Apellido_Materno")
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.ApellidoPaterno)
                    .IsRequired()
                    .HasColumnName("Apellido_Paterno")
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.BecasId)
                    .HasColumnName("Becas_Id")
                    .HasColumnType("int(11)");

                entity.Property(e => e.ClaveAccesoInternet)
                    .HasColumnName("Clave_Acceso_Internet")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Curp)
                    .IsRequired()
                    .HasColumnName("CURP")
                    .HasColumnType("varchar(16)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.DomicilioIdDomicilio)
                    .HasColumnName("Domicilio_idDomicilio")
                    .HasColumnType("int(11)");

                entity.Property(e => e.FechaNacimiento)
                    .HasColumnName("Fecha_Nacimiento")
                    .HasColumnType("date");

                entity.Property(e => e.Foto).HasColumnType("int(11)");

                entity.Property(e => e.LenguaIndigenaId)
                    .HasColumnName("LenguaIndigena_Id")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.NumControl)
                    .IsRequired()
                    .HasColumnType("varchar(9)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.ProcedenciaIdProcedencia)
                    .HasColumnName("Procedencia_idProcedencia")
                    .HasColumnType("int(11)");

                entity.Property(e => e.ProcedenciaMunicipioEstadosIdEstados)
                    .HasColumnName("Procedencia_Municipio_Estados_idEstados")
                    .HasColumnType("int(11)");

                entity.Property(e => e.ProcedenciaMunicipioIdMunicipio)
                    .HasColumnName("Procedencia_Municipio_idMunicipio")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Rfc)
                    .IsRequired()
                    .HasColumnName("RFC")
                    .HasColumnType("varchar(13)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.ServicioMedicoIdServicioMedico)
                    .HasColumnName("ServicioMedico_idServicioMedico")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Sexo)
                    .HasColumnType("int(11)")
                    .HasComment(@"1 Masculino
2 Femenino");

                entity.HasOne(d => d.Becas)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => d.BecasId)
                    .HasConstraintName("fk_Alumno_Becas1");

                entity.HasOne(d => d.DomicilioIdDomicilioNavigation)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => d.DomicilioIdDomicilio)
                    .HasConstraintName("fk_Alumno_Domicilio1");

                entity.HasOne(d => d.LenguaIndigena)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => d.LenguaIndigenaId)
                    .HasConstraintName("fk_Alumno_LenguaIndigena1");

                entity.HasOne(d => d.ServicioMedicoIdServicioMedicoNavigation)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => d.ServicioMedicoIdServicioMedico)
                    .HasConstraintName("fk_Alumno_ServicioMedico1");

                entity.HasOne(d => d.Procedencia)
                    .WithMany(p => p.Alumno)
                    .HasForeignKey(d => new { d.ProcedenciaIdProcedencia, d.ProcedenciaMunicipioIdMunicipio, d.ProcedenciaMunicipioEstadosIdEstados })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Alumno_Procedencia1");
            });

            modelBuilder.Entity<Becas>(entity =>
            {
                entity.ToTable("becas");

                entity.HasIndex(e => e.Clave)
                    .HasName("Clave_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Clave).HasColumnType("int(11)");

                entity.Property(e => e.Descripcion)
                    .HasColumnType("tinytext")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.NombreCorto)
                    .HasColumnName("Nombre corto")
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<Domicilio>(entity =>
            {
                entity.HasKey(e => e.IdDomicilio)
                    .HasName("PRIMARY");

                entity.ToTable("domicilio");

                entity.HasIndex(e => new { e.MunicipioIdMunicipio, e.MunicipioEstadosIdEstados })
                    .HasName("fk_Domicilio_Municipio1_idx");

                entity.Property(e => e.IdDomicilio)
                    .HasColumnName("idDomicilio")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Calle)
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Celular)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Ciudad)
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.CodigoPostal)
                    .HasColumnName("Codigo_Postal")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Colonia)
                    .IsRequired()
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.CorreoElectronico)
                    .HasColumnName("Correo_electronico")
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Facebook)
                    .HasColumnType("text")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.MunicipioEstadosIdEstados)
                    .HasColumnName("Municipio_Estados_idEstados")
                    .HasColumnType("int(11)");

                entity.Property(e => e.MunicipioIdMunicipio)
                    .HasColumnName("Municipio_idMunicipio")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Numero).HasColumnType("int(11)");

                entity.Property(e => e.Telefono)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Twitter)
                    .HasColumnType("text")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.HasOne(d => d.Municipio)
                    .WithMany(p => p.Domicilio)
                    .HasForeignKey(d => new { d.MunicipioIdMunicipio, d.MunicipioEstadosIdEstados })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Domicilio_Municipio1");
            });

            modelBuilder.Entity<Efmigrationshistory>(entity =>
            {
                entity.HasKey(e => e.MigrationId)
                    .HasName("PRIMARY");

                entity.ToTable("__efmigrationshistory");

                entity.Property(e => e.MigrationId)
                    .HasColumnType("varchar(95)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.ProductVersion)
                    .IsRequired()
                    .HasColumnType("varchar(32)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<Estados>(entity =>
            {
                entity.HasKey(e => e.IdEstados)
                    .HasName("PRIMARY");

                entity.ToTable("estados");

                entity.Property(e => e.IdEstados)
                    .HasColumnName("idEstados")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Clave).HasColumnType("int(11)");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<Lenguaindigena>(entity =>
            {
                entity.ToTable("lenguaindigena");

                entity.HasIndex(e => e.Clave)
                    .HasName("Clave_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Clave).HasColumnType("int(11)");

                entity.Property(e => e.Descripcion)
                    .HasColumnType("tinytext")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.NombreCorto)
                    .HasColumnName("Nombre corto")
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<Municipio>(entity =>
            {
                entity.HasKey(e => new { e.IdMunicipio, e.EstadosIdEstados })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                entity.ToTable("municipio");

                entity.HasIndex(e => e.EstadosIdEstados)
                    .HasName("fk_Municipio_Estados_idx");

                entity.Property(e => e.IdMunicipio)
                    .HasColumnName("idMunicipio")
                    .HasColumnType("int(11)")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.EstadosIdEstados)
                    .HasColumnName("Estados_idEstados")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Municipio1)
                    .HasColumnName("Municipio")
                    .HasColumnType("tinyint(4)");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.HasOne(d => d.EstadosIdEstadosNavigation)
                    .WithMany(p => p.Municipio)
                    .HasForeignKey(d => d.EstadosIdEstados)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Municipio_Estados");
            });

            modelBuilder.Entity<Procedencia>(entity =>
            {
                entity.HasKey(e => new { e.IdProcedencia, e.MunicipioIdMunicipio, e.MunicipioEstadosIdEstados })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0, 0 });

                entity.ToTable("procedencia");

                entity.HasIndex(e => new { e.MunicipioIdMunicipio, e.MunicipioEstadosIdEstados })
                    .HasName("fk_Procedencia_Municipio1_idx");

                entity.Property(e => e.IdProcedencia)
                    .HasColumnName("idProcedencia")
                    .HasColumnType("int(11)")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.MunicipioIdMunicipio)
                    .HasColumnName("Municipio_idMunicipio")
                    .HasColumnType("int(11)");

                entity.Property(e => e.MunicipioEstadosIdEstados)
                    .HasColumnName("Municipio_Estados_idEstados")
                    .HasColumnType("int(11)");

                entity.Property(e => e.AreaEgreso)
                    .HasColumnName("Area_Egreso")
                    .HasColumnType("int(11)");

                entity.Property(e => e.AñoEgreso)
                    .HasColumnName("Año_Egreso")
                    .HasColumnType("year(4)");

                entity.Property(e => e.Bachillerato).HasColumnType("int(11)");

                entity.Property(e => e.Egel)
                    .HasColumnName("EGEL")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Exani)
                    .HasColumnName("EXANI")
                    .HasColumnType("int(11)");

                entity.Property(e => e.PromedioBachillerato).HasColumnName("Promedio_Bachillerato");

                entity.Property(e => e.Toefl)
                    .HasColumnName("TOEFL")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.Municipio)
                    .WithMany(p => p.Procedencia)
                    .HasForeignKey(d => new { d.MunicipioIdMunicipio, d.MunicipioEstadosIdEstados })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Procedencia_Municipio1");
            });

            modelBuilder.Entity<Serviciomedico>(entity =>
            {
                entity.HasKey(e => e.IdServicioMedico)
                    .HasName("PRIMARY");

                entity.ToTable("serviciomedico");

                entity.Property(e => e.IdServicioMedico)
                    .HasColumnName("idServicioMedico")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Afiliacion)
                    .IsRequired()
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.AfiliacionSs)
                    .HasColumnName("Afiliacion_SS")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Institucion)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Tipo)
                    .HasColumnType("int(11)")
                    .HasComment(@"1 IMSS
2 ISSTE
");

                entity.Property(e => e.TipoSangre)
                    .HasColumnName("Tipo_Sangre")
                    .HasColumnType("varchar(3)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
