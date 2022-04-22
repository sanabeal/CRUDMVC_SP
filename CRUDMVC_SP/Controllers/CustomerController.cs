using CRUDMVC_SP.DAL;
using CRUDMVC_SP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUDMVC_SP.Controllers
{
    public class CustomerController : Controller
    {
        // GET: /Customer/
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Customer objCustomer)
        {
            objCustomer.Birthdate = Convert.ToDateTime(objCustomer.Birthdate);
            if (ModelState.IsValid) //checking model is valid or not
            {
                DataAccessLayer objDB = new DataAccessLayer();
                string result = objDB.InsertData(objCustomer);
                ViewData["result"] = result;
                ModelState.Clear(); //clearing model
                return View();
            }
            else
            {
                ModelState.AddModelError("", "Error in saving data");
                return View();
            }
        }

        [HttpGet]
        public ActionResult Index()
        {
            List<Customer> objCustomer = new List<Customer>();
            DataAccessLayer objDB = new DataAccessLayer(); //calling class DBdata
            objCustomer = objDB.Selectalldata();
            return View(objCustomer.AsEnumerable());

        }

        [HttpGet]
        public ActionResult Edit(string ID)
        {
            Customer objCustomer = new Customer();
            DataAccessLayer objDB = new DataAccessLayer(); //calling class DBdata
            return View(objDB.SelectDatabyID(ID));
        }

        [HttpPost]
        public ActionResult Edit(Customer objCustomer)
        {
            objCustomer.Birthdate = Convert.ToDateTime(objCustomer.Birthdate);
            if (ModelState.IsValid) //checking model is valid or not
            {
                DataAccessLayer objDB = new DataAccessLayer(); //calling class DBdata
                string result = objDB.UpdateData(objCustomer);
                ViewData["result"] = result;
                ModelState.Clear(); //clearing model
                return View();
            }
            else
            {
                ModelState.AddModelError("", "Error in saving data");
                return View();
            }
        }

        [HttpPost]
        public ActionResult Delete(Customer objCustomer)
        {
            DataAccessLayer objDB = new DataAccessLayer();
            string result = objDB.DeleteData(objCustomer);
            ViewData["result"] = result;
            ModelState.Clear(); //clearing model
            return View();
        }
    }
}