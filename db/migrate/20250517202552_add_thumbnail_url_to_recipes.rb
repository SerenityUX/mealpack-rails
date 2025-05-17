class AddThumbnailUrlToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :thumbnail_url, :string
  end
end
