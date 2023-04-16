class SubjectsController < ApplicationController
  def index
    @subjects = Subject.left_outer_joins(:posts)
                       .distinct
                       .group('subjects.id','posts.id')
                       .having('count(posts.id) <= 3 OR posts.id IS NULL')
                       .order("created_at ASC")
  end
end
