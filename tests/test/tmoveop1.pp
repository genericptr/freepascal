{$mode objfpc}
{$modeswitch advancedrecords}

program tmoveop1;

type
  TCopyOperations = (op_copy, op_move, op_uknown);
var
  LastOperation: TCopyOperations;

type
  TBase = record
    constructor Create(val: integer);
    class operator Copy(constref aSrc: TBase; var aDst: TBase);
    class operator Move(constref aSrc: TBase; var aDst: TBase);
  end;
  PBase = ^TBase;
  TBaseAlias = TBase;

constructor TBase.Create(val: integer);
begin
end;

class operator TBase.Copy(constref aSrc: TBase; var aDst: TBase);
begin
  LastOperation := op_copy;
end;

class operator TBase.Move(constref aSrc: TBase; var aDst: TBase);
begin
  LastOperation := op_move;
end;

type
  TMyClass = class
    a: TBase;
    function GetBase: TBase;
    function GetBase_inline: TBase; inline;
    property a0: TBase read a;
    property a1: TBase read GetBase;
    property a2: TBase read GetBase_inline;
  end;

function TMyClass.GetBase: TBase;
begin
  result := a;
end;

function TMyClass.GetBase_inline: TBase;
begin
  result := a;
end;

var
  gBase: TBase;

function get_pbase: PBase;
begin
  result := @gBase;
end;

function get_base: TBase;
begin
  result := gBase;
end;

procedure FailIfNot(op: TCopyOperations);
begin
  if LastOperation <> op then
    begin
      writeln('FAILED! LastOperation=', LastOperation, ' should be ', op);
      halt(-1);
    end;
end;

var
  a,b: TBase;
  p: PBase;
  r: array of TBase;
  c: TMyClass;
begin

  { load nodes are always copies becase they point to static memory }
  LastOperation := op_uknown;
  a := b;
  FailIfNot(op_copy);

  LastOperation := op_uknown;
  a := TBaseAlias(b);
  FailIfNot(op_copy);

  { deref nodes always default to copy because we can't confirm at
    compile time that they point to temporary memory or not }
  LastOperation := op_uknown;
  a := get_pbase^;
  FailIfNot(op_copy);

  LastOperation := op_uknown;
  a := pbase(@get_base)^;
  FailIfNot(op_copy);

  { call nodes are a move operation because the function is always 
    copy-on-pass in pascal }
  LastOperation := op_uknown;
  a := get_base;
  FailIfNot(op_move);

  { constructors are call nodes so same rules apply }
  LastOperation := op_uknown;
  a := TBase.Create(1);
  FailIfNot(op_move);

  { dynamic arrays - same rules apply as normal assignments }
  LastOperation := op_uknown;
  r := [a];
  FailIfNot(op_copy);

  { dynamic arrays - same rules apply as normal assignments }
  LastOperation := op_uknown;
  r := [TBase.Create(1)];
  FailIfNot(op_move);

  { vector nodes always default to copy because we can't confirm at
    compile time that they point to temporary memory or not }
  LastOperation := op_uknown;
  a := r[0];
  FailIfNot(op_copy);

  { subscript node to field is static memory }
  c := TMyClass.Create;
  LastOperation := op_uknown;
  a := c.a;
  FailIfNot(op_copy);

  { read property is fieldvarsym which is static memory }
  LastOperation := op_uknown;
  a := c.a0;
  FailIfNot(op_copy);

  { read property with getter function is call node and temporary }
  LastOperation := op_uknown;
  a := c.a1;
  FailIfNot(op_move);

  { read property with getter function is inlined so it maps
    directly to a field and should be a copy }
  LastOperation := op_uknown;
  a := c.a2;
  FailIfNot(op_copy);
end.
