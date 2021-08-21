class Supplier < ApplicationRecord
  validates :abn, length: 9..9, allow_blank: true
end

# == Schema Information
#
# Table name: suppliers
#
#  id          :bigint           not null, primary key
#  name        :string
#  address     :string
#  abn         :string(10)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
