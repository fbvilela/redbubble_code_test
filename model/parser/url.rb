module Parser
  class Url
    include SAXMachine

    element :url , as: :link
    element :url, value: :type, as: :url_type

    def persist( work_id )
      #Not that we need to 'find it' for any reason, this is just to avoid duplicates if running against an existing database
      ::Url.find_or_create_by( work_id: work_id, url_type: url_type, link: link )
    end
  end
end
