from concurrent.futures import ProcessPoolExecutor

def use_multi_process(action_function, argument_data: list) -> None:
  with ProcessPoolExecutor(max_wokrers=8) as pool:
    pool.map(action_function, argument_data)
