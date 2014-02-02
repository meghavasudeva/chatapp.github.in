class AddPartNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :part_number, :string
  end
end
