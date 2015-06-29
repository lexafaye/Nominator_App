class AddLastName < ActiveRecord::Migration
  def change
  add_column :nominates, :lastname, :text
  end
end
