BASE_IMAGE =  inspirehep/invenio-base
DRONE_IMAGE = inspirehep/invenio-drone
TEST_IMAGE =  test

.PHONY: build test test-shell push remove

build:
	docker build -t $(BASE_IMAGE) base
	docker build -t $(DRONE_IMAGE) drone
	docker build -t $(TEST_IMAGE) test

test:
	docker run $(TEST_IMAGE)

test-shell:
	docker run -it $(TEST_IMAGE) /bin/bash

push:
	docker push $(BASE_IMAGE)
	docker push $(DRONE_IMAGE)

remove:
	docker rmi -f $(BASE_IMAGE) $(DRONE_IMAGE) $(TEST_IMAGE)
