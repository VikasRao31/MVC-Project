using CandidateSignUp3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CandidateSignUp3.Controllers
{
    public class CandidateSignupController : Controller
    {
        public ActionResult Index()
        {
            MyService ObjMyService = new MyService();
            var test = ObjMyService.GetCandidate();
            return View(test);
        }
        //GET: CandidateSignup
         [HttpPost]   
        public ActionResult Index([DataSourceRequest]DataSourceRequest request)
        {

            MyService ObjMyService = new MyService();
            var test = ObjMyService.GetCandidate();
            var result = new DataSourceResult()
            {
                Data = test,
                Total = test.Count(),//.RecordCount,
            };

            return Json(result,JsonRequestBehavior.AllowGet);
        }
        
        //***************************  Add New Candidate  ****************************

        public ActionResult AddCandidate()
        {
            return View();
        }


        [HttpPost]
        public ActionResult AddCandidate(CandidateSignUp_Model cnd)
        {
            if (ModelState.IsValid)
            {
                MyService ObjMyService = new MyService();
                if (ObjMyService.AddCandidate(cnd))
                {
                    ViewBag.Message = "Record Save";
                    ModelState.Clear();
                  
                }
            }
            return RedirectToAction("Index");
        }
        // ************************** UPDATE Candidate DETAILS ****************************

        public ActionResult Edit(int id)
        {
            MyService ObjMyService = new MyService();
            return View(ObjMyService.GetCandidate().Find(cnd => cnd.id == id));
        }
        [HttpPost]
        public ActionResult Edit(int id,CandidateSignUp_Model cnd)
        {
            try
            {
                MyService ObjMyService = new MyService();
                ObjMyService.UpdateCandidate(cnd);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        // 4. ********************* DELETE Candidate DETAILS ******************

        public ActionResult Delete(int id)
        {
            try
            {
                MyService ObjMyService = new MyService();
                if (ObjMyService.DeleteCandidate(id))
                {
                    ViewBag.Message = "Record Delete";
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return View();
            }
        }
        //***********************************Get Department Details****************************

        public ActionResult GetDepartment()
        {
            MyService ObjService = new MyService();
            var test = ObjService.GetDepartment();
            return View(test);
        }
        [HttpPost]
        public ActionResult GetDepartment([DataSourceRequest]DataSourceRequest request)
        {
            MyService ObjService = new MyService();
            var test = ObjService.GetDepartment();
            var result = new KendoDataSourceResult(new DataSourceResult())
            {
                Data = test,
                Total = test.Count(),
            };
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}