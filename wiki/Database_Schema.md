# Схема базы данных

В приложении используется локальная реляционная база данных **SQLite** для хранения загруженных фактов, их метаданных и статуса «Избранное». 

## 1. ER-диаграмма
Ниже представлена визуальная схема таблицы.

<img width="279" height="171" alt="image" src="https://github.com/user-attachments/assets/41f96b3b-d55e-4fb1-a801-90f348872f94" />

---

## 2. Описание таблицы `facts`

Это единственная таблица в текущей версии приложения (Database Version: 3), которая хранит всю необходимую информацию.

| Колонка | Тип данных | Описание | Ограничения |
| :--- | :--- | :--- | :--- |
| **id** | INTEGER | Уникальный идентификатор записи. | PRIMARY KEY, AUTOINCREMENT |
| **fact_text** | TEXT | Текст интересного факта. | NOT NULL |
| **timestamp** | INTEGER | Время добавления факта (в миллисекундах Unix). | NOT NULL |
| **is_favorite** | INTEGER | Флаг избранного (0 — нет, 1 — да). | DEFAULT 0 |

---

## 3. SQL-скрипт (DDL)

Для воссоздания структуры базы данных в сторонних инструментах (например, в DB Browser for SQLite) или для анализа структуры, используйте следующий файл:

📄 **[Скачать schema.sql](https://github.com/fpmi-pmvs2026/pmvs12a-project-skebob/blob/main/scripts/schema.sql)**

### Код создания таблицы:
```sql
CREATE TABLE facts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fact_text TEXT NOT NULL,
    timestamp INTEGER NOT NULL,
    is_favorite INTEGER DEFAULT 0
);