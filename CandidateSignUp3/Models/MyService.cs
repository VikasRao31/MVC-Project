using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Web.Security;
using System.Web.Mvc;

namespace CandidateSignUp3.Models
{
    public class MyService
    {
        public SqlConnection con;

        public void Connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBConnection"].ToString();
            con = new SqlConnection(constr);
        }

        // ****************   ADD NEW Candidate *************************

        public bool AddCandidate(CandidateSignUp_Model cnd)
        {

            //******************************* Save ImagePath ***************************************
            //Use Namespacecalled: System.IO
            string FileName;
            if (cnd.ImageFile!=null)
            {
             FileName = Path.GetFileNameWithoutExtension(cnd.ImageFile.FileName);

            //To Get File Extension  
            string FileExtension = Path.GetExtension(cnd.ImageFile.FileName);

            //Add Current Date To Attached File Name  
            FileName = DateTime.Now.ToString("yyyyMMdd") + "-" + FileName.Trim() + FileExtension;

            
            string ImagePath = Path.Combine(HttpContext.Current.Server.MapPath("~/UserImages/"), FileName);

            cnd.ImageFile.SaveAs(ImagePath);
            }
            else
            {
                FileName = "vikas.jpg";
            }
           
            //****************************************************************************************

            Connection();
            SqlCommand com = new SqlCommand("sp_InsertDataInto_tblEmployee", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@FirstName", cnd.FirstName);
            com.Parameters.AddWithValue("@MiddleName", cnd.MiddleName);
            com.Parameters.AddWithValue("@LastName", cnd.LastName);
            com.Parameters.AddWithValue("@FatherName", cnd.FatherName);
            com.Parameters.AddWithValue("@Gender", cnd.Gender);
            com.Parameters.AddWithValue("@MartialStatus", cnd.MartialStatus);
            com.Parameters.AddWithValue("@Caste", cnd.Caste);
            com.Parameters.AddWithValue("@Religion", cnd.Religion);
            com.Parameters.AddWithValue("@BloodGroup", cnd.BloodGroup);
            com.Parameters.AddWithValue("@Address", cnd.Address);
            com.Parameters.AddWithValue("@Email", cnd.Email);
            com.Parameters.AddWithValue("@HomeState", cnd.HomeState);
            com.Parameters.AddWithValue("@HomeDistrict", cnd.HomeDistrict);
            com.Parameters.AddWithValue("@PinCode", cnd.PinCode);
            com.Parameters.AddWithValue("@Remarks", cnd.Remarks);
            com.Parameters.AddWithValue("@ImagePath", "/UserImages/" + FileName);
            com.Parameters.AddWithValue("@PhoneNo", cnd.PhoneNo);
            com.Parameters.AddWithValue("@Department", cnd.Department);
            com.Parameters.AddWithValue("@Position", cnd.Position);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }

        public bool SignUpUser(SignUp SU)
        {
            Connection();
            SqlCommand com = new SqlCommand("sp_InsertDataInto_tblUserLogin", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Email", SU.Email);
            com.Parameters.AddWithValue("@Password", SU.Password);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }

        // ***************************** VIEW Candidate DETAILS **********************

        public List<CandidateSignUp_Model> GetCandidate()
        {
            Connection();
            List<CandidateSignUp_Model> CandidateList = new List<CandidateSignUp_Model>();
            SqlCommand cmd = new SqlCommand("sp_GetDataFromtblEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                CandidateList.Add(new CandidateSignUp_Model
                {
                    id = Convert.ToInt32(dr["id"]),
                    FirstName = Convert.ToString(dr["FirstName"]),
                    MiddleName = Convert.ToString(dr["MiddleName"]),
                    LastName = Convert.ToString(dr["LastName"]),
                    FatherName = Convert.ToString(dr["FatherName"]),
                    Caste = Convert.ToString(dr["Caste"]),
                    Religion = Convert.ToString(dr["Religion"]),
                    BloodGroup = Convert.ToString(dr["BloodGroup"]),
                    Remarks = Convert.ToString(dr["Remarks"]),
                    ImagePath = Convert.ToString(dr["ImagePath"])
                });
            }
            return CandidateList;
        }

        // ***************** UPDATE STUDENT DETAILS *********************

        public bool UpdateCandidate(CandidateSignUp_Model cnd)
        {

            if (cnd.ImageFile!=null)
            {
                string FileName = Path.GetFileNameWithoutExtension(cnd.ImageFile.FileName);

                //To Get File Extension  
                string FileExtension = Path.GetExtension(cnd.ImageFile.FileName);

                //Add Current Date To Attached File Name  
                FileName = DateTime.Now.ToString("yyyyMMdd") + "-" + FileName.Trim() + FileExtension;


                string ImagePath = Path.Combine(HttpContext.Current.Server.MapPath("~/UserImages/"), FileName);

                cnd.ImageFile.SaveAs(ImagePath);

                Connection();
                SqlCommand cmd = new SqlCommand("UpdatetblEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id", cnd.id);
                cmd.Parameters.AddWithValue("@FirstName", cnd.FirstName);
                cmd.Parameters.AddWithValue("@MiddleName", cnd.MiddleName);
                cmd.Parameters.AddWithValue("@LastName", cnd.LastName);
                cmd.Parameters.AddWithValue("@FatherName", cnd.FatherName);
                cmd.Parameters.AddWithValue("@Caste", cnd.Caste);
                cmd.Parameters.AddWithValue("@Religion", cnd.Religion);
                cmd.Parameters.AddWithValue("@Bloodgroup", cnd.BloodGroup);
                cmd.Parameters.AddWithValue("@Remarks", cnd.Remarks);
                cmd.Parameters.AddWithValue("@ImagePath", "/UserImages/" + FileName);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i >= 1)
                    return true;
                else
                    return false;
            }
            else
            {
                Connection();
                SqlCommand cmd = new SqlCommand("UpdatetblEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id", cnd.id);
                cmd.Parameters.AddWithValue("@FirstName", cnd.FirstName);
                cmd.Parameters.AddWithValue("@MiddleName", cnd.MiddleName);
                cmd.Parameters.AddWithValue("@LastName", cnd.LastName);
                cmd.Parameters.AddWithValue("@FatherName", cnd.FatherName);
                cmd.Parameters.AddWithValue("@Caste", cnd.Caste);
                cmd.Parameters.AddWithValue("@Religion", cnd.Religion);
                cmd.Parameters.AddWithValue("@Bloodgroup", cnd.BloodGroup);
                cmd.Parameters.AddWithValue("@Remarks", cnd.Remarks);
                //cmd.Parameters.AddWithValue("@ImagePath", cnd.ImagePath);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i >= 1)
                    return true;
                else
                    return false;

            }

        }
        // ********************** DELETE Candidate Record *******************

