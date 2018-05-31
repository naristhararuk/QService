using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace QService.Class
{
    public class Helper
    {
        public static class Utility
        {
            public static string Encrypt(string toEncrypt, bool useHashing)
            {
                byte[] keyArray;
                byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                // Get the key from config file

                string key = "xxx";

                //System.Windows.Forms.MessageBox.Show(key);
                //If hashing use get hashcode regards to your key
                if (useHashing)
                {
                    MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    //Always release the resources and flush data of the Cryptographic service provide. Best Practice

                    hashmd5.Clear();
                }
                else
                    keyArray = UTF8Encoding.UTF8.GetBytes(key);

                TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
                //set the secret key for the tripleDES algorithm
                tdes.Key = keyArray;
                //mode of operation. there are other 4 modes. We choose ECB(Electronic code Book)
                tdes.Mode = CipherMode.ECB;
                //padding mode(if any extra byte added)

                tdes.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = tdes.CreateEncryptor();
                //transform the specified region of bytes array to resultArray
                byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
                //Release resources held by TripleDes Encryptor
                tdes.Clear();
                //Return the encrypted data into unreadable string format
                return Convert.ToBase64String(resultArray, 0, resultArray.Length);
            }
            public static string HNFormat(string rawHN)
            {
                string pattern = @"^([0-9]{1,6})/?([0-9]{2})$";
                Regex regex = new Regex(pattern);
                string hn = "";
                if (regex.IsMatch(rawHN))
                {
                    hn = rawHN.Replace("/", "");
                    hn = hn.Substring(hn.Length - 2, 2) + hn.Substring(0, hn.Length - 2).PadLeft(6, '0');
                }
                return hn;
            }
            public static string HNDisplay(string hn)
            {
                if (hn != null)
                {
                    if (hn.Length > 2)
                        return hn.Substring(2, hn.Length - 2).TrimStart('0') + "/" + hn.Substring(0, 2);
                    else
                        return hn;
                }
                else
                {
                    return string.Empty;
                }
            }
        }
    }
}
