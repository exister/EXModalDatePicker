Pod::Spec.new do |s|
  s.name         = "EXModalDatePicker"
  s.version      = "0.0.1"
  s.summary      = "Simple DatePicker Modal View"
  s.homepage     = "https://github.com/exister/EXModalDatePicker.git"
  s.license      = 'MIT'
  s.author       = { "Mikhail Kuznetsov" => "mkuznetsov.dev@gmail.com" }
  s.source       = { :git => "https://github.com/exister/EXModalDatePicker.git", :tag => "0.0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Source/*'
  s.requires_arc = true
end