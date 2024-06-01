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
      end

      def forwards(domain:)
        response = Client.post_request("domain/getUrlForwarding/#{domain}", body: {})
        Collection.from_response(response, type: Forward, key: "forwards")
      end

      def add_forward(domain:, location:, type:, include_path: false, wildcard: false, **options)
        body = {
          domain: domain,
          location: location,
          type: type,
          includePath: include_path ? "yes" : "no",
          wildcard: wildcard ? "yes" : "no",
        }.merge(options)
        response = Client.post_request("domain/addUrlForward/#{domain}", body: body)
        response.body["status"] == "SUCCESS"
      end

      def delete_forward(domain:, record:)
        response = Client.post_request("domain/deleteUrlForward/#{domain}/#{record}", body: {})
        response.body["status"] == "SUCCESS"
      end

    end

  end
end
