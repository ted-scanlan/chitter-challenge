require 'pg'

class User
  attr_reader :id
  def initialize(id:)

    @id = id
  end


  def self.create(name:, email:, username:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("INSERT INTO users (name, email, username, password) VALUES('#{name}','#{email}','#{username}','#{password}') RETURNING id, name, username")
    User.new(id: result[0]['id'])

  end

end
