class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :car, foreign_key: true
      t.attachment :photo

    end
  end
end
