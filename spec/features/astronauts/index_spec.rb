require 'rails_helper'

RSpec.describe 'Astronauts index' do
  before :each do
    @astronaut_1 = Astronaut.create(name: 'Bob', age: 42, job: 'Astronaut')
    @astronaut_2 = Astronaut.create(name: 'Ivan', age: 15, job: 'Cosmonaut')
    visit astronauts_path
  end

  describe 'I visit the index page' do
    it 'I see a list of the astronauts and details' do
      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_2.name)
      expect(page).to have_content(@astronaut_1.age)
      expect(page).to have_content(@astronaut_2.age)
      expect(page).to have_content(@astronaut_1.job)
      expect(page).to have_content(@astronaut_2.job)
    end

    it 'I see the average age of the astronauts' do
      expect(page).to have_content('Average Age: 28.5')
    end
  end
end
