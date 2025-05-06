unit ReformaTributaria.ClassTrib;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TCodigoClassTrib = record
    Codigo: string;
    Descricao: string;
  end;

  TCSTClassTribService = class
  private
    FCSTClassTribMap: TDictionary<string, TList<TCodigoClassTrib>>;

    procedure CarregarTabelaCSTClassTrib;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterClassTribPorCST(const CST: string): TArray<TCodigoClassTrib>;
    function ListarCSTDisponiveis: TArray<string>;
    function ObterDescricaoClassTrib(const CodClassTrib: string): string;
    function ValidarCSTComClassTrib(const CST, CodClassTrib: string): Boolean;
  end;

implementation

{ TCSTClassTribService }

constructor TCSTClassTribService.Create;
begin
  FCSTClassTribMap := TDictionary<string, TList<TCodigoClassTrib>>.Create;
  CarregarTabelaCSTClassTrib;
end;

destructor TCSTClassTribService.Destroy;
var
  Lista: TList<TCodigoClassTrib>;
begin
  for Lista in FCSTClassTribMap.Values do
    Lista.Free;

  FCSTClassTribMap.Free;
  inherited;
end;

procedure TCSTClassTribService.CarregarTabelaCSTClassTrib;
  procedure AddCSTClassTrib(const CST, CodClassTrib, Descricao: string);
  var
    Lista: TList<TCodigoClassTrib>;
    Item: TCodigoClassTrib;
  begin
    if not FCSTClassTribMap.TryGetValue(CST, Lista) then
    begin
      Lista := TList<TCodigoClassTrib>.Create;
      FCSTClassTribMap.Add(CST, Lista);
    end;

    Item.Codigo := CodClassTrib;
    Item.Descricao := Descricao;
    Lista.Add(Item);
  end;

