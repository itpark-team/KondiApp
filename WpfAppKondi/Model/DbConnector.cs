using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfAppKondi.Model
{
    internal class DbConnector
    {
        public static kondiEntities KondiEntities { get; } = new kondiEntities();
    }
}
