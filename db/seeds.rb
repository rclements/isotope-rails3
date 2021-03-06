# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
#

User.create( :first_name => "Laird",    :last_name => "Foret",    :password => "123456", :password_confirmation => "123456",  :position => "principal",         :email => "laird@isotope11.com",      :bio => "Laird Foret Founder and CEO Laird Foret has over 22 years of experience in the IT industry and is responsible for the day-to-day operations and administration of isotope11, inc. Prior to founding isotope11 in 2005, he started and ran many various companies and considers himself a serial entrepreneur. He graduated from Millsaps College in Computer Science and has a minor in accounting.")
User.create( :first_name => "Josh",     :last_name => "Adams",    :password => "123456", :password_confirmation => "123456",  :position => "principal",         :email => "josh@isotope11.com",       :bio => "Josh Adams is a developer and architect with over nine years of professional experience building production-quality software and managing projects. Josh is Isotope Eleven's lead architect, and is responsible for overseeing architectural decisions and translating customer requirements into working software. Josh graduated from the University of Alabama at Birmingham (UAB) with Bachelor of Science degrees in both Mathematics and Philosophy. In his free time (ha!) Josh is currently providing Technical Review to Apress for a book on programming with the Arduino microprocessor. When he's not working, Josh enjoys spending time with his family.")
User.create( :first_name => "James",    :last_name => "Cook",     :password => "123456", :password_confirmation => "123456",  :position => "senior developer",  :email => "james@isotope11.com",      :bio => "James Cook is a Senior Developer at Isotope Eleven - a rubyist fueled by coffee and bananas. In his spare time, he reads Reddit and plays video games.")
User.create( :first_name => "Nick",     :last_name => "Fine",     :password => "123456", :password_confirmation => "123456",  :position => "developer",         :email => "nick@isotope11.com",       :bio => "Nick spent the better part of a decade working in systems and networking support until discovering that developing software, particularly in Ruby, was a much more entertaining and satisfying career choice. He lives with his wife and pets in Birmingham and enjoys excessive amounts of coffee, contemporary literature, and music that's too loud.")
User.create( :first_name => "Adam",     :last_name => "Dill",     :password => "123456", :password_confirmation => "123456",  :position => "senior developer",  :email => "adam@isotope11.com",       :bio => "With over 14 years of experience, Adam Dill is a web application developer currently specializing in Ruby development. He is a regular speaker across the southeast at conferences and user groups on a variety of subjects including web standards, 508 compliance, automated testing, and project management. Before joining Isotope Eleven, Adam ran a successful development company and worked with over a dozen technology based startups, leading development for many of them.")
User.create( :first_name => "Robby",    :last_name => "Clements", :password => "123456", :password_confirmation => "123456",  :position => "developer",         :email => "rclements@isotope11.com",  :bio => "Robby Clements is an understudy Ruby on Rails developer for Isotope Eleven. He has a long history of tech support and network services. He was invited to work as a Rails developer by Isotope Eleven and his growing knowledge of Ruby and Rails is being nurtured by some of the best Rails developers on the east coast.")
User.create( :first_name => "Mike",     :last_name => "Heitzke",  :password => "123456", :password_confirmation => "123456",  :position => "designer",          :email => "mike@isotope11.com",       :bio => "Even with educational roots based in the print design, Mike really found his place in designing for the web. Hailing from Connecticut and then Texas, Mike found his way to the south for school and ended up finding his home here designing at Isotope Eleven. Proud Texan and a fan of automobiles of the hatchback variety.")
User.create( :first_name => "Adam",     :last_name => "Gamble",   :password => "123456", :password_confirmation => "123456",  :position => "developer",         :email => "agamble@isotope11.com",    :bio => "Adam has been a professional developer for almost 10 years. He started web development with PHP, and has since moved on to Ruby on Rails and hasn't looked back. He has worked on projects for both the educational and financial fields.")
User.create( :first_name => "Bradley",  :last_name => "Price",    :password => "123456", :password_confirmation => "123456",  :position => "developer",         :email => "bradley@isotope11.com",    :bio => "Bradley comes from a background in systems administration. He enjoys working with technology and startups. His biggest joy comes from helping people find solutions using technology. Outside of work, his hobbies include spending time with his son (Alex), watching movies, and hanging out with friends.")
User.create( :first_name => "Ben",      :last_name => "Holley",   :password => "123456", :password_confirmation => "123456",  :position => "developer",         :email => "ben@isotope11.com",        :bio => "This is something")

User.all.each do |user|
  file = File.open("doc/avatar_seeds/about_#{user.first_name.downcase}_#{user.last_name.downcase}.png")
  user.update_attribute(:avatar, file)
end

["laird@isotope11.com", "josh@isotope11.com"].each do |email|
  user = User.find_by_email(email)
  user.make_admin!
end

if RAILS_ENV = "development"
  User.all.each do |user|
    Post.create( :title => "Post by: #{user}",  :body => "Vivamus nec mauris egizzle nisi shit pretizzle. Vivamus shut the shizzle up amet lacizzle. Ma nizzle eu pimpin' egizzle lacizzle auctizzle pizzle. Praesent fo shizzle boofron doggy. Curabitur izzle arcu. Own yo' ass enim, auctizzle owned, congue eu, dignissizzle black, libero. Bizzle vitae pede its fo rizzle eros posuere pharetra. Quisque pede tortizzle, gangster pulvinizzle, dope stuff, mollis fizzle fo shizzle mah nizzle fo rizzle, mah home g-dizzle, erizzle. You son of a bizzle izzle dui. Aliquizzle doggy purus, black consectetizzle, sollicitudin i saw beyonces tizzles and my pizzle went crizzle, dope imperdiet, gangster. Quisque ipsizzle eu mi rutrum vehicula. Break it down things fizzle ipsum. Gangsta fo shizzle my nizzle morbi pizzle senectus izzle fizzle et malesuada shizznit daahng dawg turpis shit. In est. Curabitur elementizzle. Ut rizzle felizzle, da bomb quis, yo da bomb, sheezy pulvinizzle, its fo rizzle. Nulla sagittis gravida fo shizzle mah nizzle fo rizzle, mah home g-dizzle.",    :user => user,  :slug => "post-by-#{user.id}")
  end

  (1..10).each do |i|
    Contact.create({:email => "user_#{i}@example.com", :text => "Vivamus nec mauris egizzle nisi shit pretizzle. Vivamus shut the shizzle up amet lacizzle. Ma nizzle eu pimpin' egizzle lacizzle auctizzle pizzle.", :nickname => "User#{i}", :company => "Dude, Inc."})
  end
end
