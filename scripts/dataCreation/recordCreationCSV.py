# cd .\scripts\dataCreation\


# py -c "from recordCreationCSV import generateAccountRecords; generateAccountRecords()"
# py -c "from recordCreationCSV import generateNumbersUniqueRecords; generateNumbersUniqueRecords()"
# py -c "from recordCreationCSV import attachNumbersWithNullUniqueRecords; attachNumbersWithNullUniqueRecords()"

# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateAccountRecords; generateAccountRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateNumbersUniqueRecords; generateNumbersUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import attachNumbersWithNullUniqueRecords; attachNumbersWithNullUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateNumbersShortUniqueRecords; generateNumbersShortUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import attachNumbersShortWithNullUniqueRecords; attachNumbersShortWithNullUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateEmailsUniqueRecords; generateEmailsUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import attachEmailsWithNullUniqueRecords; attachEmailsWithNullUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateTextUniqueRecords; generateTextUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import attachTextWithNullUniqueRecords; attachTextWithNullUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateTextShortUniqueRecords; generateTextShortUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import attachTextShortWithNullUniqueRecords; attachTextShortWithNullUniqueRecords()" ; cd ..\..
# cd .\scripts\dataCreation\ ; py -c "from recordCreationCSV import generateTextAutonumberRecords; generateTextAutonumberRecords()" ; cd ..\..


# from faker import Faker
# from recordCreationUtilsWithFaker import writeToFile
from recordCreationUtilsWithFaker import writeToFile, modify_file_content, fake


def generateAccountRecords():
    # Generate account data
    filename = "Account_data.csv"

    headers_dict = {
        "Name": fake.company,
        "Phone": fake.msisdn,
        "Description": lambda: fake.text(max_nb_chars=60)
    }

    writeToFile(filename, headers_dict)



def generateNumbersUniqueRecords():
    # Generate unique numbers

    filename = "Numbers-unique.csv"

    headers_dict = {
        "Numbers-unique": lambda: fake.unique.numerify('%'+'#'*17)
    }

    writeToFile(filename, headers_dict)





def attachNumbersWithNullUniqueRecords():

    # Add NULLs to file with unique numbers


    input_filename = "Numbers-unique.csv"
    output_filename = "Numbers-unique-with-null.csv"
    header_in_output_file = "Numbers-unique-with-null"
    nullsPercentContent = 0.2


    modify_file_content(input_filename, output_filename, header_in_output_file, nullsPercentContent, lambda x: None)


def generateNumbersShortUniqueRecords():



    filename = "Numbers-short-unique.csv"

    headers_dict = {
        "Numbers-short-unique": lambda: fake.unique.numerify('%'+'#'*8)
    }
    writeToFile(filename, headers_dict)


def attachNumbersShortWithNullUniqueRecords():

    # Trim the string

    input_filename = "Numbers-short-unique.csv"
    output_filename = "Numbers-short-unique-with-null.csv"
    header_in_output_file = "Numbers-short-unique-with-null"
    nullsPercentContent = 0.2


    modify_file_content(input_filename, output_filename, header_in_output_file, nullsPercentContent, lambda x: None)

def generateEmailsUniqueRecords():
    # Generate unique numbers

    filename = "Emails-unique.csv"

    headers_dict = {
        "Emails-unique": lambda: fake.unique.ascii_free_email()
    }

    writeToFile(filename, headers_dict)

def attachEmailsWithNullUniqueRecords():

    # Add NULLs to file with unique numbers


    input_filename = "Emails-unique.csv"
    output_filename = "Emails-unique-with-null.csv"
    header_in_output_file = "Emails-unique-with-null"
    nullsPercentContent = 0.2


    modify_file_content(input_filename, output_filename, header_in_output_file, nullsPercentContent, lambda x: None)


def attachAutoNumbersWithNullUniqueRecords():
    # TODO
    # Add NULLs to file with unique numbers


    input_filename = "Aut.csv"
    output_filename = "Emails-unique-with-null.csv"
    header_in_output_file = "Emails-unique-with-null"
    nullsPercentContent = 1


    modify_file_content(input_filename, output_filename, header_in_output_file, nullsPercentContent, lambda x: None)




def generateTextUniqueRecords():

    filename = "Text-to-255-unique.csv"

    headers_dict = {
        "Text": lambda: fake.unique.text(max_nb_chars=255).replace('\n', '').replace('\r', '')[:255]
    }


    writeToFile(filename, headers_dict)


def attachTextWithNullUniqueRecords():

    # Remove some strings by random

    input_filename = "Text-to-255-unique.csv"
    output_filename = "Text-to-255-unique-with-null.csv"
    header_in_output_file = "Text-with-null"
    nullsPercentContent = 0.2


    modify_file_content(input_filename, output_filename, header_in_output_file, nullsPercentContent, lambda x: None)




def generateTextShortUniqueRecords():

    filename = "Text-to-60-unique.csv"

    headers_dict = {
        "Text": lambda: fake.unique.text(max_nb_chars=60).replace('\n', '').replace('\r', '')[:60]
    }


    writeToFile(filename, headers_dict)


def attachTextShortWithNullUniqueRecords():

    # Remove some strings by random

    input_filename = "Text-to-60-unique.csv"
    output_filename = "Text-to-60-unique-with-null.csv"
    header_in_output_file = "Text-with-null"
    nullsPercentContent = 0.2


    modify_file_content(input_filename, output_filename, header_in_output_file, nullsPercentContent, lambda x: None)

from itertools import count
def generateTextAutonumberRecords():

    filename = "Text-Autonumber-unique.csv"

    counter = count(0)

    headers_dict = {
        "Text": lambda: str(next(counter)).zfill(7)
    }


    writeToFile(filename, headers_dict)