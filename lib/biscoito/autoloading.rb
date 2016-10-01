class Object
  def self.const_missing(const)
    @fetched_consts ||= {}
    raise "Class not found: #{const}" if @fetched_consts[const]
    @fetched_consts[const] = 1

    require const.to_s.underscore
    klass = Object.const_get(const)

    klass or raise "Class not found: #{const}"
  end
end
