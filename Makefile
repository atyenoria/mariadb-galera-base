b:
	docker build -t atyenoria/mariadb-galera-base .
r:
	docker run -it --rm --name galera atyenoria/mariadb-galera-base zsh