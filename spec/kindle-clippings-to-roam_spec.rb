require  'spec_helper.rb'
require_relative '../kindle-clippings-to-roam.rb'

describe 'kindle clippings to roam' do
  describe '#tokenize' do
    it 'returns the expected hash' do
      text = <<~'TEXT'
      Peopleware: Productive Projects and Teams (3rd Edition) (DeMarco, Tom;Lister, Tim)
      Tu nota en la página 12 | posición 289 | Añadido el sábado, 1 de julio de 2017 12:32:14

      create session to tll about the project. lead the session to force a talk
      on the things that are most important to talk about
      TEXT

      expected = {
        author:   'DeMarco, Tom;Lister, Tim',
        title:    'Peopleware: Productive Projects and Teams',
        position: 'Tu nota en la página 12, posición 289',
        date:     '1 de julio de 2017 12:32:14',
        content: "create session to tll about the project. lead the session to force a talk\n"\
                 "on the things that are most important to talk about"
      }

      expect(tokenize(text)).to eq(expected)
    end
  end
end
