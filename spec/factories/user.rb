FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei::last.kanji}
    last_name             {Gimei::first.kanji}
    first_kananame        {Gimei::last.katakana}
    last_kananame         {Gimei::first.katakana}
    birthday              {Faker::Date.birthday}
  end
end