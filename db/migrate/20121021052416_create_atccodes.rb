class CreateAtccodes < ActiveRecord::Migration
  def change
    create_table :atccodes do |t|
      t.string :code
      t.text :detail
    end
  end
end
