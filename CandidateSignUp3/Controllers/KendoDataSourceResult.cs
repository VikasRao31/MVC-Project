using Kendo.Mvc.UI;

namespace CandidateSignUp3.Controllers
{
    internal class KendoDataSourceResult
    {
        private DataSourceResult dataSourceResult;

        public KendoDataSourceResult(DataSourceResult dataSourceResult)
        {
            this.dataSourceResult = dataSourceResult;
        }

        public object Data { get; set; }
        public object Total { get; set; }
    }
}