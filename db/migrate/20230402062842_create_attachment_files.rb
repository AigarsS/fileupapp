class CreateAttachmentFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :attachment_files do |t|
      t.string :name

      t.timestamps
    end
  end
end
