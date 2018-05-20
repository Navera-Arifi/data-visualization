FROM ubuntu:16.04

RUN apt-get update

# Install gcc + dependencies
RUN apt-get install build-essential -y

# for deployment on apache2
RUN apt-get install -y apt-utils vim curl apache2 apache2-utils
RUN apt-get -y install libapache2-mod-wsgi

# Install Python + dependencies
RUN apt-get install python-pip -y python-dev -y
RUN pip install --upgrade pip

# Install other dependencies
RUN pip install numpy
RUN pip install bokeh==0.12.13
RUN pip install Django

# Copy project to container path
COPY ./framework/ /var/www/html
ADD ./apache2.conf /etc/apache2/sites-available/000-default.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# permission handling
RUN chown -R root:www-data /var/www/html/dashboard/
RUN chmod -R 775 /var/www/html/dashboard/

EXPOSE 80 3500

CMD ["apache2ctl", "-D", "FOREGROUND"]

