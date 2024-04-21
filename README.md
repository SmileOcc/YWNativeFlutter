# YWNativeFlutter


文件夹层级（同级或内级）
### 以本地flutter项目代码源与iOS项目同级
--Demo
--------ios_demo
--------flutter_model

### 以本地flutter项目代码源在iOS项目里
--Demo
--------ios_demo
----------------flutter_model


====================================

1、flutter create --template module 项目名称
如：flutter create --template module flutter_model

2、flutter build ios 或 flutter build ios --no-codesign

3、创建iOS项目，如ios_demo

4、iOS项目Podfile添加,如何执行 pod install

>>>>>>>
>>>>>>>

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

####flutter源码项目（flutter_model）在iOS项目内
####flutter_application_path = 'flutter_module'
####load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

####项目在iOS项目内
flutter_application_path = '../flutter_module'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')


target ‘YWNativeDemo’ do

  install_all_flutter_pods(flutter_application_path)

post_install do |installer|
  flutter_post_install(installer)
    
end

end

>>>>>
>>>>>


5、如引用import Flutter 提示找不到，可以尝试
>>>在项目的【builde Settings] -> 【Search Paths】-> 【Framework Search Paths】-> 添加："${PODS_CONFIGURATION_BUILD_DIR}/Flutter"
