using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using WpfAppKondi.Model;
using WpfAppKondi.PagesControllers;

namespace WpfAppKondiUnitTestProject
{
    [TestClass]
    public class AuthorizePageControllerUnitTest
    {
        [TestMethod]
        [ExpectedException(typeof(Exception))]
        public void FindUserByLoginAndPassword_EmptyLogin_ThrowException()
        {
            AuthorizePageController authorizePageController = new AuthorizePageController();


            authorizePageController.FindUserByLoginAndPassword("", "pass");
        }


        [TestMethod]
        public void FindUserByLoginAndPassword_EmptyPassword_ThrowExceptionWithErrorPhrase()
        {
            AuthorizePageController authorizePageController = new AuthorizePageController();

            string expected = "Ошибка. Пароль не заполнен.";
            string actual = "";
            try
            {
                authorizePageController.FindUserByLoginAndPassword("login", "");
            }
            catch (Exception ex)
            {
                actual = ex.Message;
            }

            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        [ExpectedException(typeof(Exception))]
        public void FindUserByLoginAndPassword_UserNotFound_ThrowException()
        {
            AuthorizePageController authorizePageController = new AuthorizePageController();
            authorizePageController.FindUserByLoginAndPassword("1", "1");
        }

        [TestMethod]
        public void FindUserByLoginAndPassword_FoundUserByLoginAndPassword_ReturnUser()
        {
            AuthorizePageController authorizePageController = new AuthorizePageController();
           
            User user = authorizePageController.FindUserByLoginAndPassword("login6", "pass6");

            Assert.IsNotNull(user);
        }
    }
}
