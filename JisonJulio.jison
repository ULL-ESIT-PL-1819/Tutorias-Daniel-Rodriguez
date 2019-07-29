%lex

%%
[|*()?+.^$] return yytext;
.           return 'CHAR'
<<EOF>>    return 'EOF'
/lex

%left '|'
%nonassoc '(' '.' '$' '^' 'CHAR'
%left CHUCHU
%left '?' '*' '+'

%%
s: er  EOF { return $1; }
 ;

er
  : er '|' er 
       {$$ = ['|',[$1,$3]]; }
  | er er %prec CHUCHU
       {$$ = ["CONCAT",[$1,$2]];}
  | er '?'
       {$$ = ['?', $1];}
  | er '*'
       {$$ = ['*', $1];}
  | er '+'
       {$$ = ['+', $1];}
  | '(' er ')'
       {$$ = $2;}
  | '.'
       {$$ = '.';}
  | '^'
       {$$ = '^';}
  | '$'
       {$$ = '$';}
  | CHAR
       {$$ = ['CHAR', $1]; }
  ;
  
