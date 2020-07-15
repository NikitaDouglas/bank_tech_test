# Bank Tech Test

## How to use the Bank?

### Use the Script

Please run the following commands in your terminal to download and install the script:

```
git clone <git@github.com:NikitaDouglas/bank_tech_test.git>
bundle install
```

To play around with the script, run the following commands:

```
# To open the script in a REPL:
irb -r ./lib/account.rb

# To create a new account:
account = Account.new

# To deposit money in your account:
account.deposit(<amount>)

# To withdraw money from your account:
account.withdraw(<amount>)

# To see your account statement:
account.see_statement

```

### Run the Tests

Run the following command from the root directory of the script.

```
rspec
```

## How I built the Bank?

I built this script in response to the [Makers Academy Bank Tech Test](https://github.com/NikitaDouglas/bank_tech_test/blob/master/CHALLENGE.md). I began by creating [user stories](https://github.com/NikitaDouglas/bank_tech_test#user-stories) from the requirements listed in the challenge, and then I created a sequence diagram to plan out how my script would function:

![Bank_Tech_Test_Sequence_Diagram_1](https://github.com/NikitaDouglas/bank_tech_test/blob/master/images/bank_tech_test_sequence_1.png)

I then test-drove the creation of the Account class with two methods, `deposit` and `withdraw`, to satisfy the first and third user stories. After that I created the TransactionHistory class which contained a method `add_transaction`, to add a hash to the `@history` array. I then used dependency injection to initialize my account with an instance of TransactionHistory, so the `deposit` and `withdraw` added a new transaction to the `@history` array. 

However, I then realised that it would be preferable, rather than creating an array of hashes to store my transaction data as objects in an array. I deleted the TransactionHistory class and created a new Transaction class - now my `deposit` and `withdraw` methods create a new instance of the Transaction class and store it in the `@transaction_history` array. I created a new sequence diagram to show these changes:

![Bank_Tech_Test_Sequence_Diagram_3](https://github.com/NikitaDouglas/bank_tech_test/blob/master/images/bank_tech_test_sequence_3.png)

I used the Timecop gem to mock time in my tests, as the script uses `Time.now` to record the time the user deposits and withdrawals in order to satisfy the second user story. 

Next, I created the Formatter class and mocked the input that would come from the Account class, stubbing the instance methods for the Transaction objects. I also created two private methods to format the date and the amounts. I used dependency injection to create a new instance of the Formatter class when the account class is created. The `see_statement` method satisfies the fourth user story by puts'ing the array returned by the Formatter class into standard output. 

Unfortunately, I did not have time to satisfy the last user story and create a menu to allow easier interaction with the Bank. 

## Running the App

Here's an image of the app running in IRB:

![bank_tech_test_running](https://github.com/NikitaDouglas/bank_tech_test/blob/master/images/bank_tech_test_running.png)

## User Stories

```
As a customer of the bank
So I can keep my money safe
I would like to make a deposit into my bank account. 

As a developer, 
So my script has real-world value,
I'd like to use the actual date when recording a customer's deposits and withdrawals. 

As a customer of the bank
So I can buy things
I would like to be able to withdraw from my bank account. 

As a customer of the bank
So I can get control of my money
I want to see when money has been moved in or out of my bank account.

As a customer of the bank
So it's easy for me to interact with my bank,
I want to see a menu of options for what I can do.

# Edge Case

- a customer might want to know when their withdrawal isn't possible due to insufficient funds.
```
