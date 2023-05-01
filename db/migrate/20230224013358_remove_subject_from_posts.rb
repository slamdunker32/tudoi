class RemoveSubjectFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :subject, :string
  end
end
