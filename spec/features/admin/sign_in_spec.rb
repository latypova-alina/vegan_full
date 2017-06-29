require "rails_helper"

feature "Sign in" do
  let!(:admin) { create :admin }
  let(:password) { admin.password }

  before(:each) do
    visit new_user_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: password
    click_button "Sign in"
  end

  admin_links = ["Добавить товар", "Добавить рецепт", "Категории продуктов", "Категории рецептов"]

  scenario "Admin signs in successfully" do
    admin_links.each do |link|
      expect(page).to have_content(link)
    end
  end

end
