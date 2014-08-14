DRONE_IMAGE = inspirehep/invenio-drone
TEST_IMAGE =  test

build:
	docker build -t $(DRONE_IMAGE) drone
	docker build -t $(TEST_IMAGE) test

build-no-cache:
	docker build --no-cache=true -t $(DRONE_IMAGE) drone
	docker build --no-cache=true -t $(TEST_IMAGE) test

drone-test:
	docker run $(TEST_IMAGE)

drone-shell:
	docker run -it $(TEST_IMAGE) /bin/bash

push:
	# FIXME: register to Docker Hub
	docker push $(DRONE_IMAGE)

remove-images:
	docker rmi -f $(DRONE_IMAGE) $(TEST_IMAGE)
