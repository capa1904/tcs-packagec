using NUnit.Framework;

namespace PackageC.Test.Unit
{

    [TestFixture]
    public class ProgrammTest
    {
        [Test]
        public void GetName_NameIsNotEmpty()
        {
            var subject = new ClassOfPackageC();
            Assert.IsNotNullOrEmpty(subject.GetName());
        }
    }
}
