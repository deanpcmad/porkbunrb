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

  def test_domain_forwards
    forwards = Porkbun::Domain.forwards(domain: "deanpcmad.dev")
    assert_equal Porkbun::Collection, forwards.class
    assert_equal Porkbun::Forward, forwards.data.first.class
    assert_equal "https://deanpcmad.com", forwards.data.first.location
  end

  def test_domain_add_forward
    domain = Porkbun::Domain.add_forward(
      domain: "deanpcmad.dev",
      location: "https://deanpcmad.com",
      type: "temporary",
      include_path: true
    )
    assert domain
  end

  def test_domain_delete_forward
    domain = Porkbun::Domain.delete_forward(
      domain: "deanpcmad.dev",
      record: "23342838"
    )
    assert domain
  end

end
