module Porkbun
  class Record < Object

    class << self

      def list(domain:)
        response = Client.post_request("dns/retrieve/#{domain}", body: {})
        Collection.from_response(response, type: Record, key: "records")
      end

      def list_by_type(domain:, type:, subdomain:)
        response = Client.post_request("dns/retrieveByNameType/#{domain}/#{type}/#{subdomain}", body: {})
        Collection.from_response(response, type: Record, key: "records")
      end

      def retrieve(domain:, id:)
        response = Client.post_request("dns/retrieve/#{domain}/#{id}", body: {})
        Record.new(response.body["records"][0])
      end

      def create(domain:, type:, content:, **options)
        body = {
          type: type,
          content: content,
        }.merge(options)
        response = Client.post_request("dns/create/#{domain}", body: body)
        Record.new(id: response.body["id"]) if response.body["status"] == "SUCCESS"
      end

      def update(domain:, id:, type:, content:, **options)
        body = {
          type: type,
          content: content,
        }.merge(options)
        response = Client.post_request("dns/edit/#{domain}/#{id}", body: body)
        response.body["status"] == "SUCCESS"
      end

      def update_by_subdomain(domain:, type:, subdomain:, content:, **options)
        body = {
          content: content,
        }.merge(options)
        response = Client.post_request("dns/editByNameType/#{domain}/#{type}/#{subdomain}", body: body)
        response.body["status"] == "SUCCESS"
      end

      def delete_by_subdomain(domain:, type:, subdomain:)
        response = Client.post_request("dns/deleteByNameType/#{domain}/#{type}/#{subdomain}", body: {})
        response.body["status"] == "SUCCESS"
      end

    end

  end
end
