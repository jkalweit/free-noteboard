#include <QApplication>
#include <QtQml>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "NoteBoard.h"
#include "NoteSubject.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<NoteBoard>("FreeNoteBoard", 1, 0, "NoteBoard");
    qmlRegisterType<NoteSubject>("FreeNoteBoard", 1, 0, "NoteSubject");

    NoteBoard *nb = new NoteBoard();

    NoteSubject *ns = nb->addNoteSubject("#1 - SAFETY");
    ns->addNoteSubject("Safety Glasses MUST BE WORN at Back of Brazing Belts and Mesh Belt tempers");
    ns->addNoteSubject("If a Fire Extinquisher is used for any reason - Report it immediately");


    nb->addNoteSubject("1 - HOT LIST");
    nb->addNoteSubject("24\"");
    ns = nb->addNoteSubject("AFC-1");
    NoteSubject *ns2 = ns->addNoteSubject("Grass America");
    ns2->addNoteSubject("2 Sample orders");
    ns2->addNoteSubject("NOTE MATERIAL AND TEMPERING TEMPERATURES");
    ns2->addNoteSubject("DO NOT MIX");

    ns->addNoteSubject("Grass America");
    ns->addNoteSubject("Peterson Spring");
    ns->addNoteSubject("Set up for Carburize");
    ns->addNoteSubject("Aiken");

    nb->addNoteSubject("AFC-2");
    nb->addNoteSubject("Batch");
    nb->addNoteSubject("Blast");
    nb->addNoteSubject("Deliveries / Pick up");
    nb->addNoteSubject("Endo Generators");
    nb->addNoteSubject("Plant Information");
    nb->addNoteSubject("Quality");
    nb->addNoteSubject("Stock / Cleaning Schedule");


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("nb", (QObject*)nb);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
