#!pip install faker

import csv
from faker import Faker
import random
import shutil
import sys



directoryPath = './csvFiles/'
fake = Faker('en_US')
records = 1_500_000
    writer.writerow({header: func() for header, func in headers_dict.items()})


def writeToFile(filename, headers_dict):
    with open(directoryPath + filename, 'wt', newline='') as csvFile:
        writer = csv.DictWriter(csvFile, fieldnames=headers_dict.keys())
        writer.writeheader()

        for i in range(records):
            writer.writerow({header: func() for header, func in headers_dict.items()})
            track_progress(i+1)




def modify_file_content(input_filename, output_filename, header_in_output_file, modify_occurence_percent, modify_value_func):
    input_filename = directoryPath + input_filename
    output_filename = directoryPath + output_filename
    # Copy the original file and rename it
    shutil.copy(input_filename, output_filename)

    # Open the new file in read and write mode
    with open(output_filename, 'r+', newline='') as csvFile:
        lines = list(csv.reader(csvFile))

        # Rewind to the start of the file to overwrite it
        csvFile.seek(0)
        csvFile.truncate()

        writer = csv.writer(csvFile)

        # Write the header
        lines[0][0] = header_in_output_file
        writer.writerow(lines[0])

        for i, row in enumerate(lines[1:], start=1):  # Skipping the header line
            if random.random() > 1 - modify_occurence_percent:
                row[0] = modify_value_func(row[0])
            writer.writerow(row)

            track_progress(i+1)



def track_progress(lineNumber, totalLines=records):
    if (lineNumber) % 1000 == 0 or lineNumber == totalLines:
        print(f"\r[{lineNumber}/{totalLines}] lines written", end="")
        sys.stdout.flush()

