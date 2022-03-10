#ifndef DESKTOPHELPER_H
#define DESKTOPHELPER_H

#include <QObject>
#include <QApplication>
#include <QDesktopWidget>
#include <QScreen>

class DesktopHelper : public QObject
{
    Q_OBJECT
public:
    explicit DesktopHelper(QObject *parent = 0);
//    explicit DesktopHelper(QApplication* app, QObject* parent = nullptr);

public:
    //获得当前的缩放比例因子
    double GetCurrentScale();
    //根据当前的缩放比例因子进行缩放
//    virtual void UpdateSize(double scaleValue);

private:
    QApplication *app;

signals:

public slots:

};

#endif // DESKTOPHELPER_H
