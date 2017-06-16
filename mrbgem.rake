MRuby::Gem::Specification.new('mruby-plato-serial-enzi') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Plato developers'
  spec.description = 'PlatoEnzi::Serial class'

  spec.add_dependency('mruby-plato-machine')
  spec.add_dependency('mruby-plato-machine-enzi')
  spec.add_dependency('mruby-plato-serial')
end
