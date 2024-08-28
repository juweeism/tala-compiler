{
module Parser where

import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }


%token
    "="      { Tok_Eq }
    var      { Tok_Var $$ }
    str      { Tok_Str $$ }

%%

Assignment : var "=" str { Assignment $1 $3 }

{
data Assignment 
    = Assignment String String
    deriving (Eq, Show)

parseError :: [Token] -> a 
parseError _ = error "Parse error"
}
