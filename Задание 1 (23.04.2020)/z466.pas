procedure Zamen(var s:string);
var n,i,k:byte;
begin
  for i:=k to n do
    if s[i]='0' then s[i]:='1'
    else if s[i]='1' then s[i]:='0';
    writeln('s=',s);
end.

