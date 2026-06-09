# Use official lightweight Python image
FROM python:3.11-slim

# Metadata
LABEL maintainer="Samruddhi Sakharkar"
LABEL project="Multi Environment Deployment Pipeline"

# Set working directory
WORKDIR /app

# Copy application files
COPY app.py .

# Create non-root user for security
RUN useradd -m appuser

# Give permissions
RUN chown -R appuser /app

# Switch to non-root user
USER appuser

# Environment variable
ENV ENVIRONMENT=production

# Expose application port
EXPOSE 5000

# Health check
HEALTHCHECK CMD python --version || exit 1

# Start application
CMD ["python", "app.py"]
