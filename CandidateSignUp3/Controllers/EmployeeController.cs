using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CandidateSignUp3.Models;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;


namespace CandidateSignUp3.Controllers
{
    public class EmployeeController : Controller
    {
        private vikasEntities1 db = new vikasEntities1();

        public ActionResult GetAllEmployee()
        {
            List<LoginPage_tblEmployee> tbl = new List<LoginPage_tblEmployee>();// new LoginPage_tblEmployee();
            var employee = db.LoginPage_tblEmployee.ToList();
            return View(tbl);
        }
       // [HttpPost]
        // GET: Employee
        public ActionResult GetAllEmployees([DataSourceRequest]DataSourceRequest request,string id)
        {
            var test= db.LoginPage_tblEmployee.ToList();
            var result = new DataSourceResult()
            {
                Data = test,
                Total = test.Count(),
            };
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        // ADD: Employee

        public ActionResult AddEmployee([DataSourceRequest]DataSourceRequest request, LoginPage_tblEmployee emp)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.LoginPage_tblEmployee.Add(emp);
                    db.SaveChanges();
                    var _emplist = db.LoginPage_tblEmployee.ToList();
                    return Json(new[] { emp }.ToDataSourceResult(request, ModelState));
                }
                else
                {
                    return Json(db.LoginPage_tblEmployee.ToList());
                }
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }
        // UPDATE: Employee  
        public ActionResult UpdateEmployee([DataSourceRequest]DataSourceRequest request, LoginPage_tblEmployee emp)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(emp).State = System.Data.EntityState.Modified;
                    db.SaveChanges();
                    return Json(new[] { emp }.ToDataSourceResult(request, ModelState));

                }
                else
                {
                    return Json(db.LoginPage_tblEmployee.ToList());
                }
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }
        // DELETE: Employee  
        public ActionResult DeleteEmployee([DataSourceRequest]DataSourceRequest request, LoginPage_tblEmployee emp)
        {
            try
            {
                LoginPage_tblEmployee employee = db.LoginPage_tblEmployee.Find(emp.EmployeeID);
                if (employee == null)
                {
                    return Json("Employee Not Found");
                }
                db.LoginPage_tblEmployee.Remove(employee);
                db.SaveChanges();
                return Json(db.LoginPage_tblEmployee.ToList());
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

    }
}