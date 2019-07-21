require 'pg'


p "Setting up test database"

def setup_test_database
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.exec('TRUNCATE TABLE peeps CASCADE;')
end
