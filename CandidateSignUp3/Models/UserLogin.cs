using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CandidateSignUp3.Models
{
    public class UserLogin
    {
        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        [Required(ErrorMessage = "* Required")]
        // [RegularExpression(@"(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[^a-zA-Z]).{6,}",
        //ErrorMessage = "Password is not in a valid format")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}