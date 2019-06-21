using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Controllers
{
    [DebuggerDisplay("{StringThing}")]
    public class AwesomeSuperValue
    {
        public int FirstInt { get; set; }
        public int SecondInt { get; set; }
        public string StringThing { get; set; }
    }
}
