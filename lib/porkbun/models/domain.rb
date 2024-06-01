module Porkbun
  class Domain < Object

    class << self

      def list
        response = Client.post_request("domain/listAll", body: {})
        Collection.from_response(response, type: Domain, key: "domains")
      end

      def name_servers(domain:)
        response = Client.post_request("domain/getNs/#{domain}", body: {})
        data = response.body["ns"].map { |attrs| NameServer.new(ns: attrs) }
        Collection.new data: data, total: data.size
        # Domain.new(name_servers: response.body["ns"])
        # NameServer.new(response.body["ns"])
      end

    end

  end
end
