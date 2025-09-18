using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace class_demo
{
    internal class student_classcs
    {
        int student_id;
        string student_name;
        int student_age;
        string contact_number;
        string student_address;
        string student_email;



         public student_classcs(int id, string name, int age, string contact, string address, string email)
        {
            student_id = id;
            student_name = name;
            student_age = age;
            contact_number = contact;
            student_address = address;
            student_email = email;
            
        }

        public void show_details()
        {
                       Console.WriteLine("Student ID: " + student_id);
            Console.WriteLine("Student Name: " + student_name);
            Console.WriteLine("Student Age: " + student_age);
            Console.WriteLine("Contact Number: " + contact_number);
            Console.WriteLine("Student Address: " + student_address);
            Console.WriteLine("Student Email: " + student_email);
   
        }
        public void update_contact(string new_contact)
        {
            contact_number = new_contact;
        }


    }
}

