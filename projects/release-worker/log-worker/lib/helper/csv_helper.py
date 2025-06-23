import csv

def read_file() -> (list, list):
    with open("sample.csv", mode="r", encoding="utf-8") as file:
        reader = csv.reader(file, delimiter=",")
        # skip empty row
        records = [row for row in reader if len(row) > 0]

        record_head = records[0]
        record_body = records[1:]
        return record_head, record_body
        