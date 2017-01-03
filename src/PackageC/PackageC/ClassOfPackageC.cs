using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using PackageB;

namespace PackageC
{
    public class ClassOfPackageC
    {
        public string GetName()
        {
            return "PackageC";
        }

        public string GetVersion()
        {
            var assembly = Assembly.GetExecutingAssembly();
            var fileVersionInfo = FileVersionInfo.GetVersionInfo(assembly.Location);
            string productVersion = fileVersionInfo.ProductVersion;
            return productVersion;
        }

        public string GetSummary()
        {            
            return $"{GetName()} v. {GetVersion()} {Environment.NewLine}{GetInformationAboutUsedPackages()}";
        }

        private static string GetInformationAboutUsedPackages()
        {
            var classOfPackageB = new ClassOfPackageB();
            var packageInfo = classOfPackageB.GetSummary();
            return $"Used package: {packageInfo}";
        }
    }
}
