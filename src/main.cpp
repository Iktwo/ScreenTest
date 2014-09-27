#include <QApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QScreen>

#include "uivalues.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QCoreApplication::setOrganizationName("Iktwo");
    QCoreApplication::setOrganizationDomain("iktwo.com");
    QCoreApplication::setApplicationName("ScreenTest");

    UIValues uiValues;
    engine.rootContext()->setContextProperty("physicalDotsPerInch", qApp->primaryScreen()->physicalDotsPerInch());
    engine.rootContext()->setContextProperty("physicalDotsPerInchX", qApp->primaryScreen()->physicalDotsPerInchX());
    engine.rootContext()->setContextProperty("physicalDotsPerInchY", qApp->primaryScreen()->physicalDotsPerInchY());
    engine.rootContext()->setContextProperty("ui", &uiValues);
    engine.load(QUrl(QStringLiteral("qrc:/qml/qml/main.qml")));

    return app.exec();
}

