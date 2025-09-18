namespace class_demo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            student_classcs student1 = new student_classcs(1, "surendra", 22, "7386152390", "guntur", "msurendra.nitw@gmail.com");

            //(1, "surendra", 22, "7386152390", "guntur", "msurendra.nitw@gmail.com");
            student1.show_details();
        }
    }



}
