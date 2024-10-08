# Custom Issue Style Plugin for Redmine

![GitHub repo size](https://img.shields.io/github/repo-size/amats6655/custom_issue_style) ![GitHub issues](https://img.shields.io/github/issues/amats6655/custom_issue_style)

## Описание
Плагин **Custom Issue Style** позволяет пользователям переопределять стили отображения заявок в интерфейсе Redmine. 
Он предоставляет возможность настройки стилей для детального описания заявки и списка заявок, а также управлять отображением 
этих стилей в зависимости от роли пользователя.

## Установка

1. Скачайте или склонируйте репозиторий плагина в папку `plugins` вашего Redmine:
    ```
    git clone https://github.com/amats6655/custom_issue_style.git
    ```

2. Перезапустите Redmine для применения изменений.

3. Перейдите в раздел `Администрирование -> Плагины` и убедитесь, что плагин **Custom Issue Style** установлен.

## Настройка

1. Перейдите в раздел `Администрирование -> Плагины -> Custom Issue Style -> Настройки`.
2. Настройте следующие параметры:
   - **Включить стили:** Включает или выключает использование пользовательских стилей.
   - **Режим отображения:** Определяет, кто будет видеть пользовательские стили:
     - `Только администратор`: Стили будут отображаться только администраторам.
     - `Все пользователи`: Стили будут отображаться всем пользователям.
   - **Стиль для детального описания заявки:** Введите CSS стили, которые будут применяться к детальному описанию заявки.
   - **Стиль для списка заявок:** Введите CSS стили, которые будут применяться к списку заявок.

## Важная информация

### Замена идентификатора поля
Пожалуйста, замените все вхождения `custom_field_id = 241` в файлах плагина на фактический идентификатор вашего пользовательского поля.

### Создание пользовательского поля
Для работы плагина необходимо создать пользовательское поле для объекта **Пользователь** с булевым типом. Это поле будет определять, будет ли пользователь использовать новый стиль или нет.

1. Перейдите в раздел `Администрирование -> Настраиваемые поля -> Новое настраиваемое поле -> Пользователи`.
2. Создайте новое пользовательское поле с типом `Булево` (True/False).
3. Запомните идентификатор (ID) созданного поля и замените его в коде плагина вместо `241`.

### Указание локализации для custom_fields
Для корректного отображения списка заявок в случае использования стилей из папки `Templates` необходимо указать локализованные названия для ваших настраиваемых полей `config/locales/`

## Использование

Плагин автоматически применяет стили в зависимости от настроек и значений пользовательского поля. 
Если значение этого поля равно `1`, то пользователь увидит новый интерфейс в зависимости от настроек плагина.

## Описание работы скриптов

- **_detail_view.erb**: Этот скрипт отвечает за применение пользовательских стилей на странице детального описания заявки. 
Он проверяет, включены ли стили и задан ли режим отображения. Если текущий пользователь соответствует условиям отображения (например, администратор), 
то в зависимости от значения пользовательского поля загружаются стили, определенные в настройках плагина. Также, если пользователь заходит с мобильного устройства, 
скрипт скрывает пустые атрибуты и добавляет красную границу к обязательным полям, если они не заполнены.

- **_list_view.erb**: Этот скрипт применяется к странице списка заявок. Он также проверяет, включены ли стили и задан ли режим отображения. 
Если условия выполнены, скрипт добавляет пользовательские стили для элементов списка. Он обрабатывает отображение заголовков для мобильных устройств, 
скрывает элементы, которые не должны отображаться, и добавляет тени и границы для улучшения визуального восприятия на мобильных устройствах.

## Примеры стилей
Вы можете использовать или переопределить стили из папки Templates. 
<img width="400" alt="image" src="https://github.com/user-attachments/assets/5a147be5-b5e2-4c58-ac5e-e28c114e436c">
<img width="400" alt="image" src="https://github.com/user-attachments/assets/ac6a4b57-22a3-4a71-8534-53a2227edf74">




## Структура проекта

- `init.rb`: Инициализация плагина и регистрация в Redmine.
- `lib/custom_issue_style_hook_listener.rb`: Основная логика плагина, которая добавляет пользовательские стили на страницы.
- `config/locales/ru.yml`: Локализация на русском языке.
- `app/views/issues/_detail_view.erb`: Представление для отображения детального описания заявки с применением пользовательских стилей.
- `app/views/issues/_list_view.erb`: Представление для отображения списка заявок с применением пользовательских стилей.
- `app/views/settings/_custom_issue_style_settings.html.erb`: Настройки плагина в интерфейсе администратора.
- `templates/list_issues.css`: Стили для отображения списка заявок на мобильных устройствах.
- `templates/detail_issue_view.css`: Стили для отображения детального вида заявки на мобильных устройствах.

## Автор
**Andrey Mats**

- [GitHub](https://github.com/amats6655)
- [Telegram](https://t.me/amats)
