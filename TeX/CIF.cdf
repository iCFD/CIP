(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    173215,       5232]
NotebookOptionsPosition[    164753,       4928]
NotebookOutlinePosition[    165194,       4948]
CellTagsIndexPosition[    165151,       4945]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Constrained Interpolation Methods", "Title"],

Cell["by Manuel Diaz, NTU, 2015.08.10.", "Subtitle"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Quit", "[", "]"}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Proposed Interpolation Functions", "Section"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f0", "[", "\[Xi]_", "]"}], ":=", 
   RowBox[{"a", "+", 
    RowBox[{"b", " ", "\[Xi]"}], "+", 
    RowBox[{"c", " ", 
     SuperscriptBox["\[Xi]", "2"]}]}]}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f1", "[", "\[Xi]_", "]"}], ":=", 
   RowBox[{"a", " ", "+", " ", 
    RowBox[{"b", " ", "\[Xi]"}], "+", 
    RowBox[{"c", " ", 
     SuperscriptBox["\[Xi]", "2"]}], "+", 
    RowBox[{"d", " ", 
     SuperscriptBox["\[Xi]", "3"]}]}]}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f2", "[", "\[Xi]_", "]"}], ":=", 
   FractionBox[
    RowBox[{"a", "+", 
     RowBox[{"b", " ", "\[Xi]"}], "+", 
     RowBox[{"c", " ", 
      SuperscriptBox["\[Xi]", "2"]}]}], 
    RowBox[{"1", "+", " ", 
     RowBox[{"e", " ", "\[Xi]"}]}]]}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f3", "[", "\[Xi]_", "]"}], ":=", 
  RowBox[{
   RowBox[{
    RowBox[{"-", 
     FractionBox["c", "a"]}], " ", "\[CapitalDelta]x", " ", 
    RowBox[{"Log", "[", 
     RowBox[{"\[Xi]", "-", 
      RowBox[{
       FractionBox["\[CapitalDelta]x", "2"], 
       RowBox[{"(", 
        RowBox[{
         FractionBox["2", "a"], "-", "1"}], ")"}]}]}], "]"}]}], "+", 
   RowBox[{
    RowBox[{"-", 
     FractionBox["d", "b"]}], " ", "\[CapitalDelta]x", " ", 
    RowBox[{"Log", "[", 
     RowBox[{"\[Xi]", "-", 
      RowBox[{
       FractionBox["\[CapitalDelta]x", "2"], 
       RowBox[{"(", 
        RowBox[{
         FractionBox["2", "b"], "-", "1"}], ")"}]}]}], "]"}]}]}]}]}], "Input"],

