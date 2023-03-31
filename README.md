# 42's Inception project
42's Inception is a school project that demonstrates the use of Docker and Docker Compose to build a fully functional WordPress website with Nginx as a reverse proxy and MariaDB as a database. The project involves setting up and configuring containers, managing dependencies, and ensuring seamless communication between different services. The resulting website is scalable, portable, and easily deployable to any environment. The code is written in a modular and organized manner for easy maintenance and customization.

 ### Project tasks include

 * Creating a Dockerfile for the WordPress application.
 * Configuring a Docker Compose file for WordPress, Nginx, and MariaDB.
 * Building and running the containers using Docker Compose.
 * Configuring the Nginx reverse proxy to serve WordPress.
 * Setting up the MariaDB database and configuring the WordPress installation to use it.
 * Installing WordPress plugins and themes using the WordPress admin panel.
 * Configuring HTTPS and SSL certificates using Nginx.
 * Optimizing the website for performance and security.
 * Testing the website's functionality and making sure everything works as expected.

### Installation
```
git clone https://github.com/kazemsami/Inception.git
```
```
$ cd Inception
$ make
```
#### `$ make re` will force clean and redo the build.

### Usage
To view the website, you can either enter `localhost` in your browser or link 127.0.0.1 to `kabusitt.42.fr` by adding the line `127.0.0.1 kabusitt.42.fr` to your `/etc/hosts` file using your favorite editor. Additionally, you can customize the link by modifying the `.env` file and changing "kabusitt" to your own intra login.

# I know that .env is not supposed to be uploaded to github but this is just for learning purposes.
