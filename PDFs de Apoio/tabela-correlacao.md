# Correlação entre CSTs Atuais e CSTs da Reforma Tributária

## Introdução

A Reforma Tributária traz os novos tributos IBS (Imposto sobre Bens e Serviços) e CBS (Contribuição sobre Bens e Serviços) que substituirão diversos impostos:

- **IBS**: substituirá o ICMS (estadual) e o ISS (municipal)
- **CBS**: substituirá o PIS, COFINS e parte do IPI (federais)

Esta tabela apresenta uma correlação entre os códigos atuais (incluindo os do Simples Nacional) e os novos, baseada na similaridade das operações tributárias.

## Tabela de Correlação: CST ICMS → CST IBS

### Regime Normal (Não-Simples)

| CST ICMS Atual | Descrição ICMS | CST IBS Provável | Descrição IBS | Observações |
|----------------|----------------|------------------|---------------|-------------|
| 00 | Tributada integralmente | 000 | Tributação integral | Operações normais tributadas integralmente |
| 10 | Tributada e com cobrança do ICMS por substituição tributária | 620 | Tributação monofásica | Similar ao conceito de responsabilidade tributária |
| 20 | Com redução da base de cálculo | 210/220 | Alíquota reduzida ou fixa | Operações com redução de tributação |
| 30 | Isenta ou não tributada e com cobrança do ICMS por substituição tributária | 400/620 | Isenção/Tributação monofásica | Combina isenção na operação atual e substituição |
| 40 | Isenta | 400 | Isenção | Operações isentas |
| 41 | Não tributada | 410 | Imunidade e não incidência | Operações sem incidência tributária |
| 50 | Suspensão | 550 | Suspensão | Operações com suspensão do imposto |
| 51 | Diferimento | 510 | Diferimento | Operações com imposto diferido |
| 60 | ICMS cobrado anteriormente por ST | 620 | Tributação monofásica | Operações subsequentes à cobrança monofásica |
| 70 | Com redução da BC e cobrança do ICMS por ST | 210/620 | Alíquota reduzida/Tributação monofásica | Combina redução e substituição |
| 90 | Outras | 900 | Outros | Demais operações não classificadas |

### Simples Nacional (CSOSN)

| CSOSN Atual | Descrição CSOSN | CST IBS Provável | Descrição IBS | Observações |
|-------------|-----------------|------------------|---------------|-------------|
| 101 | Tributada pelo Simples Nacional com permissão de crédito | 000 | Tributação integral | Operação tributada com permissão de crédito |
| 102 | Tributada pelo Simples Nacional sem permissão de crédito | 000 | Tributação integral | Operação tributada sem permissão de crédito |
| 103 | Isenção do ICMS no Simples Nacional para faixa de receita bruta | 400 | Isenção | Operações isentas no Simples |
| 201 | Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por ST | 620 | Tributação monofásica | Com permissão de crédito e ST |
| 202 | Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por ST | 620 | Tributação monofásica | Sem permissão de crédito e com ST |
| 203 | Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por ST | 620 | Tributação monofásica | Combina isenção e substituição tributária |
| 300 | Imune | 410 | Imunidade e não incidência | Operações imunes |
| 400 | Não tributada pelo Simples Nacional | 410 | Imunidade e não incidência | Operações não tributadas |
| 500 | ICMS cobrado anteriormente por ST ou por antecipação | 620 | Tributação monofásica | Operações subsequentes à ST |
| 900 | Outros | 900 | Outros | Demais operações não classificadas |

## Tabela de Correlação: CST PIS/COFINS → CST CBS

### Regime Normal (Não-Simples)

