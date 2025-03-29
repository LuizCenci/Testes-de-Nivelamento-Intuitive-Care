import tabula
import pandas as pd

def pdf_to_csv(path):
    tables = tabula.read_pdf(path, pages='all', lattice=True)
    full_df = pd.DataFrame()

    for tbl in tables:
        df = tbl.copy()
        full_df = pd.concat([full_df, df], ignore_index=False)

    return full_df

path = 'anexos/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf'

df = pdf_to_csv(path)

df = df.drop('Unnamed: 0', axis=1)
df = df.replace('\r', ' ', regex=True)  
df = df.rename(columns={'RN\r(alteração)':'RN (alteração)', 'OD':'Seg. Odontológica', 'AMB':'Seg. Ambulatorial'})
df = df.fillna(' ')
df.to_csv('Anexo_I_v2.csv', index=False, encoding='utf-8')