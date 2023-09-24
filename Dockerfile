# Nous construisons notre image a partir de l'image officielle Odoo Community version 15 accessible sur le Docker Hub
FROM odoo:15

# Nous nous mettons en utilisateur root  
USER root

# En tant que root nous ajoutons les permissions de lecture et d'exécution pour tous les utilisateurs (autres) sur tous les fichiers et dossiers dans le répertoire /mnt/extra-addons/custom-addons.
RUN mkdir -p /mnt/extra-addons/custom-addons && chmod -R o+rX /mnt/extra-addons/custom-addons

# Nous copions nos modules personnalises implementes dans le respertoire contenant les modules personnalises dans notre image
ADD costum_addons/ /mnt/extra-addons/custom-addons/

# Nous copions nos configuration systeme dans l'image afin qu'il soit prise en compte au lancement d'Odoo
COPY config/odoo.conf /etc/odoo/

# Nous nous mettons odoo
USER odoo