# cd .\scripts\sandboxUtils\ ; py "changeFieldInHeaderInDataFile.py" "D:\Studia\Magisterka\code\dissertation\dataToInsert\merged\Account_data_Emails_4k.csv" "External_Email__c"; cd ..\..
# cd .\scripts\sandboxUtils\ ; py "changeFieldInHeaderInDataFile.py" "D:\Studia\Magisterka\code\dissertation\dataToInsert\merged\Account_data_Emails_no_nulls.csv" "Test_Custom_Object__c" "External_Email__c" ; cd ..\..
# cd .\scripts\sandboxUtils\ ; py "changeFieldInHeaderInDataFile.py" "D:\Studia\Magisterka\code\dissertation\dataToInsert\merged\Account_data_Emails_no_nulls.csv" "Account" "External_Email__c" ; cd ..\..
# cd .\scripts\sandboxUtils\ ; py "changeFieldInHeaderInDataFile.py" "D:\Studia\Magisterka\code\dissertation\dataToInsert\merged\Account_data.csv" "Account" "Autonumber_no_index__c" ; cd ..\..
import sys


def modify_csv_header(file_path, sObject_name, field_api_name):
    print(file_path)
    # Open the file in read and write mode
    with open(file_path, "r+") as file:
        # Read all lines
        lines = file.readlines()

        # Modify the first line
        first_line = lines[0].strip().split(",")
        print('0 field_api_name: ', field_api_name)
        print('1: ', first_line)
        # Remove all occurrences of '__c' from each field
        first_line = [field.replace("__c", "") for field in first_line]
        print('2: ', first_line)

        # Check if sObject_name contains '__c', which means Custom Object
        if "__c" in sObject_name:
            # Add '__c' to the end of each field except fields named 'Name' or 'name'
            first_line = [field if field.lower() == "name" else field + "__c" for field in first_line]

        if field_api_name:
            first_line[-1] = field_api_name

        print('3: ', first_line)

        # Write the modified line and the rest of the lines
        lines[0] = ",".join(first_line) + "\n"
        file.seek(0)
        file.writelines(lines)
        file.truncate()


file_path = sys.argv[1]
sObject_name = sys.argv[2]
field_api_name = sys.argv[3] if len(sys.argv) > 3 else ""
modify_csv_header(file_path, sObject_name, field_api_name)
