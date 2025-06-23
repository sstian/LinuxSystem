import argparse

paprser = argparse.ArgumentParser()
paprser.add_argument("-i", "--input", help=f"specify input file")
command_args = paprser.parse_args()
