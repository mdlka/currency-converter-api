# Currency Converter API

API для конвертации валют, разработанное на Ruby on Rails.

## Основные возможности

- Конвертация валют по актуальному курсу
- Поддержка всех основных мировых валют (трехбуквенные коды ISO 4217)
- Кэширование курсов валют для минимизации запросов к внешнему API
- Сохранение истории конвертаций в базе данных
- Валидация входных данных
- Обработка ошибок с понятными сообщениями

## Технологии

- Ruby on Rails 8.0.2
- SQLite3
- [ExchangeRate API](https://www.exchangerate-api.com/) для получения актуальных курсов валют

## API Endpoints

### Конвертация валют

```
GET /api/convert
```

Параметры запроса:
- `from`: Код валюты, из которой конвертируем (например, "USD")
- `to`: Код валюты, в которую конвертируем (например, "RUB")
- `amount`: Сумма для конвертации

Пример запроса:
```
GET /api/convert?from=USD&to=RUB&amount=100
```

Пример успешного ответа:
```json
{
   "id": 1,
   "from": "USD",
   "to": "RUB",
   "amount": "100.0",
   "result": "7834.7",
   "created_at": "2025-06-26T13:54:54.312Z",
   "updated_at": "2025-06-26T13:54:54.312Z"
}
```

## Установка и запуск

1. Клонируйте репозиторий
2. Установите зависимости: `bundle install`
3. Настройте базу данных: 
   ```bash
   rails db:create
   rails db:migrate
   ```
4. Добавьте ключ API от [ExchangeRate API](https://www.exchangerate-api.com/) в credentials:
   ```bash
   EDITOR="code --wait" rails credentials:edit
   ```
   Добавьте строку:
   ```yaml
   exchangerate_api_key: ваш_ключ_api
   ```
5. Запустите сервер: `rails server`

