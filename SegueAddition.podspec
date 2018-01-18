Pod::Spec.new do |s|
  s.name = 'SegueAddition'
  s.version = '1.2.0'
  s.license = 'MIT'
  s.homepage = 'https://github.com/bannzai/'
  s.summary = 'Easily way to write perfromSegueWithIdentifier.'
  s.authors = { 'bannzai' => 'kingkong999yhirose@gmail.com' }
  s.source = { :git => 'https://github.com/bannzai/SegueAddition.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'Classes/*.swift'
end


