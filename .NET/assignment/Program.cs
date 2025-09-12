using System.Xml.Linq;

namespace bank_account
{
    internal class Program
    {

        //public static void generateaccount(int accno, string balance)
        //{
            
        //    Console.WriteLine("enter your account number");
        //    string inputString = Console.ReadLine();
        //    accno = Convert.ToInt32(inputString);
        //    //Console.WriteLine($"You entered: {accno}");
        //    Console.WriteLine("enter your name");
        //    //Console.WriteLine($"You entered name and account number : {name} + {accno}");
        //    Console.WriteLine("your acoount is created");

        //}


        static void Main(string[] args)
        {
            int balance = 0;
            int accno;
            string name;
            int option;


            do
            {

                Console.WriteLine("1. Create a new bank account\r\n2. Deposit money\r\n3. Withdraw money\r\n4. Display account details\r\n5. Exit");
                string inputStringOption = Console.ReadLine();

                Console.WriteLine("choose one of the option");


                Console.Write("Enter an option: ");

                inputStringOption = Console.ReadLine();
                option = Convert.ToInt32(inputStringOption);
                Console.WriteLine($"You entered: {option}");


                switch (option)
                {
                    case 1:

                        Console.WriteLine("enter your account number");
                        string inputString = Console.ReadLine();
                        accno = Convert.ToInt32(inputString);
                        Console.WriteLine("enter your name");
                        name = Console.ReadLine();
                        Console.WriteLine("your acoount is created");
                        break;
                    case 2:

                        int deposit;
                        Console.Write("Enter the money you want to deposit ");
                        string inputStringdep = Console.ReadLine();
                        deposit = Convert.ToInt32(inputStringdep);
                        if (deposit <= 0) { Console.WriteLine("negative and zero money not accepted"); }
                        balance += deposit;
                        Console.WriteLine($"your bank balance is : {balance}");

                        break;
                    case 3:
                        int wd;
                        Console.Write("Enter the money you want to withdraw ");
                        string inputStringwd = Console.ReadLine();
                        wd = Convert.ToInt32(inputStringwd);
                        if (wd > balance) { Console.WriteLine("insuffcient balance"); }
                        balance -= wd;
                        Console.WriteLine("your bank balance is : { balance}");

                        break;
                    case 4:
                        Console.WriteLine("your account number {accno} and your name {name}");

                        break;
                    default:
                        Console.WriteLine("enter any option from 1 t o 5");
                        break;

                }
            }

            while (option != 5);   
         
        }
    }
}
/*Develop a console-based banking application that allows a user to interact with a
virtual bank account using a menu-driven interface. The user can create an account by
providing an account number and holder name, and then perform basic banking
operations such as depositing money, withdrawing money, and viewing account
details. The program ensures that only valid operations are allowed-for example,
withdrawals cannot exceed the available balance, and negative amounts are not
accepted.

1. Create a new bank account
2. Deposit money
3. Withdraw money
4. Display account details
5. Exit*/


