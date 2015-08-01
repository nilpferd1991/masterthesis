%% LaTeX2e class for diploma theses
%% Based on wissdoc.cls by Roland Bless, 1996-2001
%% bless@telematik.informatik.uni-karlsruhe.de
%%
%% Adapted by: Timo Rohrberg, 2009
%% timo.rohrberg@student.kit.edu
%%
%% Additions by: Thorsten Haberecht, IPD - Chair Prof. Böhm, 2010
%% thorsten.haberecht@kit.edu

%% Bearbeitet von Nils Braun, 2013


\NeedsTeXFormat{LaTeX2e}										% We do need LaTeX2e
\ProvidesClass{class/thesisclass}
\LoadClass[a4paper,11pt,titlepage,listof=numbered]{scrbook}	% Class based on scrbook

\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}


%% -------------------------------
%% |          Packages           |
%% -------------------------------

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc} % Input in utf8
\usepackage[pdftex]{graphicx}
\usepackage[toc,page]{appendix}

\addtokomafont{disposition}{\rmfamily}
\usepackage{vmargin}          % Adjust margins in a simple way
\usepackage{subcaption}
\usepackage{scrpage2}
\usepackage{url}
\usepackage[absolute,overlay]{textpos}
\usepackage{tikz}
\usepackage[english]{babel}
\usepackage{listing}
\usepackage{amsmath}
\usepackage{todonotes}
\usepackage{letltxmacro}
\usepackage{chngcntr}
\usepackage{upgreek}
\usepackage{longtable}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{footnote}
\usepackage[fixlanguage]{babelbib}	% sets german style for literature entries


\usepackage[
	colorlinks,
	linkcolor = black,
	citecolor = black,
	raiselinks=true,
	bookmarks=true,
	bookmarksopenlevel=1,
	bookmarksopen=true,
	bookmarksnumbered=true,
	breaklinks,
	hyperindex=true,
	plainpages=false,
	pdfpagelabels=true,
	pdfborder={0 0 0.5}]{hyperref}
	
\usepackage[all]{hypcap}
%% --- End of Packages ---



%% -------------------------------
%% |        Declarations         |
%% -------------------------------
\DeclareGraphicsExtensions{.pdf}
\selectbiblanguage{english}			% for \bibliographystyle{babalpha}
%% --- End of Declarations ---



%% -------------------------------
%% |         New commands        |
%% -------------------------------
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
\newcommand{\chapterheadfont}{}
\newcommand{\blankpage}{
 \clearpage{\pagestyle{empty}\cleardoublepage}
}

%% --- End of New Commands ---



%% -------------------------------
%% |      Globale Settings       |
%% -------------------------------
\setcounter{secnumdepth}{3} % Numbering also for \subsubsections
\setcounter{tocdepth}{1}    % Register \subsubsections in content directory

\setpapersize{A4}
\setmarginsrb{3cm}{1cm}{3cm}{1cm}{6mm}{7mm}{5mm}{15mm}

\parindent 0cm                     % Do not indent beginning of paragraph
\parskip1.5ex plus0.5ex minus0.5ex % Margin between paragraphs

\counterwithin{figure}{chapter}   % Figures mit Chapter-Zählung
%\counterwithin{figure}{section}   % Figures mit Section-Zählung
\counterwithin{table}{chapter}   % Table mit Chapter-Zählung
%\counterwithin{table}{section}   % Table mit Section-Zählung
%% --- End of global Settings ---



%% -------------------------------
%% |          Headings           |
%% -------------------------------
\pagestyle{scrheadings}
\lehead{{\headfont\thepage}}				% Left/right header for even/odd pages
\rohead{{\headfont\thepage}}				% Left/right header for even/odd pages
\lohead{\headfont\uppercase{\rightmark}}		% Header for left page (odd)
\rehead{\headfont\uppercase{\leftmark}}		% Header for right page (even)
\cfoot{}
\lefoot{}
\rofoot{}

%% --- End of Headings ---



%% -------------------------------
%% |      Style of captions      |
%% -------------------------------
\renewcommand{\chaptername}{}

\renewcommand{\section}{%
\@startsection{section}%
{1}		% Structure level
{0mm}	% Indention
{2ex plus 1ex minus 1ex}		% Pre-Margin
{0.5ex plus 0.5ex minus 0.5ex}		% Post-Margin
{\chapterheadfont\Large\bfseries}	% Style
}
\renewcommand{\subsection}{%
\@startsection{subsection}%
{2}		% Structure level
{0mm}	% Indention
{1.5ex plus 1ex minus 0.5ex}		% Pre-Margin
{0.3ex plus 0.3ex minus 0.3ex}		% Post-Margin
{\chapterheadfont\large\bfseries}	% Style
}
\renewcommand{\subsubsection}{%
\@startsection{subsubsection}%
{3}		% Structure level
{0mm}	% Indention
{1.5ex plus 1ex minus 0.5ex}			% Pre-Margin
{0.2ex plus 0.2ex minus 0.2ex}			% Post-Margin
{\chapterheadfont\normalsize\bfseries}	% Style
}
\renewcommand{\paragraph}{%
\@startsection{paragraph}%
{4}		% Structure level
{0mm}	% Indention
{1.3ex plus 1ex minus 0.3ex}			% Pre-Margin
{0.2ex plus 0.2ex minus 0.2ex}			% Post-Margin
{\chapterheadfont\normalsize\bfseries}	% Style
}
\renewcommand{\subparagraph}{%
\@startsection{subparagraph}%
{5}		% Structure level
{0mm}	% Indention
{1ex plus 1ex minus 0.2ex}				% Pre-Margin
{0.1ex plus 0.1ex minus 0.1ex}			% Post-Margin
{\chapterheadfont\normalsize\bfseries}	% Style
}
%% --- End of captions style ---



%% ---------------------------------
%% |   Style of chapter captions   |
%% ---------------------------------
\newlength{\chapnolen}
\newlength{\chapparlen}
\newsavebox{\chapno}
\renewcommand{\@makechapterhead}[1]{
  \vspace*{0.1\textheight}
  \vskip 15\p@
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \savebox{\chapno}{\huge\bfseries \thechapter.}
        \settowidth{\chapnolen}{\usebox{\chapno}}
        \parbox[t]{\chapnolen}{\usebox{\chapno}}\nobreak\leavevmode
      \fi
    \fi
    \interlinepenalty\@MM
    \setlength{\chapparlen}{\textwidth}
    \addtolength{\chapparlen}{-1.0\chapnolen}
    \addtolength{\chapparlen}{-2ex}
    \leavevmode\nobreak
    \parbox[t]{\chapparlen}{\raggedright\huge \bfseries #1\par\nobreak}
    \vskip 40\p@
  }}

\renewcommand{\@makeschapterhead}[1]{
  \vspace*{50\p@}
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }
}
%% --- End of chapter captions style ---



%% ---------------------------------
%% |  Style of content directory   |
%% ---------------------------------
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{#5}}
%% --- End of content directory style ---

%% **** END OF CLASS ****
