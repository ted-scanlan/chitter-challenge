require 'pg'


p "Setting up test database"

def setup_test_database_peeps
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.exec('TRUNCATE TABLE peeps CASCADE;')
end

def setup_test_database_users
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.exec('TRUNCATE TABLE users CASCADE;')
end
