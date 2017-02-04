require_relative '../models/Tag'
require_relative '../models/Merchant'
require_relative '../models/Transaction'
require 'pry-byebug'

tag_1 = Tag.new({
  'tag_name' => 'Food'
  })
tag_2 = Tag.new({
  'tag_name' => 'Clothes'
  })
tag_3 = Tag.new({
  'tag_name' => 'Petrol'
  })
tag_4 = Tag.new({
  'tag_name' => 'Dinner'
  })
tag_5 = Tag.new({
  'tag_name' => 'Bank Fees'
  })
tag_6 = Tag.new({
  'tag_name' => 'Credit Card payment'
  })
merchant_1 = Merchant.new({
  'merchant_name' => 'Tesco'
  })
merchant_2 = Merchant.new({
  'merchant_name' => 'Subway'
  })
merchant_3 = Merchant.new({
  'merchant_name' => 'Bank of Scotland'
  })
merchant_4 = Merchant.new({
  'merchant_name' => 'Arquiva'
  })
merchant_5 = Merchant.new({
  'merchant_name' => 'Shell'
  })
merchant_6 = Merchant.new({
  'merchant_name' => 'Burton'
  })

merchant_1.save
merchant_2.save
merchant_3.save
merchant_4.save
merchant_5.save
merchant_6.save

tag_1.save()
tag_2.save()
tag_3.save()
tag_4.save()
tag_5.save()

transaction_1 = Transaction.new({
  "merchant_id"=> "1",
  "tag_id" => "1",
  "transaction_amount" => "21.11",
  "item_description" => "bought dinner for friends"
  })
transaction_2 = Transaction.new({
  "merchant_id"=> "1",
  "tag_id" => "2",
  "transaction_amount" => "2.99",
  "item_description" => "bought new shirt"
  })
transaction_3 = Transaction.new({
  "merchant_id"=> "3",
  "tag_id" => "1",
  "transaction_amount" => "13.59",
  "item_description" => "bought drinks for everyone"
  })
transaction_4 = Transaction.new({
  "merchant_id"=> "2",
  "tag_id" => "4",
  "transaction_amount" => "10.50",
  "item_description" => "filled tank"
  })
transaction_5 = Transaction.new({
  "merchant_id"=> "1",
  "tag_id" => "5",
  "transaction_amount" => "20.35",
  "item_description" => "bought helicopter"
  })

transaction_1.save
transaction_2.save
transaction_3.save
transaction_4.save
transaction_5.save

binding.pry

nil