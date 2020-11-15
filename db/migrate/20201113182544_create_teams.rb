class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.timestamps
    end

    add_reference :users, :team, foreign_key: true
  end
end
