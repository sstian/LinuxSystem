
# !/usr/bin/python3
# -*- coding: utf-8 -*-
import traceback

def init() -> None:
  pass

def run() -> None;
  pass

if __name__ == "__main__":
  try:
    init()
    run()
  except Exception as error:
    print(error)
    print(traceback.format_exc())
    