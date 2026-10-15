class BankAccount {
  // TODO
  final int _accountId;
  final String accountOwner;
  double _balance;
  BankAccount._({
    required int givenId,
    required this.accountOwner,
    required double Amount,
  }) : _balance = Amount,
       _accountId = givenId;

  double get balance =>  _balance;


  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception("Insufficient balance for withdrawal!");
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }

  String get accountTag => accountOwner;
}

class Bank {
  // TODO
  final String name;
  final List<BankAccount> _accountList;

  Bank({required this.name}) : _accountList = [];

  BankAccount createAccount(
    int InputId ,
    String InputName,
    [double? InputBalance]
  ) {
    BankAccount newAccount = BankAccount._(
      givenId: InputId,
      accountOwner: InputName,
      Amount: InputBalance ?? 0.0 ,
    );
    for (var acc in _accountList) {
      if (InputId == acc._accountId)
        throw Exception("Account with ID $InputId already exists");
    }
    _accountList.add(newAccount);

    return newAccount;
  }

  void accountInList() {
    _accountList.forEach(
      (acc) => print('''
_________________________________________________________________
    AccountId: ${acc._accountId} 
    Owner: ${acc.accountOwner}
    Balance: ${acc.balance}
_________________________________________________________________
'''),
    );
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(175); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
  
}
