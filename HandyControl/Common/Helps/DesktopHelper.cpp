#include "DesktopHelper.h"

DesktopHelper::DesktopHelper(QObject* parent)
    : QObject(parent)
{
}
//DesktopHelper::DesktopHelper(QApplication *app,QObject* parent)
//    : QObject(parent),app(app)
//{
//}

double DesktopHelper::GetCurrentScale(){
    QDesktopWidget* desktopWidget = QApplication::desktop();
    int logicWidth = desktopWidget->width();
    int logicalDpiX = desktopWidget->logicalDpiX();

    //    缩放因子
    double scaleValue= 1.0;
    //大于4K，即8K
    if(logicWidth>4090)
        scaleValue=2.2;
    //大于3K，即4K
    else if(logicWidth>3200)
        scaleValue=1.6;
    //大于2.5K，即3K
    else if(logicWidth>2560)
        scaleValue=1.2;
    //大于2K，即2.5K，以此分辨率为标准
    else if(logicWidth>2048)
        scaleValue=1;
    //2K
    else if(logicWidth>1920)
        scaleValue=0.9;
    else if(logicWidth>1280)
        scaleValue=0.8;
    else
        scaleValue=0.6;

    //获取桌面缩放比例（例如200%）
    double desktopScale = logicalDpiX/ 96.0;
//    scaleValue = scaleValue/ desktopScale;

    return  scaleValue;

//    int desktop_widthMM = desktopWidget->widthMM();
//    int desktop_highMM = desktopWidget->heightMM();
//    int physicalDpiX = desktopWidget->physicalDpiX();
//    QScreen *screenTemp=QApplication::primaryScreen();
//    int logicalDotsPerInch = screenTemp->logicalDotsPerInch();
//    int logicalDotsPerInchX = screenTemp->logicalDotsPerInchX();
//    int geometrywidth = screenTemp->geometry().width();
//    QRect screenRect =  screenTemp->availableVirtualGeometry();

}

//void DesktopHelper::UpdateSize(double scaleValue){
//    QObject *themeStyle = this->app->findChild<QObject *>("themeStyle");
//    if(themeStyle!=nullptr){
//        double readonlyControlHeight = themeStyle->property("readonlyControlHeight").toDouble();
//        double defaultControlHeight = themeStyle->property("defaultControlHeight").toDouble();
//        scaleValue = scaleValue * (readonlyControlHeight/defaultControlHeight);

//        QVariant returnedValue;
//        QVariant param = scaleValue;
//        //调用themeStyle中的updateSizeProperty方法
//        QMetaObject::invokeMethod(themeStyle, "updateSizeProperty", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, param));

//    }
//}
