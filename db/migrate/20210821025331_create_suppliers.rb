class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :abn, limit: 10
      t.text :description

      t.timestamps
    end
    add_index :suppliers, :name
    add_index :suppliers, :abn, unique: true
  end
end
