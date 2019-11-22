account = Account.create(name: 'Checking', balance: 1000)

transaction = Transaction.create(account_id: 1, amount: 10, trans_type: 'deposit', date: DateTime.now, description: 'Found $10')

transaction_two = Transaction.create(account_id: 1, amount: 10, trans_type: 'withdraw', date: DateTime.now, description: 'Found $10')
