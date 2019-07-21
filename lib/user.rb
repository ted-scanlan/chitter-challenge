require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :email
  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end


  def self.create(name:, email:, username:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO users (name, email, username, password) VALUES('#{name}','#{email}','#{username}','#{encrypted_password}') RETURNING id, name, username, email")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])

  end

  def self.find(username:)
    # return nil unless username

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("SELECT * FROM users WHERE username = '#{username}'")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])

  end

end