Cell[CellGroupData[{

Cell["Just Testing", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"f0", "[", 
  RowBox[{
   RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"f0", "[", 
  RowBox[{
   RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"f1", "[", 
  RowBox[{
   RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"f1", "[", 
  RowBox[{
   RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"f2", "[", 
  RowBox[{
   RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"f2", "[", 
  RowBox[{
   RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f3", "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "//", 
  "Simplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f3", "[", 
   RowBox[{
    RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "//", 
  "Simplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{"a", "-", 
  FractionBox[
   RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
  FractionBox[
   RowBox[{"c", " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}]], "Output"],

Cell[BoxData[
 RowBox[{"a", "+", 
  FractionBox[
   RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
  FractionBox[
   RowBox[{"c", " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}]], "Output"],

Cell[BoxData[
 RowBox[{"a", "-", 
  FractionBox[
   RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
  FractionBox[
   RowBox[{"c", " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"], "-", 
  FractionBox[
   RowBox[{"d", " ", 
    SuperscriptBox["\[CapitalDelta]x", "3"]}], "8"]}]], "Output"],

Cell[BoxData[
 RowBox[{"a", "+", 
  FractionBox[
   RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
  FractionBox[
   RowBox[{"c", " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"], "+", 
  FractionBox[
   RowBox[{"d", " ", 
    SuperscriptBox["\[CapitalDelta]x", "3"]}], "8"]}]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{"a", "-", 
   FractionBox[
    RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], 
  RowBox[{"1", "-", 
   FractionBox[
    RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}]]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{"a", "+", 
   FractionBox[
    RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], 
  RowBox[{"1", "+", 
   FractionBox[
    RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}]]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{"\[CapitalDelta]x", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"b", " ", "c", " ", 
       RowBox[{"Log", "[", 
        RowBox[{"-", 
         FractionBox["\[CapitalDelta]x", "a"]}], "]"}]}], "+", 
      RowBox[{"a", " ", "d", " ", 
       RowBox[{"Log", "[", 
        RowBox[{"-", 
         FractionBox["\[CapitalDelta]x", "b"]}], "]"}]}]}], ")"}]}], 
   RowBox[{"a", " ", "b"}]]}]], "Output"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{"\[CapitalDelta]x", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"b", " ", "c", " ", 
       RowBox[{"Log", "[", 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", "\[CapitalDelta]x"}], 
         "a"], "]"}]}], "+", 
      RowBox[{"a", " ", "d", " ", 
       RowBox[{"Log", "[", 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "b"}], ")"}], " ", "\[CapitalDelta]x"}], 
         "b"], "]"}]}]}], ")"}]}], 
   RowBox[{"a", " ", "b"}]]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"f0", "'"}], "[", 
  RowBox[{
   RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f0", "'"}], "[", 
  RowBox[{
   RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f1", "'"}], "[", 
  RowBox[{
   RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f1", "'"}], "[", 
  RowBox[{
   RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f2", "'"}], "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"a", "-", 
     FractionBox[
      RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
     FractionBox[
      RowBox[{"c", " ", 
       SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], " ", ")"}], 
   "\[Rule]", " ", 
   RowBox[{
    SubscriptBox["f", 
     RowBox[{"i", "-", 
      RowBox[{"1", "/", "2"}]}]], " ", 
    RowBox[{"(", 
     RowBox[{"1", "-", 
      FractionBox[
       RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}], 
     ")"}]}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f2", "'"}], "[", 
   RowBox[{
    RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"a", "+", 
     FractionBox[
      RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
     FractionBox[
      RowBox[{"c", " ", 
       SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], " ", ")"}], 
   "\[Rule]", " ", 
   RowBox[{
    SubscriptBox["f", 
     RowBox[{"i", "+", 
      RowBox[{"1", "/", "2"}]}]], " ", 
    RowBox[{"(", 
     RowBox[{"1", "+", 
      FractionBox[
       RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}], 
     ")"}]}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f3", "'"}], "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "//", 
  "Simplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f3", "'"}], "[", 
   RowBox[{
    RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "//", 
  "Simplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{"b", "-", 
  RowBox[{"c", " ", "\[CapitalDelta]x"}]}]], "Output"],

Cell[BoxData[
 RowBox[{"b", "+", 
  RowBox[{"c", " ", "\[CapitalDelta]x"}]}]], "Output"],

Cell[BoxData[
 RowBox[{"b", "-", 
  RowBox[{"c", " ", "\[CapitalDelta]x"}], "+", 
  FractionBox[
   RowBox[{"3", " ", "d", " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}]], "Output"],

Cell[BoxData[
 RowBox[{"b", "+", 
  RowBox[{"c", " ", "\[CapitalDelta]x"}], "+", 
  FractionBox[
   RowBox[{"3", " ", "d", " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{"b", "-", 
    RowBox[{"c", " ", "\[CapitalDelta]x"}]}], 
   RowBox[{"1", "-", 
    FractionBox[
     RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}]], "-", 
  FractionBox[
   RowBox[{"d", " ", 
    SubscriptBox["f", 
     RowBox[{
      RowBox[{"-", 
       FractionBox["1", "2"]}], "+", "i"}]]}], 
   RowBox[{"1", "-", 
    FractionBox[
     RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}]]}]], "Output"],

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{"b", "+", 
    RowBox[{"c", " ", "\[CapitalDelta]x"}]}], 
   RowBox[{"1", "+", 
    FractionBox[
     RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}]], "-", 
  FractionBox[
   RowBox[{"d", " ", 
    SubscriptBox["f", 
     RowBox[{
      FractionBox["1", "2"], "+", "i"}]]}], 
   RowBox[{"1", "+", 
    FractionBox[
     RowBox[{"d", " ", "\[CapitalDelta]x"}], "2"]}]]}]], "Output"],

Cell[BoxData[
 RowBox[{"c", "+", "d"}]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{"c", "-", 
   RowBox[{"b", " ", "c"}], "+", "d", "-", 
   RowBox[{"a", " ", "d"}]}], 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "b"}], ")"}]}]]], "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Interpolating Polynomial f0[x]", "Section"],

Cell[CellGroupData[{

Cell["constrains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f0", "'"}], "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    SubscriptBox["f", "i"], "-", 
    SubscriptBox["f", 
     RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f0", "'"}], "[", 
   RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    SubscriptBox["f", 
     RowBox[{"i", "+", "1"}]], "-", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "-", 
   RowBox[{"c", " ", "\[CapitalDelta]x"}]}], "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "+", 
   RowBox[{"c", " ", "\[CapitalDelta]x"}]}], "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", "i"]}], "+", 
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]]}], "\[CapitalDelta]x"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Simplify", "[", 
   RowBox[{
    FractionBox["1", "\[CapitalDelta]x"], 
    RowBox[{
     SubsuperscriptBox["\[Integral]", 
      RowBox[{
       RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
      RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
     RowBox[{
      RowBox[{"f0", "[", "\[Xi]", "]"}], 
      RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "]"}], "==", " ", 
  SubscriptBox["f", "i"]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "12"]}], "\[Equal]", 
  SubscriptBox["f", "i"]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["solving as a system of equations", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f0", "'"}], "[", 
       RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       RowBox[{
        SubscriptBox["f", 
         RowBox[{"i", "+", "1"}]], "-", 
        SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}], " ", "&&", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"f0", "'"}], "[", 
       RowBox[{
        RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       RowBox[{
        SubscriptBox["f", "i"], "-", 
        SubscriptBox["f", 
         RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], " ", "&&", 
     RowBox[{
      RowBox[{
       RowBox[{"+", 
        FractionBox["1", "\[CapitalDelta]x"]}], 
       RowBox[{
        SubsuperscriptBox["\[Integral]", 
         RowBox[{
          RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
         RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
        RowBox[{
         RowBox[{"f0", "[", "\[Xi]", "]"}], 
         RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "==", " ", 
      SubscriptBox["f", "i"]}]}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "c"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", "24"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{"26", " ", 
         SubscriptBox["f", "i"]}], "-", 
        SubscriptBox["f", 
         RowBox[{"1", "+", "i"}]]}], ")"}]}]}], ",", 
    RowBox[{"b", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        SubscriptBox["f", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "i"}]], "-", 
        SubscriptBox["f", 
         RowBox[{"1", "+", "i"}]]}], 
       RowBox[{"2", " ", "\[CapitalDelta]x"}]]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{"-", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{"2", " ", 
         SubscriptBox["f", "i"]}], "-", 
        SubscriptBox["f", 
         RowBox[{"1", "+", "i"}]]}], 
       RowBox[{"2", " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]]}]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f0", "[", 
    RowBox[{
     RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", " ", 
   "coefs"}], " ", "//", "Expand"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f0", "[", 
    RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], " ", "/.", " ", "coefs"}], 
  " ", "//", "Expand"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox[
    SubscriptBox["f", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "i"}]], "3"], "+", 
   FractionBox[
    RowBox[{"5", " ", 
     SubscriptBox["f", "i"]}], "6"], "-", 
   FractionBox[
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]], "6"]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    RowBox[{"-", 
     FractionBox["1", "6"]}], " ", 
    SubscriptBox["f", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
   FractionBox[
    RowBox[{"5", " ", 
     SubscriptBox["f", "i"]}], "6"], "+", 
   FractionBox[
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]], "3"]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f0", "'"}], "[", 
       RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       SubscriptBox["d", 
        RowBox[{"i", "+", 
         RowBox[{"1", "/", "2"}]}]], "\[CapitalDelta]x"]}], " ", "&&", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"f0", "'"}], "[", 
       RowBox[{
        RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       SubscriptBox["d", 
        RowBox[{"i", "-", 
         RowBox[{"1", "/", "2"}]}]], "\[CapitalDelta]x"]}], " ", "&&", 
     RowBox[{
      RowBox[{
       RowBox[{"+", 
        FractionBox["1", "\[CapitalDelta]x"]}], 
       RowBox[{
        SubsuperscriptBox["\[Integral]", 
         RowBox[{
          RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
         RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
        RowBox[{
         RowBox[{"f0", "[", "\[Xi]", "]"}], 
         RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "==", " ", 
      SubscriptBox["f", "i"]}]}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "c"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", "24"], " ", 
      RowBox[{"(", 
       RowBox[{
        SubscriptBox["d", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]], "-", 
        SubscriptBox["d", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]], "+", 
        RowBox[{"24", " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}]}], ",", 
    RowBox[{"b", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{"-", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "-", 
        SubscriptBox["d", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       RowBox[{"2", " ", "\[CapitalDelta]x"}]]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        SubscriptBox["d", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]], "-", 
        SubscriptBox["d", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       RowBox[{"2", " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]]}]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Interpolating Polynomial f1[x]", "Section"],

Cell[CellGroupData[{

Cell["constrains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f1", "'"}], "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    SubscriptBox["f", "i"], "-", 
    SubscriptBox["f", 
     RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f1", "'"}], "[", 
   RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    SubscriptBox["f", 
     RowBox[{"i", "+", "1"}]], "-", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "-", 
   RowBox[{"c", " ", "\[CapitalDelta]x"}], "+", 
   FractionBox[
    RowBox[{"3", " ", "d", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "+", 
   RowBox[{"c", " ", "\[CapitalDelta]x"}], "+", 
   FractionBox[
    RowBox[{"3", " ", "d", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", "i"]}], "+", 
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]]}], "\[CapitalDelta]x"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Simplify", "[", 
   RowBox[{
    FractionBox["1", "\[CapitalDelta]x"], 
    RowBox[{
     SubsuperscriptBox["\[Integral]", 
      RowBox[{
       RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
      RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
     RowBox[{
      RowBox[{"f1", "[", "\[Xi]", "]"}], 
      RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "]"}], "==", " ", 
  SubscriptBox["f", "i"]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "12"]}], "\[Equal]", 
  SubscriptBox["f", "i"]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["solving as a system of equations", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f1", "'"}], "[", 
       RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       RowBox[{
        SubscriptBox["f", 
         RowBox[{"i", "+", "1"}]], "-", 
        SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}], " ", "&&", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"f1", "'"}], "[", 
       RowBox[{
        RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       RowBox[{
        SubscriptBox["f", "i"], "-", 
        SubscriptBox["f", 
         RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], " ", "&&", 
     RowBox[{
      RowBox[{
       RowBox[{"+", 
        FractionBox["1", "\[CapitalDelta]x"]}], 
       RowBox[{
        SubsuperscriptBox["\[Integral]", 
         RowBox[{
          RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
         RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
        RowBox[{
         RowBox[{"f1", "[", "\[Xi]", "]"}], 
         RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "==", " ", 
      SubscriptBox["f", "i"]}]}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "c", ",", "d"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", "24"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{"26", " ", 
         SubscriptBox["f", "i"]}], "-", 
        SubscriptBox["f", 
         RowBox[{"1", "+", "i"}]]}], ")"}]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{"-", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{"2", " ", 
         SubscriptBox["f", "i"]}], "-", 
        SubscriptBox["f", 
         RowBox[{"1", "+", "i"}]]}], 
       RowBox[{"2", " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]]}]}], ",", 
    RowBox[{"d", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{"2", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"2", " ", "b", " ", "\[CapitalDelta]x"}], "+", 
          SubscriptBox["f", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "i"}]], "-", 
          SubscriptBox["f", 
           RowBox[{"1", "+", "i"}]]}], ")"}]}], 
       RowBox[{"3", " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]]}]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f1", "[", 
    RowBox[{
     RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", " ", 
   "coefs"}], " ", "//", "Expand"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f1", "[", 
    RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], " ", "/.", " ", "coefs"}], 
  " ", "//", "Expand"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", 
    FractionBox[
     RowBox[{"b", " ", "\[CapitalDelta]x"}], "3"]}], "+", 
   FractionBox[
    SubscriptBox["f", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "i"}]], "6"], "+", 
   FractionBox[
    RowBox[{"5", " ", 
     SubscriptBox["f", "i"]}], "6"]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox[
    RowBox[{"b", " ", "\[CapitalDelta]x"}], "3"], "+", 
   FractionBox[
    RowBox[{"5", " ", 
     SubscriptBox["f", "i"]}], "6"], "+", 
   FractionBox[
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]], "6"]}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
What is b? 
To find out we will assuming and extra constrain:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"bcoef", " ", "=", " ", 
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"f1", "'"}], "[", "0", "]"}], "\[Equal]", 
     FractionBox[
      RowBox[{
       SubscriptBox["f", 
        RowBox[{"i", "+", "1"}]], "-", 
       SubscriptBox["f", 
        RowBox[{"i", "-", "1"}]]}], 
      RowBox[{"2", "\[CapitalDelta]x"}]]}], ",", "b"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"b", "\[Rule]", 
    FractionBox[
     RowBox[{
      RowBox[{"-", 
       SubscriptBox["f", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
      SubscriptBox["f", 
       RowBox[{"1", "+", "i"}]]}], 
     RowBox[{"2", " ", "\[CapitalDelta]x"}]]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f1", "[", 
     RowBox[{
      RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", " ", 
    "coefs"}], " ", "/.", "bcoef"}], "//", 
  "Expand"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f1", "[", 
     RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], " ", "/.", " ", "coefs"}],
    " ", "/.", "bcoef"}], "//", "Expand"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    FractionBox[
     SubscriptBox["f", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "i"}]], "3"], "+", 
    FractionBox[
     RowBox[{"5", " ", 
      SubscriptBox["f", "i"]}], "6"], "-", 
    FractionBox[
     SubscriptBox["f", 
      RowBox[{"1", "+", "i"}]], "6"]}], "}"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     RowBox[{"-", 
      FractionBox["1", "6"]}], " ", 
     SubscriptBox["f", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
    FractionBox[
     RowBox[{"5", " ", 
      SubscriptBox["f", "i"]}], "6"], "+", 
    FractionBox[
     SubscriptBox["f", 
      RowBox[{"1", "+", "i"}]], "3"]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
NOTE: this is exactly the result from using polynomial f0[x]!\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Clear", "[", "d", "]"}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f1", "'"}], "[", 
       RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       SubscriptBox["\[Delta]", 
        RowBox[{"i", "+", 
         RowBox[{"1", "/", "2"}]}]], "\[CapitalDelta]x"]}], " ", "&&", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"f1", "'"}], "[", 
       RowBox[{
        RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
      FractionBox[
       SubscriptBox["\[Delta]", 
        RowBox[{"i", "-", 
         RowBox[{"1", "/", "2"}]}]], "\[CapitalDelta]x"]}], " ", "&&", 
     RowBox[{
      RowBox[{
       RowBox[{"+", 
        FractionBox["1", "\[CapitalDelta]x"]}], 
       RowBox[{
        SubsuperscriptBox["\[Integral]", 
         RowBox[{
          RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
         RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
        RowBox[{
         RowBox[{"f1", "[", "\[Xi]", "]"}], 
         RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "==", " ", 
      SubscriptBox["f", "i"]}]}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "c", ",", "d"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", "24"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"24", " ", 
         SubscriptBox["f", "i"]}], "+", 
        SubscriptBox["\[Delta]", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]], "-", 
        SubscriptBox["\[Delta]", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], ")"}]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        SubscriptBox["\[Delta]", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]], "-", 
        SubscriptBox["\[Delta]", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       RowBox[{"2", " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]]}]}], ",", 
    RowBox[{"d", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{"2", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"2", " ", "b", " ", "\[CapitalDelta]x"}], "-", 
          SubscriptBox["\[Delta]", 
           RowBox[{
            RowBox[{"-", 
             FractionBox["1", "2"]}], "+", "i"}]], "-", 
          SubscriptBox["\[Delta]", 
           RowBox[{
            FractionBox["1", "2"], "+", "i"}]]}], ")"}]}], 
       RowBox[{"3", " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]]}]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell["\<\
Therefore, it is obvious that we can choose \[OpenCurlyQuote]b\
\[CloseCurlyQuote] as a free parameter to control the slope of the \
approximation!\
\>", "Text"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Non-polynomial Interpolation function f2[x]", "Section"],

Cell[CellGroupData[{

Cell["constrains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f2", "'"}], "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    SubscriptBox["f", "i"], "-", 
    SubscriptBox["f", 
     RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f2", "'"}], "[", 
   RowBox[{
    RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    SubscriptBox["f", 
     RowBox[{"i", "+", "1"}]], "-", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   FractionBox[
    RowBox[{"b", "-", 
     RowBox[{"c", " ", "\[CapitalDelta]x"}]}], 
    RowBox[{"1", "-", 
     FractionBox[
      RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}]], "-", 
   FractionBox[
    RowBox[{"e", " ", 
     RowBox[{"(", 
      RowBox[{"a", "-", 
       FractionBox[
        RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
       FractionBox[
        RowBox[{"c", " ", 
         SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], ")"}]}], 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"1", "-", 
       FractionBox[
        RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}], ")"}], "2"]]}], 
  "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   FractionBox[
    RowBox[{"b", "+", 
     RowBox[{"c", " ", "\[CapitalDelta]x"}]}], 
    RowBox[{"1", "+", 
     FractionBox[
      RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}]], "-", 
   FractionBox[
    RowBox[{"e", " ", 
     RowBox[{"(", 
      RowBox[{"a", "+", 
       FractionBox[
        RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
       FractionBox[
        RowBox[{"c", " ", 
         SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"]}], ")"}]}], 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"1", "+", 
       FractionBox[
        RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}], ")"}], "2"]]}], 
  "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", "i"]}], "+", 
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]]}], "\[CapitalDelta]x"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Simplify", "[", 
   RowBox[{
    FractionBox["1", "\[CapitalDelta]x"], 
    RowBox[{
     SubsuperscriptBox["\[Integral]", 
      RowBox[{
       RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
      RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
     RowBox[{
      RowBox[{"f2", "[", "\[Xi]", "]"}], 
      RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "]"}], "==", " ", 
  SubscriptBox["f", "i"]}]], "Input"],

Cell[BoxData[
 RowBox[{"ConditionalExpression", "[", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{
      RowBox[{"e", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "c"}], "+", 
         RowBox[{"b", " ", "e"}]}], ")"}], " ", "\[CapitalDelta]x"}], "+", 
      RowBox[{"2", " ", 
       RowBox[{"(", 
        RowBox[{"c", "+", 
         RowBox[{"e", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "b"}], "+", 
            RowBox[{"a", " ", "e"}]}], ")"}]}]}], ")"}], " ", 
       RowBox[{"ArcTanh", "[", 
        FractionBox[
         RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], 
     RowBox[{
      SuperscriptBox["e", "3"], " ", "\[CapitalDelta]x"}]], "\[Equal]", 
    SubscriptBox["f", "i"]}], ",", 
   RowBox[{
    RowBox[{
     RowBox[{"Re", "[", 
      FractionBox["1", 
       RowBox[{"e", " ", "\[CapitalDelta]x"}]], "]"}], ">", 
     FractionBox["1", "2"]}], "||", 
    RowBox[{
     RowBox[{"Re", "[", 
      FractionBox["1", 
       RowBox[{"e", " ", "\[CapitalDelta]x"}]], "]"}], "<", 
     RowBox[{"-", 
      FractionBox["1", "2"]}]}], "||", 
    RowBox[{
     FractionBox["1", 
      RowBox[{"e", " ", "\[CapitalDelta]x"}]], "\[NotElement]", "Reals"}]}]}],
   "]"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Solve system", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{"f2", "'"}], "[", 
        RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
       FractionBox[
        RowBox[{
         SubscriptBox["f", 
          RowBox[{"i", "+", "1"}]], "-", 
         SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}], " ", "&&", " ", 
      RowBox[{
       RowBox[{
        RowBox[{"f2", "'"}], "[", 
        RowBox[{
         RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
       FractionBox[
        RowBox[{
         SubscriptBox["f", "i"], "-", 
         SubscriptBox["f", 
          RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], " ", "&&", 
      RowBox[{
       RowBox[{"+", "\[IndentingNewLine]", 
        RowBox[{
         FractionBox["1", 
          RowBox[{
           SuperscriptBox["e", "3"], " ", "\[CapitalDelta]x"}]], 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "c"}], "+", 
              RowBox[{"b", " ", "e"}]}], ")"}], " ", "\[CapitalDelta]x"}], 
           "+", 
           RowBox[{"2", " ", 
            RowBox[{"(", 
             RowBox[{"c", "+", 
              RowBox[{"e", " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"-", "b"}], "+", 
                 RowBox[{"a", " ", "e"}]}], ")"}]}]}], ")"}], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], 
          ")"}]}]}], "\[Equal]", 
       SubscriptBox["f", "i"]}]}], ",", 
     RowBox[{"{", 
      RowBox[{"a", ",", "b", ",", "c"}], "}"}]}], "]"}], "//", 
   "Simplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"32", " ", 
        SuperscriptBox["e", "3"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x", " ", 
            RowBox[{"(", 
             RowBox[{"16", "-", 
              RowBox[{"24", " ", 
               SuperscriptBox["e", "2"], " ", 
               SuperscriptBox["\[CapitalDelta]x", "2"]}], "+", 
              RowBox[{
               SuperscriptBox["e", "4"], " ", 
               SuperscriptBox["\[CapitalDelta]x", "4"]}]}], ")"}]}], "+", 
           RowBox[{"4", " ", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "4"}], "+", 
               RowBox[{
                SuperscriptBox["e", "2"], " ", 
                SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}]}], ",", 
    RowBox[{"b", "\[Rule]", 
     RowBox[{"-", 
      RowBox[{
       FractionBox["1", 
        RowBox[{"16", " ", 
         SuperscriptBox["e", "2"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"]}]], 
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "2"}], "+", 
             RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
            RowBox[{
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"2", "+", 
                RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
             RowBox[{"ArcTanh", "[", 
              FractionBox[
               RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}],
           " ", 
          SubscriptBox["f", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
         RowBox[{"2", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "8"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
            RowBox[{"6", " ", 
             SuperscriptBox["e", "3"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "3"]}], "+", 
            RowBox[{
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "4"}], "+", 
                RowBox[{
                 SuperscriptBox["e", "2"], " ", 
                 SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], 
             " ", 
             RowBox[{"ArcTanh", "[", 
              FractionBox[
               RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}],
           " ", 
          SubscriptBox["f", "i"]}], "+", 
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"2", "+", 
             RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
            RowBox[{
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "2"}], "+", 
                RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
             RowBox[{"ArcTanh", "[", 
              FractionBox[
               RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}],
           " ", 
          SubscriptBox["f", 
           RowBox[{"1", "+", "i"}]]}]}], ")"}]}]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"8", " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{"4", "+", 
           RowBox[{
            SuperscriptBox["e", "2"], " ", 
            SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}]}]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell["for example notice that", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   FractionBox[
    RowBox[{
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "2"}], "+", 
         RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
      SubscriptBox["f", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
     RowBox[{"2", " ", 
      RowBox[{"(", 
       RowBox[{"4", "+", 
        RowBox[{
         SuperscriptBox["e", "2"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], " ", 
      SubscriptBox["f", "i"]}], "+", 
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"2", "+", 
         RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
      SubscriptBox["f", 
       RowBox[{"1", "+", "i"}]]}]}], 
    RowBox[{"8", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}]], "/.", 
   RowBox[{"e", "\[Rule]", "0"}]}], " ", "//", "Simplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SubscriptBox["f", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "i"}]], "-", 
   RowBox[{"2", " ", 
    SubscriptBox["f", "i"]}], "+", 
   SubscriptBox["f", 
    RowBox[{"1", "+", "i"}]]}], 
  RowBox[{"2", " ", 
   SuperscriptBox["\[CapitalDelta]x", "2"]}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f2", "[", 
    RowBox[{
     RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", " ", 
   "coefs"}], " "}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f2", "[", 
   RowBox[{
    RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], " ", "/.", " ", 
  "coefs", " "}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", 
    RowBox[{"1", "-", 
     FractionBox[
      RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}]], 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      FractionBox["1", "32"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{"4", "+", 
           RowBox[{
            SuperscriptBox["e", "2"], " ", 
            SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}], "+", 
     RowBox[{
      RowBox[{"1", "/", 
       RowBox[{"(", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"]}], ")"}]}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x", " ", 
            RowBox[{"(", 
             RowBox[{"16", "-", 
              RowBox[{"24", " ", 
               SuperscriptBox["e", "2"], " ", 
               SuperscriptBox["\[CapitalDelta]x", "2"]}], "+", 
              RowBox[{
               SuperscriptBox["e", "4"], " ", 
               SuperscriptBox["\[CapitalDelta]x", "4"]}]}], ")"}]}], "+", 
           RowBox[{"4", " ", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "4"}], "+", 
               RowBox[{
                SuperscriptBox["e", "2"], " ", 
                SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}], "+", 
     RowBox[{
      RowBox[{"1", "/", 
       RowBox[{"(", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "2"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "2"]}], ")"}]}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"2", "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "8"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{"6", " ", 
            SuperscriptBox["e", "3"], " ", 
            SuperscriptBox["\[CapitalDelta]x", "3"]}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "4"}], "+", 
               RowBox[{
                SuperscriptBox["e", "2"], " ", 
                SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}]}], ")"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", 
    RowBox[{"1", "+", 
     FractionBox[
      RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}]], 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      FractionBox["1", "32"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{"4", "+", 
           RowBox[{
            SuperscriptBox["e", "2"], " ", 
            SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}], "+", 
     RowBox[{
      RowBox[{"1", "/", 
       RowBox[{"(", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"]}], ")"}]}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x", " ", 
            RowBox[{"(", 
             RowBox[{"16", "-", 
              RowBox[{"24", " ", 
               SuperscriptBox["e", "2"], " ", 
               SuperscriptBox["\[CapitalDelta]x", "2"]}], "+", 
              RowBox[{
               SuperscriptBox["e", "4"], " ", 
               SuperscriptBox["\[CapitalDelta]x", "4"]}]}], ")"}]}], "+", 
           RowBox[{"4", " ", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "4"}], "+", 
               RowBox[{
                SuperscriptBox["e", "2"], " ", 
                SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}], "-", 
     RowBox[{
      RowBox[{"1", "/", 
       RowBox[{"(", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "2"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "2"]}], ")"}]}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"2", "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "i"}]]}], "-", 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "8"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{"6", " ", 
            SuperscriptBox["e", "3"], " ", 
            SuperscriptBox["\[CapitalDelta]x", "3"]}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "4"}], "+", 
               RowBox[{
                SuperscriptBox["e", "2"], " ", 
                SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", "i"]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["f", 
          RowBox[{"1", "+", "i"}]]}]}], ")"}]}]}], ")"}]}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
