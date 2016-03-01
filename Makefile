b:
	docker build -t atyenoria/galera-base .
r:
	docker run -it --rm --name galera atyenoria/galera-base zsh