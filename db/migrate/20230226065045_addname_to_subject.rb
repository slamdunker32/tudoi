class AddnameToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :title, :string
    add_column :posts, :images, :json
  end
end
