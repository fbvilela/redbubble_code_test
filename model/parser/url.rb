module Parser
  class Url
    include SAXMachine

    element :url , as: :link
    element :url, value: :type, as: :url_type
  end
end
