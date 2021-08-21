# frozen_string_literal: true

class Supplier < ApplicationRecord
  # default_scope { where.not(abn: nil) }
  scope :with_abn, -> { where.not(abn: nil) }
  scope :without_abn, -> { where(abn: nil) }

    # default_scope { where.not(abn: nil) }

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
