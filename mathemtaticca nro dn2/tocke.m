(* ::Package:: *)


tocke[n_]:=Module[{notr,zunj,x,y},

notr={};
zunj={};

Do[
x=RandomReal[];
y=RandomReal[];

If[
x^2+y^2<=1,
AppendTo[notr,{x,y}],AppendTo[zunj,{x,y}]],{n}];
{notr,zunj};

Return[{notr,zunj}];]




(* ::Input:: *)
(*SetDirectory[NotebookDirectory[]];*)
(*Save["tocke.m",tocke]*)
