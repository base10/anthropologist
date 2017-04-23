Rails.application.routes.draw do
  get 'commits_charts', to: 'charts#commits'
end
