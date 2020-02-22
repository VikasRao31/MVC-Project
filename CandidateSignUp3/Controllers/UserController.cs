using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CandidateSignUp3.Models;
using System.Net.Mail;
using System.Net;

namespace CandidateSignUp3.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult LoginUser()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginUser(UserLogin UL)
        {
            if (ModelState.IsValid) // Check the model state for any validation errors
            {
                MyService ObjService = new MyService();
                if (ObjService.CheckUser(UL.Email, UL.Password))
                {
                    return RedirectToAction("Index", "CandidateSignUp");
                }
                else
                {
                    ViewBag.Message = "Invalid Username or Password";
                    return View();
                }
            }
            else
            {
                return View(); // Return the same view with validation errors.
            }
        }
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgotPassword(string EmailID)
        {
            string message = "";
            MyService ObjService = new MyService();
            if (ObjService.CheckPassword(EmailID))
            {

                message = "Reset password link has been sent to your email id.";
                string resetCode = Guid.NewGuid().ToString();
                SendVerificationLinkEmail(EmailID, resetCode, "ResetPassword");
            }
            else
            {
                ViewBag.Message = "Invalid Username or Password";
                return View();
            }
            ViewBag.Message = message;
            return View();
        }
        public void SendVerificationLinkEmail(string emailID, string activationCode, string emailFor = "VerifyAccount")
        {
            var verifyUrl = "/User/" + emailFor + "/" + activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);

            var fromEmail = new MailAddress("Enter Your Email Address", "RestPassword");
            var toEmail = new MailAddress(emailID);
            //var fromEmailPassword = "******"; // Replace with actual password

            string subject = "";
            string body = "";
            if (emailFor == "VerifyAccount")
            {
                subject = "Your account is successfully created!";
                body = "<br/><br/>Please click on the below link to verify your account" +
                    " <br/><br/><a href='" + link + "'>" + link + "</a> ";

            }
            else if (emailFor == "ResetPassword")
            {
                subject = "Reset Password";
                body = "Hi,<br/>br/>We got request for reset your account password. Please click on the below link to reset your password" +
                    "<br/><br/><a href=" + link + ">Reset Password link</a>";
            }


            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("Enter Your Email Address like vikas.rao@dziscorp.com", "your email password")
            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
                smtp.Send(message);
        }

        [HttpGet]
        public ActionResult Registration()
        {
            return View();
        }
        //Registration POST action 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registration(SignUp SU)
        {
            if (ModelState.IsValid)
            {
                MyService ObjMyService = new MyService();
                if (ObjMyService.SignUpUser(SU))
                {
                    ViewBag.Message = "Record Save";
                    ModelState.Clear();
                }
               
            }
            return RedirectToAction("LoginUser");
        }
        //public ActionResult ResetPassword(string id)
        //{
        //    //Verify the reset password link
        //    //Find account associated with this link
        //    //redirect to reset password page
        //    if (string.IsNullOrWhiteSpace(id))
        //    {
        //        return HttpNotFound();
        //    }

        //    using (vikasEntities1 dc = new vikasEntities1())
        //    {
        //        var user = dc.Users.Where(a => a.ResetPasswordCode == id).FirstOrDefault();
        //        if (user != null)
        //        {
        //            ResetPasswordModel model = new ResetPasswordModel();
        //            model.ResetCode = id;
        //            return View(model);
        //        }
        //        else
        //        {
        //            return HttpNotFound();
        //        }
        //    }
        //}

    }
}