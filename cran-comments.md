## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
* This is an R data package.
* I have adopted the suggestions of the last CRAN maintainer: (i) removed
single quotes from author names, and from the words polymerase and
neuroblastoma; (ii) I have removed examples from the unexported functions;
(iii) I have replaced `\dontrun{}` with `\donttest{}` in the example of the
function `get_biomarker_dataset()`; and (iv) I have created a few tests
to compensate for the lack of automatic tests.
* The note I am getting is because of misspelled words in DESCRIPTION. But I
am doing as I have been told by the CRAN maintainer, i.e. I am not quoting
author names, latin abbreviations (al and et), and the words "neuroblastoma"
and "polymerase".
