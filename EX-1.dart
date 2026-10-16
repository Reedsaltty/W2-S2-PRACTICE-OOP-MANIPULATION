enum Skill {
  FLUTTER(bonus: 200),
  DART(bonus: 3999),
  JAVA(bonus: 10),
  OTHER(bonus: 7000);

  final int bonus;

  const new({required this.bonus});
}

const FLUTTER = 5000;
const DART = 3000;
const OTHER = 1000;

class Address {
  String street;
  String city;
  String zipcode;

  Address(this.street, this.city, this.zipcode) {}

  Address.defaultAddress() : street = "N/A", city = "N/A", zipcode = "N/A";

  @override
  String toString() {
    // TODO: implement toString
    return "Street: $street, City: $city, Zipcode: $zipcode";
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final int _yearOfExperince;
  final Address _address;

  Employee(
    this._name,
    this._baseSalary, {
    List<Skill>? skills ,
    int? yearOfExperince,
    Address? address,
  }) : _skill = skills ?? [],
       _yearOfExperince = yearOfExperince ?? 0,
       _address = address ?? Address.defaultAddress();

  Employee.mobileDeveloper(
    this._name,
    this._baseSalary, {
    int? yearOfExperince,
    Address? address,
  }) : _skill = [Skill.DART, Skill.FLUTTER],
       _yearOfExperince = 0,
       _address = address ?? Address.defaultAddress();

  void printDetails() {
    String formatSkill = _skill.map((s) => s.name).join(",");
    print('''
    name: $_name   
    Base salary: $_baseSalary  
    Year of experience: $_yearOfExperince  
    Skills: $formatSkill
    Total Salary: \$${calculateSalary()}
    Address: $_address
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

  Address get getAddress {
    return _address;
  }

  double calculateSalary() {
    double totalSalary = _baseSalary;
    for (var s in _skill) {
      switch (s) {
        case Skill.FLUTTER:
          totalSalary += Skill.FLUTTER.bonus;
          // TODO: Handle this case.
          throw UnimplementedError();
        case Skill.DART:
          totalSalary += Skill.FLUTTER.bonus;
          // TODO: Handle this case.
          throw UnimplementedError();
        case Skill.OTHER:
          totalSalary += Skill.OTHER.bonus;
          // TODO: Handle this case.
          throw UnimplementedError();
        case Skill.JAVA:
          totalSalary += Skill.JAVA.bonus;
          // TODO: Handle this case.
          throw UnimplementedError();
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
    "Ricks",
    5000.067,
    yearOfExperince: 4,
    address: Address('St. 138', 'Phnom Penh', '67000'),
  );
  emp3.printDetails();

  var emp4 = Employee(
    "Aston",
    2000,
    skills: [Skill.FLUTTER, Skill.OTHER],
    yearOfExperince: 10,
  );
  emp4.printDetails();
}
