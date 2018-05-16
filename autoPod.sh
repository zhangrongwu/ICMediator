
#!/bin/bash
#该脚本仅适用于cocoapods生成的framework静态库
frameworkName='ICMediator'
#修改
oldversion='0.1.0'
#修改
version='0.1.0.5'
message='${version}版本ICMediator发布第一个pod'



pod lib lint ${frameworkName}.podspec  --no-clean --verbose --allow-warnings 
#代码提交到服务器
git add .
git commit -a -m${version}${message}
git tag -a $version -m${message}
git push origin ${version}
git push -u origin master 
#修改version
sed -i '' "s/${oldversion}/${version}/g" ${frameworkName}.podspec




#发布pod使用
##########################################################################
pod spec lint --allow-warnings
#发布到cocoapods库
pod trunk push ${frameworkName}.podspec --allow-warnings

#!!!!!The spec did not pass validation, due to 902 warnings!!!!!!!!!!! 警告忽略就是了
##########################################################################




#打包成SDK，拷贝到自己的demo目录，并且上传到github等操作
##########################################################################
#pod package ${frameworkName}.podspec --force
#sdkFilePath=$(cd `dirname $0`;pwd)
#SDK="${sdkFilePath}/iComeSDK-${version}/ios/iComeSDK.framework"
##自己编写的sdk测试demo所在位置
#DEMOPATH="/Users/zhangrongwu/iComeProj/iComeDemo-SDK"
#cp -rf ${SDK} ${DEMOPATH}
##到sdk使用目录下
#cd /Users/zhangrongwu/iComeProj/iComeDemo-SDK
##上传文件，其中autoPush.sh文件是放在demo中的git上传文件脚本，可自己实现
#sh /Users/zhangrongwu/iComeProj/iComeDemo-SDK/autoPush.sh ${version} ${message}
##########################################################################

