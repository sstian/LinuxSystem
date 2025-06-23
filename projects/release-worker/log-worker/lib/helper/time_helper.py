import time

def start() -> float:
  return time.perf_counter()

def elapsed(start_time: float) -> float:
  end_time = time.perf_counter()
  return end_time - start_time

def sleep(seconds: float) -> None: 
  time.sleep(seconds)
  