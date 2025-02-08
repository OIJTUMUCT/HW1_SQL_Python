# HW1 PostgreSQL+Python (описание ниже)
## SQL схема
![customer and transaction (white)](https://github.com/user-attachments/assets/494be466-2170-46e7-b804-f7594ca1a4f6)
## Результат
<p align="center">
  <img src="https://github.com/user-attachments/assets/20231fc9-426b-4bbc-88f4-020011f01a5c" alt="image">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/04a7e40a-32af-4f0e-a2dc-48aa2530c35f" alt="image">
</p>
<p align="center">
  <img src="" alt="image">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/17399e6e-c125-4327-a3f6-80a921f98bcf" alt="image">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/ea55547f-bd11-42b3-b010-8de425829390" alt="image">
</p>

- Работа выполнялась с использованием языка Python и сопутствующих библиотек для работы с PostgreSQL, csv-файлами, данными, SQL. Для наглядности результаты представлены также в программной оболочке DBeaver.
- Изначально таблицы БД находились в 1НФ:
  - Все атрибуты простые;
  - Все сохраняемые данные на пересечении столбцов и строк содержат только скалярные значения.
- Для перехода к 2НФ и 3НФ необходимо, чтобы в каждой таблицы был уникальный ключевой атрибут, а все остальные зависели только от него. Отсутствие возможной транзитивности. Например, выделить атрибут product_id в отдельную таблицу с другими атрибутами. При проведении транзакции мы обращаемся по product_id и получаем информацию характерную для продукта. (Почему list_price вынесен отдельно и находится в transaction? - Предполагается, что это является результатом некой бизнес-логики, в которой берётся себестоимость продукта и по определённым правилам представляется уже ценой в транзакции). Отдельно вынесено финансовое положение (один к одному), предполагается, что у одного покупателя может быть одно финансовое положение (индикатор смерт). Возможное улучшение - "разнести" для каждого покупателя финансовое положение во времени (в направлении к 6НФ). Адреса выделены отдельно со связью (один ко многим). Это даёт возможность добавления нового функционала - пользователь теперь может добавлять несколько адресов, которые могут использовать сторонние сервисы - например, доставка.
  - Особенности выполнения: в процессе анализа и разделения потенциальных таблиц возникла потребность в создании или обновлении ключевых атрибутов, чтобы они обладали уникальностью и не теряли связность после разделения. Для этой цели написал простую функцию хеширования (алгоритм sha256), позволяющая выделить все уникальные записи (потенциальной таблицы) и создать для них ключевой атрибут в виде индекса.
