from django.shortcuts import render
import csv
import os
from django.conf import settings
from API_operadoras.models import *
from django.http import JsonResponse
# Create your views here.

CSV_PATH = os.path.join(settings.BASE_DIR, "data", "Relatorio_cadop.csv")

def importar_operadoras():
    with open(CSV_PATH, newline='', encoding="utf-8") as file:
        reader = csv.DictReader(file)
        operadoras = []

        for row in reader:
            operadoras.append(Operadora(
                registro_ans=row["Registro_ANS"],
                cnpj=row["CNPJ"],
                razao_social=row["Razao_Social"],
                nome_fantasia=row["Nome_Fantasia"],
                modalidade=row["Modalidade"],
                logradouro=row["Logradouro"],
                numero=row["Numero"],
                complemento=row.get("Complemento", ""),
                bairro=row["Bairro"],
                cidade=row["Cidade"],
                uf=row["UF"],
                cep=row["CEP"],
                ddd=row["DDD"],
                telefone=row["Telefone"],
                fax=row.get("Fax", ""),
                endereco_eletronico=row.get("Endereco_eletronico", ""),
                representante=row["Representante"],
                cargo_representante=row["Cargo_Representante"],
                regiao_de_comercializacao=int(row["Regiao_de_Comercializacao"]) if row["Regiao_de_Comercializacao"] else None,
                data_registro_ans=row["Data_Registro_ANS"] if row["Data_Registro_ANS"] else None
            ))

        Operadora.objects.bulk_create(operadoras, ignore_conflicts=True)
        print(f"{len(operadoras)} operadoras importadas com sucesso!")

def search(request):
    key = request.GET.get('q', '').strip().lower()
    if not key:
        return JsonResponse({"error": "Nenhum termo de busca fornecido."}, status=400)
    
    operadoras = Operadora.objects.filter(nome_fantasia__icontains=key).values(
        "registro_ans", "nome_fantasia", "cnpj", "modalidade","uf", "cidade", "telefone", "endereco_eletronico"
    )[:20]

    return JsonResponse(list(operadoras), safe=False)