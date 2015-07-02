class AddStateToIndex < ActiveRecord::Migration
  def change
    add_column :nominates, :name, :text
  end
end
