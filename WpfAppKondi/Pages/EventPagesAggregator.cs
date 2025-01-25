using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfAppKondi.Pages
{
    internal static class EventPagesAggregator
    {
        public static event Action GridCustomerDataUpdated;

        public static void NotifyGridCustomerDataUpdated()
        {
            GridCustomerDataUpdated.Invoke();
        }
    }
}
