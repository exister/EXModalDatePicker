Pod::Spec.new do |s|
  s.name         = "EXModalDatePicker"
  s.version      = "0.0.6"
  s.summary      = "Simple DatePicker Modal View"
  s.homepage     = "https://github.com/exister/EXModalDatePicker.git"
  s.license      = 'MIT'
  s.author       = { "Mikhail Kuznetsov" => "mkuznetsov.dev@gmail.com" }
  s.source       = { :git => "https://github.com/exister/EXModalDatePicker.git", :tag => "0.0.6" }
  s.platform     = :ios, '7.0'
  s.source_files = 'Source/*.{h,m}'
  s.resource     = 'Source/*.xib'
  s.requires_arc = true
end