which is consisten with previous results. Re-compute with d-slopes variables:\
\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{"f2", "'"}], "[", 
        RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
       FractionBox[
        SubscriptBox["d", 
         RowBox[{"i", "+", 
          RowBox[{"1", "/", "2"}]}]], "\[CapitalDelta]x"]}], " ", "&&", " ", 
      RowBox[{
       RowBox[{
        RowBox[{"f2", "'"}], "[", 
        RowBox[{
         RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
       FractionBox[
        SubscriptBox["d", 
         RowBox[{"i", "-", 
          RowBox[{"1", "/", "2"}]}]], "\[CapitalDelta]x"]}], " ", "&&", 
      RowBox[{
       RowBox[{"+", "\[IndentingNewLine]", 
        RowBox[{
         FractionBox["1", 
          RowBox[{
           SuperscriptBox["e", "3"], " ", "\[CapitalDelta]x"}]], 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "c"}], "+", 
              RowBox[{"b", " ", "e"}]}], ")"}], " ", "\[CapitalDelta]x"}], 
           "+", 
           RowBox[{"2", " ", 
            RowBox[{"(", 
             RowBox[{"c", "+", 
              RowBox[{"e", " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"-", "b"}], "+", 
                 RowBox[{"a", " ", "e"}]}], ")"}]}]}], ")"}], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], 
          ")"}]}]}], "\[Equal]", 
       SubscriptBox["f", "i"]}]}], ",", 
     RowBox[{"{", 
      RowBox[{"a", ",", "b", ",", "c"}], "}"}]}], "]"}], "//", 
   "Simplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"32", " ", 
        SuperscriptBox["e", "3"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "4"}], "+", 
             RowBox[{
              SuperscriptBox["e", "2"], " ", 
              SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"]}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}], "+", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"], " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}]}], ",", 
    RowBox[{"b", "\[Rule]", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"16", " ", 
        SuperscriptBox["e", "2"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"2", "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "-", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}], "+", 
        RowBox[{"16", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"], " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     FractionBox[
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"]}], " ", 
        SubscriptBox["d", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
       RowBox[{
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"2", "+", 
           RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
        SubscriptBox["d", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}]}], 
      RowBox[{"8", " ", 
       SuperscriptBox["\[CapitalDelta]x", "2"]}]]}]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f2", "[", 
    RowBox[{
     RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "/.", " ", 
   "coefs"}], " "}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f2", "[", 
   RowBox[{
    RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], " ", "/.", " ", 
  "coefs", " "}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", 
    RowBox[{"1", "-", 
     FractionBox[
      RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}]], 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      FractionBox["1", "32"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "2"}], "+", 
             RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"]}], " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}]}], ")"}]}], "-", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"32", " ", 
        SuperscriptBox["e", "2"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"2", "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "-", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}], "+", 
        RowBox[{"16", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"], " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}], "+", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"32", " ", 
        SuperscriptBox["e", "3"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "4"}], "+", 
             RowBox[{
              SuperscriptBox["e", "2"], " ", 
              SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"]}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}], "+", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"], " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}]}], ")"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", 
    RowBox[{"1", "+", 
     FractionBox[
      RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"]}]], 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      FractionBox["1", "32"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "2"}], "+", 
             RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"]}], " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}]}], ")"}]}], "+", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"32", " ", 
        SuperscriptBox["e", "2"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "2"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"2", "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "-", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"2", "+", 
            RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "e", " ", "\[CapitalDelta]x"}], "+", 
           RowBox[{
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", 
               RowBox[{"e", " ", "\[CapitalDelta]x"}]}], ")"}], "2"], " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}], "+", 
        RowBox[{"16", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"], " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}], "+", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"32", " ", 
        SuperscriptBox["e", "3"], " ", 
        SuperscriptBox["\[CapitalDelta]x", "3"]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "4"}], "+", 
             RowBox[{
              SuperscriptBox["e", "2"], " ", 
              SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"]}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "4"}], "+", 
            RowBox[{
             SuperscriptBox["e", "2"], " ", 
             SuperscriptBox["\[CapitalDelta]x", "2"]}]}], ")"}], "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"e", " ", "\[CapitalDelta]x"}], "-", 
           RowBox[{"2", " ", 
            RowBox[{"ArcTanh", "[", 
             FractionBox[
              RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}]}]}], ")"}], 
         " ", 
         SubscriptBox["d", 
          RowBox[{
           FractionBox["1", "2"], "+", "i"}]]}], "+", 
        RowBox[{"32", " ", 
         SuperscriptBox["e", "3"], " ", 
         SuperscriptBox["\[CapitalDelta]x", "3"], " ", 
         SubscriptBox["f", "i"]}]}], ")"}]}]}], ")"}]}], "}"}]], "Output"]
}, Open  ]],

Cell["How to define variable e? ", "Text"],

Cell[BoxData[" "], "Input"],

Cell["\<\
What\[CloseCurlyQuote]s the derivative of ArcTanh[x]?\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"ArcTanh", "'"}], "[", 
   FractionBox[
    RowBox[{"e", " ", "\[CapitalDelta]x"}], "2"], "]"}], "//", 
  "Simplify"}]], "Input"],

Cell[BoxData[
 FractionBox["4", 
  RowBox[{"4", "-", 
   RowBox[{
    SuperscriptBox["e", "2"], " ", 
    SuperscriptBox["\[CapitalDelta]x", "2"]}]}]]], "Output"]
}, Open  ]],

