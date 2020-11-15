class CreatePropositionAndAnswer < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.belongs_to :team
      t.string :proposition_1
      t.string :proposition_2
      t.timestamps
    end
    create_table :answers do |t|
      t.belongs_to :proposition
      t.belongs_to :user
      t.boolean :proposition_1
      t.boolean :proposition_2
    end
  end
end
