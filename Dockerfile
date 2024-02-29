# We're building our image from the official Odoo Community version 15 image available on the Docker Hub.
FROM odoo:15

# We'll log on as root user  
USER root

# As root we can add read and execute permissions for all users (others) on all files and folders in the 
# /mnt/extra-addons/custom-addons directory.
RUN mkdir -p /mnt/extra-addons/custom-addons && chmod -R o+rX /mnt/extra-addons/custom-addons

# We copy our custom modules implemented in the directory containing custom modules into our image
ADD costum_addons/ /mnt/extra-addons/custom-addons/

# We copy our Odoo configurations into the image so that they are taken into account when Odoo is launched.
COPY config/odoo.conf /etc/odoo/

# We're setting up an odoo user
USER odoo