Cell[TextData[{
 "can we approximate ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["Tanh", 
    RowBox[{"-", "1"}]], TraditionalForm]]],
 "[x] some how? "
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Series", "[", 
  RowBox[{
   RowBox[{"ArcTanh", "[", "x", "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", "0", ",", "24"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"x", "+", 
   FractionBox[
    SuperscriptBox["x", "3"], "3"], "+", 
   FractionBox[
    SuperscriptBox["x", "5"], "5"], "+", 
   FractionBox[
    SuperscriptBox["x", "7"], "7"], "+", 
   FractionBox[
    SuperscriptBox["x", "9"], "9"], "+", 
   FractionBox[
    SuperscriptBox["x", "11"], "11"], "+", 
   FractionBox[
    SuperscriptBox["x", "13"], "13"], "+", 
   FractionBox[
    SuperscriptBox["x", "15"], "15"], "+", 
   FractionBox[
    SuperscriptBox["x", "17"], "17"], "+", 
   FractionBox[
    SuperscriptBox["x", "19"], "19"], "+", 
   FractionBox[
    SuperscriptBox["x", "21"], "21"], "+", 
   FractionBox[
    SuperscriptBox["x", "23"], "23"], "+", 
   InterpretationBox[
    SuperscriptBox[
     RowBox[{"O", "[", "x", "]"}], "25"],
    SeriesData[$CellContext`x, 0, {}, 1, 25, 1],
    Editable->False]}],
  SeriesData[$CellContext`x, 0, {1, 0, 
    Rational[1, 3], 0, 
    Rational[1, 5], 0, 
    Rational[1, 7], 0, 
    Rational[1, 9], 0, 
    Rational[1, 11], 0, 
    Rational[1, 13], 0, 
    Rational[1, 15], 0, 
    Rational[1, 17], 0, 
    Rational[1, 19], 0, 
    Rational[1, 21], 0, 
    Rational[1, 23]}, 1, 25, 1],
  Editable->False]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"ArcTanh", "[", "x", "]"}], ",", "x", ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"]}], ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"], "+", 
      FractionBox[
       SuperscriptBox["x", "5"], "5"]}], ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"], "+", 
      FractionBox[
       SuperscriptBox["x", "5"], "5"], "+", 
      FractionBox[
       SuperscriptBox["x", "7"], "7"], "+", 
      FractionBox[
       SuperscriptBox["x", "9"], "9"]}], ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"], "+", 
      FractionBox[
       SuperscriptBox["x", "5"], "5"], "+", 
      FractionBox[
       SuperscriptBox["x", "7"], "7"], "+", 
      FractionBox[
       SuperscriptBox["x", "9"], "9"], "+", 
      FractionBox[
       SuperscriptBox["x", "11"], "11"], "+", 
      FractionBox[
       SuperscriptBox["x", "13"], "13"], "+", 
      FractionBox[
       SuperscriptBox["x", "15"], "15"]}], ",", 
     RowBox[{
      FractionBox["1", "2"], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"Log", "[", 
         RowBox[{"1", "+", "x"}], "]"}], "-", 
        RowBox[{"Log", "[", 
         RowBox[{"1", "-", "x"}], "]"}]}], ")"}]}]}], " ", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", 
     RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", "\"\<Expressions\>\""}], ",", 
   RowBox[{"PlotStyle", "\[Rule]", "Thick"}], ",", 
   RowBox[{"Frame", "\[Rule]", "True"}], ",", 
   RowBox[{"GridLines", "\[Rule]", "Automatic"}]}], "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {}, {
      Hue[0.67, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1: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
       "]]}, {
      Hue[0.9060679774997897, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJxF1P0vFHAcwPHjMjp5XDTlyOM8zbjqLDKmGHLGjdHEOS21Q+qW7swmdK2r
aSxsl9TaDpF2FyU7juO4nRqTzsNxOu64y53OkdQxm2rL5/vDe6//4O2RV0y+
ao7BYEh/+2dwlLN+f98oOrB4x4u9s4t8+y7Ud2sbSfAj5WnXkGEOrPmxWWT0
8uanp3wk+cF4xykKkjHBKro2sA5OTVnrh6gGED9YfDTM9TvYXTBiYfdVD+ZW
h27MVelA05MytihqFeTaKl04Ki3YlBhKlz3UgFWFVKZ/wgpYhn3NoBvUILVi
wnumTQU29Gs4TbQlsHfR78gbTyXoZR8dk/ZCAXYFsGnqZTm4KOk8SSTOgJqg
BoLogwx0KG8nBptNgkFEY1DL1hh474Lhs4ApBZ3SeLWXjonBrl8Su1HvXrBF
oXmsY/HA7FTX94or9aAAVzYtLqmLOvCM2sytMpMPem307YSLBWACd248OVMM
xpIcsdvdUrCGMlsR0jMGSpPxNimOk6DBw6n8S6MMLLkdSK1xngFnF+zJ+aNy
MLf03DfLJAU4HBj2aNhCCfoeFq42xy+BeGFBrAVbBWJ2zdvpajX4O7U/R+Kz
AipOU074sDTgzQx7B88FLehSv5J5CL8K8rJevtpi6sCMyLvxo/16sDOnyDN8
bw004c5jBekGkDwZQcRz1kFchPWQ8DlyqHn+4mUuMoRZSn3GQ9q691S7SJAf
CwnLTj+Q0Vb+tbZJRtB0y3Scl4rkK6QtpAykGz+/rzoPuZferMWVInu47pGW
rcgbNkZpawfSlzFAjutE1idmX78vRNI3G+uwMmRAFs2NK0eqRs62xyiRKRz5
QKUOaWXeluBhRIoKGFODP5F3puMoubvI/98C/wDu85Pd
       "]]}, {
      Hue[0.1421359549995791, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJwtlPs3lAkYgF2i6ILpItYlpCO1QjUq2jeKXCLZqM2EmS5qaCtbrm1bLrGt
UottNlIbirVGWunQ6M1IY8XRRGOaKZdhBlPmw3yfmDpr23P64TnPOc8f8Niw
jocc0tHS0gr8zP92giXKmRkCf8mLgdBQCo9P22VNawh8fTjBa2cwhff+dlmh
pggkmQeM/AModHUIZCneEZg0ztD38qTQzSRd0tZN4MqgiEPuX1O4ZWC89fcq
An0bxc+/1aMwJLO9Ym0kgUN3bzPMa0lM6Eg/Fv1YhX2e7jc+mJHY1TVX2cgc
RQvl3Em+cAItnxxf5GbxHh0Y952LKsbxQcxTPaO3SpxyPHhp+29jGJXtMvY6
dQRPORSVnVSqcOrXlCyEYRxkXxFrBt5j8YIeM06/AiN4tSEygRIL/V3iOn+W
Y3FG+N2E1mFMjWUmrvQbRP0DRJRQawhTdP9MiBuVYX4BpyXNVo7Mcx3LRWX9
WG+fVfDshwHMb5BzCtl9mFFj47ZD+rn3Osz7y7YHf5zzR/5Rpz60M97itbtI
iqMOvNsbQt/ifccstmxAjAtfXA20tZdgb3P1MjpdhIqZYJc0826Ur853xdpO
9HGvL2SEdaHJ2XK6k7YQAzgX1xdFC3E1nVhdqm5DjcijySCuHdO2jb6oSxRg
pReNovEEuHg398p3pnwcLKmJdKbz8f5ks1HL8npkDzEPzvOox1Kp/NJIOhdF
mTXRjpe5uH+XRY30QB5OrtkcnH0wD+sMU17xT+cCh1bKYMTnwnqZttX5vVUg
2JB5L5NVBXZjj6Y38etAJDppeEZcB37Fr9uD9vLB25R2Jj7xswNputQDAcQ2
tN9kfRRATmT3OeeHbXDVZB2mubaDIMhyfjBNCOn7MmSTSUIYtVl89uX1Tlia
PBHR7tYFp0+tYuYsEUHX1jODJh9E0P3GOORwixiCOgrzUvUkEJXkMTR7hxTa
PGcFPVO/gaZVbheb9HqAZv5ypsmiD1YY8IZLfPvg3wA8Gn+vHyx5Md56Wf1g
d3lMYOA3AFoanfI4mQz0KnYvqVwohw+7GiKa7Qch38XZJLBDAdJ1kV/Zp8vh
Y3KurRt/GE7sMTaxfaOAlmUGq26jEszyBvfOshyG+lj+ZXble+CG37qrThwB
+qUwy60SFezZ/JNvS4MSNgrY3IqUMaiOOGa76dM7MI3tdQrLGYcpw626daGj
cJHRPVj5bAJChO50S44K9ENP3fKg1GDoPreRd0MFhX1WrUUaNTSWSAIYxSqQ
8zrk2lokOCcmMQu4KiilT6pbDUlYYP0w26xZBdvFrieOLCPhn1jXgcUTKjhr
HWwkDCBhy5yVVxbsIGC5mbf1vmISpk5OmXN3EfBWX9IrKSOhSiooDdxDQEuD
LofBJcGq6vCjbBYB28IEBKuOhE+hJQrDJALcpe88UzpIeFhsvXn2HQIKz+Vc
k3wk4fv5hOBOBQE+3tsVbG0KViQ8DvGpJoBlFL7mkz4Fef77j2TwCJhO9a22
oVEQN349V7eTALOrpkmJDhQ4hrOtisUE1Dpm3zR2oqD/6cZyrx4C+qKfNJav
pSCYI358foSAyQIzTc83FMzRKfOzIQg4mnzNOGUbBRiT0PWEJCD5+QW7pf4U
xL/yiYzSEKDSWbS2dicFX/4FX/4F/wF3dpB/
       "]]}, {
      Hue[0.37820393249936934`, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJwtlGs0lAkYgCeT+1La1SZRJjkVtbG7nFK9VlTKdCRiVzUuJccl25TbKomp
ptIN7ZFkq0lIxk5qJaYX5QyiMHIbxIzBmMw3DOYzKduesz+e8/x9fj1WwdHe
R7QoFAr9K/95PSwenZsj8PBw4VE2m8TomZXsGQ2Brfc5VMpZEv8utbdRTRHo
tgRnExJIdFhNDx6SE8gvGtSKCSfRyYTV3dhB4JSofPsFTxJdJOMNt0oIzJ1p
kJubkOh9oanoRwaBYv183txtNca9Y0UdfalA5cUgy5Tn09jWZjhaHTSG9R6b
jBgjk2hRFf2d07KPeO9ZNn+FvwqfRbzWXtA7in0NErc2+TgGptkru1JkuGvY
7IPuaSWS6YlshBFsjUhiMU4rkGPcZ5Y1MIQFNhtyVmjkmLPLnim8KMU3/FJ4
81iGKZFB8Ws8BrG7q9jyasEwJlIfxTHHxHjT+U8nq1tSDEp+Z91eMIANZ+Y7
cwQSvMmXZuWE92ORPNyPZSrGFx9Wf/OY1oc8XuQnX59+XLnQxdUnV4TXpsTN
rud78cladrhY0om560YyPVy78UMtb4WjYzs20Ru1qLYdKLW76YD/CDHkC9nM
ZLShSVKh4/p5LTjR4amZjGhBO0fCLk/ViOlhXprRmCZMdRtrLo8X4Faf/MZj
fAGa+nCv//p9DW5c937uqmMNPpmuXVBn/QJv6Os9st/8AvNE0isyFhdlS1gn
f7jKxYN7lz0VhWRiXfGX39IOZ2K5QeL7mpgMSPVac+RAbAb8LJ5neda/BI4U
W8deCS6BlcqKmU015ZCiq8nL7SwHD05X0x7/GrjRso8QxdeAO30RdeqZAN5a
qK40zwrgGqMjeUNZI1RO0JZtcWwCwR4LI69FLZD/kVISktQCY1amSa3ZQlDp
OIxxXNog5qRt0LXF7cCraD5podsBHT0LvUPrOuGQPGeHAa0bAhM2D+t6imBy
X0OeDq0XXtk6XXql3Qeq1kU9n37pBxv9ypEHO/uhN+mJ+ODIAFhURrhrswdA
EuV1YuiWBCgarUKmWAwBfueOqdhSUO/lH6pdNQg65guiQo8Pg+gnhvkqlhRK
XYQ9gRwZ/O630ITWMwTKdn3uCaUczDIH/edbjMAU77P+KWcFcAPu5qviZVDf
pNg9wVSC35YzO+v4o3ApTrj8fP048A5F0TbNyqHYU2gf5qAC0mAbtdx3DNJC
Z7N1uibBu8XZ0SJLAVVaZ8b+Sp0GA2fD6so7CqAZuO0/cHkaqh907z7AUUDu
VptI84xp2BCfEHSbq4DHubWce/enwXh5WZpZrQKyFebBb6unoT7SQWI6oYBX
dUVmjyhqcNFbc93Yk4Awc8NEZrIayOPkUu5eAuy86vjn2WooEQny6H4EcFPD
W+9cV4NlSWhFWjAB2s+NY9vuqmHW98GQQQIBwTZVgpBqNZRxlm/RfUgAk7/t
jiGVhGNGhOBhEQE+UsFluiEJNnEvvbfzCJAaWTLSvyUhc9fBsHOVBBS665Vb
W5PAHM/OoAoJOC5mBES6k7A2INyS00nAH2afb9TSSRh4vbHQtY+AisvaZVb7
SfDK6nx5VkYAtdC2RRxKgp5WgYcV8bVv3tO6HdEkYERcW9UkAb6KU6UlcSTE
vt/OCNQQsI5Xmb40mYT//wX//wv+BZTAoII=
       "]]}, {
      Hue[0.6142719099991583, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJwtlGk41AkcgGWaTZSo6CHkKI8pK0PGbpnnV4kiCmXVCsNuaXXIVI60RWvL
1ii7tDtFrTLSsRGylvBzpME6mgyjmUaucYzjn7M5/mXb5+nD+7yf3q+vRVik
30FNDQ0N70/8bzswlM/NEfhv+Ev/Bi6JkUqrZKWKwIb9i/yYHBKfFNGtp2YI
HH22wrb0PIkONt5hAyMEppyaYdUfItFZP0ncJCJw6K6L5TYnEjf3TTTeyCew
wJpT/KhNjX6Xmh85hhCo9YFyR99QjTGtScfCK8cR7j2eUuUrUSjUkVeHjmEg
e9PK8A+zaFoVudzZZBTfe4kdlr2axuIjz6lLpHIUb/fMnJuZRBaH/u71hWFs
xcoXH9dPoOK3+GSEIUzeuZzmeYLAbN0uI27PACa0L7eK+n0UMz3p7LZfZKgb
27a7Y4kcLxwNjaV59OM/odShqsFBjKc8jGGP9eJcbQp0VMowNKF1dcf9HpT8
Wp3j2NWH1ytk3MyIbgygbHlYZNmLZW9tFv1l2YUaux1usQK70Upv89a9tyXo
MzSYVZYixcK1yRG9fZ24zDa4vMVNjG/rCswZjA7sWOh0KtVWhDLb6w74dxuO
5HKNTVhC1D/3gGE3T4BSOzc9+6MCtGUQtjlTTbg4KrFEL7oZf9o29rI0lo9P
t/mHxFTw0WBvXur+FTX4iiYOTmXUYOFs3ZL61WX4pd2TCbpLGeZIZCnDSXlo
HNwSs/5qHgb5mjyVfJeOZ07Pfcv5Ph1LtePba06nQXI37eCB6DRw6p1nlrgv
H57vNzmTEpYPVu+eKTfWlIKRgjNwu7MUPLJfN+/aVwMj9Gi2NLYG3LyXUmaK
+bAuY3vta5IP10JECfYlTTAQ900pi9EM/F2mi32WCsD1g2ZU1jkBjFkYnHt1
sw3mK5g89y1COH1qXeg1ww6wc9yzK0NLBKI3en6H6jsBjCzqT64RAyvOZXCB
lwRaf3SS9tpIoXad8+VaahcY6880t+/oBuuF5UO8T05o3m3YON0DpuVH3KjJ
PfCxOTpmR34faKg0H7B7e0GWu3fgizwZvPetCK5b0w9L7YPMTz4eBMmGkJVr
kmSgrPQ1vU+Vw4kAPX3LNwNQcCKy6OGVUTBK798333QI4jbwKpirCcgLzMqd
ih0GFpcuFllNQADz/I76Cjm8E0xdTGychILgY5YbyRH4wzGw59Kf06DQdqWU
+o/B9k5pC3twFvwEmxim3HFwqTJk3glWgvYmneryW+Pg6iJnn41QQjVPvPNA
9jiUzG/KDIlWgn1sXGhG3jh48KaHmFeVoLuqhGNUNw6j0he0wEolNBx16DOY
HIf4uzo3zMxVsFmLlqrrRYD77EUhOawCRZTCOM+XABtz0eP+WRXkS/g53gEE
dAeRh9spajDLP/SME0bABSqdJzBVA+nPG9COI6CwPVeH4aeGkuxVzAX3COhr
ccwqLlfD8cUE/94jAs56sfasb1SDdUyln3sBAUUKix8KRWpI9ww6/HM5AbfT
LkqFk2pgT9xMo7QRwI3c2XaFRsLawAiz7E4CPFaGJ/k6k9Dz/OsHW7sIUG1c
JjF3I8GH21mZOPypl1lkvGGRoKV538OCIEBPxTVoOE4CHokRVk0TEJnVEIBn
SYhudw9hqQigfuUTgZdJ+Pwv+Pwv+A/PiJvA
       "]]}, {
      Hue[0.8503398874989481, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1: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
       "]]}, {
      Hue[0.08640786499873876, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1: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
       "]]}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, 
    AxesOrigin -> {0, 0}, Frame -> True, FrameLabel -> {None, None}, 
    GridLines -> Automatic, Method -> {}, 
    PlotRange -> {{-1, 1}, {-2.9799786498358056`, 2.9721074081069045`}}, 
    PlotRangeClipping -> True, PlotRangePadding -> {
      Scaled[0.02], 
      Scaled[0.02]}],TemplateBox[{
     TagBox[
      FormBox[
       TagBox[
        RowBox[{
          SuperscriptBox["tanh", 
           RowBox[{"-", "1"}]], "(", "x", ")"}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox["x", HoldForm], TraditionalForm], TraditionalForm, Editable -> 
      True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"], "+", 
          FractionBox[
           SuperscriptBox["x", "5"], "5"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"], "+", 
          FractionBox[
           SuperscriptBox["x", "5"], "5"], "+", 
          FractionBox[
           SuperscriptBox["x", "7"], "7"], "+", 
          FractionBox[
           SuperscriptBox["x", "9"], "9"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"], "+", 
          FractionBox[
           SuperscriptBox["x", "5"], "5"], "+", 
          FractionBox[
           SuperscriptBox["x", "7"], "7"], "+", 
          FractionBox[
           SuperscriptBox["x", "9"], "9"], "+", 
          FractionBox[
           SuperscriptBox["x", "11"], "11"], "+", 
          FractionBox[
           SuperscriptBox["x", "13"], "13"], "+", 
          FractionBox[
           SuperscriptBox["x", "15"], "15"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{
          FractionBox["1", "2"], " ", 
          RowBox[{"(", 
            RowBox[{
              RowBox[{"log", "(", 
                RowBox[{"1", "+", "x"}], ")"}], "-", 
              RowBox[{"log", "(", 
                RowBox[{"1", "-", "x"}], ")"}]}], ")"}]}], HoldForm], 
       TraditionalForm], TraditionalForm, Editable -> True]}, "LineLegend", 
    DisplayFunction -> (StyleBox[
      StyleBox[
       PaneBox[
        TagBox[
         GridBox[{{
            TagBox[
             GridBox[{{
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.1421359549995791, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.1421359549995791, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.6142719099991583, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.6142719099991583, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.8503398874989481, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.8503398874989481, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.08640786499873876, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.08640786499873876, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #7}}, 
              GridBoxAlignment -> {
               "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {
               "Columns" -> {{False}}, "Rows" -> {{False}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], 
             "Grid"]}}, 
          GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
          AutoDelete -> False, 
          GridBoxItemSize -> {
           "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
          GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], "Grid"], 
        Alignment -> Left, AppearanceElements -> None, 
        ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> "ResizeToFit"], 
       LineIndent -> 0, StripOnInput -> False], {FontFamily -> "Times"}, 
      Background -> Automatic, StripOnInput -> False]& ), Editable -> True, 
    InterpretationFunction :> (RowBox[{"LineLegend", "[", 
       RowBox[{
         RowBox[{"{", 
           RowBox[{
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.9060679774997897`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.1421359549995791`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.37820393249936934`", ",", "0.6`", ",", "0.6`"}],
                    "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.6142719099991583`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.8503398874989481`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.08640786499873876`", ",", "0.6`", ",", "0.6`"}],
                    "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}]}], "}"}], 
         ",", 
         RowBox[{"{", 
           RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6, ",", #7}], 
           "}"}], ",", 
         RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& )]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"ArcTanh", "[", "x", "]"}], ",", "x", ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"]}], ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"], "+", 
      FractionBox[
       SuperscriptBox["x", "5"], "5"]}], ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"], "+", 
      FractionBox[
       SuperscriptBox["x", "5"], "5"], "+", 
      FractionBox[
       SuperscriptBox["x", "7"], "7"], "+", 
      FractionBox[
       SuperscriptBox["x", "9"], "9"]}], ",", 
     RowBox[{"x", "+", 
      FractionBox[
       SuperscriptBox["x", "3"], "3"], "+", 
      FractionBox[
       SuperscriptBox["x", "5"], "5"], "+", 
      FractionBox[
       SuperscriptBox["x", "7"], "7"], "+", 
      FractionBox[
       SuperscriptBox["x", "9"], "9"], "+", 
      FractionBox[
       SuperscriptBox["x", "11"], "11"], "+", 
      FractionBox[
       SuperscriptBox["x", "13"], "13"], "+", 
      FractionBox[
       SuperscriptBox["x", "15"], "15"]}]}], " ", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", 
     RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", "\"\<Expressions\>\""}], ",", 
   RowBox[{"PlotStyle", "\[Rule]", "Thick"}], ",", 
   RowBox[{"Frame", "\[Rule]", "True"}], ",", 
   RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
   RowBox[{"GridLinesStyle", "\[Rule]", 
    RowBox[{"Directive", "[", 
     RowBox[{"Orange", ",", "Dashed"}], "]"}]}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "x", ",", 
      "\"\<Approximations for \!\(\*SuperscriptBox[\(tanh\), \
\(-1\)]\)(x)\>\""}], "}"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {}, {
      Hue[0.67, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1: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
       "]]}, {
      Hue[0.9060679774997897, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJxF1P0vFHAcwPHjMjp5XDTlyOM8zbjqLDKmGHLGjdHEOS21Q+qW7swmdK2r
aSxsl9TaDpF2FyU7juO4nRqTzsNxOu64y53OkdQxm2rL5/vDe6//4O2RV0y+
ao7BYEh/+2dwlLN+f98oOrB4x4u9s4t8+y7Ud2sbSfAj5WnXkGEOrPmxWWT0
8uanp3wk+cF4xykKkjHBKro2sA5OTVnrh6gGED9YfDTM9TvYXTBiYfdVD+ZW
h27MVelA05MytihqFeTaKl04Ki3YlBhKlz3UgFWFVKZ/wgpYhn3NoBvUILVi
wnumTQU29Gs4TbQlsHfR78gbTyXoZR8dk/ZCAXYFsGnqZTm4KOk8SSTOgJqg
BoLogwx0KG8nBptNgkFEY1DL1hh474Lhs4ApBZ3SeLWXjonBrl8Su1HvXrBF
oXmsY/HA7FTX94or9aAAVzYtLqmLOvCM2sytMpMPem307YSLBWACd248OVMM
xpIcsdvdUrCGMlsR0jMGSpPxNimOk6DBw6n8S6MMLLkdSK1xngFnF+zJ+aNy
MLf03DfLJAU4HBj2aNhCCfoeFq42xy+BeGFBrAVbBWJ2zdvpajX4O7U/R+Kz
AipOU074sDTgzQx7B88FLehSv5J5CL8K8rJevtpi6sCMyLvxo/16sDOnyDN8
bw004c5jBekGkDwZQcRz1kFchPWQ8DlyqHn+4mUuMoRZSn3GQ9q691S7SJAf
CwnLTj+Q0Vb+tbZJRtB0y3Scl4rkK6QtpAykGz+/rzoPuZferMWVInu47pGW
rcgbNkZpawfSlzFAjutE1idmX78vRNI3G+uwMmRAFs2NK0eqRs62xyiRKRz5
QKUOaWXeluBhRIoKGFODP5F3puMoubvI/98C/wDu85Pd
       "]]}, {
      Hue[0.1421359549995791, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJwtlPs3lAkYgF2i6ILpItYlpCO1QjUq2jeKXCLZqM2EmS5qaCtbrm1bLrGt
UottNlIbirVGWunQ6M1IY8XRRGOaKZdhBlPmw3yfmDpr23P64TnPOc8f8Niw
jocc0tHS0gr8zP92giXKmRkCf8mLgdBQCo9P22VNawh8fTjBa2cwhff+dlmh
pggkmQeM/AModHUIZCneEZg0ztD38qTQzSRd0tZN4MqgiEPuX1O4ZWC89fcq
An0bxc+/1aMwJLO9Ym0kgUN3bzPMa0lM6Eg/Fv1YhX2e7jc+mJHY1TVX2cgc
RQvl3Em+cAItnxxf5GbxHh0Y952LKsbxQcxTPaO3SpxyPHhp+29jGJXtMvY6
dQRPORSVnVSqcOrXlCyEYRxkXxFrBt5j8YIeM06/AiN4tSEygRIL/V3iOn+W
Y3FG+N2E1mFMjWUmrvQbRP0DRJRQawhTdP9MiBuVYX4BpyXNVo7Mcx3LRWX9
WG+fVfDshwHMb5BzCtl9mFFj47ZD+rn3Osz7y7YHf5zzR/5Rpz60M97itbtI
iqMOvNsbQt/ifccstmxAjAtfXA20tZdgb3P1MjpdhIqZYJc0826Ur853xdpO
9HGvL2SEdaHJ2XK6k7YQAzgX1xdFC3E1nVhdqm5DjcijySCuHdO2jb6oSxRg
pReNovEEuHg398p3pnwcLKmJdKbz8f5ks1HL8npkDzEPzvOox1Kp/NJIOhdF
mTXRjpe5uH+XRY30QB5OrtkcnH0wD+sMU17xT+cCh1bKYMTnwnqZttX5vVUg
2JB5L5NVBXZjj6Y38etAJDppeEZcB37Fr9uD9vLB25R2Jj7xswNputQDAcQ2
tN9kfRRATmT3OeeHbXDVZB2mubaDIMhyfjBNCOn7MmSTSUIYtVl89uX1Tlia
PBHR7tYFp0+tYuYsEUHX1jODJh9E0P3GOORwixiCOgrzUvUkEJXkMTR7hxTa
PGcFPVO/gaZVbheb9HqAZv5ypsmiD1YY8IZLfPvg3wA8Gn+vHyx5Md56Wf1g
d3lMYOA3AFoanfI4mQz0KnYvqVwohw+7GiKa7Qch38XZJLBDAdJ1kV/Zp8vh
Y3KurRt/GE7sMTaxfaOAlmUGq26jEszyBvfOshyG+lj+ZXble+CG37qrThwB
+qUwy60SFezZ/JNvS4MSNgrY3IqUMaiOOGa76dM7MI3tdQrLGYcpw626daGj
cJHRPVj5bAJChO50S44K9ENP3fKg1GDoPreRd0MFhX1WrUUaNTSWSAIYxSqQ
8zrk2lokOCcmMQu4KiilT6pbDUlYYP0w26xZBdvFrieOLCPhn1jXgcUTKjhr
HWwkDCBhy5yVVxbsIGC5mbf1vmISpk5OmXN3EfBWX9IrKSOhSiooDdxDQEuD
LofBJcGq6vCjbBYB28IEBKuOhE+hJQrDJALcpe88UzpIeFhsvXn2HQIKz+Vc
k3wk4fv5hOBOBQE+3tsVbG0KViQ8DvGpJoBlFL7mkz4Fef77j2TwCJhO9a22
oVEQN349V7eTALOrpkmJDhQ4hrOtisUE1Dpm3zR2oqD/6cZyrx4C+qKfNJav
pSCYI358foSAyQIzTc83FMzRKfOzIQg4mnzNOGUbBRiT0PWEJCD5+QW7pf4U
xL/yiYzSEKDSWbS2dicFX/4FX/4F/wF3dpB/
       "]]}, {
      Hue[0.37820393249936934`, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJwtlGs0lAkYgCeT+1La1SZRJjkVtbG7nFK9VlTKdCRiVzUuJccl25TbKomp
ptIN7ZFkq0lIxk5qJaYX5QyiMHIbxIzBmMw3DOYzKduesz+e8/x9fj1WwdHe
R7QoFAr9K/95PSwenZsj8PBw4VE2m8TomZXsGQ2Brfc5VMpZEv8utbdRTRHo
tgRnExJIdFhNDx6SE8gvGtSKCSfRyYTV3dhB4JSofPsFTxJdJOMNt0oIzJ1p
kJubkOh9oanoRwaBYv183txtNca9Y0UdfalA5cUgy5Tn09jWZjhaHTSG9R6b
jBgjk2hRFf2d07KPeO9ZNn+FvwqfRbzWXtA7in0NErc2+TgGptkru1JkuGvY
7IPuaSWS6YlshBFsjUhiMU4rkGPcZ5Y1MIQFNhtyVmjkmLPLnim8KMU3/FJ4
81iGKZFB8Ws8BrG7q9jyasEwJlIfxTHHxHjT+U8nq1tSDEp+Z91eMIANZ+Y7
cwQSvMmXZuWE92ORPNyPZSrGFx9Wf/OY1oc8XuQnX59+XLnQxdUnV4TXpsTN
rud78cladrhY0om560YyPVy78UMtb4WjYzs20Ru1qLYdKLW76YD/CDHkC9nM
ZLShSVKh4/p5LTjR4amZjGhBO0fCLk/ViOlhXprRmCZMdRtrLo8X4Faf/MZj
fAGa+nCv//p9DW5c937uqmMNPpmuXVBn/QJv6Os9st/8AvNE0isyFhdlS1gn
f7jKxYN7lz0VhWRiXfGX39IOZ2K5QeL7mpgMSPVac+RAbAb8LJ5neda/BI4U
W8deCS6BlcqKmU015ZCiq8nL7SwHD05X0x7/GrjRso8QxdeAO30RdeqZAN5a
qK40zwrgGqMjeUNZI1RO0JZtcWwCwR4LI69FLZD/kVISktQCY1amSa3ZQlDp
OIxxXNog5qRt0LXF7cCraD5podsBHT0LvUPrOuGQPGeHAa0bAhM2D+t6imBy
X0OeDq0XXtk6XXql3Qeq1kU9n37pBxv9ypEHO/uhN+mJ+ODIAFhURrhrswdA
EuV1YuiWBCgarUKmWAwBfueOqdhSUO/lH6pdNQg65guiQo8Pg+gnhvkqlhRK
XYQ9gRwZ/O630ITWMwTKdn3uCaUczDIH/edbjMAU77P+KWcFcAPu5qviZVDf
pNg9wVSC35YzO+v4o3ApTrj8fP048A5F0TbNyqHYU2gf5qAC0mAbtdx3DNJC
Z7N1uibBu8XZ0SJLAVVaZ8b+Sp0GA2fD6so7CqAZuO0/cHkaqh907z7AUUDu
VptI84xp2BCfEHSbq4DHubWce/enwXh5WZpZrQKyFebBb6unoT7SQWI6oYBX
dUVmjyhqcNFbc93Yk4Awc8NEZrIayOPkUu5eAuy86vjn2WooEQny6H4EcFPD
W+9cV4NlSWhFWjAB2s+NY9vuqmHW98GQQQIBwTZVgpBqNZRxlm/RfUgAk7/t
jiGVhGNGhOBhEQE+UsFluiEJNnEvvbfzCJAaWTLSvyUhc9fBsHOVBBS665Vb
W5PAHM/OoAoJOC5mBES6k7A2INyS00nAH2afb9TSSRh4vbHQtY+AisvaZVb7
SfDK6nx5VkYAtdC2RRxKgp5WgYcV8bVv3tO6HdEkYERcW9UkAb6KU6UlcSTE
vt/OCNQQsI5Xmb40mYT//wX//wv+BZTAoII=
       "]]}, {
      Hue[0.6142719099991583, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1:eJwtlGk41AkcgGWaTZSo6CHkKI8pK0PGbpnnV4kiCmXVCsNuaXXIVI60RWvL
1ii7tDtFrTLSsRGylvBzpME6mgyjmUaucYzjn7M5/mXb5+nD+7yf3q+vRVik
30FNDQ0N70/8bzswlM/NEfhv+Ev/Bi6JkUqrZKWKwIb9i/yYHBKfFNGtp2YI
HH22wrb0PIkONt5hAyMEppyaYdUfItFZP0ncJCJw6K6L5TYnEjf3TTTeyCew
wJpT/KhNjX6Xmh85hhCo9YFyR99QjTGtScfCK8cR7j2eUuUrUSjUkVeHjmEg
e9PK8A+zaFoVudzZZBTfe4kdlr2axuIjz6lLpHIUb/fMnJuZRBaH/u71hWFs
xcoXH9dPoOK3+GSEIUzeuZzmeYLAbN0uI27PACa0L7eK+n0UMz3p7LZfZKgb
27a7Y4kcLxwNjaV59OM/odShqsFBjKc8jGGP9eJcbQp0VMowNKF1dcf9HpT8
Wp3j2NWH1ytk3MyIbgygbHlYZNmLZW9tFv1l2YUaux1usQK70Upv89a9tyXo
MzSYVZYixcK1yRG9fZ24zDa4vMVNjG/rCswZjA7sWOh0KtVWhDLb6w74dxuO
5HKNTVhC1D/3gGE3T4BSOzc9+6MCtGUQtjlTTbg4KrFEL7oZf9o29rI0lo9P
t/mHxFTw0WBvXur+FTX4iiYOTmXUYOFs3ZL61WX4pd2TCbpLGeZIZCnDSXlo
HNwSs/5qHgb5mjyVfJeOZ07Pfcv5Ph1LtePba06nQXI37eCB6DRw6p1nlrgv
H57vNzmTEpYPVu+eKTfWlIKRgjNwu7MUPLJfN+/aVwMj9Gi2NLYG3LyXUmaK
+bAuY3vta5IP10JECfYlTTAQ900pi9EM/F2mi32WCsD1g2ZU1jkBjFkYnHt1
sw3mK5g89y1COH1qXeg1ww6wc9yzK0NLBKI3en6H6jsBjCzqT64RAyvOZXCB
lwRaf3SS9tpIoXad8+VaahcY6880t+/oBuuF5UO8T05o3m3YON0DpuVH3KjJ
PfCxOTpmR34faKg0H7B7e0GWu3fgizwZvPetCK5b0w9L7YPMTz4eBMmGkJVr
kmSgrPQ1vU+Vw4kAPX3LNwNQcCKy6OGVUTBK798333QI4jbwKpirCcgLzMqd
ih0GFpcuFllNQADz/I76Cjm8E0xdTGychILgY5YbyRH4wzGw59Kf06DQdqWU
+o/B9k5pC3twFvwEmxim3HFwqTJk3glWgvYmneryW+Pg6iJnn41QQjVPvPNA
9jiUzG/KDIlWgn1sXGhG3jh48KaHmFeVoLuqhGNUNw6j0he0wEolNBx16DOY
HIf4uzo3zMxVsFmLlqrrRYD77EUhOawCRZTCOM+XABtz0eP+WRXkS/g53gEE
dAeRh9spajDLP/SME0bABSqdJzBVA+nPG9COI6CwPVeH4aeGkuxVzAX3COhr
ccwqLlfD8cUE/94jAs56sfasb1SDdUyln3sBAUUKix8KRWpI9ww6/HM5AbfT
LkqFk2pgT9xMo7QRwI3c2XaFRsLawAiz7E4CPFaGJ/k6k9Dz/OsHW7sIUG1c
JjF3I8GH21mZOPypl1lkvGGRoKV538OCIEBPxTVoOE4CHokRVk0TEJnVEIBn
SYhudw9hqQigfuUTgZdJ+Pwv+Pwv+A/PiJvA
       "]]}, {
      Hue[0.8503398874989481, 0.6, 0.6], 
      Thickness[Large], 
      LineBox[CompressedData["
1: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
       "]]}}, AspectRatio -> 
    NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> True, 
    AxesLabel -> {
      FormBox["x", TraditionalForm], 
      FormBox[
      "\"Approximations for \\!\\(\\*SuperscriptBox[\\(tanh\\), \
\\(-1\\)]\\)(x)\"", TraditionalForm]}, AxesOrigin -> {0, 0}, Frame -> True, 
    FrameLabel -> {None, None}, GridLines -> Automatic, GridLinesStyle -> 
    Directive[
      RGBColor[1, 0.5, 0], 
      Dashing[{Small, Small}]], Method -> {}, 
    PlotRange -> {{-1, 1}, {-2.9694865945496023`, 2.955750853733281}}, 
    PlotRangeClipping -> True, PlotRangePadding -> {
      Scaled[0.02], 
      Scaled[0.02]}],TemplateBox[{
     TagBox[
      FormBox[
       TagBox[
        RowBox[{
          SuperscriptBox["tanh", 
           RowBox[{"-", "1"}]], "(", "x", ")"}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox["x", HoldForm], TraditionalForm], TraditionalForm, Editable -> 
      True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"], "+", 
          FractionBox[
           SuperscriptBox["x", "5"], "5"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"], "+", 
          FractionBox[
           SuperscriptBox["x", "5"], "5"], "+", 
          FractionBox[
           SuperscriptBox["x", "7"], "7"], "+", 
          FractionBox[
           SuperscriptBox["x", "9"], "9"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True], 
     TagBox[
      FormBox[
       TagBox[
        RowBox[{"x", "+", 
          FractionBox[
           SuperscriptBox["x", "3"], "3"], "+", 
          FractionBox[
           SuperscriptBox["x", "5"], "5"], "+", 
          FractionBox[
           SuperscriptBox["x", "7"], "7"], "+", 
          FractionBox[
           SuperscriptBox["x", "9"], "9"], "+", 
          FractionBox[
           SuperscriptBox["x", "11"], "11"], "+", 
          FractionBox[
           SuperscriptBox["x", "13"], "13"], "+", 
          FractionBox[
           SuperscriptBox["x", "15"], "15"]}], HoldForm], TraditionalForm], 
      TraditionalForm, Editable -> True]}, "LineLegend", 
    DisplayFunction -> (StyleBox[
      StyleBox[
       PaneBox[
        TagBox[
         GridBox[{{
            TagBox[
             GridBox[{{
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.67, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.9060679774997897, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.1421359549995791, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.1421359549995791, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.37820393249936934`, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.6142719099991583, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.6142719099991583, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                GraphicsBox[{{
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.8503398874989481, 0.6, 0.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                   Directive[
                    EdgeForm[{
                    Opacity[0.3], 
                    GrayLevel[0]}], 
                    Hue[0.8503398874989481, 0.6, 0.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                 ImageSize -> {20, 10}, PlotRangePadding -> None, 
                 ImagePadding -> 1, 
                 BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
              GridBoxAlignment -> {
               "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
              AutoDelete -> False, 
              GridBoxDividers -> {
               "Columns" -> {{False}}, "Rows" -> {{False}}}, 
              GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
              GridBoxSpacings -> {"Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], 
             "Grid"]}}, 
          GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
          AutoDelete -> False, 
          GridBoxItemSize -> {
           "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
          GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], "Grid"], 
        Alignment -> Left, AppearanceElements -> None, 
        ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> "ResizeToFit"], 
       LineIndent -> 0, StripOnInput -> False], {FontFamily -> "Times"}, 
      Background -> Automatic, StripOnInput -> False]& ), Editable -> True, 
    InterpretationFunction :> (RowBox[{"LineLegend", "[", 
       RowBox[{
         RowBox[{"{", 
           RowBox[{
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.67`", ",", "0.6`", ",", "0.6`"}], "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.9060679774997897`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.1421359549995791`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.37820393249936934`", ",", "0.6`", ",", "0.6`"}],
                    "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.6142719099991583`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
             RowBox[{"Directive", "[", 
               RowBox[{
                 RowBox[{"Hue", "[", 
                   RowBox[{"0.8503398874989481`", ",", "0.6`", ",", "0.6`"}], 
                   "]"}], ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}]}], "}"}], 
         ",", 
         RowBox[{"{", 
           RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
         ",", 
         RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& )]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Export", "[", 
  RowBox[{"\"\<ArcTanh.pdf\>\"", ",", "%"}], "]"}]], "Input"],

Cell[BoxData["\<\"ArcTanh.pdf\"\>"], "Output"]
}, Open  ]],

Cell["\<\
Yes! It can be approximated very well, and as long as \[CapitalDelta]x \
\[Rule] 0. ( Which is always a desirable feature. ;D )\
\>", "Text"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Non-polynomial Interpolation function f3[x] (incomplete)", "Section"],

Cell[CellGroupData[{

Cell["constrains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f3", "'"}], "[", 
    RowBox[{
     RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
   FractionBox[
    RowBox[{
     SubscriptBox["f", "i"], "-", 
     SubscriptBox["f", 
      RowBox[{"i", "-", "1"}]]}], "\[CapitalDelta]x"]}], "//", 
  "Simplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f3", "'"}], "[", 
    RowBox[{
     RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
   FractionBox[
    RowBox[{
     SubscriptBox["f", 
      RowBox[{"i", "+", "1"}]], "-", 
     SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}], "//", 
  "Simplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"c", "+", "d"}], "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "i"}]]}], "+", 
    SubscriptBox["f", "i"]}], "\[CapitalDelta]x"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{"c", "-", 
    RowBox[{"b", " ", "c"}], "+", "d", "-", 
    RowBox[{"a", " ", "d"}]}], 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "b"}], ")"}]}]], "\[Equal]", 
  FractionBox[
   RowBox[{
    RowBox[{"-", 
     SubscriptBox["f", "i"]}], "+", 
    SubscriptBox["f", 
     RowBox[{"1", "+", "i"}]]}], "\[CapitalDelta]x"]}]], "Output"]
}, Open  ]],

