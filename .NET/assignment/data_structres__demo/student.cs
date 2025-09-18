using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace data_structres_demo
{

    internal class Student
    {
        public int id, marks;
        public string name;
     
        public Student(int Student_id,string  Student_name ,int Student_marks)
        {
            id = Student_id;
            marks =Student_marks;
            name = Student_name;

        }
    }
}
