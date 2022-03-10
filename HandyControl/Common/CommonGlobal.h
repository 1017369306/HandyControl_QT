#ifndef COMMONGLOBAL_H
#define COMMONGLOBAL_H

#endif // COMMONGLOBAL_H
#pragma once
#include <QtCore/QtGlobal>

#if !defined(BUILD_STATIC) && !defined(Common_NO_LIB)
#    if defined(Common_Library)
#        define hc_API Q_DECL_EXPORT
#    else
#        define hc_API Q_DECL_IMPORT
#    endif
#else
#    define hc_API
#endif

#ifndef GLOBALDATA_H
#define GLOBALDATA_H

#include <QString>

class GlobalData
{
public:
    static bool flag; //全局变量要加上static关键字
    static int data1;
    static QString str1;
};

#endif // GLOBALDATA_H