Cell["solving for c and d", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"cnd", "=", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"f3", "'"}], "[", 
         RowBox[{
          RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
        "\[Delta]1"}], "&&", 
       RowBox[{
        RowBox[{
         RowBox[{"f3", "'"}], "[", 
         RowBox[{
          RowBox[{"+", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
        "\[Delta]2"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"c", ",", "d"}], "}"}]}], "]"}], "//", "Simplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"c", "\[Rule]", 
     FractionBox[
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{"\[Delta]1", "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "b"}], ")"}], " ", "\[Delta]2"}]}], 
        ")"}]}], 
      RowBox[{"a", "-", "b"}]]}], ",", 
    RowBox[{"d", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "b"}], ")"}], " ", 
        RowBox[{"(", 
         RowBox[{"\[Delta]1", "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", "\[Delta]2"}]}], 
         ")"}]}], 
       RowBox[{"a", "-", "b"}]]}]}]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell["yes, but in the paper we found that", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"d", "==", 
    RowBox[{"-", 
     FractionBox[
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "b"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{"\[Delta]1", "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", "\[Delta]2"}]}], 
        ")"}]}], 
      RowBox[{"a", "-", "b"}]]}]}], "/.", 
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{"c", "==", 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", 
        RowBox[{"(", 
         RowBox[{"\[Delta]1", "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "b"}], ")"}], " ", "\[Delta]2"}]}], 
         ")"}]}], 
       RowBox[{"a", "-", "b"}]]}], ",", "\[Delta]2"}], "]"}]}], "//", 
  "Simplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"c", "+", "d"}], "\[Equal]", "\[Delta]1"}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
