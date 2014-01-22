module MiniTest::Assertions

  def assert_connects_to_endpoint(endpoint, opts={})
    fixture = opts[:fixture]
    method = opts[:method] || :get

    @connection.expect(method, fixture, [endpoint])
    @result = yield
    @connection.verify
  end

  def assert_returns_array_of(obj_class, opts={}, &blk)
    assert_connects_to_endpoint(opts[:endpoint], fixture: opts[:fixture], &blk)

    assert @result.is_a? Array
    assert @result.first.is_a? obj_class
  end

  def assert_returns_one_of(obj_class, opts={}, &blk)
    assert_connects_to_endpoint(opts[:endpoint], fixture: opts[:fixture], &blk)

    assert @result.is_a? obj_class

  end
end