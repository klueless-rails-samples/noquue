# frozen_string_literal: true

json.extract! supplier, :id, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
