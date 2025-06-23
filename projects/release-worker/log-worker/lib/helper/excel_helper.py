import xlwings as xw
from xlwings import Book

def read_file() -> (list, list):
  with xw.App(visible=False, add_book=False) as app:
    wb = app.books.open("sample.xlsx")

    sheet_index, sheet_name = (1, "Sheet1")
    sheet = wb.sheets[sheet_index] 
    record_address = sheet.range("A1").expand().address
    records = sheet.range(record_address).value

    record_head = get_record_head(wb, sheet_index)
    record_data = records[1:]
    return record_head, record_data
  

def get_record_head(wb: Book, sheet_index: int = 0) -> list:
  sheet = wb.sheets[sheet_index]
  record_address = sheet.range("A1").expand("right").address
  record_head = sheet.range(record_address).value
  return record_head
