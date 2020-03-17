5.times do |n|
  User.create!(
    name: "テストマン#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: 'foobar',
    password_confirmation: 'foobar',
    first_name: 'テスト',
    last_name: 'マン',
    firstFurigana: 'テスト',
    last_Furigana: 'マン',
    birth_year: '2000',
    birth_month: '1',
    birth_day: '1',
    post_number: '0000000',
    prefecture:  '大阪',
    municipality: '淀川区',
    house_number: '新高１丁目1-1',
    tel: '00000000000',
    icon: ''
  )
end

Product.create!(
  id: '1',
  name: 'カメラ',
  price: '15000',
  stock: '1',
  condition: '傷や汚れあり',
  size: 'L',
  introduction: '美品です',
  sales_status: '販売中',
  user_id: '1',
  saler_id: "",
  buyer_id: ""
)

Product.create!(
  id: '2',
  name: 'ハンバーガー',
  price: '500',
  stock: '1',
  condition: '傷や汚れあり',
  size: 'L',
  introduction: '美品です',
  sales_status: '販売中',
  user_id: '1',
  saler_id: "",
  buyer_id: ""
)

Product.create!(
  id: '3',
  name: '掃除機',
  price: '20000',
  stock: '1',
  condition: '傷や汚れあり',
  size: 'L',
  introduction: '美品です',
  sales_status: '販売中',
  user_id: '2',
  saler_id: "",
  buyer_id: ""
)