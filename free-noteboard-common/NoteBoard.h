#ifndef NOTEBOARD_H
#define NOTEBOARD_H

#include <QObject>
#include <QQmlListProperty>

#include "NoteSubject.h"

class NoteBoard : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<NoteSubject> noteSubjects READ noteSubjects NOTIFY noteSubjectsChanged)
public:
    explicit NoteBoard(QObject *parent = 0);

    QQmlListProperty<NoteSubject> noteSubjects();
    Q_INVOKABLE NoteSubject* addNoteSubject(QString name);
    void addNoteSubject(NoteSubject *noteSubject);

signals:
    void noteSubjectsChanged(QQmlListProperty<NoteSubject>);
public slots:

private:
    quint32 m_currentNoteSubjectId;
    QList<NoteSubject*> m_noteSubjects;

};

#endif // NOTEBOARD_H
