class CreateRecipeDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :recipe_documents do |t|
      t.string :title
      t.string :original_filename
      t.string :file_type

      t.timestamps
    end
  end
end
