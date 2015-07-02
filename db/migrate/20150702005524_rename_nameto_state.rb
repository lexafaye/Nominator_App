class RenameNametoState < ActiveRecord::Migration
  def change
  rename_column :nominates, :name, :state
  end
end
