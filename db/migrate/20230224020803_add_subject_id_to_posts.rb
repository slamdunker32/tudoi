class AddSubjectIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :subject, foreign_key: true
  end
end
