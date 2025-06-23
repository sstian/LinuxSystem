import progressbar

progress = progressbar.ProgressBar()
task_count = 0

def progress_start(max_value: int) -> None:
  progress.start(max_value=max_value)


def progress_update(step: int = 1) -> None:
  global task_count
  task_count += step
  progress.update(task_count)


def progress_finsh() -> None:
  progress.finish()
  global task_count
  task_count = 0