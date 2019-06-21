using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace WebApplication.Controllers
{
    [Route("api/values")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            var list = new List<AwesomeSuperValue>()
            {
                new AwesomeSuperValue
                {
                    FirstInt = 1,
                    SecondInt = 2,
                    StringThing = "Cool"
                },
                new AwesomeSuperValue
                {
                    FirstInt = 4,
                    SecondInt = 2,
                    StringThing = "Awesome"
                },
                new AwesomeSuperValue
                {
                    FirstInt = 1,
                    SecondInt = 5,
                    StringThing = "Hip"
                },
                new AwesomeSuperValue
                {
                    FirstInt = 1,
                    SecondInt = 3,
                    StringThing = "Tubular"
                },
            };
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
