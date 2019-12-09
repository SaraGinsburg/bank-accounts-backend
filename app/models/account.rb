class Account < ApplicationRecord
  has_many :transactions
  validates :name, :balance, presence: true

  def update_balance(transaction)
    if transaction.trans_type == 'deposit'
      self.balance = self.balance + transaction.amount
      self.save
    elsif transaction.trans_type == 'withdraw'

      if transaction.amount <= self.balance
        self.balance = self.balance - transaction.amount
        self.save
      else
        return 'Balance too low'
      end
    end
  end

  def update_balance_after_transaction_removal(transaction)
    if transaction.trans_type == 'deposit'
      if transaction.amount <= self.balance
        self.balance = self.balance - transaction.amount
        self.save
      else
        return 'Balance too low'
      end
    elsif transaction.trans_type == 'withdraw'
      self.balance = self.balance + transaction.amount
      self.save
    end
  end
end