symmetry condition \[Delta]1 = -\[Delta]2 when r\[CloseCurlyQuote][0] = 0.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"f3", "'"}], "[", "0", "]"}], "\[Equal]", "0"}], "/.", "cnd"}], 
   "/.", 
   RowBox[{"\[Delta]1", "\[Rule]", 
    RowBox[{"-", "\[Delta]2"}]}]}], "//", "Simplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox[
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"a", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "b"}], ")"}]}], "-", "b"}], ")"}], " ", 
     "\[Delta]2"}], 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "2"}], "+", "a"}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "2"}], "+", "b"}], ")"}]}]], "\[Equal]", "0"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f3", "'"}], "[", "0", "]"}], "\[Equal]", "0"}], ",", 
     RowBox[{"{", "b", "}"}]}], "]"}], "/.", 
   RowBox[{"\[Delta]1", "\[Rule]", 
    RowBox[{"-", "\[Delta]2"}]}]}], "//", "Simplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"b", "\[Rule]", 
    FractionBox[
     RowBox[{
      RowBox[{"2", " ", "c"}], "+", 
      RowBox[{"2", " ", "d"}], "-", 
      RowBox[{"a", " ", "d"}]}], "c"]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell["therefore ", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "==", 
   FractionBox["a", 
    RowBox[{"a", "-", "1"}]]}], ";"}]], "Input"],

