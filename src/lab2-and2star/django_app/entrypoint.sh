#!/bin/bash

# Ждем пока PostgreSQL будет готова


echo "PostgreSQL started"

# Применяем миграции
echo "Applying database migrations..."
python manage.py migrate

# Создаем суперпользователя
echo "Creating superuser..."
python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
    print('Superuser created: admin/admin123')
else:
    print('Superuser already exists')
"

# Запускаем сервер
echo "Starting Django server..."
exec "$@"