# cd .\scripts\dataCreation\



# cd .\scripts\dataCreation\ ; py -c "generateAccountRecords()" ; cd ..\..
# py "unmergeFile.py"
import csv

def extract_fourth_column(input_filename, output_filename):
    try:
        # Otwieranie pliku wejściowego
        with open(input_filename, 'r', encoding='utf-8') as csv_file:
            csv_reader = csv.reader(csv_file)

            # Otwieranie pliku wyjściowego
            with open(output_filename, 'w', encoding='utf-8', newline='') as output_file:
                csv_writer = csv.writer(output_file)

                # Iteracja przez wiersze i zapis czwartych kolumn
                for row in csv_reader:
                    if len(row) >= 4:  # Upewnienie się, że wiersz ma co najmniej 4 kolumny
                        csv_writer.writerow([row[3]])

        print(f"Czwarta kolumna została zapisana w pliku: {output_filename}")

    except Exception as e:
        print(f"Wystąpił błąd: {e}")

# Ścieżki plików
input_filename = r"D:\Studia\Magisterka\code\dissertation\dataToInsert\Account_data_Text_60_no_nulls.csv"
output_filename = r"D:\Studia\Magisterka\code\dissertation\dataToInsert\Text_60_no_nulls.csv"

# Wywołanie funkcji
extract_fourth_column(input_filename, output_filename)