Cell["lets examing f3[x] with detail:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"f3", "[", "\[Xi]", "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", 
   FractionBox[
    RowBox[{"c", " ", "\[CapitalDelta]x", " ", 
     RowBox[{"Log", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         FractionBox["1", "2"]}], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", 
          FractionBox["2", "a"]}], ")"}], " ", "\[CapitalDelta]x"}], "+", 
       "\[Xi]"}], "]"}]}], "a"]}], "-", 
  FractionBox[
   RowBox[{"d", " ", "\[CapitalDelta]x", " ", 
    RowBox[{"Log", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        FractionBox["1", "2"]}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", 
         FractionBox["2", "b"]}], ")"}], " ", "\[CapitalDelta]x"}], "+", 
      "\[Xi]"}], "]"}]}], "b"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Assuming", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"Re", "[", "a", "]"}], "<", "1"}], ",", 
     RowBox[{
      RowBox[{"Re", "[", "\[CapitalDelta]x", "]"}], ">", "0"}]}], "}"}], ",", 
   
   RowBox[{
    FractionBox["1", "\[CapitalDelta]x"], 
    RowBox[{
     SubsuperscriptBox["\[Integral]", 
      RowBox[{
       RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
      RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
     RowBox[{
      FractionBox[
       RowBox[{"c", " ", "\[CapitalDelta]x", " ", 
        RowBox[{"Log", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", 
             FractionBox["2", "a"]}], ")"}], " ", "\[CapitalDelta]x"}], "+", 
          "\[Xi]"}], "]"}]}], "a"], 
      RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}]}], " ", "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  FractionBox["1", 
   RowBox[{"2", " ", 
    SuperscriptBox["a", "2"]}]], 
  RowBox[{"c", " ", "\[CapitalDelta]x", " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"2", " ", "a", " ", 
      RowBox[{"ArcTanh", "[", 
       RowBox[{"1", "-", "a"}], "]"}]}], "-", 
     RowBox[{"2", " ", 
      RowBox[{"Log", "[", 
       RowBox[{"2", "-", "a"}], "]"}]}], "-", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "a"}], ")"}], " ", 
      RowBox[{"Log", "[", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "a"}], "]"}]}], "-", 
     RowBox[{"2", " ", 
      RowBox[{"Log", "[", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "a"}], "]"}]}], "+", 
     RowBox[{"a", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "2"}], "+", 
        RowBox[{"Log", "[", 
         RowBox[{"-", 
          FractionBox["1", "a"]}], "]"}], "+", 
        RowBox[{"2", " ", 
         RowBox[{"Log", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "a"}], ")"}], " ", "\[CapitalDelta]x"}],
           "]"}]}]}], ")"}]}]}], ")"}]}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Assuming", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"Re", "[", "b", "]"}], "<", "1"}], ",", 
     RowBox[{
      RowBox[{"Re", "[", "\[CapitalDelta]x", "]"}], ">", "0"}]}], "}"}], ",", 
   
   RowBox[{
    FractionBox["1", "\[CapitalDelta]x"], 
    RowBox[{
     SubsuperscriptBox["\[Integral]", 
      RowBox[{
       RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
      RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
     RowBox[{
      FractionBox[
       RowBox[{"d", " ", "\[CapitalDelta]x", " ", 
        RowBox[{"Log", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", 
            FractionBox["1", "2"]}], " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", 
             FractionBox["2", "b"]}], ")"}], " ", "\[CapitalDelta]x"}], "+", 
          "\[Xi]"}], "]"}]}], "b"], 
      RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}]}], " ", "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  FractionBox["1", 
   RowBox[{"2", " ", 
    SuperscriptBox["b", "2"]}]], 
  RowBox[{"d", " ", "\[CapitalDelta]x", " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"2", " ", "b", " ", 
      RowBox[{"ArcTanh", "[", 
       RowBox[{"1", "-", "b"}], "]"}]}], "-", 
     RowBox[{"2", " ", 
      RowBox[{"Log", "[", 
       RowBox[{"2", "-", "b"}], "]"}]}], "-", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "b"}], ")"}], " ", 
      RowBox[{"Log", "[", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "b"}], "]"}]}], "-", 
     RowBox[{"2", " ", 
      RowBox[{"Log", "[", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "b"}], "]"}]}], "+", 
     RowBox[{"b", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "2"}], "+", 
        RowBox[{"Log", "[", 
         RowBox[{"-", 
          FractionBox["1", "b"]}], "]"}], "+", 
        RowBox[{"2", " ", 
         RowBox[{"Log", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "b"}], ")"}], " ", "\[CapitalDelta]x"}],
           "]"}]}]}], ")"}]}]}], ")"}]}]}]], "Output"]
}, Open  ]],

Cell["\<\
recall that for any given \[OpenCurlyQuote]x\[CloseCurlyQuote] value:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     FractionBox["1", "2"], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"Log", "[", 
        RowBox[{"1", "+", "x"}], "]"}], "-", 
       RowBox[{"Log", "[", 
        RowBox[{"1", "-", "x"}], "]"}]}], ")"}]}], "\[Equal]", " ", 
    RowBox[{"ArcTanh", "[", "x", "]"}]}], "}"}], "/.", 
  RowBox[{"x", "\[Rule]", " ", "0.656"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", "True", "}"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["MCV3", "Section"],

Cell[CellGroupData[{

Cell["constrains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"f1", "[", 
   RowBox[{"-", "1"}], "]"}], "\[Equal]", 
  SubscriptBox["f", "L"]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f1", "[", "1", "]"}], "\[Equal]", 
  SubscriptBox["f", "R"]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "-", "b", "+", "c", "-", "d"}], "\[Equal]", 
  SubscriptBox["f", "L"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "+", "b", "+", "c", "+", "d"}], "\[Equal]", 
  SubscriptBox["f", "R"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f1", "'"}], "[", 
   RowBox[{"-", "1"}], "]"}], "\[Equal]", 
  SubscriptBox[
   RowBox[{"f", "'"}], "L"]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"f1", "'"}], "[", "1", "]"}], "\[Equal]", 
  SubscriptBox[
   RowBox[{"f", "'"}], "R"]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "-", 
   RowBox[{"2", " ", "c"}], "+", 
   RowBox[{"3", " ", "d"}]}], "\[Equal]", 
  SubscriptBox[
   SuperscriptBox["f", "\[Prime]",
    MultilineFunction->None], "L"]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", "+", 
   RowBox[{"2", " ", "c"}], "+", 
   RowBox[{"3", " ", "d"}]}], "\[Equal]", 
  SubscriptBox[
   SuperscriptBox["f", "\[Prime]",
    MultilineFunction->None], "R"]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["solving as a system of equations", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f1", "[", 
        RowBox[{"-", "1"}], "]"}], "\[Equal]", 
       SubscriptBox["f", "L"]}], " ", "&&", " ", 
      RowBox[{
       RowBox[{"f1", "[", "1", "]"}], "\[Equal]", 
       SubscriptBox["f", "R"]}], "&&", 
      RowBox[{
       RowBox[{
        RowBox[{"f1", "'"}], "[", 
        RowBox[{"-", "1"}], "]"}], "\[Equal]", 
       SubscriptBox[
        RowBox[{"f", "'"}], "L"]}], "&&", " ", 
      RowBox[{
       RowBox[{
        RowBox[{"f1", "'"}], "[", "1", "]"}], "\[Equal]", 
       SubscriptBox[
        RowBox[{"f", "'"}], "R"]}]}], ",", 
     RowBox[{"{", 
      RowBox[{"a", ",", "b", ",", "c", ",", "d"}], "}"}]}], "]"}], "//", 
   "Simplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      FractionBox["1", "4"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"2", " ", 
         SubscriptBox["f", "L"]}], "+", 
        RowBox[{"2", " ", 
         SubscriptBox["f", "R"]}], "+", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "L"], "-", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "R"]}], ")"}]}]}], ",", 
    RowBox[{"b", "\[Rule]", 
     RowBox[{
      FractionBox["1", "4"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "3"}], " ", 
         SubscriptBox["f", "L"]}], "+", 
        RowBox[{"3", " ", 
         SubscriptBox["f", "R"]}], "-", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "L"], "-", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "R"]}], ")"}]}]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{
      FractionBox["1", "4"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", 
         SubscriptBox[
          SuperscriptBox["f", "\[Prime]",
           MultilineFunction->None], "L"]}], "+", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "R"]}], ")"}]}]}], ",", 
    RowBox[{"d", "\[Rule]", 
     RowBox[{
      FractionBox["1", "4"], " ", 
      RowBox[{"(", 
       RowBox[{
        SubscriptBox["f", "L"], "-", 
        SubscriptBox["f", "R"], "+", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "L"], "+", 
        SubscriptBox[
         SuperscriptBox["f", "\[Prime]",
          MultilineFunction->None], "R"]}], ")"}]}]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"f1", "[", "\[Xi]", "]"}], "/.", " ", "coefs", " "}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    FractionBox["1", "4"], " ", "\[Xi]", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "3"}], " ", 
       SubscriptBox["f", "L"]}], "+", 
      RowBox[{"3", " ", 
       SubscriptBox["f", "R"]}], "-", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "L"], "-", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}], "+", 
   RowBox[{
    FractionBox["1", "4"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"2", " ", 
       SubscriptBox["f", "L"]}], "+", 
      RowBox[{"2", " ", 
       SubscriptBox["f", "R"]}], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "L"], "-", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}], "+", 
   RowBox[{
    FractionBox["1", "4"], " ", 
    SuperscriptBox["\[Xi]", "2"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", 
       SubscriptBox[
        SuperscriptBox["f", "\[Prime]",
         MultilineFunction->None], "L"]}], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}], "+", 
   RowBox[{
    FractionBox["1", "4"], " ", 
    SuperscriptBox["\[Xi]", "3"], " ", 
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["f", "L"], "-", 
      SubscriptBox["f", "R"], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "L"], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"f1", "'"}], "[", "\[Xi]", "]"}], "/.", " ", "coefs", 
  " "}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    FractionBox["1", "4"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "3"}], " ", 
       SubscriptBox["f", "L"]}], "+", 
      RowBox[{"3", " ", 
       SubscriptBox["f", "R"]}], "-", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "L"], "-", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}], "+", 
   RowBox[{
    FractionBox["1", "2"], " ", "\[Xi]", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", 
       SubscriptBox[
        SuperscriptBox["f", "\[Prime]",
         MultilineFunction->None], "L"]}], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}], "+", 
   RowBox[{
    FractionBox["3", "4"], " ", 
    SuperscriptBox["\[Xi]", "2"], " ", 
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["f", "L"], "-", 
      SubscriptBox["f", "R"], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "L"], "+", 
      SubscriptBox[
       SuperscriptBox["f", "\[Prime]",
        MultilineFunction->None], "R"]}], ")"}]}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f1", "'"}], "[", 
    RowBox[{"-", "1"}], "]"}], "/.", " ", "coefs"}], " ", "//", 
  "Simplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f1", "'"}], "[", " ", "0", " ", "]"}], "/.", " ", "coefs"}], " ",
   "//", "Simplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"f1", "'"}], "[", 
    RowBox[{"+", "1"}], "]"}], " ", "/.", " ", "coefs"}], " ", "//", 
  "Simplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  SubscriptBox[
   SuperscriptBox["f", "\[Prime]",
    MultilineFunction->None], "L"], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", "4"], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "3"}], " ", 
      SubscriptBox["f", "L"]}], "+", 
     RowBox[{"3", " ", 
      SubscriptBox["f", "R"]}], "-", 
     SubscriptBox[
      SuperscriptBox["f", "\[Prime]",
       MultilineFunction->None], "L"], "-", 
     SubscriptBox[
      SuperscriptBox["f", "\[Prime]",
       MultilineFunction->None], "R"]}], ")"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  SubscriptBox[
   SuperscriptBox["f", "\[Prime]",
    MultilineFunction->None], "R"], "}"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["CIP-CSL3", "Section"],

Cell["\<\
Notice that the information to be evolved are the cell boundary values!\
\>", "Text"],

Cell[CellGroupData[{

Cell["constrains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"f1", "[", 
   RowBox[{
    RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
  SubscriptBox["f", 
   RowBox[{"i", "-", 
    RowBox[{"1", "/", "2"}]}]]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"f1", "[", 
   RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
  SubscriptBox["f", 
   RowBox[{"i", "+", 
    RowBox[{"1", "/", "2"}]}]]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "-", 
   FractionBox[
    RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"], "-", 
   FractionBox[
    RowBox[{"d", " ", 
     SuperscriptBox["\[CapitalDelta]x", "3"]}], "8"]}], "\[Equal]", 
  SubscriptBox["f", 
   RowBox[{
    RowBox[{"-", 
     FractionBox["1", "2"]}], "+", "i"}]]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "+", 
   FractionBox[
    RowBox[{"b", " ", "\[CapitalDelta]x"}], "2"], "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "4"], "+", 
   FractionBox[
    RowBox[{"d", " ", 
     SuperscriptBox["\[CapitalDelta]x", "3"]}], "8"]}], "\[Equal]", 
  SubscriptBox["f", 
   RowBox[{
    FractionBox["1", "2"], "+", "i"}]]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Simplify", "[", 
   RowBox[{
    FractionBox["1", "\[CapitalDelta]x"], 
    RowBox[{
     SubsuperscriptBox["\[Integral]", 
      RowBox[{
       RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
      RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
     RowBox[{
      RowBox[{"f1", "[", "\[Xi]", "]"}], 
      RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "]"}], "==", " ", 
  SubscriptBox["f", "i"]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"a", "+", 
   FractionBox[
    RowBox[{"c", " ", 
     SuperscriptBox["\[CapitalDelta]x", "2"]}], "12"]}], "\[Equal]", 
  SubscriptBox["f", "i"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"f1", "'"}], "[", "0", "]"}], " ", "==", " ", 
  SubscriptBox["dd", "i"]}]], "Input"],

Cell[BoxData[
 RowBox[{"b", "\[Equal]", 
  SubscriptBox["dd", "i"]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["solving as a system of equations", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"coefs", "=", " ", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"f1", "[", 
        RowBox[{"\[CapitalDelta]x", "/", "2"}], "]"}], "\[Equal]", 
       SubscriptBox["f", 
        RowBox[{"i", "+", 
         RowBox[{"1", "/", "2"}]}]]}], " ", "&&", " ", 
      RowBox[{
       RowBox[{"f1", "[", 
        RowBox[{
         RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], "]"}], "\[Equal]", 
       SubscriptBox["f", 
        RowBox[{"i", "-", 
         RowBox[{"1", "/", "2"}]}]]}], " ", "&&", 
      RowBox[{
       RowBox[{
        FractionBox["1", "\[CapitalDelta]x"], 
        RowBox[{
         SubsuperscriptBox["\[Integral]", 
          RowBox[{
           RowBox[{"-", "\[CapitalDelta]x"}], "/", "2"}], 
          RowBox[{"\[CapitalDelta]x", "/", "2"}]], 
         RowBox[{
          RowBox[{"f1", "[", "\[Xi]", "]"}], 
          RowBox[{"\[DifferentialD]", "\[Xi]"}]}]}]}], " ", "==", " ", 
       SubscriptBox["f", "i"]}], "&&", 
      RowBox[{
       RowBox[{
        RowBox[{"f1", "'"}], "[", "0", "]"}], " ", "==", " ", 
       SubscriptBox["dd", "i"]}]}], ",", 
     RowBox[{"{", 
      RowBox[{"a", ",", "b", ",", "c", ",", "d"}], "}"}]}], "]"}], "//", 
   "Expand"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"a", "\[Rule]", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        FractionBox["1", "4"]}], " ", 
       SubscriptBox["f", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
      FractionBox[
       RowBox[{"3", " ", 
        SubscriptBox["f", "i"]}], "2"], "-", 
      RowBox[{
       FractionBox["1", "4"], " ", 
       SubscriptBox["f", 
        RowBox[{
         FractionBox["1", "2"], "+", "i"}]]}]}]}], ",", 
    RowBox[{"b", "\[Rule]", 
     SubscriptBox["dd", "i"]}], ",", 
    RowBox[{"c", "\[Rule]", 
     RowBox[{
      FractionBox[
       RowBox[{"3", " ", 
        SubscriptBox["f", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "2"]], "-", 
      FractionBox[
       RowBox[{"6", " ", 
        SubscriptBox["f", "i"]}], 
       SuperscriptBox["\[CapitalDelta]x", "2"]], "+", 
      FractionBox[
       RowBox[{"3", " ", 
        SubscriptBox["f", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "2"]]}]}], ",", 
    RowBox[{"d", "\[Rule]", 
     RowBox[{
      RowBox[{"-", 
       FractionBox[
        RowBox[{"4", " ", 
         SubscriptBox["dd", "i"]}], 
        SuperscriptBox["\[CapitalDelta]x", "2"]]}], "-", 
      FractionBox[
       RowBox[{"4", " ", 
        SubscriptBox["f", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "3"]], "+", 
      FractionBox[
       RowBox[{"4", " ", 
        SubscriptBox["f", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "3"]]}]}]}], "}"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"f1", "[", 
   RowBox[{"x", "-", 
    SubscriptBox["x", 
     RowBox[{"i", "-", 
      RowBox[{"1", "/", "2"}]}]]}], "]"}], "/.", " ", "coefs", " ", 
  RowBox[{"(*", 
   RowBox[{"x", " ", "\\", 
    RowBox[{"in", " ", "[", 
     RowBox[{
      SubscriptBox["x", 
       RowBox[{"i", "-", 
        RowBox[{"1", "/", "2"}]}]], ",", 
      SubscriptBox["x", 
       RowBox[{"i", "+", 
        RowBox[{"1", "/", "2"}]}]]}], "]"}]}], " ", "*)"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    RowBox[{"-", 
     FractionBox["1", "4"]}], " ", 
    SubscriptBox["f", 
     RowBox[{
      RowBox[{"-", 
       FractionBox["1", "2"]}], "+", "i"}]]}], "+", 
   FractionBox[
    RowBox[{"3", " ", 
     SubscriptBox["f", "i"]}], "2"], "-", 
   RowBox[{
    FractionBox["1", "4"], " ", 
    SubscriptBox["f", 
     RowBox[{
      FractionBox["1", "2"], "+", "i"}]]}], "+", 
   RowBox[{
    SubscriptBox["dd", "i"], " ", 
    RowBox[{"(", 
     RowBox[{"x", "-", 
      SubscriptBox["x", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["1", "2"]}], "+", "i"}]]}], ")"}]}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      FractionBox[
       RowBox[{"3", " ", 
        SubscriptBox["f", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "2"]], "-", 
      FractionBox[
       RowBox[{"6", " ", 
        SubscriptBox["f", "i"]}], 
       SuperscriptBox["\[CapitalDelta]x", "2"]], "+", 
      FractionBox[
       RowBox[{"3", " ", 
        SubscriptBox["f", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "2"]]}], ")"}], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"x", "-", 
       SubscriptBox["x", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", "2"]}], "+", "i"}]]}], ")"}], "2"]}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", 
       FractionBox[
        RowBox[{"4", " ", 
         SubscriptBox["dd", "i"]}], 
        SuperscriptBox["\[CapitalDelta]x", "2"]]}], "-", 
      FractionBox[
       RowBox[{"4", " ", 
        SubscriptBox["f", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "2"]}], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "3"]], "+", 
      FractionBox[
       RowBox[{"4", " ", 
        SubscriptBox["f", 
         RowBox[{
          FractionBox["1", "2"], "+", "i"}]]}], 
       SuperscriptBox["\[CapitalDelta]x", "3"]]}], ")"}], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"x", "-", 
       SubscriptBox["x", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", "2"]}], "+", "i"}]]}], ")"}], "3"]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[TextData[{
 "is ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["f", "i"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " the cell center value?"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"a", "+", 
    FractionBox[
     RowBox[{"c", " ", 
      SuperscriptBox["\[CapitalDelta]x", "2"]}], "12"]}], "/.", " ", 
   "coefs"}], "//", "Simplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  SubscriptBox["f", "i"], "}"}]], "Output"]
}, Open  ]],

