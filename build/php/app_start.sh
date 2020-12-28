#!/bin/sh -eux

service postgresql start \
  && apachectl -DFOREGROUND
