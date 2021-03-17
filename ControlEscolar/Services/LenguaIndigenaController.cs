using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ControlEscolar.Repositories;
using ControlEscolar.Models;
namespace ControlEscolar.Services
{
    [Route("api/[controller]")]
    [ApiController]
    public class LenguaIndigenaController : ControllerBase
    {
        sieContext Context;
        public LenguaIndigenaController(sieContext context)
        {
            Context = context;
        }
        public IEnumerable<Lenguaindigena> GetLenguasIndigenas()
        {

            LenguaIndigenaRepository LIRepo = new LenguaIndigenaRepository(Context);
            return LIRepo.GetAll();
        }
        [HttpPost]
        public ActionResult Post([FromBody] Lenguaindigena lengua)
        {
            try
            {
                LenguaIndigenaRepository LIRepo = new LenguaIndigenaRepository(Context);
                lengua = LIRepo.InsertLenguaIndigena(lengua);
                return Ok(lengua);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message) ;
            }
        }
        [HttpDelete]
        public void Delete(int id)
        {
            LenguaIndigenaRepository LIRepo = new LenguaIndigenaRepository(Context);
            LIRepo.DeleteLenguaById(id);
        }
    }
}
