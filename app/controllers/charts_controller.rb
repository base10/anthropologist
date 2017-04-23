class ChartsController < ApplicationController
  def commits
    render json: Commit.group_by_month(:author_datetime).count
  end
end