Cell["yes!", "Text"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1366, 702},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"9.0 for Linux x86 (64-bit) (February 7, 2013)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 50, 0, 92, "Title"],
Cell[1538, 37, 52, 0, 50, "Subtitle"],
Cell[1593, 39, 70, 2, 32, "Input"],
Cell[CellGroupData[{
Cell[1688, 45, 51, 0, 80, "Section"],
Cell[1742, 47, 1609, 52, 204, "Input"],
Cell[CellGroupData[{
Cell[3376, 103, 34, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[3435, 107, 995, 34, 181, "Input"],
Cell[4433, 143, 206, 6, 49, "Output"],
Cell[4642, 151, 206, 6, 49, "Output"],
Cell[4851, 159, 302, 9, 49, "Output"],
Cell[5156, 170, 302, 9, 49, "Output"],
Cell[5461, 181, 317, 10, 70, "Output"],
Cell[5781, 193, 317, 10, 70, "Output"],
Cell[6101, 205, 458, 14, 55, "Output"],
Cell[6562, 221, 670, 22, 56, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7269, 248, 2167, 78, 231, "Input"],
Cell[9439, 328, 88, 2, 32, "Output"],
Cell[9530, 332, 88, 2, 32, "Output"],
Cell[9621, 336, 194, 5, 49, "Output"],
Cell[9818, 343, 194, 5, 49, "Output"],
Cell[10015, 350, 454, 16, 68, "Output"],
Cell[10472, 368, 431, 15, 68, "Output"],
Cell[10906, 385, 50, 1, 32, "Output"],
Cell[10959, 388, 302, 11, 50, "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]],
Cell[CellGroupData[{
Cell[11322, 406, 49, 0, 80, "Section"],
Cell[CellGroupData[{
Cell[11396, 410, 32, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[11453, 414, 577, 19, 87, "Input"],
Cell[12033, 435, 298, 10, 47, "Output"],
Cell[12334, 447, 274, 9, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12645, 461, 445, 13, 51, "Input"],
Cell[13093, 476, 192, 6, 49, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[13334, 488, 54, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[13413, 492, 1268, 38, 51, "Input"],
Cell[14684, 532, 1191, 41, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15912, 578, 362, 11, 55, "Input"],
Cell[16277, 591, 321, 12, 47, "Output"],
Cell[16601, 605, 367, 14, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17005, 624, 1212, 36, 51, "Input"],
Cell[18220, 662, 1274, 44, 59, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[19555, 713, 49, 0, 80, "Section"],
Cell[CellGroupData[{
Cell[19629, 717, 32, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[19686, 721, 577, 19, 87, "Input"],
Cell[20266, 742, 407, 13, 49, "Output"],
Cell[20676, 757, 383, 12, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21096, 774, 445, 13, 51, "Input"],
Cell[21544, 789, 192, 6, 49, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[21785, 801, 54, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[21864, 805, 1268, 38, 51, "Input"],
Cell[23135, 845, 1356, 45, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24528, 895, 362, 11, 55, "Input"],
Cell[24893, 908, 332, 12, 47, "Output"],
Cell[25228, 922, 289, 10, 47, "Output"]
}, Open  ]],
Cell[25532, 935, 85, 3, 49, "Text"],
Cell[CellGroupData[{
Cell[25642, 942, 405, 13, 48, "Input"],
Cell[26050, 957, 350, 12, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26437, 974, 430, 14, 55, "Input"],
Cell[26870, 990, 355, 13, 47, "Output"],
Cell[27228, 1005, 403, 15, 47, "Output"]
}, Open  ]],
Cell[27646, 1023, 85, 2, 30, "Text"],
Cell[27734, 1027, 76, 2, 32, "Input"],
Cell[CellGroupData[{
Cell[27835, 1033, 1226, 36, 51, "Input"],
Cell[29064, 1071, 1457, 47, 69, "Output"]
}, Open  ]],
Cell[30536, 1121, 171, 4, 31, "Text"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[30756, 1131, 62, 0, 80, "Section"],
Cell[CellGroupData[{
Cell[30843, 1135, 32, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[30900, 1139, 597, 20, 87, "Input"],
Cell[31500, 1161, 871, 30, 73, "Output"],
Cell[32374, 1193, 847, 29, 73, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33258, 1227, 445, 13, 51, "Input"],
Cell[33706, 1242, 1260, 40, 56, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[35015, 1288, 34, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[35074, 1292, 1807, 54, 89, "Input"],
Cell[36884, 1348, 6230, 178, 161, "Output"]
}, Open  ]],
Cell[43129, 1529, 39, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[43193, 1533, 932, 30, 54, "Input"],
Cell[44128, 1565, 309, 11, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44474, 1581, 335, 11, 55, "Input"],
Cell[44812, 1594, 6163, 178, 169, "Output"],
Cell[50978, 1774, 6163, 178, 169, "Output"]
}, Open  ]],
Cell[57156, 1955, 103, 3, 30, "Text"],
Cell[CellGroupData[{
Cell[57284, 1962, 1749, 52, 88, "Input"],
Cell[59036, 2016, 4588, 136, 141, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63661, 2157, 335, 11, 55, "Input"],
Cell[63999, 2170, 4632, 138, 137, "Output"],
Cell[68634, 2310, 4632, 138, 137, "Output"]
}, Open  ]],
Cell[73281, 2451, 42, 0, 30, "Text"],
Cell[73326, 2453, 27, 0, 32, "Input"],
Cell[73356, 2455, 77, 2, 31, "Text"],
Cell[CellGroupData[{
Cell[73458, 2461, 175, 6, 47, "Input"],
Cell[73636, 2469, 162, 5, 48, "Output"]
}, Open  ]],
Cell[73813, 2477, 167, 7, 32, "Text"],
Cell[CellGroupData[{
Cell[74005, 2488, 177, 5, 32, "Input"],
Cell[74185, 2495, 1213, 42, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[75435, 2542, 1723, 52, 84, "Input"],
Cell[77161, 2596, 30693, 611, 252, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[107891, 3212, 1790, 53, 84, "Input"],
Cell[109684, 3267, 24887, 505, 257, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[134608, 3777, 100, 2, 32, "Input"],
Cell[134711, 3781, 46, 0, 32, "Output"]
}, Open  ]],
Cell[134772, 3784, 151, 3, 31, "Text"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[134972, 3793, 75, 0, 80, "Section"],
Cell[CellGroupData[{
Cell[135072, 3797, 32, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[135129, 3801, 683, 24, 87, "Input"],
Cell[135815, 3827, 259, 9, 47, "Output"],
Cell[136077, 3838, 497, 18, 50, "Output"]
}, Open  ]],
Cell[136589, 3859, 35, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[136649, 3863, 613, 20, 32, "Input"],
Cell[137265, 3885, 919, 32, 47, "Output"]
}, Open  ]],
Cell[138199, 3920, 51, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[138275, 3924, 961, 34, 48, "Input"],
Cell[139239, 3960, 112, 3, 32, "Output"]
}, Open  ]],
Cell[139366, 3966, 98, 2, 31, "Text"],
Cell[CellGroupData[{
Cell[139489, 3972, 264, 9, 32, "Input"],
Cell[139756, 3983, 487, 19, 50, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[140280, 4007, 320, 10, 32, "Input"],
Cell[140603, 4019, 243, 8, 47, "Output"]
}, Open  ]],
Cell[140861, 4030, 26, 0, 30, "Text"],
Cell[140890, 4032, 115, 4, 45, "Input"],
Cell[141008, 4038, 47, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[141080, 4042, 59, 1, 32, "Input"],
Cell[141142, 4045, 782, 26, 55, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[141961, 4076, 965, 30, 60, "Input"],
Cell[142929, 4108, 1158, 38, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[144124, 4151, 965, 30, 60, "Input"],
Cell[145092, 4183, 1158, 38, 48, "Output"]
}, Open  ]],
Cell[146265, 4224, 93, 2, 31, "Text"],
Cell[CellGroupData[{
Cell[146383, 4230, 408, 13, 48, "Input"],
Cell[146794, 4245, 53, 1, 32, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[146908, 4253, 23, 0, 80, "Section"],
Cell[CellGroupData[{
Cell[146956, 4257, 32, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[147013, 4261, 236, 7, 55, "Input"],
Cell[147252, 4270, 122, 3, 32, "Output"],
Cell[147377, 4275, 122, 3, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[147536, 4283, 312, 11, 55, "Input"],
Cell[147851, 4296, 221, 7, 32, "Output"],
Cell[148075, 4305, 221, 7, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[148345, 4318, 54, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[148424, 4322, 812, 26, 32, "Input"],
Cell[149239, 4350, 1876, 60, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[151152, 4415, 97, 2, 32, "Input"],
Cell[151252, 4419, 1715, 56, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[153004, 4480, 119, 4, 32, "Input"],
Cell[153126, 4486, 1249, 41, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[154412, 4532, 503, 17, 77, "Input"],
Cell[154918, 4551, 133, 4, 32, "Output"],
Cell[155054, 4557, 474, 16, 47, "Output"],
Cell[155531, 4575, 133, 4, 32, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[155725, 4586, 27, 0, 80, "Section"],
Cell[155755, 4588, 95, 2, 31, "Text"],
Cell[CellGroupData[{
Cell[155875, 4594, 32, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[155932, 4598, 413, 13, 55, "Input"],
Cell[156348, 4613, 430, 14, 52, "Output"],
Cell[156781, 4629, 409, 13, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[157227, 4647, 445, 13, 51, "Input"],
Cell[157675, 4662, 192, 6, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[157904, 4673, 131, 4, 32, "Input"],
Cell[158038, 4679, 80, 2, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[158167, 4687, 54, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[158246, 4691, 1264, 37, 51, "Input"],
Cell[159513, 4730, 1847, 61, 59, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[161397, 4796, 487, 16, 32, "Input"],
Cell[161887, 4814, 2297, 81, 66, "Output"]
}, Open  ]],
Cell[164199, 4898, 168, 7, 32, "Text"],
Cell[CellGroupData[{
Cell[164392, 4909, 211, 7, 51, "Input"],
Cell[164606, 4918, 72, 2, 32, "Output"]
}, Open  ]],
Cell[164693, 4923, 20, 0, 31, "Text"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 0xDQoDAOaK@GLCgHenOuiN3g *)
