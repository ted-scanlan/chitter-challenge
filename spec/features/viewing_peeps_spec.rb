require 'pg'


feature 'viewing peeps' do
scenario 'user can see all peeps' do
  connection = PG.connect(dbname: "peep_manager_test")
  Peep.create(peep_input: "I love eggs", time: Time.now)
  Peep.create(peep_input: "Ted waz ere 2k19", time: Time.now)
  Peep.create(peep_input: "I love dogs", time: Time.now)

visit '/'
click_button 'Show Peeps'

expect(page).to have_content "I love eggs"
expect(page).to have_content "I love dogs"


end
end