| CST PIS/COFINS Atual | Descrição PIS/COFINS | CST CBS Provável | Descrição CBS | Observações |
|----------------------|----------------------|------------------|---------------|-------------|
| 01 | Operação Tributável com Alíquota Básica | 000 | Tributação integral | Tributação normal |
| 02 | Operação Tributável com Alíquota Diferenciada | 011 | Tributação com alíquotas uniformes reduzidas | Alíquotas específicas |
| 03 | Operação Tributável com Alíquota por Unidade de Medida de Produto | 620 | Tributação monofásica | Tributação específica por unidade |
| 04 | Operação Tributável Monofásica - Revenda a Alíquota Zero | 620 | Tributação monofásica | Revenda após tributação monofásica |
| 05 | Operação Tributável por Substituição Tributária | 620 | Tributação monofásica | Responsabilidade tributária |
| 06 | Operação Tributável a Alíquota Zero | 200 | Alíquota zero | Operações com alíquota zero |
| 07 | Operação Isenta da Contribuição | 400 | Isenção | Operações isentas |
| 08 | Operação sem Incidência da Contribuição | 410 | Imunidade e não incidência | Operações sem incidência |
| 09 | Operação com Suspensão da Contribuição | 550 | Suspensão | Operações com suspensão |
| 49 | Outras Operações de Saída | 900 | Outros | Demais operações não classificadas |
| 50-66 | Operações de Entrada com direito a crédito | 000 | Tributação integral | Com aproveitamento de crédito |
| 70-75 | Operações de Entrada sem direito a crédito | 410 | Imunidade e não incidência | Sem aproveitamento de crédito |
| 98 | Outras Operações de Entrada | 900 | Outros | Demais operações de entrada |
| 99 | Outras Operações | 900 | Outros | Demais operações não classificadas |

### Simples Nacional (PIS/COFINS)

| CST PIS/COFINS Simples | Descrição PIS/COFINS no Simples | CST CBS Provável | Descrição CBS | Observações |
|------------------------|----------------------------------|------------------|---------------|-------------|
| 99 | Outras Operações (geralmente usado pelo Simples Nacional) | 900 | Outros | Empresas do Simples geralmente usam CST 99 |

## Observações Importantes sobre o Simples Nacional

1. **Tratamento no Simples Nacional**: No sistema atual, empresas optantes pelo Simples Nacional:
   - Utilizam CSOSN em vez de CST ICMS
   - Geralmente utilizam CST 99 para PIS/COFINS

2. **Tratamento no Novo Sistema Tributário**: No sistema da Reforma Tributária:
   - O Simples Nacional continuará existindo como regime diferenciado
   - Pequenas empresas terão tratamento específico para fins de IBS e CBS
   - Os regimes de apuração simplificada serão mantidos

3. **Período de Transição**: 
   - Empresas do Simples Nacional entrarão no novo sistema a partir de 2027
   - O regime continuará com apuração unificada, mas incorporando os novos tributos

4. **Peculiaridades e Considerações**:
   - Os novos códigos CST-IBS/CBS se aplicarão a todos os contribuintes, incluindo os do Simples Nacional
   - Pode haver códigos específicos adicionais para o Simples na regulamentação final
   - As correspondências apresentadas são aproximadas e poderão ser ajustadas

## Observações Gerais

1. Esta correlação é uma aproximação baseada na natureza das operações, uma vez que ainda não existe uma tabela oficial de correspondência.

2. A Reforma Tributária traz alguns novos conceitos e tratamentos tributários que não existiam anteriormente, como:
   - Códigos específicos para operações com reduções percentuais padronizadas (30%, 60%, etc.)
   - Tratamento simplificado para operações imobiliárias
   - Códigos especiais para determinados setores como educação, saúde e agroindústria

3. A aplicação dos novos códigos poderá variar conforme a regulamentação específica que será detalhada nos próximos anos.

4. Durante o período de transição (2026-2033), ambos os sistemas coexistirão, exigindo atenção especial dos contribuintes para a correta aplicação dos códigos.

5. Essa correlação deve ser utilizada apenas como referência inicial, sendo necessária a consulta à legislação específica assim que estiver disponível.
