using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class Class1
    {
        public static bool Check_Mail(string Mail)//почта
        {
            bool IsTrue = false;
            string pattern = @"(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)";
            if (Regex.IsMatch(Mail, pattern, RegexOptions.IgnoreCase))
                IsTrue = true;
            return IsTrue;
        }

        public static bool Check_Password(string Password)//пароль
        {
            bool IsTrue = false;
            string Pattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{1,16}$";

            if (Regex.IsMatch(Password, Pattern, RegexOptions.IgnoreCase))
                IsTrue = true;
            return IsTrue;
        }

        public static bool Check_Login(string Login)//логин
        {
            bool IsTrue = false;
            string Pattern = @"^[a-zA-Z0-9]{6,}$";

            if (Regex.IsMatch(Login, Pattern, RegexOptions.IgnoreCase))
                IsTrue = true;
            return IsTrue;
        }
    }
}
