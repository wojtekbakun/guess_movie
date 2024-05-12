import os
import json

def get_png_files(directory):
    png_files = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".png"):
                file_path = os.path.join(root, file)
                relative_path = "assets/images/extinct_animals/" + file
                file_name = os.path.splitext(file)[0]  # Pobierz nazwę pliku bez rozszerzenia
                png_files.append({
                    "image_url": relative_path,
                    "answer": file_name
                })
    return png_files

directory = input("Podaj ścieżkę do folderu: ")
json_file = input("Podaj nazwę pliku JSON: ")

png_files = get_png_files(directory)

json_data = json.dumps(png_files, indent=4)

with open(json_file, 'w') as file:
    file.write(json_data)

print(f"Dane zostały zapisane do pliku {json_file}.")
