class CreateUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :uploads do |t|
      t.string :name

      t.timestamps
    end

   add_reference :uploads, :user, index: true, comment: 'Refernce to uploaded file owner'
   add_foreign_key :uploads, :users
  end
end
