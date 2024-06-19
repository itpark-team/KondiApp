using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfAppKondi.Model;

namespace WpfAppKondi.PagesControllers
{
    public class AddNewRequestPageController
    {
        public List<ClimateTechType> GetAllClimateTechTypes()
        {
            return DbConnector.KondiEntities.ClimateTechTypes.ToList();
        }

        public void AddNewRequest(long climateTechTypeId, string climateTechModel, string problemDescryption)
        {
            if (climateTechModel == "")
            {
                throw new Exception("Ошибка. Модель не заполнена.");
            }

            if (problemDescryption == "")
            {
                throw new Exception("Ошибка. Описание проблемы не заполнено.");
            }

            try
            {
                Request request = new Request()
                {
                    StartDate = DateTime.Now,
                    ClimateTechTypeId = climateTechTypeId,
                    ClimateTechModel = climateTechModel,
                    ProblemDescryption = problemDescryption,
                    RequestStatusId = 3,
                    CompletionDate = null,
                    RepairParts = null,
                    MasterId = null,
                    ClientId = GlobalVariables.User.Id,
                };

                DbConnector.KondiEntities.Requests.Add(request);
                DbConnector.KondiEntities.SaveChanges();

            }
            catch (Exception e)
            {
                throw new Exception("Ошибка соединения с БД");
            }

        }
    }
}
