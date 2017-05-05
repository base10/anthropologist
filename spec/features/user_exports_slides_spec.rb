require "rails_helper"

BASE_URL = 'http://localhost:3600/pages/home#/'
URL_RANGE = 0..5
#SAVE_PATH = "#{ENV.fetch('HOME')}/Desktop/slide-pages/"

feature "Save slides to images" do
  scenario "User views slides", js: true do
    visit page_path(id: :home)

    save_and_open_screenshot
  end
end

URL_RANGE.each do |num|
  url = BASE_URL + num.to_s
  #file_name = SAVE_PATH + "#{num}.pdf"
end
