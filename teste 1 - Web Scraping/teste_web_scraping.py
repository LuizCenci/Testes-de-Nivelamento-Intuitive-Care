import os
import wget
from bs4 import BeautifulSoup
import requests
import shutil

url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'
headers = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0'}
response = requests.get(url, headers=headers)

soup = BeautifulSoup(response.text, 'html.parser')

files = soup.find_all('a', attrs={'data-tippreview-enabled': 'true'})
pdfs = []
for item in files:
    if item['href'].endswith('.pdf'):
        pdfs.append(item['href'])


os.makedirs('anexos', exist_ok=True)
for url in pdfs:
    filename = os.path.join('anexos', os.path.basename(url))
    print(filename)
    wget.download(url, filename)

dirs_path = 'anexos'
shutil.make_archive('anexos', 'zip', dirs_path)
