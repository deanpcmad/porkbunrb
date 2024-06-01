require "test_helper"

class DomainTest < Minitest::Test

  def test_domain_list
    domains = Porkbun::Domain.list
    assert_equal Porkbun::Collection, domains.class
    assert_equal Porkbun::Domain, domains.data.first.class
    assert_equal "deanpcmad.dev", domains.data.first.domain
  end

  def test_domain_name_servers
    name_servers = Porkbun::Domain.name_servers(domain: "deanpcmad.dev")
    assert_equal Porkbun::Collection, name_servers.class
    assert_equal Porkbun::NameServer, name_servers.data.first.class
    assert_equal "curitiba.ns.porkbun.com", name_servers.data.first.ns
  end

end
