import datetime as dt
from typing import Generator 

date_format = "%Y%m%d"

def get_date_list(date_range: str) -> list:
  date_list = []
  contents = date_range.split(",")
  for content in contents:
    if content.__contains__("-"):
      dates = content.split("-")
      some_dates = get_dates(strat=dates[0].strip(), end=dates[1].strip())
      date_list.extend(some_dates)
    else:
      one_date = content.strip()
      date_list.append(one_date)
  
  date_list = list(set(date_list))
  date_list.sort()
  return date_list


def get_dates(start: str = None, end: str = None) -> list:
  start_date = end_date = dt.datetime.now()
  if start:
    start_date = dt.datetime.strptime(start, date_format)
  if end:
    end_date = dt.datetime.strptime(end, date_format)

  date_list = []
  days = (end_date - start_date).days
  if days < 0:
    raise Exception("start_date should be less than or equal to end_date")

  for the_date in genereate_dates(start_date, days):
    the_date_str = dt.datetime.strftime(the_date, date_format)  
    date_list.append(the_date_str)
  return date_list


def genereate_dates(start_date: dt.datetime, days: int) -> Generator[dt.datetime, None, None]:
  one_day = dt.timedelta(days=1)
  for index in range(days+1):
    yield (start_date + one_day * index)
