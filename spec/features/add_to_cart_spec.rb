require 'rails_helper'

RSpec.feature "Visitor adds product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "The text in the nav shows an item in the cart" do
    # ACT
    visit root_path
    first('button').click
    sleep(0.5)

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content('My Cart (1)')
  end

end