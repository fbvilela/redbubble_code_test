require 'sax-machine'
require_relative 'work'

module Parser
  class WorksParser
    include SAXMachine
    elements :work, as: :works, class: Work

    def persist
      works.each(&:persist)
    end
  end
end
