import Foundation

class BankAccount {
    let accountNumber: String
    let accountOwner: String
    private var balance: Double
    
    init(accountNumber: String, accountOwner: String, startingBalance: Double) {
        self.accountNumber = accountNumber
        self.accountOwner = accountOwner
        self.balance = startingBalance
    }
    
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("Incorrect deposit amount.")
            return
        }
        balance += amount
        print("\(amount) was successfully deposited.")
    }
    
    func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Incorrect withdrawal amount.")
            return
        }
        if balance >= amount {
            balance -= amount
            print("Withdrawal of \(amount) was successful.")
        } else {
            print(" ")
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func displayAccountInfo() {
        print("Account Number: \(accountNumber)")
        print("Account Owner: \(accountOwner)")
        print("Balance: \(balance)")
    }
}

print("Enter your account number:", terminator: " ")
let accountNumber = readLine() ?? ""
print("Enter your name:", terminator: " ")
let accountOwner = readLine() ?? ""
print("Starting balance:", terminator: " ")
if let startingBalance = Double(readLine() ?? "") {
    let myAccount = BankAccount(accountNumber: accountNumber, accountOwner: accountOwner, startingBalance: startingBalance)
    myAccount.displayAccountInfo()

    print("Enter deposit amount:", terminator: " ")
    if let depositAmount = Double(readLine() ?? "") {
        myAccount.deposit(amount: depositAmount)
    } else {
        print("Incorrect deposit amount.")
    }

    print("Enter withdrawal amount:", terminator: " ")
    if let withdrawalAmount = Double(readLine() ?? "") {
        myAccount.withdraw(amount: withdrawalAmount)
    } else {
        print("Incorrect withdrawal amount.")
    }

    myAccount.displayAccountInfo()
} else {
    print("Incorrect starting balance.")
}
