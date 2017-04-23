class ChartsController < ApplicationController
  def commits
    render json: Commit.group_by_day(:author_datetime).count
  end
end
