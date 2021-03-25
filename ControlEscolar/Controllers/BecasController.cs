using ControlEscolar.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ControlEscolar.Controllers
{
    public class BecasController : Controller
    {

        sieContext Context;
        public BecasController(sieContext context)
        {
            Context = context;
        }

        public IActionResult Index()
        {
   
            return View();
        }

        [HttpGet]
        public IActionResult Agregar()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Agregar(Becas beca)
        {
            return View();
        }
       
    }
}
