# Script para remover 3 registros incorretos de saude e recalcular os totais
# Uso: roda este script na pasta do repositorio (onde esta o index.html)

$arquivo = ".\index.html"

if (-not (Test-Path $arquivo)) {
    Write-Host "ERRO: index.html nao encontrado nesta pasta. Rode o script de dentro da pasta do repositorio." -ForegroundColor Red
    exit
}

Write-Host "Lendo o arquivo..." -ForegroundColor Cyan
$conteudo = Get-Content -Path $arquivo -Raw -Encoding UTF8

$substituicoes = @(
    @{
        Buscar = '<tr><td class=""><span class="badge-ano">2023</span></td><td class="">Londrina</td><td class="">REFORMA</td><td class="">UBS Jardim Bandeirantes</td><td class="val">R$ 300.000,00</td></tr>'
        Trocar = ''
    },
    @{
        Buscar = '<tr><td class=""><span class="badge-ano">2023</span></td><td class="">Londrina</td><td class="">REFORMA</td><td class="">UBS Padovane FOI P/ UBS MISTER THOMAS</td><td class="val">R$ 300.000,00</td></tr>'
        Trocar = ''
    },
    @{
        Buscar = '<tr><td class=""><span class="badge-ano">2023</span></td><td class="">Londrina</td><td class="">REFORMA</td><td class="">UBS Jardim Tókio FOI P/ TAQUARUNA</td><td class="val">R$ 200.000,00</td></tr>'
        Trocar = ''
    },
    @{
        Buscar = '{"ano": 2023, "cidade": "Londrina", "valor": 300000.0, "item": "REFORMA", "inst": "UBS Jardim Bandeirantes"}, '
        Trocar = ''
    },
    @{
        Buscar = '{"ano": 2023, "cidade": "Londrina", "valor": 300000.0, "item": "REFORMA", "inst": "UBS Padovane FOI P/ UBS MISTER THOMAS"}, '
        Trocar = ''
    },
    @{
        Buscar = '{"ano": 2023, "cidade": "Londrina", "valor": 200000.0, "item": "REFORMA", "inst": "UBS Jardim Tókio FOI P/ TAQUARUNA"}, '
        Trocar = ''
    },
    @{
        Buscar = '<b>66</b> destinações em <b>25</b> municípios, somando <b>R$ 17.773.018,98</b>.'
        Trocar = '<b>63</b> destinações em <b>25</b> municípios, somando <b>R$ 16.973.018,98</b>.'
    },
    @{
        Buscar = 'Total 66 registros</td><td class="val">R$ 17.773.018,98</td>'
        Trocar = 'Total 63 registros</td><td class="val">R$ 16.973.018,98</td>'
    },
    @{
        Buscar = '<span data-total-tema="">R$ 17,77 milhões</span>'
        Trocar = '<span data-total-tema="">R$ 16,97 milhões</span>'
    },
    @{
        Buscar = 'Todo o mandato <span class="cnt">R$ 17,77 mi</span></span><span class="chip" data-cidade="Londrina">Londrina <span class="cnt">R$ 8,34 mi</span>'
        Trocar = 'Todo o mandato <span class="cnt">R$ 16,97 mi</span></span><span class="chip" data-cidade="Londrina">Londrina <span class="cnt">R$ 7,54 mi</span>'
    }
)

$totalAplicadas = 0
foreach ($sub in $substituicoes) {
    $ocorrencias = ([regex]::Matches($conteudo, [regex]::Escape($sub.Buscar))).Count
    if ($ocorrencias -eq 0) {
        Write-Host "AVISO: nao encontrei este trecho (pode ja ter sido removido antes):" -ForegroundColor Yellow
        Write-Host "  $($sub.Buscar.Substring(0, [Math]::Min(80, $sub.Buscar.Length)))..." -ForegroundColor Yellow
    } else {
        $conteudo = $conteudo.Replace($sub.Buscar, $sub.Trocar)
        Write-Host "OK: substituido ($ocorrencias ocorrencia(s))" -ForegroundColor Green
        $totalAplicadas++
    }
}

Set-Content -Path $arquivo -Value $conteudo -Encoding UTF8 -NoNewline

Write-Host ""
Write-Host "Concluido! $totalAplicadas de $($substituicoes.Count) substituicoes aplicadas." -ForegroundColor Cyan
Write-Host "Confere o site local (F5) antes de dar git push." -ForegroundColor Cyan
