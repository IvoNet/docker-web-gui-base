#!/usr/bin/env bash

chown -R nobody:users /nobody/

export PATH=$PATH:/usr/lib/postgresql/$PG_MAJOR/bin
