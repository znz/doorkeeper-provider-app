# https://github.com/doorkeeper-gem/doorkeeper/pull/432
expected_version = '1.3.1'
unless Doorkeeper::VERSION == expected_version
  raise "Doorkeeper gem version mismatch (expect #{expected_version})"
end
RedirectUriValidator # autoload
class RedirectUriValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, :blank)
    else
      value.split.each do |val|
        uri = ::URI.parse(val)
        return if native_redirect_uri?(uri)
        record.errors.add(attribute, :fragment_present) unless uri.fragment.nil?
        record.errors.add(attribute, :relative_uri) if uri.scheme.nil? || uri.host.nil?
      end
    end
  rescue URI::InvalidURIError
    record.errors.add(attribute, :invalid_uri)
  end
end
