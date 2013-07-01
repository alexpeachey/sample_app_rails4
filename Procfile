# Define all of your processes here
# You can even start up various databases you need
# You should specify your databases first

# Redis for Sidekiq - This has issues, run Redis separately
#redis: redis-server ./redis.conf

# Define your web process
web: bin/puma -t 16:16 -w 4 -p $PORT

# Foreman can run guard for us too
guard: bin/guard

# Sidekiq for our background jobs
worker: bin/sidekiq