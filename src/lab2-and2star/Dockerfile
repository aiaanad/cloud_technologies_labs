FROM python:3.11-slim

# Создать пользователя
RUN groupadd -r appuser && useradd -r -g appuser appuser
WORKDIR /app

# Копировать только нужное
COPY requirements.txt .
# Чистим кэш при установке
RUN pip install --no-cache-dir -r requirements.txt
# Копировать код
COPY django_app/ .

# Объединить команды
RUN chmod +x /app/entrypoint.sh && \
    chown -R appuser:appuser /app

USER appuser
EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000", "--insecure"]
