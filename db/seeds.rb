# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Store.destroy_all
Product.destroy_all
u=User.create!(email: 'johndoe@example.com',password:'johndoepassword',password_confirmation:'johndoepassword')
u.store.name="John Doe\'s storefront"
u.store.save
s=u.store

10.times do
s.products.create(:title=>"Suspendisse non auctor diam",:description=>"Quisque eget eros eget est facilisis feugiat. Mauris fermentum auctor metus sed vestibulum. Vivamus sodales dignissim nulla, non rhoncus lorem rutrum at. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ac magna lacus. Fusce ut odio semper lectus elementum interdum. Etiam congue est erat, ac luctus nibh faucibus a. Duis at convallis purus, id scelerisque lacus. Morbi faucibus, mauris id vehicula aliquam, tortor libero accumsan diam, a commodo lacus libero imperdiet eros. Nullam vel dignissim justo, eu ornare est. Nullam faucibus eget mi vel sodales. Nam eleifend rhoncus lacinia. Duis ornare ultricies velit, sed eleifend augue malesuada sit amet. Ut cursus erat magna, ut ultricies odio ornare et.")


  end
