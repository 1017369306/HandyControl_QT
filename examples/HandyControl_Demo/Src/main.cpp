#include <QApplication>
#include <QQmlApplicationEngine>
#include "AppInfo.h"
//#include "DeviceAddTable/DeviceAddModel.h"
#include <Common/Frameless/FrameLessView.h>
//#include "Logger/Logger.h"
#include <Common/QuickTool/QuickTool.h>
#include <Common/Trans/Trans.h>
#include <QDir>
#include <QApplication>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickItem>
#include <QUrl>
#include <QApplication>
#include <QDesktopWidget>
#include <QObject>
#include <QPaintDevice>
#include <QObject>
#include <QScreen>
#include <QRect>
#include <Common/Helps/DesktopHelper.h>

#ifdef QMAKE_GEN_GlobalData
#include "Common/Common/AllPath.h"
#endif

static void prepareApp()
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    //    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication::setAttribute(Qt::AA_DisableHighDpiScaling);
    QApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
#    if (QT_VERSION >= QT_VERSION_CHECK(5, 14, 0))
    QApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);
#    endif
#endif
    QCoreApplication::setOrganizationName("Jared");
    QCoreApplication::setOrganizationDomain("https://jared.github.io");
    QCoreApplication::setApplicationName("HandyControl");
}

int main(int argc, char **argv)
{
    prepareApp();
    QApplication app(argc, argv);

    const auto appPath = QDir::cleanPath(app.applicationDirPath());
    qWarning() << "appPath" << appPath;

    Trans trans;
    AppInfo appInfo;
    QuickTool quickTool;

    FrameLessView view;
    view.setMinimumSize({ 800, 450 });
    view.resize(800, 450);
    trans.beforeUiReady(view.rootContext(), transDir);
    appInfo.beforeUiReady(view.rootContext());

    view.engine()->addImportPath(qmlPath);
#ifdef HcImport
    view.rootContext()->setContextProperty("HcImportPath", HcImport);
    view.engine()->addImportPath(HcImport);
    qWarning() << "HcImportPath " << HcImport;
#endif

#ifdef HcImage
    view.rootContext()->setContextProperty("HcImagePath", HcImage);
#endif

#ifdef HcSvg
    view.rootContext()->setContextProperty("HcSvgPath", HcSvg);
#endif

#ifdef DEBUG
    view.rootContext()->setContextProperty("isDebug", true);
#else
    view.rootContext()->setContextProperty("isDebug", QVariant(false));
#endif

    view.rootContext()->setContextProperty("qmlPath", qmlPath);
    view.rootContext()->setContextProperty("imgPath", imgPath);
    //    view.rootContext()->setContextProperty("contentsPath", contentsPath);
    view.rootContext()->setContextProperty("appPath", appPath);
    view.rootContext()->setContextProperty("view", &view);
    view.rootContext()->setContextProperty("quickTool", &quickTool);

    //    DeviceAddModel model;
    QDesktopWidget* desktopWidget = QApplication::desktop();
    DesktopHelper *desktopHelper = new DesktopHelper(&view);

    //    view.rootContext()->setContextProperty("deviceAddModel", &model);
    const QUrl url(qmlPath + QStringLiteral("main.qml"));
    QObject::connect(&view, &QQuickView::statusChanged, &view, [&](QQuickView::Status status) {
        if (status == QQuickView::Status::Ready) {
            trans.afterUiReady();
            appInfo.afterUiReady();
            quickTool.setRootObjet(view.rootObject());

            //            第一次加载时根据缩放比例更新动态属性
            double scaleValue = desktopHelper->GetCurrentScale();
            QQuickItem *rootObject = view.rootObject();
            if(rootObject!=nullptr){
                QVariant returnedValue;
                QVariant scaleValueTemp = scaleValue;
                //调用themeStyle中的updateSizeProperty方法
                QMetaObject::invokeMethod(rootObject, "updateSizeProperty", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, scaleValueTemp));
            }
        }
    });
    //qml call 'Qt.quit()' will emit engine::quit, here should call qApp->quit
    QObject::connect(view.engine(), &QQmlEngine::quit, qApp, &QCoreApplication::quit);
    //qml clear content before quit
    QObject::connect(qApp, &QApplication::aboutToQuit, qApp, [&view](){view.setSource({});});

    QObject::connect(desktopWidget, &QDesktopWidget::workAreaResized, [&](int value){
        //        int logicWidth = desktopWidget->width();
        //        int logicalDpiX = desktopWidget->logicalDpiX();
        //        int desktop_widthMM = desktopWidget->widthMM();
        //        int desktop_highMM = desktopWidget->heightMM();
        //        int physicalDpiX = desktopWidget->physicalDpiX();
        //        QScreen *screenTemp=QApplication::primaryScreen();
        //        int logicalDotsPerInch = screenTemp->logicalDotsPerInch();
        //        int logicalDotsPerInchX = screenTemp->logicalDotsPerInchX();
        //        int geometrywidth = screenTemp->geometry().width();
        //        QRect screenRect =  screenTemp->availableVirtualGeometry();
        //        int a= 0;

        double scaleValue = desktopHelper->GetCurrentScale();
        QQuickItem *rootObject = view.rootObject();/* quickTool.rootObject();*/
        if(rootObject!=nullptr){
            //            QVariant readonlyControlHeight;
            //            QVariant defaultControlHeight;
            //            QMetaObject::invokeMethod(rootObject, "getReadonlyControlHeight", Q_RETURN_ARG(QVariant,readonlyControlHeight));
            //            QMetaObject::invokeMethod(rootObject, "getDefaultControlHeight", Q_RETURN_ARG(QVariant,defaultControlHeight));
            //            scaleValue = scaleValue * (readonlyControlHeight.toDouble()/defaultControlHeight.toDouble());

            QVariant returnedValue;
            QVariant scaleValueTemp = scaleValue;
            //调用themeStyle中的updateSizeProperty方法
            QMetaObject::invokeMethod(rootObject, "updateSizeProperty", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, scaleValueTemp));
        }
    });

    QStringList pathList = view.engine()->importPathList();
    foreach (QString str, pathList) {
        qDebug() << str;
    }

    QQuickItem *qQuickItem = view.rootObject();
    QVariant text;
    QVariant param;
    QMetaObject::invokeMethod(view.rootObject(), "getTitleWidth", Q_RETURN_ARG(QVariant,text),Q_ARG(QVariant, param));
    qDebug() << text.toString();

    //设置窗口最大化
    view.setWindowState(Qt::WindowMaximized);
    view.setSource(url);
    view.moveToScreenCenter();
    view.show();

    return app.exec();
}

