enum Skill { FLUTTER, DART, OTHER }

const FLUTTER = 5000;
const DART = 3000;
const OTHER = 1000;

class Address {
  String street;
  String city;
  String zipcode;

  Address(this.street, this.city, this.zipcode) {}

  Address.defaultAddress()
    : this.street = "N/A",
      this.city = "N/A",
      this.zipcode = "N/A";
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final int _yearOfExperince;
  final Address _address;

  Employee(
    this._name,
    this._baseSalary, [
    List<Skill>? skills,
    int? yearOfExperince,
    Address? address,
  ]) : _skill = skills ?? [],
       _yearOfExperince = yearOfExperince ?? 0,
       _address = address ?? Address.defaultAddress();

  Employee.mobileDeveloper(
    this._name,
    this._baseSalary, [
    int? yearOfExperince,
    Address? address,
  ]) : _skill = [Skill.DART, Skill.FLUTTER],
       _yearOfExperince = yearOfExperince ?? 0,
       _address = address ?? Address.defaultAddress();

  void printDetails() {
    String formatSkill = _skill.map((s) => s.name).join(",");
    print('''
    _name : $_name  \t 
    Base salary : $_baseSalary \t 
    Year of experience : $_yearOfExperince \t 
    Skills : $formatSkill
    Total Salary : \$${calculateSalary()}
    ''');
  }

  String get getName {
    return _name;
  }

  double get getBaseSalary {
    return _baseSalary;
  }

  List<Skill> get getSkill {
    return _skill;
  }

  int get getYearOfExperience {
    return _yearOfExperince;
  }

  double calculateSalary() {
    double totalSalary = _baseSalary;
    for (var s in _skill) {
      if (s == Skill.FLUTTER) {
        totalSalary += FLUTTER;
      } else if (s == Skill.DART) {
        totalSalary += DART;
      } else {
        totalSalary += OTHER;
      }
    }

    return (totalSalary + (2000.0 * _yearOfExperince));
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
  var emp3 = Employee.mobileDeveloper(
    "Reeds",
    5000.067,
    4,
    Address('St. 138', 'Phnom Penh', '67000'),
  );
  emp3.printDetails();
}
