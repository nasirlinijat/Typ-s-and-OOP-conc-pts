# Task 2 – Static vs Dynamic Method Binding in C#

## Introduction

This program shows how C# decides which method to call when a child class has a method with the same name as its parent class.

- **Static binding** – the method is chosen by the **type of the variable**, when the program is compiled. This happens with normal methods and with methods hidden using `new`.
- **Dynamic binding** – the method is chosen by the **type of the real object**, while the program is running. This happens with `virtual` methods that are changed using `override`.

There are two classes, `Animal` and `Dog`. The same `Dog` object is called through an `Animal` variable and through a `Dog` variable, and the output shows which method runs.

## How to run

There is no need to install the .NET platform – you can use an online compiler like [www.onlinegdb.com](https://www.onlinegdb.com):

1. Open the site and choose **C#** from the language list (top right).
2. Copy the code from `task.cs` and paste it into the editor.
3. Click **Run**.

If you have the .NET SDK (version 10 or newer) installed, you can also open a terminal in the `Task2` folder and run:

```bash
dotnet run task.cs
```

Output:

```
Animal eats
Woof
Animal moves
Dog eats
Dog runs
```

## How the file was written (step by step)

### Step 1 – Animal and Dog classes (commit `add Animal and Dog classes`)

First I wrote the parent class `Animal` with three methods:

```c#
class Animal{
    public void Eat() { Console.WriteLine("Animal eats"); }
    public virtual void Sound() { Console.WriteLine("Animal sound"); }
    public virtual void Move() { Console.WriteLine("Animal moves"); }
}
```

- `Eat` is a normal method.
- `Sound` and `Move` are `virtual`, so a child class is allowed to override them.

Then I wrote the child class `Dog`, which inherits from `Animal` and has its own version of each method:

```c#
class Dog : Animal{
    public new void Eat() { Console.WriteLine("Dog eats"); }
    public override void Sound() { Console.WriteLine("Woof"); }
    public new void Move() { Console.WriteLine("Dog runs"); }
}
```

- `Eat` uses `new` – it **hides** the parent's method.
- `Sound` uses `override` – it **replaces** the parent's virtual method.
- `Move` uses `new` – it **hides** the parent's method, even though the parent's method is `virtual`.

### Step 2 – Main function (commit `add main function for initializing two dog objects and call functions`)

Last I added `Main`, which creates two `Dog` objects and calls their methods:

```c#
class Program {
    static void Main(){
        Animal a = new Dog();
        a.Eat();
        a.Sound();
        a.Move();

        Dog d = new Dog();
        d.Eat();
        d.Move();
    }
}
```

- `a` is a `Dog` object stored in an `Animal` variable.
- `d` is a `Dog` object stored in a `Dog` variable.

## Explaining the results

| Call | Output | Why |
|---|---|---|
| `a.Eat()` | Animal eats | `Eat` is not virtual, so C# uses the variable type (`Animal`). **Static binding.** |
| `a.Sound()` | Woof | `Sound` is virtual and `Dog` overrides it, so C# uses the real object type (`Dog`). **Dynamic binding.** |
| `a.Move()` | Animal moves | `Move` is virtual, but `Dog` used `new` instead of `override`. `Dog.Move` is a different method that only a `Dog` variable can see, so `Animal.Move` runs. |
| `d.Eat()` | Dog eats | The variable type is `Dog`, so `Dog.Eat` is used. |
| `d.Move()` | Dog runs | The variable type is `Dog`, so `Dog.Move` is used. |

So:

- With **`override`**, the object decides. A `Dog` always says "Woof", no matter what type of variable it is stored in.
- With **`new`** (or no `virtual` at all), the variable decides. The same `Dog` object prints "Animal eats" through an `Animal` variable and "Dog eats" through a `Dog` variable.
