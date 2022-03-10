<p align="center">
    <a href="https://github.com/HandyOrg/HandyControl/blob/master/README-cn.md">中文</a> 
    ❤ 
    <a href="https://github.com/HandyOrg/HandyControl/blob/master/README.md">English</a>
</p>

<p align="center"> 
    <img alt="dotnet-version" src="https://img.shields.io/badge/IDE-QT%20Creator-blue"></img>
    <img alt="csharp-version" src="https://img.shields.io/badge/QT-%3E%3D5.14.2-blue"></img>
    <a href="https://github.com/HandyOrg/HandyControl/actions?query=workflow%3Abuild">
        <img alt="Github-build-status" src="https://github.com/HandyOrg/HandyControl/workflows/build/badge.svg"></img>
    </a>
</p>

## 特别声明

感谢<a href="https://github.com/HandyOrg/HandyControl">HandyControl</a>项目的启发，才有了其QT版本，目前此项目刚刚起步，欢迎各位大佬提出意见和建议。<br/>

## 特点
1: 完美按<a href="https://github.com/HandyOrg/HandyControl">HandyControl</a>的样式和逻辑进行移植，包括了基础组件和自定义组件，同样具备多语言、多主体实时切换。
2: 支持各分辨率、缩放比例实时自适应，这是<a href="https://github.com/HandyOrg/HandyControl">HandyControl</a>所不具备的功能（实际的4K屏幕、平板开发中踩过的坑）。

## 用法

Step 1: 把整个HandyControl文件夹拷贝至你的主项目中，并在主项目.pro文件中添加引用 

```include($$PWD/../../HandyControl/HandyControl.pri)```

Step 2: 如果使用到了多语言功能，请在主项目.pro（.pri）的CONFIG中添加如下代码:
```CONFIG(debug, debug|release) {
transDir = \"$${path}/Themes/Basics/Trans/\"
} else {
transDir= \"qrc:/Themes/Themes/Basics/Trans/\"
}
```
其中transDir指向您主项目的语言资源文件所在的目录

Step 3: 在您的项目的QML添加import:
`import HcThemes 1.0`

Step 4: 开始使用HandyControl_QT封装的组件进行编码

## 主界面及相应的每个功能的示例图稍后更新至此