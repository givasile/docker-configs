((docker nil)
 (docker-compose nil)
 (docker-container-attach nil)
 (docker-container-diff nil)
 (docker-container-help nil)
 (docker-container-stop nil)
 (docker-image-run
	("-i" "--rm" "-t")
	("-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY" "-i" "--rm" "-t" "-u givasile"))
 (magit-commit nil)
 (magit-log
	("-n256" "--graph" "--color" "--decorate"))
 (transient:docker-image-run:-u\  "givasile"))
