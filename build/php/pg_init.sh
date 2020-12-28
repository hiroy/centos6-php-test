#!/use/bin/env bash

if [ -z "$(ls -A $PGDATA)" ]; then
  pg_ctl -w start
  # run some SQLs
  # psql -f /path.to.file
  pg_ctl -w stop
fi

exec "$@"
