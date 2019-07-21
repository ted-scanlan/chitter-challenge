require 'pg'
require 'date'

class Peep
attr_reader :peep, :id, :time

def initialize(peep:, id:, time:)
  @peep = peep
  @id = id
  @time = time
end

def self.all

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'peep_manager_test')
  else
  connection = PG.connect(dbname: 'peep_manager')
end
  result = connection.exec("SELECT * FROM peeps")
  result.map do |post|
    Peep.new(id: post['id'], peep: post['peep'], time: post['time'])
  end

end




def self.create(peep_input:, time:)

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'peep_manager_test')
  else
  connection = PG.connect(dbname: 'peep_manager')
end
  result = connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep_input}','#{time}') RETURNING peep, id, time")
  Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])

end

end
