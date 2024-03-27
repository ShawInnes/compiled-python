# Use an official Python runtime as a parent image
FROM python:3.12 as build

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Compile Cython code
RUN python setup.py build_ext

FROM python:3.12-slim as runtime

WORKDIR /app

COPY --from=build /app/requirements.txt .
COPY --from=build /app/*.so .

RUN pip install -r requirements.txt

EXPOSE 80

ENV PORT 80

# Run main.py when the container launches
CMD ["gunicorn", "api:app", "--access-logfile", "-", "--error-logfile", "-"]
