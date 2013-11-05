FactoryGirl.define do
  factory :user do
    first_name "Moe"
    last_name "Syszlack"
    email 'moe@flamingmoes.com'
    password 'itsmoemoe'
    password_confirmation 'itsmoemoe'
    confirmed_at Time.now
  end
  factory :admin do
    after(:create){|user| user.add_role(:admin)}
  end
  factory :client do
    after(:create){|user| user.add_role(:client)}
  end
  factory :store do
    after(:create){|user| user.store.update_attributes(:name=>"Flaming Moe\'s",:url=>'flamingmoes.example.com',:description=>"Not to be confused with Flaming Homer\'s")}
  end

end