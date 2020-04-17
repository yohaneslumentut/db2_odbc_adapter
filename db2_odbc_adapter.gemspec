lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odbc_adapter/version'

Gem::Specification.new do |spec|
  spec.name          = 'db2_odbc_adapter'
  spec.version       = ODBCAdapter::VERSION
  spec.authors       = ['Yohanes']
  spec.email         = ['yohanes.lumentut@gmail.com']

  spec.summary       = 'An ActiveRecord DB2 ODBC adapter'
  spec.homepage      = 'https://github.com/yohaneslumentut/db2_odbc_adapter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby-odbc', '~> 0.99999'
end
