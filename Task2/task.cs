using System;

class Animal{
    public void Eat() { Console.WriteLine("Animal eats"); }            
    public virtual void Sound() { Console.WriteLine("Animal sound"); } 
    public virtual void Move() { Console.WriteLine("Animal moves"); }
}

class Dog : Animal{
    public new void Eat() { Console.WriteLine("Dog eats"); }           
    public override void Sound() { Console.WriteLine("Woof"); }        
    public new void Move() { Console.WriteLine("Dog runs"); }          
}

