require_relative '../models/Tag'
require_relative '../models/Merchant'
require_relative '../models/Transaction'
require 'pry-byebug'

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
  'merchant_name' => 'Slaters'
  })
merchant_5 = Merchant.new({
  'merchant_name' => 'Shell'
  })
merchant_6 = Merchant.new({
  'merchant_name' => 'Burton'
  })
merchant_7 = Merchant.new({
  'merchant_name' => 'Local Pub'
  })

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
  'tag_name' => 'Lunch'
  })
tag_5 = Tag.new({
  'tag_name' => 'Finance'
  })
tag_6 = Tag.new({
  'tag_name' => 'Booze'
  })

merchant_1.save
merchant_2.save
merchant_3.save
merchant_4.save
merchant_5.save
merchant_6.save
merchant_7.save

tag_1.save()
tag_2.save()
tag_3.save()
tag_4.save()
tag_5.save()
tag_6.save()

transactions_array = [
  transaction_1 = Transaction.new({
  "merchant_id"=> "1",
  "tag_id" => "1",
  "transaction_amount" => "10.35",
  "item_description" => "bought some christmas stuff.",
  "transaction_date" => "20161201"
  }),
  transaction_1 = Transaction.new({
  "merchant_id"=> "1",
  "tag_id" => "1",
  "transaction_amount" => "5.35",
  "item_description" => "bought Weekly Shopping. Bread, milk eggs.",
  "transaction_date" => "20170115"
  }),
transaction_2 = Transaction.new({
  "merchant_id"=> "2",
  "tag_id" => "4",
  "transaction_amount" => "8.59",
  "item_description" => "Went for steak and cheese cost more than I was expecting.",
  "transaction_date" => "20170116"
  }),
transaction_3 = Transaction.new({
  "merchant_id"=> "2",
  "tag_id" => "4",
  "transaction_amount" => "5.00",
  "item_description" => "Footlong BML with a drink",
  "transaction_date" => "20170117"
  }),
transaction_4 = Transaction.new({
  "merchant_id"=> "4",
  "tag_id" => "2",
  "transaction_amount" => "16.00",
  "item_description" => "Bought new shirt for work.",
  "transaction_date" => "20170119"
  }),
transaction_5 = Transaction.new({
  "merchant_id"=> "1",
  "tag_id" => "1",
  "transaction_amount" => "18.29",
  "item_description" => "More shoping bought cakes.",
  "transaction_date" => "20170120"
  }),
transaction_6 = Transaction.new({
  "merchant_id"=> "3",
  "tag_id" => "5",
  "transaction_amount" => "120.35",
  "item_description" => "Loan payments",
  "transaction_date" => "20160201"
  }),
transaction_7 = Transaction.new({
  "merchant_id"=> "5",
  "tag_id" => "3",
  "transaction_amount" => "40.01",
  "item_description" => "Filled Tank",
  "transaction_date" => "20170202"
  }),
transaction_8 = Transaction.new({
  "merchant_id"=> "4",
  "tag_id" => "2",
  "transaction_amount" => "299.99",
  "item_description" => "bought new suit for interviews.",
  "transaction_date" => "20170202"
  }),
transaction_9 = Transaction.new({
  "merchant_id"=> "6",
  "tag_id" => "2",
  "transaction_amount" => "59.99",
  "item_description" => "bought new shoes",
  "transaction_date" => "20170202"
  })
]

transactions_array.each{|transaction| transaction.save }

binding.pry

nil