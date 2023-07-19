
class Person {
  String name;

  Person(this.name);
  
  void printInfo(){
   
  }
}

class Wrestler extends Person{
  double weight;
  Wrestler(String name, this.weight) : super(name);
}

class Coach extends Person{
  int seniority;
  Coach(String name, this.seniority) : super(name);

}

class Judoka extends Wrestler{
  Judoka(String name, double weight) : super(name, weight);
  
   @override
  void printInfo(){
    print("Имя борца:$name, вес:$weight, борьба: дзюдо");
  }
}
  
class Sambo extends Wrestler{
  Sambo(String name, double weight) : super(name, weight);
  
   @override
  void printInfo(){
    print("Имя борца:$name, вес:$weight, борьба: самбо");
  }
}
void main(){
  var judoWrestler = Judoka("Джордж Керр", 72.4);
  judoWrestler.printInfo();
  
  var samboWrestler = Sambo("Сурен Балачинский", 92.1);
  samboWrestler.printInfo();
}