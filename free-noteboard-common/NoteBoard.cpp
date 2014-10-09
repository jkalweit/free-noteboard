#include "NoteBoard.h"

#include <QDebug>


NoteBoard::NoteBoard(QObject *parent) :
    QObject(parent), m_currentNoteSubjectId(0)
{
}



NoteSubject* NoteBoard::addNoteSubject(QString name) {
    NoteSubject* item = new NoteSubject(this, ++m_currentNoteSubjectId, name);
    addNoteSubject(item);
    return item;
}

void NoteBoard::addNoteSubject(NoteSubject *item) {
    m_noteSubjects.append(item);
    noteSubjectsChanged(noteSubjects());
}

QQmlListProperty<NoteSubject> NoteBoard::noteSubjects() {
    return QQmlListProperty<NoteSubject>(this, m_noteSubjects);
}
