class Account < ApplicationRecord
  has_many :transactions
  validates :name, :balance, presence: true

  def update_balance(transaction)
    if transaction.trans_type = 'deposit'
      self.balance = self.balance + transaction.amount
      self.save
    elsif transaction.trans_type = 'withdraw'
      if transaction.amoun <= self.balance
        self.balance = self.balance - transaction.amount
        self.save
      else
        return 'Balance too low.'
      end
    end
  end
end
