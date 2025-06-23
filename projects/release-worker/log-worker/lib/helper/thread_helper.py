import threading
from concurrent.futures import ThreadPoolExecutor
import shutil

thread_locker = threading.Lock()

def use_multiple_threads(action_function, argument_data: list) -> None:
  with ThreadPoolExecutor(max_workers=8) as pool:
    pool.map(action_function, argument_data)

def action_copy_files(the_full_dict):
  src_file = ""
  dst_file = ""
  shutil.copy(src_file, dst_file)