# frozen_string_literal: true

FactoryBot.define do
  factory :supplier do
    name                                      { nil }
    address                                   { nil }
    abn                                       { nil }
    description                               { nil }

    # Realistic sample data in comment
    trait :trait1 do
      name                                   { "A-Name" }
      address                                { "A-Address" }
      abn                                    { "A23456789" }
      description                            { "A-Description" }
    end

    trait :trait2 do
      name                                   { "B-Name" }
      address                                { "B-Address" }
      abn                                    { "B23456789" }
      description                            { "B-Description" }
    end

    trait :trait3 do
      name                                   { "C-Name" }
      address                                { "C-Address" }
      abn                                    { "C23456789" }
      description                            { "C-Description" }
    end

    trait :no_abn do
      abn                                    { nil }
    end
  end
end
