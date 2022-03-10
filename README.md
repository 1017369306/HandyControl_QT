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

## Special statement
Thanks to the inspiration of project <a href="https://github.com/HandyOrg/HandyControl">HandyControl</a>, we have the QT version. At present, this project has just started. We welcome your comments and suggestions.

## Characteristic
1: Perfect transplantation according to the style and logic of <a href="https://github.com/HandyOrg/HandyControl">HandyControl</a>, including basic components and custom components, also with multi-language, multi-subject real-time switching.
2: It supports real-time self-adaptation of each resolution and zoom ratio, which is <a href="https://github.com/HandyOrg/HandyControl">HandyControl</a> function that <a href="https://github.com/HandyOrg/HandyControl">HandyControl</a> does not have (the actual 4K screen and tablet development have stepped on the hole).

## Use
Step 1: Copy the entire HandyControl folder into your main project and add references to the main project. Pro file

```include($$PWD/../../HandyControl/HandyControl.pri)```

Step 2: If multilingual functionality is used, add the following code to the CONFIG of the main project.pro (.pri) :
```CONFIG(debug, debug|release) {
transDir = \"$${path}/Themes/Basics/Trans/\"
} else {
transDir= \"qrc:/Themes/Themes/Basics/Trans/\"
}
```
Where transDir points to the directory where the language resource files for your main project reside

Step 3: Add an import to your project's QML:

`import HcThemes 1.0`

Step 4: Start coding with components wrapped in HandyControl_QT

##Sample diagrams of the main interface and corresponding functions for each feature are updated here later
