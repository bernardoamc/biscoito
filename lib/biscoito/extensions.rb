class String
  # From ActiveSupport
  def underscore
    return self unless self =~ /[A-Z-]|::/
    word = self.to_s.gsub('::'.freeze, '/'.freeze)
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2'.freeze)
    word.gsub!(/([a-z\d])([A-Z])/, '\1_\2'.freeze)
    word.tr!("-".freeze, "_".freeze)
    word.downcase!
    word
  end
end
