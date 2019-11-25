class TransactionSerializer < ActiveModel::Serializer
  attributes :id,
  :account_id,
  :date,
  :trans_type,
  :amount,
  :description
end
