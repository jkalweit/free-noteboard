#include "NoteSubject.h"

#include <QDebug>

NoteSubject::NoteSubject(QObject *parent, quint32 id, QString name) :
    QObject(parent), m_id(id), m_name(name)
{
}


NoteSubject* NoteSubject::addNoteSubject(QString name) {
    NoteSubject* item = new NoteSubject(this, ++m_currentNoteSubjectId, name);
    addNoteSubject(item);
    return item;
}

void NoteSubject::addNoteSubject(NoteSubject *item) {
    m_noteSubjects.append(item);
    noteSubjectsChanged(noteSubjects());
}

QQmlListProperty<NoteSubject> NoteSubject::noteSubjects() {
    return QQmlListProperty<NoteSubject>(this, m_noteSubjects);
}


