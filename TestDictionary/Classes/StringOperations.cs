using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace TestDictionary.Classes
{
    public static class StringOperations
    {
        public static bool IsEmail(this string s)
        {
            return Regex.IsMatch(s.Trim(), @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }

        public static string ReplaceSymbols(this string str, string symbols, string replace = null)
        {
            if (replace == null) replace = string.Empty;
            return Regex.Replace(str, $"[{symbols}]+", replace);
        }

        public static string NormalizePhone(this string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return str;
            var tmpStr = str.ReplaceSymbols(@"\s\+\(\)\-\–\;\n\r\t""\=\?)\.");
            if (string.IsNullOrWhiteSpace(tmpStr)) return str;
            if (tmpStr.Length == 10)
            {
                tmpStr = "7" + tmpStr;
            }
            if (tmpStr[0] == '8')
            {
                tmpStr = "7" + tmpStr.Substring(1);
            }

            return tmpStr;
        }

        public static bool IsPhone(this string str, bool removeSymbs = false)
        {
            if (string.IsNullOrWhiteSpace(str)) return false;
            return Regex.IsMatch(removeSymbs ? str.NormalizePhone() : str, @"^\d{11}$");
        }
    }
}