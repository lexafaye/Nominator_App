class AddUserIdToNominates < ActiveRecord::Migration
  def change
    add_column :nominates, :user_id, :integer
  end
end
