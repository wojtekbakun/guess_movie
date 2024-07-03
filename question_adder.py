import os
import json
import re


def get_png_files(folder_name, links):
    png_files = []
    index = 0
    for root, dirs, files in os.walk(f"guess_movie_app/assets/images/{folder_name}"):
        files.sort()  # Sortuj pliki w folderze
        for file in files:
            if file.endswith(".txt"):
                continue
            print(f"index: {index}, file: {file}, link: {links[index]}")
            relative_path = f"assets/images/{folder_name}/" + file
            file_name = os.path.splitext(file)[0]  # Pobierz nazwę pliku bez rozszerzenia
            link = wiki_links[index]
            png_files.append({
                "image_url": relative_path,
                "answer": file_name,
                "link": link  # Dodaj pole "link" do słownika
            })
            index += 1
    return png_files

def get_link_from_file(file_path):
    with open(file_path, 'r') as file:
        link = file.readline().strip()  # Pobierz pierwszą linię z pliku i usuń białe znaki
    return link

def change_file_extension(folder_name):
    for root, dirs, files in os.walk(f"guess_movie_app/assets/images/{folder_name}"):
        for file in files:
            if file.endswith(".txt"):
                continue
            file_path = os.path.join(root, file)
            new_file_path = os.path.splitext(file_path)[0] + ".png"
            os.rename(file_path, new_file_path)


def get_https_links(file_path):
    https_links = []
    link_pattern = r'https://[^\s]+'  # Wzorzec dla linków HTTPS
    with open(file_path, 'r') as file:
        for line in file:
            found_links = re.findall(link_pattern, line.strip())
            https_links.extend(found_links)  # Dodaj znalezione linki do listy
            for link in found_links:
                print(link)
    return https_links

folder_name = input("Podaj nazwę folderu: ")
change_file_extension(folder_name)
wiki_links = get_https_links(f"guess_movie_app/assets/images/{folder_name}/{folder_name}.txt")
png_files = get_png_files(folder_name, wiki_links)
json_data = json.dumps(png_files, indent=4)
with open(f"guess_movie_app/assets/{folder_name}.json", 'w') as file:
    file.write(json_data)
print(f"Dane zostały zapisane do pliku {folder_name}.")