begin
  // CST 000 - Tributação normal
  AddCSTClassTrib('000', '000000', 'Tributação integral');
  AddCSTClassTrib('000', '000010', 'Operações de compra e venda de bens imóveis');
  AddCSTClassTrib('000', '000011', 'Transporte aéreo, ferroviário, aquaviário e rodoviário coletivo de passageiros');
  AddCSTClassTrib('000', '000012', 'Operações com produtos de higiene menstrual');
  AddCSTClassTrib('000', '000013', 'Operações com dispositivos médicos e de acessibilidade para pessoas com deficiência');
  AddCSTClassTrib('000', '000014', 'Operações com produtos de cuidados básicos à saúde menstrual');
  AddCSTClassTrib('000', '000015', 'Operações com produtos hortícolas, frutas, ovos');
  AddCSTClassTrib('000', '000020', 'Operação sujeita à alíquota reduzida do IBS/CBS');
  AddCSTClassTrib('000', '000021', 'Alíquota reduzida em operações de crédito imobiliário');
  AddCSTClassTrib('000', '000022', 'Operação de prestação de serviços profissionais');
  AddCSTClassTrib('000', '000023', 'Operações com insumos agropecuários');
  AddCSTClassTrib('000', '000024', 'Operações com automóveis de passageiros');
  AddCSTClassTrib('000', '000025', 'Operações com biocombustíveis');

  // CST 200 - Alíquota zero
  AddCSTClassTrib('200', '200000', 'Operação tributada com alíquota zero');
  AddCSTClassTrib('200', '200010', 'Exportação direta de bens e serviços');
  AddCSTClassTrib('200', '200011', 'Venda para consumidor final não contribuinte localizado no exterior');
  AddCSTClassTrib('200', '200012', 'Vendas para embaixadas e consulados estrangeiros');
  AddCSTClassTrib('200', '200013', 'Cesta básica nacional de alimentos');
  AddCSTClassTrib('200', '200014', 'Dispositivos médicos e de acessibilidade para pessoas com deficiência');
  AddCSTClassTrib('200', '200015', 'Medicamentos');
  AddCSTClassTrib('200', '200016', 'Serviços de educação');
  AddCSTClassTrib('200', '200017', 'Serviços de saúde');
  AddCSTClassTrib('200', '200018', 'Produtos de higiene pessoal e limpeza');
  AddCSTClassTrib('200', '200019', 'Produtos agropecuários');
  AddCSTClassTrib('200', '200020', 'Alimentos isentos');

  // CST 400 - Isenção
  AddCSTClassTrib('400', '400000', 'Operação isenta');
  AddCSTClassTrib('400', '400010', 'Serviços de educação');
  AddCSTClassTrib('400', '400011', 'Operações com medicamentos de uso humano dispensados com receita');
  AddCSTClassTrib('400', '400012', 'Dispositivos médicos e de acessibilidade');
  AddCSTClassTrib('400', '400020', 'Produtos hortícolas, frutas e ovos');
  AddCSTClassTrib('400', '400030', 'Operações com insumos agropecuários');
  AddCSTClassTrib('400', '400040', 'Serviços prestados por instituições financeiras');
  AddCSTClassTrib('400', '400050', 'Operações com produtos da cesta básica');

  // CST 410 - Não incidência
  AddCSTClassTrib('410', '410000', 'Operação não sujeita à incidência');
  AddCSTClassTrib('410', '410010', 'Operação com locação de bens imóveis residenciais');
  AddCSTClassTrib('410', '410020', 'Serviços prestados por sociedades');
  AddCSTClassTrib('410', '410030', 'Operações de seguro social e de seguros de vida');
  AddCSTClassTrib('410', '410040', 'Operações de concessão e intermediação de crédito');
  AddCSTClassTrib('410', '410050', 'Operações de transporte público coletivo municipal');
  AddCSTClassTrib('410', '410060', 'Prestação de serviços para entidade da qual o prestador seja associado');

  // CST 510 - Diferimento
  AddCSTClassTrib('510', '510000', 'Operação com diferimento');
  AddCSTClassTrib('510', '510010', 'Operação com diferimento do IBS/CBS');
  AddCSTClassTrib('510', '510020', 'Operação de importação com diferimento do IBS/CBS');
  AddCSTClassTrib('510', '510030', 'Operação com insumos agropecuários com diferimento');
  AddCSTClassTrib('510', '510040', 'Operação com diferimento em regime especial');
  AddCSTClassTrib('510', '510050', 'Operação de importação para industrialização com diferimento');

  // CST 550 - Suspensão
  AddCSTClassTrib('550', '550000', 'Operação com suspensão');
  AddCSTClassTrib('550', '550010', 'Operação com bens materiais com o fim específico de exportação');
  AddCSTClassTrib('550', '550020', 'Entrega de bens a estabelecimento em regime aduaneiro especial');
  AddCSTClassTrib('550', '550030', 'Operação de remessa para industrialização por encomenda');
  AddCSTClassTrib('550', '550040', 'Operações com suspensão de tributos em regimes especiais');
  AddCSTClassTrib('550', '550050', 'Operação com suspensão vinculada a programa de incentivo');

  // CST 620 - Tributação monofásica
  AddCSTClassTrib('620', '620000', 'Operação com tributação monofásica');
  AddCSTClassTrib('620', '620010', 'Operação com combustíveis - produção');
  AddCSTClassTrib('620', '620011', 'Operação com combustíveis - distribuição');
  AddCSTClassTrib('620', '620012', 'Operação com combustíveis - revenda');
  AddCSTClassTrib('620', '620020', 'Operação com bebidas alcoólicas - produção');
  AddCSTClassTrib('620', '620021', 'Operação com bebidas alcoólicas - distribuição');
  AddCSTClassTrib('620', '620022', 'Operação com bebidas alcoólicas - revenda');
  AddCSTClassTrib('620', '620030', 'Operação com cigarros e outros produtos do fumo - produção');
  AddCSTClassTrib('620', '620031', 'Operação com cigarros e outros produtos do fumo - distribuição');
  AddCSTClassTrib('620', '620032', 'Operação com cigarros e outros produtos do fumo - revenda');

  // CST 800 - Transferência de créditos
  AddCSTClassTrib('800', '800000', 'Transferência de créditos');
  AddCSTClassTrib('800', '800010', 'Transferência de créditos acumulados');
  AddCSTClassTrib('800', '800020', 'Transferência especial de créditos do IBS');
  AddCSTClassTrib('800', '800030', 'Transferência de créditos entre estabelecimentos do mesmo contribuinte');
  AddCSTClassTrib('800', '800040', 'Transferência de créditos em operações de reorganização societária');
  AddCSTClassTrib('800', '800050', 'Transferência de créditos por sucessão');

  // CST 810 - Ajustes
  AddCSTClassTrib('810', '810000', 'Nota para fins de ajuste tributário');
  AddCSTClassTrib('810', '810010', 'Nota de débito para ajuste de imposto devido');
  AddCSTClassTrib('810', '810020', 'Nota de crédito para ajuste de imposto devido');
  AddCSTClassTrib('810', '810030', 'Ajuste de base de cálculo');
  AddCSTClassTrib('810', '810040', 'Ajuste por modificação de alíquota');
  AddCSTClassTrib('810', '810050', 'Ajuste por erro de classificação fiscal');

  // CST 900 - Outros
  AddCSTClassTrib('900', '900000', 'Outras operações');
  AddCSTClassTrib('900', '900010', 'Outras operações não classificadas');
  AddCSTClassTrib('900', '900020', 'Operações com tratamento tributário especial');
  AddCSTClassTrib('900', '900030', 'Operações com regime especial de tributação');
  AddCSTClassTrib('900', '900040', 'Operações com tratamento diferenciado');
  AddCSTClassTrib('900', '900050', 'Operações específicas de entidades sem fins lucrativos');
end;

function TCSTClassTribService.ObterClassTribPorCST(const CST: string): TArray<TCodigoClassTrib>;
var
  Lista: TList<TCodigoClassTrib>;
begin
  if FCSTClassTribMap.TryGetValue(CST, Lista) then
    Result := Lista.ToArray
  else
    SetLength(Result, 0);
end;

function TCSTClassTribService.ListarCSTDisponiveis: TArray<string>;
var
  Lista: TList<string>;
  CST: string;
begin
  Lista := TList<string>.Create;
  try
    for CST in FCSTClassTribMap.Keys do
      Lista.Add(CST);

    Result := Lista.ToArray;
  finally
    Lista.Free;
  end;
end;

function TCSTClassTribService.ObterDescricaoClassTrib(const CodClassTrib: string): string;
var
  Lista: TList<TCodigoClassTrib>;
  Item: TCodigoClassTrib;
begin
  Result := '';

  for Lista in FCSTClassTribMap.Values do
  begin
    for Item in Lista do
    begin
      if Item.Codigo = CodClassTrib then
      begin
        Result := Item.Descricao;
        Exit;
      end;
    end;
  end;
end;

function TCSTClassTribService.ValidarCSTComClassTrib(const CST, CodClassTrib: string): Boolean;
var
  Lista: TList<TCodigoClassTrib>;
  Item: TCodigoClassTrib;
begin
  Result := False;

  if FCSTClassTribMap.TryGetValue(CST, Lista) then
  begin
    for Item in Lista do
    begin
      if Item.Codigo = CodClassTrib then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

end.
