require 'database_helpers'


describe Peep do
  time_double = "2019-07-21 12:51:41"
  describe '.create' do


    it 'creates a peep' do

      peep_example = Peep.create(peep_input: "I love eggs", time: time_double)

      database_row = get_database_row_from_db(id: peep_example.id)

      expect(database_row['peep']).to eq "I love eggs"

      expect(peep_example.peep).to eq "I love eggs"
      expect(peep_example.time). to eq time_double

    end
  end

  describe '.all' do
    it 'shows all peeps' do
      peep = Peep.create(peep_input: "I love eggs", time: time_double)
      Peep.create(peep_input: "Ted waz ere 2k19", time: time_double)
      Peep.create(peep_input: "I love dogs", time: time_double)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep).to eq "I love eggs"


    end
  end
end