        public bool DeleteCandidate(int id)
        {
            Connection();
            SqlCommand cmd = new SqlCommand("sp_DeleteEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i >= 1)
                return true;
            else
                return false;
        }
        //******************************************Get Department****************************

        public List<CandidateSignUp_Model> GetDepartment()
        {
            Connection();
            List<CandidateSignUp_Model> DepartmentList = new List<CandidateSignUp_Model>();
            SqlCommand cmd = new SqlCommand("sp_GetDepartmentFromtblEmployee123", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                DepartmentList.Add(new CandidateSignUp_Model
                {
                    id = Convert.ToInt32(dr["id"]),
                    Department = Convert.ToString(dr["Department"]),
                    FirstName = Convert.ToString(dr["FirstName"]),
                    Position = Convert.ToString(dr["Position"]),
                    PhoneNo = Convert.ToString(dr["PhoneNo"]),
                    Email = Convert.ToString(dr["Email"])
                });
            }
            return DepartmentList;
        }
        //******************************************User Login****************************

        public bool CheckUser(string Email, string password)
        {
            Connection();
            bool flag = false;
            SqlCommand cmd = new SqlCommand("Select count(*) from tblUserLogin where EmailAddress='" + Email + "' and Password='" + password + "'", con);
            con.Open();
            flag = Convert.ToBoolean(cmd.ExecuteScalar());
            return flag;

        }

        //****************************** forgot password *****************************

        public bool CheckPassword(string Email)
        {
            Connection();
            bool flag = false;
            SqlCommand cmd = new SqlCommand("Select count(*) from tblUserLogin where EmailAddress='" + Email + "' ", con);
            con.Open();
            flag = Convert.ToBoolean(cmd.ExecuteScalar());
            
            return flag;
        }
    }
}