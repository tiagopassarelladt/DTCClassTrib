# 🧾 Sistema de Classificação Tributária IBS/CBS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Delphi Supported](https://img.shields.io/badge/Delphi-Supported-blue.svg)](https://www.embarcadero.com/products/delphi)

## 📋 Descrição

Este sistema é uma ferramenta essencial para profissionais contábeis e fiscais que precisam lidar com as complexidades da **Reforma Tributária Brasileira**, especificamente a transição para o sistema **IBS** (Imposto sobre Bens e Serviços) e **CBS** (Contribuição sobre Bens e Serviços).

O aplicativo permite a consulta, visualização e correlação entre códigos tributários atuais e seus equivalentes no novo sistema, facilitando o planejamento e preparação para a transição fiscal.

## ✨ Funcionalidades

- **Consulta de CSTs** (Códigos de Situação Tributária):
  - Seleção a partir de lista categorizada e descrita (16 tipos de CSTs)
  - Exibição automática dos códigos de classificação correspondentes 
  - Navegação intuitiva entre CSTs e seus desdobramentos

- **Sistema DTCClassTrib** - Modelo de dados robusto para classificações tributárias:
  - Implementação da interface `IClassTribRepository` para acesso aos dados
  - Uso do objeto `TClassTribMetadata` para armazenamento estruturado de metadados
  - Método `GetByCodigo` para consulta detalhada por código de classificação
  - Método `GetByCST` para filtrar classificações por CST
  - Método `GetAllCSTs` para recuperação de todos os códigos disponíveis
  - Método `ObterDadosConversaoIBS` para mapeamento entre sistemas tributários

- **Visualização de Classificações Tributárias** com metadados completos:
  - 📑 Artigos de lei relacionados com descrições detalhadas
  - 💰 Percentuais de redução de alíquota com cálculos precisos
  - 📆 Datas de início e fim de vigência com suporte a períodos indeterminados
  - 📊 Tipo de tributação aplicável (normal, monofásica, etc.)
  - 👥 Informações sobre tomador específico quando aplicável
  - 📝 Observações completas e título do capítulo legal relacionado

- **Correlação entre sistemas tributários**:
  - Conversão automática de ICMS para IBS através da estrutura `TConversionResult`
  - Conversão de CSOSN para IBS com informações detalhadas de equivalência
  - Conversão de PIS/COFINS para CBS com exibição de descrições completas
  - Interface visual com resultados em tempo real ao selecionar códigos de origem
  - Exibição clara de "Sem correspondência" para códigos não mapeados

## 🛠️ Tecnologias

- Desenvolvido em **Delphi** com suporte a versões recentes
- Interface gráfica com componentes VCL (Visual Component Library):
  - `TPageControl` para organização em abas
  - `TComboBox` para seleção intuitiva de códigos
  - `TMemo` para exibição de textos detalhados
  - `TPanel` para organização visual dos elementos
- Arquitetura de serviços baseada em interfaces:
  - Interface `IClassTribRepository` para abstração de acesso aos dados
  - Implementação `TClassTribService.CreateDefault` para instanciação simplificada
  - Estrutura `TClassTribMetadata` para representação de dados tributários
  - Estrutura `TConversionResult` para mapear conversões entre sistemas
- Uso eficiente de recursos do Framework:
  - Enumeradores para tipos de modelos tributários (`tpmodCST`, `tpmodCSOSN`, etc.)
  - Formatação condicional e manipulação de strings para exibição amigável
  - Gerenciamento adequado do ciclo de vida dos objetos
- Implementação completa das regras de negócio da Reforma Tributária

## 🚀 Como utilizar

1. **Aba de Consulta de CSTs**:
   - Selecione um CST no primeiro combo box (ex: "0 - Tributação Normal")
   - O sistema carregará automaticamente os códigos de classificação tributária disponíveis
   - Escolha o código de classificação tributária específico no segundo combo box
   - Visualize todos os detalhes relacionados nos campos informativos:
     - Código, CST, Artigo de Lei, Tipo de Tributação
     - Tomador Específico, Percentual de Redução
     - Datas de início e fim da vigência
     - Descrição detalhada, observações e base legal no campo de texto expandido

2. **Aba de Correlação**:
   - Selecione o código ICMS no primeiro combo box (valores de 00 a 90)
   - Selecione o código CSOSN no segundo combo box (valores de 101 a 900)
   - Selecione o código PIS/COFINS no terceiro combo box (valores de 01 a 99)
   - Visualize automaticamente os códigos equivalentes:
     - Para ICMS: o código CST IBS correspondente e sua classificação
     - Para CSOSN: o código CST IBS correspondente e sua classificação
     - Para PIS/COFINS: o código CST CBS correspondente e sua classificação
   - O sistema utiliza internamente o método `ObterDadosConversaoIBS` do modelo DTCClassTrib
   - Os resultados são exibidos em tempo real, sem necessidade de confirmação adicional
   - Caso não exista correspondência, o sistema informa claramente "Sem correspondência"

## 🔧 Requisitos

- Windows 7 ou superior
- Delphi 10 ou superior
- 50MB de espaço em disco
- Conhecimentos básicos em tributação brasileira

## 🤝 Contribuições

Contribuições são bem-vindas! Se você encontrou um bug ou tem uma sugestão de melhoria, por favor abra uma issue ou envie um pull request.

## 📜 Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.

---

### 📢 Importante

Este sistema é uma ferramenta de apoio e não substitui o conhecimento técnico especializado ou a consulta à legislação atualizada. As regras tributárias implementadas estão sujeitas a alterações conforme as definições finais da Reforma Tributária.