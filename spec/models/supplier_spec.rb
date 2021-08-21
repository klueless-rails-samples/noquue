# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Supplier, type: :model do
  before(:each) do
    FactoryBot.reload
  end

  # focus models
  let(:supplier_trait1) { FactoryBot.create(:supplier, :trait1) }
  let(:supplier_trait2) { FactoryBot.create(:supplier, :trait2) }
  # let(:supplier_trait3) { FactoryBot.create(:supplier, :trait3) }
  let(:supplier_trait3_no_abn) { FactoryBot.create(:supplier, :trait3, :no_abn) }

  let(:described_model) { supplier_trait1 }

  describe "#find" do
    context "when row ID exists" do
      before(:each) { described_model }

      let(:found) { described_class.find(described_model.id) }

      it "should find by id" do
        expect(found.id).to eq(described_model.id)
      end
    end
  end

  describe "#create" do
    let(:create) { described_class.new(attributes) }

    let(:optional_data_values) do
      {
        name: "name",
        address: "address",
        abn: "123456789",
        description: "description"
      }
    end
    let(:all_data_values) { {}.merge(optional_data_values) }
    let(:nil_data_values) { all_data_values.keys.map { |key| [key, nil] }.to_h }

    describe "happy path :)" do
      context "when creating a row" do
        context "with valid data values" do
          context "and valid relationships" do
            let(:attributes) { all_data_values }

            it "should create a new row" do
              expect { create.save }
                .to change { described_class.count }.by(1)
            end

          end
        end
      end
    end

    describe "unhappy path :(" do
      context "when misconfigured" do
        context "because relationships are invalid" do
          # no relationships for belongs_to
        end

        context "because ABN must be 9 characters" do
          let(:attributes) { 
            {
              name: "name",
              address: "address",
              abn: "Abn9",
              description: "description"
            }
          }

          it "should not create a new row" do
            expect { create.save }
              .to change { described_class.count }.by(0)
          end

          describe '.valid?' do
            subject { create.valid? }

            it { is_expected.to be_falsey }
          end

          describe '.errors.full_messages' do
            subject { create.errors.full_messages }

            before { create.valid? }

            it { is_expected.to include("Abn is too short (minimum is 9 characters)") }
          end
        end

      end
    end
  end

  describe "#update" do
    let(:optional_data_values) do
      {
        name: "name+updated",
        address: "address+updated",
        abn: "D23456789",
        description: "description+updated"
      }
    end
    let(:all_data_values) { {}.merge(optional_data_values) }
    let(:nil_data_values) { all_data_values.keys.map { |key| [key, nil] }.to_h }

    let(:update) { described_model }

    describe "happy path :)" do
      context "when data fields are valid" do
        let(:attributes) { all_data_values }

        describe ".valid?" do
          before(:each) {  update.assign_attributes(attributes) }

          it { expect(update.valid?).to be_truthy }
        end

        describe ".save" do
          it "values should change" do
            expect do
              update.assign_attributes(attributes)
              update.save
              update.reload
            end
            .to  change { update.updated_at }
            .and change { update.name }.to("name+updated") # you can check specific fields
          end
        end
      end
    end

    describe "unhappy path :(" do
      before(:each) { update.assign_attributes(attributes) }

      let(:attributes) { 
        {
          name: "name",
          address: "address",
          abn: abn,
          description: "description"
        }
      }
      
      context "when abn is too short" do
        let(:abn) { '123' }

        describe ".valid?" do
          subject { update.valid? }

          it { expect(update.valid?).to be_falsey }
        end

        describe ".errors.full_messages" do
          subject { update.errors.full_messages }

          before { update.valid? }

          it { is_expected.to include('Abn is too short (minimum is 9 characters)') }
        end
      end

      context "when abn is too long" do
        let(:abn) { '1234567890' }

        describe ".valid?" do
          subject { update.valid? }

          it { expect(update.valid?).to be_falsey }
        end

        describe ".errors.full_messages" do
          subject { update.errors.full_messages }

          before { update.valid? }

          it { is_expected.to include('Abn is too long (maximum is 9 characters)') }
        end
      end
    end
  end

  describe "#destroy" do
    context "when delete by id" do
      before(:each) { described_model }

      it "when the row exists" do
        expect { described_class.destroy(described_model.id) }
          .to change { described_class.count }.by(-1)
      end
    end
    context "when delete by multiple ids" do
      before(:each) { full_data_set }

      it "should rows with valid ids exist" do
        byebug
        expect { described_class.where(id: [supplier_trait1.id, supplier_trait2.id, supplier_trait3_no_abn.id]).destroy_all }
        .to change { described_class.count }.by(-3)
      end
    end
  end

  # # data set for general unit tests
  def full_data_set
    supplier_trait1
    supplier_trait2
    supplier_trait3_no_abn
  end

  context "factories" do
    before(:each) do
    end

    describe "check factory data" do
      it "validate test data" do
        # print_data_set

        expect(supplier_trait1).to_not be_nil
        expect(supplier_trait2).to_not be_nil
        expect(supplier_trait3_no_abn).to_not be_nil
      end
    end
  end

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
