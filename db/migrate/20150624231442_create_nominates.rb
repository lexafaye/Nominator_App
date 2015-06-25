class CreateNominates < ActiveRecord::Migration
  def change
    create_table :nominates do |t|
      t.text :yourname
      t.text :yourbiz
      t.text :youremail
      t.text :referralname
      t.text :referralbiz
      t.text :referralemail
      t.text :referralstate

      t.timestamps
    end
  end
end
