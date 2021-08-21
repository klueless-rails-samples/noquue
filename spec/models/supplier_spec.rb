# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Supplier, type: :model do
  # before(:each) do
  #   FactoryBot.reload
  # end

  describe '#addition' do
    context 'when lhs == 2 and rhs = 3' do
      it 'should return 5' do
        expect(2 + 3).to eq(5)
      end
    end
    context 'when lhs == 7 and rhs = 3' do
      it do
        expect(7 + 3).to eq(10)
      end
    end
    context 'when lhs == 7 and rhs = 4' do
      it do
        expect(7 + 4).to eq(11)
      end
    end
  end

  # # focus models
  # let(:supplier_trait1) { FactoryBot.create(:supplier, :trait1) }
  # let(:supplier_trait2) { FactoryBot.create(:supplier, :trait2) }
  # let(:supplier_trait3) { FactoryBot.create(:supplier, :trait3) }

  # let(:described_model) { supplier_trait1 }

  # describe "#find" do
  #   context "when row ID exists" do
  #     before(:each) { described_model }

  #     let(:found) { described_class.find(described_model.id) }

  #     it "should find by id" do
  #       expect(found.id).to eq(described_model.id)
  #     end

  #   end
  # end

  # describe "#create" do
  #   let(:create) { described_class.new(attributes) }

  #   let(:optional_data_values) do
  #     {
  #       name: "name",
  #       os: "os",
  #       checksum: "checksum"
  #     }
  #   end
  #   let(:all_data_values) { {}.merge(optional_data_values) }
  #   let(:nil_data_values) { all_data_values.keys.map { |key| [key, nil] }.to_h }

  #   describe "happy path :)" do
  #     context "when creating a row" do
  #       context "with valid data values" do
  #         context "and valid relationships" do
  #           let(:attributes) { all_data_values }

  #           it "should create a new row" do
  #             expect { create.save }
  #               .to change { described_class.count }.by(1)
  #           end

  #         end
  #       end
  #     end
  #   end

  #   describe "unhappy path :(" do
  #     context "when misconfigured" do
  #       context "because relationships are invalid" do
  #         # no relationships for belongs_to
  #       end

  #       context "because data columns are missing" do
  #         let(:attributes) { {} }

  #         # xit "should not create a new row" do
  #         #   expect { create.save }
  #         #     .to change { described_class.count }.by(0)
  #         # end
  #       end

  #       context "because data columns are nil" do
  #         let(:attributes) { nil_data_values }

  #         # xit "should fail to create new row" do
  #         #   expect { create.save }
  #         #     .to change { described_class.count }.by(0)
  #         #   # .to raise_error(ActiveRecord::NotNullViolation)
  #         # end
  #       end
  #     end
  #   end
  # end

  # describe "#update" do
  #   let(:optional_data_values) do
  #     {
  #       name: "name+updated",
  #       os: "os+updated",
  #       checksum: "checksum+updated"
  #     }
  #   end
  #   let(:all_data_values) { {}.merge(optional_data_values) }
  #   let(:nil_data_values) { all_data_values.keys.map { |key| [key, nil] }.to_h }

  #   let(:update) { described_model }

  #   describe "happy path :)" do
  #     context "when data fields are valid" do
  #       let(:attributes) { all_data_values }

  #       describe ".valid?" do
  #         before(:each) { update.assign_attributes(attributes) }

  #         it { expect(update.valid?).to be_truthy }
  #       end

  #       describe ".save" do
  #         it "values should change" do
  #           expect do
  #             update.assign_attributes(attributes)
  #             update.save
  #             update.reload
  #           end
  #           .to  change { update.updated_at }
  #           .and change { update.name }.to("name+updated") # you can check specific fields
  #         end
  #       end
  #     end
  #   end

  #   describe "unhappy path :(" do
  #     context "data fields with nil" do
  #       before(:each) { update.assign_attributes(attributes) }

  #       let(:attributes) { nil_data_values }

  #       describe ".valid?" do
  #         # this test does not work for Supplier
  #         # xit { expect(update.valid?).to be_falsey }
  #       end

  #       describe ".save" do
  #         before(:each) { update.assign_attributes(attributes) }

  #         # xit "should fail to save" do
  #         #   expect { update.save }.to raise_error(ActiveRecord::NotNullViolation)
  #         # end
  #       end
  #     end

  #     context "when updating foreign keys with nil" do
  #       # NOT APPLICABLE
  #     end
  #   end
  # end

  # describe "#destroy" do
  #   context "when delete by id" do
  #     before(:each) { described_model }

  #     it "when the row exists" do
  #       expect { described_class.destroy(described_model.id) }
  #         .to change { described_class.count }.by(-1)
  #     end
  #   end
  #   context "when delete by multiple ids" do
  #     before(:each) { full_data_set }

  #     it "should rows with valid ids exist" do
  #       expect { described_class.where(id: [supplier_trait1.id, supplier_trait2.id]).destroy_all }
  #       .to change { described_class.count }.by(-2)
  #     end
  #   end
  # end

  # # data set for general unit tests
  # def full_data_set
  #   supplier_trait1
  #   supplier_trait2
  #   # supplier_trait3
  # end

  # context "factories" do
  #   before(:each) do
  #     full_data_set
  #   end

  #   describe "check factory data" do
  #     it "validate test data" do
  #       # print_data_set

  #       expect(supplier_trait1).to_not be_nil
  #       expect(supplier_trait2).to_not be_nil
  #       expect(supplier_trait3).to_not be_nil
  #     end
  #   end
  # end

  # def print_me
  #   print_suppliers_as_table
  #   # print_suppliers(nil, format: :detailed)
  # end

  # def print_data_set
  #   # return unless AppService.debug?

  #   # print related tables

  #   print_me
  # end
end
