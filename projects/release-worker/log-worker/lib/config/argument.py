import datetime
import multiprocessing

program_entry = "log-worker.py"
program_version = "0.0.1"

launch_time = datetime.datetime.now()
launch_folder = launch_time.strftime("%Y%m%d.%H%M%S")

max_wokrers = multiprocessing.cpu_count()

