{
module Lexer where
}

%wrapper "basic"

$digit = [0-9] 
$alpha = [a-zA-Z]
$string = [a-zA-Z0-9 ]

tokens :-
  $white+                        ;  
  "--".*                         ; 
  "="                            { \_ -> Tok_Eq }
  \" $string* \"                 { \s -> Tok_Str (init (tail s)) }
  $alpha [$alpha $digit \_ \']*  { \s -> Tok_Var s }

{
data Token 
    = Tok_Eq
    | Tok_Var String
    | Tok_Str String
    deriving(Eq, Show)
}
