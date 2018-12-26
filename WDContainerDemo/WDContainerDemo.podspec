Pod::Spec.new do |s|
    s.name         = 'XJContainerController'
    s.version      = '0.0.1'
    s.summary      = 'UTV personal page'
    s.homepage     = 'https://github.com/xjThree/XJContainerController.git'
    s.license      = 'MIT'
    s.authors      = {'XJCode' => '250323489@qq.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/xjThree/XJContainerController.git', :tag => s.version}
    s.source_files = 'WDContainerDemo/Sources/**/*.{h,m}'
    s.requires_arc = true
end
