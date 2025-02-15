unit MonolitoFinanceiro.Utilitarios;

interface
type
  TUtilitario = class
    class function GetID : String;
    end;

implementation
uses System.SysUtils;
{ TUtilitario }

class function TUtilitario.GetID: String;
begin
  Result := TGUID.NewGuid.TOString;
  Result := StringReplace(Result, '{', '',[rfReplaceAll]);
  Result := StringReplace(Result, '}', '',[rfReplaceAll]);
end;

end.
