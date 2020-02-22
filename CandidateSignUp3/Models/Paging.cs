using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CandidateSignUp3.Models
{
    public class Paging
    {
        public const int DefaultPageSize = 20;
        public const int CurrentPage = 1;
        public const bool ShowColumnMenu = false;
        public static int[] PageSizeValues = new int[] { 20, 50, 100, };
    }
}