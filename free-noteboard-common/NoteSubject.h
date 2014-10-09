#ifndef NOTESUBJECT_H
#define NOTESUBJECT_H

#include <QObject>
#include <QQmlListProperty>

class NoteSubject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(quint32 id MEMBER m_id NOTIFY idChanged)
    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)
    Q_PROPERTY(QQmlListProperty<NoteSubject> noteSubjects READ noteSubjects NOTIFY noteSubjectsChanged)
public:
    explicit NoteSubject(QObject *parent = 0, quint32 id = 0, QString name = "");

    QQmlListProperty<NoteSubject> noteSubjects();
    Q_INVOKABLE NoteSubject* addNoteSubject(QString name);
    void addNoteSubject(NoteSubject *noteSubject);

signals:
    void idChanged(quint32);
    void nameChanged(QString);
    void noteSubjectsChanged(QQmlListProperty<NoteSubject>);

private:
    quint32 m_id;
    QString m_name;
    quint32 m_currentNoteSubjectId;
    QList<NoteSubject*> m_noteSubjects;

};

#endif // NOTESUBJECT_H
