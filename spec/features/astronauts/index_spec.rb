require 'rails_helper'

RSpec.describe 'Astronauts index' do
  before :each do
    @astronaut_1 = Astronaut.create(name: 'Bob', age: 42, job: 'Astronaut')
    @astronaut_2 = Astronaut.create(name: 'Ivan', age: 15, job: 'Cosmonaut')
    @mission_1 = @astronaut_1.missions.create(title: 'Mission to Mars', time_in_space: 4)
    @mission_2 = @astronaut_1.missions.create(title: 'Escape from Earth', time_in_space: 400)
    @mission_3 = @astronaut_2.missions.create(title: 'A Search for Spock', time_in_space: 42)
    @mission_4 = @astronaut_2.missions.create(title: 'Kessel Run', time_in_space: 12)
    visit astronauts_path
  end

  describe 'I visit the index page' do
    it 'I see a list of the astronauts and details' do
      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_1.job)
        expect(page).to have_content('Total time in space: 404')
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.age)
        expect(page).to have_content(@astronaut_2.job)
        expect(page).to have_content('Total time in space: 54')
      end
    end

    it 'I see the average age of the astronauts' do
      expect(page).to have_content('Average Age: 28.5')
    end

    it 'I see an alphabetical list of missions for each astronaut' do
      within "#astronaut-#{@astronaut_1.id}" do
        expect(page.all('p')[3]).to have_content(@mission_2.title)
        expect(page.all('p')[4]).to have_content(@mission_1.title)
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page.all('p')[3]).to have_content(@mission_3.title)
        expect(page.all('p')[4]).to have_content(@mission_4.title)
      end
    end
  end
end
