require "test_helper"

class RecordTest < Minitest::Test

  def test_record_list
    records = Porkbun::Record.list(domain: "deanpcmad.dev")
    assert_equal Porkbun::Collection, records.class
    assert_equal Porkbun::Record, records.data.first.class
    assert_equal "pixie.porkbun.com", records.data.first.content
  end

  def test_record_list_by_type
    records = Porkbun::Record.list_by_type(domain: "deanpcmad.dev", type: "CNAME", subdomain: "*")
    assert_equal Porkbun::Collection, records.class
    assert_equal Porkbun::Record, records.data.first.class
    assert_equal "pixie.porkbun.com", records.data.first.content
  end

  def test_record_retrieve
    record = Porkbun::Record.retrieve(domain: "deanpcmad.dev", id: "253421437")
    assert_equal Porkbun::Record, record.class
    assert_equal "pixie.porkbun.com", record.content
  end

  def test_record_create
    record = Porkbun::Record.create(
      domain: "deanpcmad.dev",
      type: "A",
      content: "1.2.3.4",
      name: "test2"
    )
    assert_equal Porkbun::Record, record.class
  end

  def test_record_update
    record = Porkbun::Record.update(
      domain: "deanpcmad.dev",
      id: "404108078",
      type: "A",
      content: "1.1.1.1",
      name: "test2"
    )
    assert record
  end

  def test_record_update_by_subdomain
    record = Porkbun::Record.update_by_subdomain(
      domain: "deanpcmad.dev",
      type: "A",
      subdomain: "test2",
      content: "2.2.2.2"
    )
    assert record
  end

  def test_record_delete
    record = Porkbun::Record.delete(
      domain: "deanpcmad.dev",
      id: "253421437"
    )
    assert record
  end

  def test_record_delete_by_subdomain
    record = Porkbun::Record.delete_by_subdomain(
      domain: "deanpcmad.dev",
      type: "A",
      subdomain: "test2"
    )
    assert record
  end

end
