unit UntPrincCClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ReformaTributaria.ClassTrib;

type
  TForm8 = class(TForm)
    cboCST: TComboBox;
    cboCClassTrib: TComboBox;
    mLog: TMemo;
    lblCST: TLabel;
    lblCClassTrib: TLabel;
    lblDescricao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cboCSTChange(Sender: TObject);
    procedure cboCClassTribChange(Sender: TObject);
  private
    FCSTService: TCSTClassTribService;
    procedure CarregarCSTs;
    procedure CarregarClassTribPorCST(const CST: string);
    procedure ExibirDescricaoClassTrib(const CodClassTrib: string);
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.FormCreate(Sender: TObject);
begin
  FCSTService := TCSTClassTribService.Create;

  // Adicionar rótulos caso não existam no DFM
  if not Assigned(lblCST) then
  begin
    lblCST := TLabel.Create(Self);
    lblCST.Parent := Self;
    lblCST.Caption := 'CST:';
    lblCST.Left := cboCST.Left;
    lblCST.Top := cboCST.Top - 20;
  end;

  if not Assigned(lblCClassTrib) then
  begin
    lblCClassTrib := TLabel.Create(Self);
    lblCClassTrib.Parent := Self;
    lblCClassTrib.Caption := 'Código de Classificação Tributária:';
    lblCClassTrib.Left := cboCClassTrib.Left;
    lblCClassTrib.Top := cboCClassTrib.Top - 20;
  end;

  if not Assigned(lblDescricao) then
  begin
    lblDescricao := TLabel.Create(Self);
    lblDescricao.Parent := Self;
    lblDescricao.Caption := 'Descrição:';
    lblDescricao.Left := mLog.Left;
    lblDescricao.Top := mLog.Top - 20;
  end;

  // Carregar os CSTs no ComboBox
  CarregarCSTs;

  // Configurar eventos de alteração
  cboCST.OnChange := cboCSTChange;
  cboCClassTrib.OnChange := cboCClassTribChange;
end;

procedure TForm8.FormDestroy(Sender: TObject);
begin
  FCSTService.Free;
end;

procedure TForm8.CarregarCSTs;
var
  CSTs: TArray<string>;
  CST: string;
begin
  cboCST.Items.Clear;
  cboCST.Text := '';

  CSTs := FCSTService.ListarCSTDisponiveis;

  for CST in CSTs do
  begin
    case CST.ToInteger of
      0: cboCST.Items.Add(Format('%s - Tributação Normal', [CST]));
      200: cboCST.Items.Add(Format('%s - Alíquota Zero', [CST]));
      400: cboCST.Items.Add(Format('%s - Isenção', [CST]));
      410: cboCST.Items.Add(Format('%s - Não Incidência', [CST]));
      510: cboCST.Items.Add(Format('%s - Diferimento', [CST]));
      550: cboCST.Items.Add(Format('%s - Suspensão', [CST]));
      620: cboCST.Items.Add(Format('%s - Tributação Monofásica', [CST]));
      800: cboCST.Items.Add(Format('%s - Transferência de Créditos', [CST]));
      810: cboCST.Items.Add(Format('%s - Ajustes', [CST]));
      900: cboCST.Items.Add(Format('%s - Outros', [CST]));
    else
      cboCST.Items.Add(CST);
    end;
  end;

  // Limpar o segundo ComboBox
  cboCClassTrib.Items.Clear;
  cboCClassTrib.Text := '';

  // Limpar o Memo
  mLog.Clear;
end;

procedure TForm8.CarregarClassTribPorCST(const CST: string);
var
  CodigosClassTrib: TArray<TCodigoClassTrib>;
  Codigo: TCodigoClassTrib;
begin
  cboCClassTrib.Items.Clear;
  cboCClassTrib.Text := '';

  CodigosClassTrib := FCSTService.ObterClassTribPorCST(CST);

  for Codigo in CodigosClassTrib do
    cboCClassTrib.Items.Add(Format('%s - %s', [Codigo.Codigo, Codigo.Descricao]));

  // Limpar o Memo
  mLog.Clear;
end;

procedure TForm8.ExibirDescricaoClassTrib(const CodClassTrib: string);
var
  Descricao: string;
begin
  mLog.Clear;

  Descricao := FCSTService.ObterDescricaoClassTrib(CodClassTrib);

  if Descricao <> '' then
  begin
    mLog.Lines.Add('Código: ' + CodClassTrib);
    mLog.Lines.Add('Descrição: ' + Descricao);
  end;
end;

procedure TForm8.cboCSTChange(Sender: TObject);
var
  CST: string;
  PosTraco: Integer;
begin
  if cboCST.ItemIndex >= 0 then
  begin
    // Extrair o CST do item selecionado (apenas os dígitos antes do traço)
    PosTraco := Pos(' - ', cboCST.Text);
    if PosTraco > 0 then
      CST := Copy(cboCST.Text, 1, PosTraco - 1)
    else
      CST := cboCST.Text;

    // Preencher o ComboBox de Classificação Tributária
    CarregarClassTribPorCST(CST);
  end;
end;

procedure TForm8.cboCClassTribChange(Sender: TObject);
var
  CodClassTrib: string;
  PosTraco: Integer;
begin
  if cboCClassTrib.ItemIndex >= 0 then
  begin
    // Extrair o código de classificação do item selecionado (apenas os dígitos antes do traço)
    PosTraco := Pos(' - ', cboCClassTrib.Text);
    if PosTraco > 0 then
      CodClassTrib := Copy(cboCClassTrib.Text, 1, PosTraco - 1)
    else
      CodClassTrib := cboCClassTrib.Text;

    // Exibir a descrição
    ExibirDescricaoClassTrib(CodClassTrib);
  end;
end;

end.
