class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true, index: { unique: true}

      t.timestamps
    end
  end
end
