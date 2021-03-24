using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ControlEscolar.Models;
using ControlEscolar.Repositories;

namespace ControlEscolar.Controllers
{
    public class LenguaIndigenaController : Controller
    {
        sieContext Context;
        public LenguaIndigenaController(sieContext context)
        {
            Context = context;
        }
        public IActionResult Index()
        {
            LenguaIndigenaRepository LIRepo = new LenguaIndigenaRepository(Context);
            return View(LIRepo.GetAll());
        }
        [HttpGet]
        public IActionResult Agregar()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Agregar( Lenguaindigena lengua)
        {
            return View();
        }
    }    
}
