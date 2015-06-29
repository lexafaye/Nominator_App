class AddLastNametoReferral < ActiveRecord::Migration
  def change
  add_column :nominates, :referrallastname, :text
  end
end
