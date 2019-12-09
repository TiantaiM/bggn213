class18
================

## The GenomicDataCommon R packages

``` r
library(GenomicDataCommons)
```

    ## Loading required package: magrittr

    ## 
    ## Attaching package: 'GenomicDataCommons'

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

``` r
library(TCGAbiolinks)
library(maftools)
```

``` r
# check on GDC status
status()
```

    ## $commit
    ## [1] "955a105f3f2ba797e1d9d8de013226a495feae56"
    ## 
    ## $data_release
    ## [1] "Data Release 20.0 - November 11, 2019"
    ## 
    ## $status
    ## [1] "OK"
    ## 
    ## $tag
    ## [1] "1.23.0"
    ## 
    ## $version
    ## [1] 1

``` r
MHC <- read.csv("~/Downloads/result.csv")
MHC
```

    ##           allele seq_num start end length   peptide
    ## 1    HLA-B*07:02       1    76  84      9 APAAPTPAA
    ## 2    HLA-B*07:02       1   249 257      9 RPILTIITL
    ## 3    HLA-A*02:01       1   205 213      9 YLDDRNTFV
    ## 4    HLA-B*35:01       1   212 220      9 FVHSVVVPY
    ## 5    HLA-B*07:02       1    33  41      9 SPLPSQAML
    ## 6    HLA-A*02:01       1    65  73      9 WMPEAAPPV
    ## 7    HLA-B*07:02       1    35  43      9 LPSQAMLDL
    ## 8    HLA-B*07:02       1    88  96      9 APSWPLSSS
    ## 9    HLA-A*68:01       1   124 132      9 CTYSPALNK
    ## 10   HLA-A*02:01       1   251 259      9 ILTIITLEV
    ## 11   HLA-B*35:01       1    91  99      9 WPLSSSVPS
    ## 12   HLA-B*07:02       1   152 160      9 PPGTRVRAM
    ## 13   HLA-A*68:01       1    93 101      9 LSSSVPSQK
    ## 14   HLA-B*07:02       1    70  78      9 APPVAPAPA
    ## 15   HLA-A*02:01       1   135 143      9 CQLAKTCPV
    ## 16   HLA-B*35:01       1    66  74      9 MPEAAPPVA
    ## 17   HLA-B*35:01       1   118 126      9 TAKSVTCTY
    ## 18   HLA-A*68:01       1   240 248      9 SSCMGGMNR
    ## 19   HLA-A*68:01       1   148 156      9 DSTPPPGTR
    ## 20   HLA-B*07:02       1    66  74      9 MPEAAPPVA
    ## 21   HLA-A*02:01       1   103 111      9 YQGSYGFRL
    ## 22   HLA-B*35:01       1    11  19      9 EPPLSQETF
    ## 23   HLA-A*68:01       1   212 220      9 FVHSVVVPY
    ## 24   HLA-B*35:01       1    35  43      9 LPSQAMLDL
    ## 25   HLA-B*35:01       1    63  71      9 APWMPEAAP
    ## 26   HLA-A*02:01       1    24  32      9 KLLPENNVL
    ## 27   HLA-B*35:01       1    81  89      9 TPAAPAPAP
    ## 28   HLA-B*07:02       1   189 197      9 APPQHLIRV
    ## 29   HLA-A*68:01       1   102 110      9 TYQGSYGFR
    ## 30   HLA-B*35:01       1    71  79      9 PPVAPAPAA
    ## 31   HLA-B*35:01       1    76  84      9 APAAPTPAA
    ## 32   HLA-B*07:02       1    63  71      9 APWMPEAAP
    ## 33   HLA-A*68:01       1   118 126      9 TAKSVTCTY
    ## 34   HLA-B*07:02       1    91  99      9 WPLSSSVPS
    ## 35   HLA-A*02:01       1   164 172      9 KQSQHMTEV
    ## 36   HLA-B*07:02       1    71  79      9 PPVAPAPAA
    ## 37   HLA-A*02:01       1   187 195      9 GLAPPQHLI
    ## 38   HLA-B*35:01       1    46  54      9 SPDDIEQWF
    ## 39   HLA-A*02:01       1   129 137      9 ALNKMFCQL
    ## 40   HLA-A*02:01       1   132 140      9 KMFCQLAKT
    ## 41   HLA-B*07:02       1   154 162      9 GTRVRAMAI
    ## 42   HLA-A*68:01       1   160 168      9 MAIYKQSQH
    ## 43   HLA-B*35:01       1    32  40      9 LSPLPSQAM
    ## 44   HLA-B*35:01       1   152 160      9 PPGTRVRAM
    ## 45   HLA-A*02:01       1    39  47      9 AMLDLMLSP
    ## 46   HLA-A*02:01       1    31  39      9 VLSPLPSQA
    ## 47   HLA-A*68:01       1   188 196      9 LAPPQHLIR
    ## 48   HLA-B*35:01       1    62  70      9 EAPWMPEAA
    ## 49   HLA-B*35:01       1   160 168      9 MAIYKQSQH
    ## 50   HLA-B*07:02       1    86  94      9 APAPSWPLS
    ## 51   HLA-A*68:01       1   156 164      9 RVRAMAIYK
    ## 52   HLA-B*07:02       1    74  82      9 APAPAAPTP
    ## 53   HLA-B*35:01       1    79  87      9 APTPAAPAP
    ## 54   HLA-A*02:01       1   139 147      9 KTCPVQLWV
    ## 55   HLA-B*35:01       1    68  76      9 EAAPPVAPA
    ## 56   HLA-A*68:01       1   167 175      9 QHMTEVVRR
    ## 57   HLA-B*07:02       1    79  87      9 APTPAAPAP
    ## 58   HLA-B*35:01       1   141 149      9 CPVQLWVDS
    ## 59   HLA-B*35:01       1   235 243      9 NYMCNSSCM
    ## 60   HLA-B*35:01       1   249 257      9 RPILTIITL
    ## 61   HLA-A*68:01       1    17  25      9 ETFSDLWKL
    ## 62   HLA-B*35:01       1    95 103      9 SSVPSQKTY
    ## 63   HLA-B*07:02       1   127 135      9 SPALNKMFC
    ## 64   HLA-A*02:01       1   217 225      9 VVPYEPPEV
    ## 65   HLA-B*35:01       1    33  41      9 SPLPSQAML
    ## 66   HLA-B*35:01       1    57  65      9 DPGPDEAPW
    ## 67   HLA-A*02:01       1   113 121      9 FLHSGTAKS
    ## 68   HLA-B*35:01       1     3  11      9 EPQSDPSVE
    ## 69   HLA-B*35:01       1    74  82      9 APAPAAPTP
    ## 70   HLA-B*07:02       1    84  92      9 APAPAPSWP
    ## 71   HLA-B*35:01       1    86  94      9 APAPSWPLS
    ## 72   HLA-B*07:02       1    81  89      9 TPAAPAPAP
    ## 73   HLA-B*07:02       1   244 252      9 GGMNRRPIL
    ## 74   HLA-B*07:02       1   246 254      9 MNRRPILTI
    ## 75   HLA-B*07:02       1   121 129      9 SVTCTYSPA
    ## 76   HLA-B*07:02       1   243 251      9 MGGMNRRPI
    ## 77   HLA-B*35:01       1   146 154      9 WVDSTPPPG
    ## 78   HLA-B*35:01       1    26  34      9 LPENNVLSP
    ## 79   HLA-A*68:01       1   194 202      9 LIRVEGNLR
    ## 80   HLA-B*35:01       1    59  67      9 GPDEAPWMP
    ## 81   HLA-A*68:01       1   166 174      9 SQHMTEVVR
    ## 82   HLA-A*02:01       1   122 130      9 VTCTYSPAL
    ## 83   HLA-B*07:02       1    46  54      9 SPDDIEQWF
    ## 84   HLA-B*07:02       1   129 137      9 ALNKMFCQL
    ## 85   HLA-A*02:01       1    37  45      9 SQAMLDLML
    ## 86   HLA-A*68:01       1    16  24      9 QETFSDLWK
    ## 87   HLA-B*35:01       1    85  93      9 PAPAPSWPL
    ## 88   HLA-B*07:02       1   151 159      9 PPPGTRVRA
    ## 89   HLA-B*07:02       1   176 184      9 CPHHERCSD
    ## 90   HLA-A*68:01       1   150 158      9 TPPPGTRVR
    ## 91   HLA-A*02:01       1   210 218      9 NTFVHSVVV
    ## 92   HLA-A*68:01       1    68  76      9 EAAPPVAPA
    ## 93   HLA-A*68:01       1   230 238      9 TTIHYNYMC
    ## 94   HLA-A*68:01       1   241 249      9 SCMGGMNRR
    ## 95   HLA-A*02:01       1    40  48      9 MLDLMLSPD
    ## 96   HLA-B*07:02       1   150 158      9 TPPPGTRVR
    ## 97   HLA-B*35:01       1   137 145      9 LAKTCPVQL
    ## 98   HLA-B*07:02       1    78  86      9 AAPTPAAPA
    ## 99   HLA-A*02:01       1   193 201      9 HLIRVEGNL
    ## 100  HLA-B*35:01       1    38  46      9 QAMLDLMLS
    ## 101  HLA-A*68:01       1   131 139      9 NKMFCQLAK
    ## 102  HLA-B*35:01       1    70  78      9 APPVAPAPA
    ## 103  HLA-B*35:01       1   176 184      9 CPHHERCSD
    ## 104  HLA-B*35:01       1    40  48      9 MLDLMLSPD
    ## 105  HLA-A*68:01       1   210 218      9 NTFVHSVVV
    ## 106  HLA-B*07:02       1   156 164      9 RVRAMAIYK
    ## 107  HLA-B*35:01       1   126 134      9 YSPALNKMF
    ## 108  HLA-A*68:01       1   229 237      9 CTTIHYNYM
    ## 109  HLA-B*07:02       1    24  32      9 KLLPENNVL
    ## 110  HLA-B*07:02       1    26  34      9 LPENNVLSP
    ## 111  HLA-B*07:02       1    32  40      9 LSPLPSQAM
    ## 112  HLA-B*07:02       1   137 145      9 LAKTCPVQL
    ## 113  HLA-B*07:02       1   161 169      9 AIYKQSQHM
    ## 114  HLA-B*07:02       1   209 217      9 RNTFVHSVV
    ## 115  HLA-A*02:01       1    17  25      9 ETFSDLWKL
    ## 116  HLA-B*35:01       1    53  61      9 WFTEDPGPD
    ## 117  HLA-B*35:01       1    73  81      9 VAPAPAAPT
    ## 118  HLA-B*35:01       1    82  90      9 PAAPAPAPS
    ## 119  HLA-B*35:01       1   107 115      9 YGFRLGFLH
    ## 120  HLA-B*35:01       1   228 236      9 DCTTIHYNY
    ## 121  HLA-B*35:01       1   229 237      9 CTTIHYNYM
    ## 122  HLA-B*35:01       1   233 241      9 HYNYMCNSS
    ## 123  HLA-B*07:02       1   158 166      9 RAMAIYKQS
    ## 124  HLA-A*02:01       1    25  33      9 LLPENNVLS
    ## 125  HLA-B*35:01       1    44  52      9 MLSPDDIEQ
    ## 126  HLA-B*35:01       1    65  73      9 WMPEAAPPV
    ## 127  HLA-B*35:01       1    77  85      9 PAAPTPAAP
    ## 128  HLA-B*35:01       1    84  92      9 APAPAPSWP
    ## 129  HLA-B*35:01       1   145 153      9 LWVDSTPPP
    ## 130  HLA-B*35:01       1   204 212      9 EYLDDRNTF
    ## 131  HLA-B*35:01       1   218 226      9 VPYEPPEVG
    ## 132  HLA-B*35:01       1   226 234      9 GSDCTTIHY
    ## 133  HLA-B*07:02       1    11  19      9 EPPLSQETF
    ## 134  HLA-B*07:02       1    14  22      9 LSQETFSDL
    ## 135  HLA-B*07:02       1    68  76      9 EAAPPVAPA
    ## 136  HLA-A*02:01       1    42  50      9 DLMLSPDDI
    ## 137  HLA-A*02:01       1   236 244      9 YMCNSSCMG
    ## 138  HLA-B*35:01       1    69  77      9 AAPPVAPAP
    ## 139  HLA-A*68:01       1   107 115      9 YGFRLGFLH
    ## 140  HLA-A*68:01       1   171 179      9 EVVRRCPHH
    ## 141  HLA-B*07:02       1    73  81      9 VAPAPAAPT
    ## 142  HLA-B*07:02       1   122 130      9 VTCTYSPAL
    ## 143  HLA-B*07:02       1   149 157      9 STPPPGTRV
    ## 144  HLA-B*07:02       1   190 198      9 PPQHLIRVE
    ## 145  HLA-A*68:01       1   214 222      9 HSVVVPYEP
    ## 146  HLA-A*68:01       1   231 239      9 TIHYNYMCN
    ## 147  HLA-A*02:01       1    21  29      9 DLWKLLPEN
    ## 148  HLA-B*35:01       1     7  15      9 DPSVEPPLS
    ## 149  HLA-B*35:01       1   101 109      9 KTYQGSYGF
    ## 150  HLA-B*35:01       1   238 246      9 CNSSCMGGM
    ## 151  HLA-A*68:01       1    95 103      9 SSVPSQKTY
    ## 152  HLA-B*07:02       1    37  45      9 SQAMLDLML
    ## 153  HLA-B*07:02       1    57  65      9 DPGPDEAPW
    ## 154  HLA-B*07:02       1    83  91      9 AAPAPAPSW
    ## 155  HLA-B*07:02       1   193 201      9 HLIRVEGNL
    ## 156  HLA-B*07:02       1   235 243      9 NYMCNSSCM
    ## 157  HLA-A*68:01       1   228 236      9 DCTTIHYNY
    ## 158  HLA-A*02:01       1    44  52      9 MLSPDDIEQ
    ## 159  HLA-A*02:01       1   212 220      9 FVHSVVVPY
    ## 160  HLA-A*02:01       1   245 253      9 GMNRRPILT
    ## 161  HLA-A*02:01       1   249 257      9 RPILTIITL
    ## 162  HLA-B*35:01       1    75  83      9 PAPAAPTPA
    ## 163  HLA-B*35:01       1   111 119      9 LGFLHSGTA
    ## 164  HLA-B*35:01       1   127 135      9 SPALNKMFC
    ## 165  HLA-B*35:01       1   155 163      9 TRVRAMAIY
    ## 166  HLA-B*35:01       1   158 166      9 RAMAIYKQS
    ## 167  HLA-B*07:02       1   106 114      9 SYGFRLGFL
    ## 168  HLA-A*68:01       1   121 129      9 SVTCTYSPA
    ## 169  HLA-A*02:01       1   121 129      9 SVTCTYSPA
    ## 170  HLA-A*02:01       1   144 152      9 QLWVDSTPP
    ## 171  HLA-A*02:01       1   161 169      9 AIYKQSQHM
    ## 172  HLA-B*35:01       1    88  96      9 APSWPLSSS
    ## 173  HLA-B*35:01       1    97 105      9 VPSQKTYQG
    ## 174  HLA-B*35:01       1   150 158      9 TPPPGTRVR
    ## 175  HLA-B*35:01       1   206 214      9 LDDRNTFVH
    ## 176  HLA-B*35:01       1   214 222      9 HSVVVPYEP
    ## 177  HLA-B*35:01       1   237 245      9 MCNSSCMGG
    ## 178  HLA-B*35:01       1   243 251      9 MGGMNRRPI
    ## 179  HLA-A*68:01       1   216 224      9 VVVPYEPPE
    ## 180  HLA-B*07:02       1   103 111      9 YQGSYGFRL
    ## 181  HLA-B*07:02       1   141 149      9 CPVQLWVDS
    ## 182  HLA-B*07:02       1   164 172      9 KQSQHMTEV
    ## 183  HLA-A*68:01       1     9  17      9 SVEPPLSQE
    ## 184  HLA-A*68:01       1   101 109      9 KTYQGSYGF
    ## 185  HLA-A*02:01       1    89  97      9 PSWPLSSSV
    ## 186  HLA-A*02:01       1   101 109      9 KTYQGSYGF
    ## 187  HLA-B*35:01       1    36  44      9 PSQAMLDLM
    ## 188  HLA-B*35:01       1   182 190      9 CSDSDGLAP
    ## 189  HLA-B*35:01       1   216 224      9 VVVPYEPPE
    ## 190  HLA-A*68:01       1    44  52      9 MLSPDDIEQ
    ## 191  HLA-B*07:02       1    89  97      9 PSWPLSSSV
    ## 192  HLA-B*07:02       1   101 109      9 KTYQGSYGF
    ## 193  HLA-B*07:02       1   110 118      9 RLGFLHSGT
    ## 194  HLA-A*68:01       1    54  62      9 FTEDPGPDE
    ## 195  HLA-A*68:01       1   201 209      9 LRVEYLDDR
    ## 196  HLA-A*02:01       1   110 118      9 RLGFLHSGT
    ## 197  HLA-B*35:01       1    78  86      9 AAPTPAAPA
    ## 198  HLA-B*35:01       1   121 129      9 SVTCTYSPA
    ## 199  HLA-B*35:01       1   122 130      9 VTCTYSPAL
    ## 200  HLA-B*35:01       1   188 196      9 LAPPQHLIR
    ## 201  HLA-B*35:01       1   225 233      9 VGSDCTTIH
    ## 202  HLA-B*07:02       1     9  17      9 SVEPPLSQE
    ## 203  HLA-B*07:02       1    97 105      9 VPSQKTYQG
    ## 204  HLA-B*07:02       1   205 213      9 YLDDRNTFV
    ## 205  HLA-B*07:02       1   251 259      9 ILTIITLEV
    ## 206  HLA-A*02:01       1   168 176      9 HMTEVVRRC
    ## 207  HLA-A*02:01       1   195 203      9 IRVEGNLRV
    ## 208  HLA-B*35:01       1    14  22      9 LSQETFSDL
    ## 209  HLA-B*35:01       1    17  25      9 ETFSDLWKL
    ## 210  HLA-B*35:01       1    72  80      9 PVAPAPAAP
    ## 211  HLA-B*35:01       1   115 123      9 HSGTAKSVT
    ## 212  HLA-B*07:02       1     3  11      9 EPQSDPSVE
    ## 213  HLA-B*07:02       1    30  38      9 NVLSPLPSQ
    ## 214  HLA-B*07:02       1   159 167      9 AMAIYKQSQ
    ## 215  HLA-B*07:02       1   196 204      9 RVEGNLRVE
    ## 216  HLA-B*07:02       1   210 218      9 NTFVHSVVV
    ## 217  HLA-A*68:01       1   215 223      9 SVVVPYEPP
    ## 218  HLA-A*02:01       1   189 197      9 APPQHLIRV
    ## 219  HLA-A*68:01       1    38  46      9 QAMLDLMLS
    ## 220  HLA-A*68:01       1   169 177      9 MTEVVRRCP
    ## 221  HLA-B*07:02       1    31  39      9 VLSPLPSQA
    ## 222  HLA-B*07:02       1    85  93      9 PAPAPSWPL
    ## 223  HLA-B*07:02       1   212 220      9 FVHSVVVPY
    ## 224  HLA-A*68:01       1   105 113      9 GSYGFRLGF
    ## 225  HLA-B*35:01       1   105 113      9 GSYGFRLGF
    ## 226  HLA-B*35:01       1   113 121      9 FLHSGTAKS
    ## 227  HLA-B*35:01       1   125 133      9 TYSPALNKM
    ## 228  HLA-A*68:01       1    96 104      9 SVPSQKTYQ
    ## 229  HLA-B*07:02       1    65  73      9 WMPEAAPPV
    ## 230  HLA-B*07:02       1   115 123      9 HSGTAKSVT
    ## 231  HLA-B*07:02       1   218 226      9 VPYEPPEVG
    ## 232  HLA-B*07:02       1   221 229      9 EPPEVGSDC
    ## 233  HLA-B*07:02       1   238 246      9 CNSSCMGGM
    ## 234  HLA-A*02:01       1   146 154      9 WVDSTPPPG
    ## 235  HLA-B*35:01       1     1   9      9 MEEPQSDPS
    ## 236  HLA-B*35:01       1    64  72      9 PWMPEAAPP
    ## 237  HLA-B*35:01       1   161 169      9 AIYKQSQHM
    ## 238  HLA-A*68:01       1    48  56      9 DDIEQWFTE
    ## 239  HLA-B*07:02       1   160 168      9 MAIYKQSQH
    ## 240  HLA-B*07:02       1   187 195      9 GLAPPQHLI
    ## 241  HLA-B*07:02       1   222 230      9 PPEVGSDCT
    ## 242  HLA-B*07:02       1   229 237      9 CTTIHYNYM
    ## 243  HLA-A*68:01       1   236 244      9 YMCNSSCMG
    ## 244  HLA-A*02:01       1   149 157      9 STPPPGTRV
    ## 245  HLA-B*35:01       1    43  51      9 LMLSPDDIE
    ## 246  HLA-B*35:01       1    48  56      9 DDIEQWFTE
    ## 247  HLA-B*35:01       1    83  91      9 AAPAPAPSW
    ## 248  HLA-A*68:01       1    62  70      9 EAPWMPEAA
    ## 249  HLA-A*68:01       1   112 120      9 GFLHSGTAK
    ## 250  HLA-A*68:01       1   235 243      9 NYMCNSSCM
    ## 251  HLA-B*07:02       1   105 113      9 GSYGFRLGF
    ## 252  HLA-A*02:01       1     6  14      9 SDPSVEPPL
    ## 253  HLA-B*35:01       1   165 173      9 QSQHMTEVV
    ## 254  HLA-B*35:01       1   190 198      9 PPQHLIRVE
    ## 255  HLA-B*35:01       1   210 218      9 NTFVHSVVV
    ## 256  HLA-B*35:01       1   221 229      9 EPPEVGSDC
    ## 257  HLA-A*68:01       1   239 247      9 NSSCMGGMN
    ## 258  HLA-B*07:02       1   172 180      9 VVRRCPHHE
    ## 259  HLA-A*68:01       1   113 121      9 FLHSGTAKS
    ## 260  HLA-A*02:01       1    38  46      9 QAMLDLMLS
    ## 261  HLA-A*02:01       1   230 238      9 TTIHYNYMC
    ## 262  HLA-B*35:01       1   109 117      9 FRLGFLHSG
    ## 263  HLA-B*35:01       1   131 139      9 NKMFCQLAK
    ## 264  HLA-B*07:02       1   234 242      9 YNYMCNSSC
    ## 265  HLA-A*68:01       1    28  36      9 ENNVLSPLP
    ## 266  HLA-A*68:01       1   126 134      9 YSPALNKMF
    ## 267  HLA-A*68:01       1   173 181      9 VRRCPHHER
    ## 268  HLA-A*68:01       1   211 219      9 TFVHSVVVP
    ## 269  HLA-A*68:01       1   250 258      9 PILTIITLE
    ## 270  HLA-A*02:01       1   109 117      9 FRLGFLHSG
    ## 271  HLA-B*35:01       1    12  20      9 PPLSQETFS
    ## 272  HLA-B*35:01       1    37  45      9 SQAMLDLML
    ## 273  HLA-B*35:01       1   236 244      9 YMCNSSCMG
    ## 274  HLA-A*68:01       1    30  38      9 NVLSPLPSQ
    ## 275  HLA-B*07:02       1   165 173      9 QSQHMTEVV
    ## 276  HLA-B*07:02       1   247 255      9 NRRPILTII
    ## 277  HLA-A*02:01       1    14  22      9 LSQETFSDL
    ## 278  HLA-B*35:01       1    41  49      9 LDLMLSPDD
    ## 279  HLA-B*35:01       1   189 197      9 APPQHLIRV
    ## 280  HLA-B*35:01       1   224 232      9 EVGSDCTTI
    ## 281  HLA-B*07:02       1    12  20      9 PPLSQETFS
    ## 282  HLA-B*07:02       1    39  47      9 AMLDLMLSP
    ## 283  HLA-B*07:02       1   135 143      9 CQLAKTCPV
    ## 284  HLA-A*68:01       1   224 232      9 EVGSDCTTI
    ## 285  HLA-A*02:01       1   145 153      9 LWVDSTPPP
    ## 286  HLA-A*02:01       1   165 173      9 QSQHMTEVV
    ## 287  HLA-B*35:01       1   129 137      9 ALNKMFCQL
    ## 288  HLA-B*35:01       1   197 205      9 VEGNLRVEY
    ## 289  HLA-A*68:01       1   117 125      9 GTAKSVTCT
    ## 290  HLA-A*68:01       1   155 163      9 TRVRAMAIY
    ## 291  HLA-B*07:02       1    18  26      9 TFSDLWKLL
    ## 292  HLA-B*07:02       1    75  83      9 PAPAAPTPA
    ## 293  HLA-B*07:02       1    82  90      9 PAAPAPAPS
    ## 294  HLA-B*07:02       1    99 107      9 SQKTYQGSY
    ## 295  HLA-B*07:02       1   111 119      9 LGFLHSGTA
    ## 296  HLA-B*07:02       1   114 122      9 LHSGTAKSV
    ## 297  HLA-B*07:02       1   194 202      9 LIRVEGNLR
    ## 298  HLA-A*68:01       1   213 221      9 VHSVVVPYE
    ## 299  HLA-A*68:01       1   226 234      9 GSDCTTIHY
    ## 300  HLA-A*02:01       1   106 114      9 SYGFRLGFL
    ## 301  HLA-B*35:01       1     6  14      9 SDPSVEPPL
    ## 302  HLA-B*35:01       1   103 111      9 YQGSYGFRL
    ## 303  HLA-B*35:01       1   144 152      9 QLWVDSTPP
    ## 304  HLA-B*35:01       1   244 252      9 GGMNRRPIL
    ## 305  HLA-B*07:02       1     6  14      9 SDPSVEPPL
    ## 306  HLA-B*07:02       1   138 146      9 AKTCPVQLW
    ## 307  HLA-B*07:02       1   170 178      9 TEVVRRCPH
    ## 308  HLA-A*02:01       1   136 144      9 QLAKTCPVQ
    ## 309  HLA-B*35:01       1    51  59      9 EQWFTEDPG
    ## 310  HLA-B*35:01       1   123 131      9 TCTYSPALN
    ## 311  HLA-B*35:01       1   134 142      9 FCQLAKTCP
    ## 312  HLA-B*35:01       1   151 159      9 PPPGTRVRA
    ## 313  HLA-B*35:01       1   211 219      9 TFVHSVVVP
    ## 314  HLA-B*35:01       1   222 230      9 PPEVGSDCT
    ## 315  HLA-A*68:01       1   170 178      9 TEVVRRCPH
    ## 316  HLA-B*07:02       1    80  88      9 PTPAAPAPA
    ## 317  HLA-B*07:02       1   113 121      9 FLHSGTAKS
    ## 318  HLA-B*07:02       1   169 177      9 MTEVVRRCP
    ## 319  HLA-A*68:01       1   125 133      9 TYSPALNKM
    ## 320  HLA-A*02:01       1    19  27      9 FSDLWKLLP
    ## 321  HLA-A*02:01       1    61  69      9 DEAPWMPEA
    ## 322  HLA-A*02:01       1    85  93      9 PAPAPSWPL
    ## 323  HLA-A*02:01       1   120 128      9 KSVTCTYSP
    ## 324  HLA-A*02:01       1   229 237      9 CTTIHYNYM
    ## 325  HLA-A*02:01       1   244 252      9 GGMNRRPIL
    ## 326  HLA-B*35:01       1    29  37      9 NNVLSPLPS
    ## 327  HLA-B*35:01       1   183 191      9 SDSDGLAPP
    ## 328  HLA-A*68:01       1   251 259      9 ILTIITLEV
    ## 329  HLA-B*07:02       1    27  35      9 PENNVLSPL
    ## 330  HLA-B*07:02       1   139 147      9 KTCPVQLWV
    ## 331  HLA-B*07:02       1   153 161      9 PGTRVRAMA
    ## 332  HLA-B*07:02       1   181 189      9 RCSDSDGLA
    ## 333  HLA-A*02:01       1    18  26      9 TFSDLWKLL
    ## 334  HLA-A*02:01       1    68  76      9 EAAPPVAPA
    ## 335  HLA-A*02:01       1    76  84      9 APAAPTPAA
    ## 336  HLA-A*02:01       1    78  86      9 AAPTPAAPA
    ## 337  HLA-B*35:01       1    93 101      9 LSSSVPSQK
    ## 338  HLA-B*07:02       1   173 181      9 VRRCPHHER
    ## 339  HLA-A*68:01       1   158 166      9 RAMAIYKQS
    ## 340  HLA-A*68:01       1   227 235      9 SDCTTIHYN
    ## 341  HLA-A*68:01       1   234 242      9 YNYMCNSSC
    ## 342  HLA-A*02:01       1   137 145      9 LAKTCPVQL
    ## 343  HLA-A*02:01       1   234 242      9 YNYMCNSSC
    ## 344  HLA-B*35:01       1    19  27      9 FSDLWKLLP
    ## 345  HLA-B*35:01       1   133 141      9 MFCQLAKTC
    ## 346  HLA-B*07:02       1    94 102      9 SSSVPSQKT
    ## 347  HLA-A*68:01       1    11  19      9 EPPLSQETF
    ## 348  HLA-A*68:01       1   193 201      9 HLIRVEGNL
    ## 349  HLA-A*68:01       1   204 212      9 EYLDDRNTF
    ## 350  HLA-A*02:01       1    23  31      9 WKLLPENNV
    ## 351  HLA-A*02:01       1    33  41      9 SPLPSQAML
    ## 352  HLA-B*35:01       1    18  26      9 TFSDLWKLL
    ## 353  HLA-B*35:01       1    25  33      9 LLPENNVLS
    ## 354  HLA-B*35:01       1   171 179      9 EVVRRCPHH
    ## 355  HLA-B*35:01       1   215 223      9 SVVVPYEPP
    ## 356  HLA-B*35:01       1   239 247      9 NSSCMGGMN
    ## 357  HLA-B*07:02       1    59  67      9 GPDEAPWMP
    ## 358  HLA-B*07:02       1    62  70      9 EAPWMPEAA
    ## 359  HLA-B*07:02       1    72  80      9 PVAPAPAAP
    ## 360  HLA-B*07:02       1   248 256      9 RRPILTIIT
    ## 361  HLA-A*68:01       1   136 144      9 QLAKTCPVQ
    ## 362  HLA-A*02:01       1    13  21      9 PLSQETFSD
    ## 363  HLA-A*02:01       1    80  88      9 PTPAAPAPA
    ## 364  HLA-A*02:01       1   208 216      9 DRNTFVHSV
    ## 365  HLA-A*02:01       1   224 232      9 EVGSDCTTI
    ## 366  HLA-B*35:01       1    58  66      9 PGPDEAPWM
    ## 367  HLA-B*35:01       1   251 259      9 ILTIITLEV
    ## 368  HLA-A*68:01       1    43  51      9 LMLSPDDIE
    ## 369  HLA-B*07:02       1   125 133      9 TYSPALNKM
    ## 370  HLA-B*07:02       1   224 232      9 EVGSDCTTI
    ## 371  HLA-A*68:01       1   123 131      9 TCTYSPALN
    ## 372  HLA-A*02:01       1   143 151      9 VQLWVDSTP
    ## 373  HLA-A*02:01       1   154 162      9 GTRVRAMAI
    ## 374  HLA-B*35:01       1    30  38      9 NVLSPLPSQ
    ## 375  HLA-B*35:01       1    56  64      9 EDPGPDEAP
    ## 376  HLA-B*35:01       1   135 143      9 CQLAKTCPV
    ## 377  HLA-B*35:01       1   231 239      9 TIHYNYMCN
    ## 378  HLA-A*68:01       1    18  26      9 TFSDLWKLL
    ## 379  HLA-A*68:01       1   122 130      9 VTCTYSPAL
    ## 380  HLA-B*07:02       1   120 128      9 KSVTCTYSP
    ## 381  HLA-B*07:02       1   131 139      9 NKMFCQLAK
    ## 382  HLA-A*02:01       1    73  81      9 VAPAPAAPT
    ## 383  HLA-A*02:01       1   216 224      9 VVVPYEPPE
    ## 384  HLA-B*35:01       1    49  57      9 DIEQWFTED
    ## 385  HLA-B*35:01       1    99 107      9 SQKTYQGSY
    ## 386  HLA-B*35:01       1   198 206      9 EGNLRVEYL
    ## 387  HLA-B*35:01       1   241 249      9 SCMGGMNRR
    ## 388  HLA-A*68:01       1    81  89      9 TPAAPAPAP
    ## 389  HLA-A*68:01       1   237 245      9 MCNSSCMGG
    ## 390  HLA-B*07:02       1   126 134      9 YSPALNKMF
    ## 391  HLA-B*07:02       1   195 203      9 IRVEGNLRV
    ## 392  HLA-B*07:02       1   204 212      9 EYLDDRNTF
    ## 393  HLA-B*07:02       1   241 249      9 SCMGGMNRR
    ## 394  HLA-A*68:01       1   232 240      9 IHYNYMCNS
    ## 395  HLA-A*02:01       1   183 191      9 SDSDGLAPP
    ## 396  HLA-A*02:01       1   242 250      9 CMGGMNRRP
    ## 397  HLA-B*35:01       1    87  95      9 PAPSWPLSS
    ## 398  HLA-B*35:01       1   104 112      9 QGSYGFRLG
    ## 399  HLA-B*35:01       1   143 151      9 VQLWVDSTP
    ## 400  HLA-B*35:01       1   246 254      9 MNRRPILTI
    ## 401  HLA-A*68:01       1     3  11      9 EPQSDPSVE
    ## 402  HLA-B*07:02       1    77  85      9 PAAPTPAAP
    ## 403  HLA-B*07:02       1    96 104      9 SVPSQKTYQ
    ## 404  HLA-B*07:02       1   168 176      9 HMTEVVRRC
    ## 405  HLA-A*02:01       1    92 100      9 PLSSSVPSQ
    ## 406  HLA-A*02:01       1   111 119      9 LGFLHSGTA
    ## 407  HLA-B*35:01       1   184 192      9 DSDGLAPPQ
    ## 408  HLA-B*35:01       1   234 242      9 YNYMCNSSC
    ## 409  HLA-A*68:01       1   184 192      9 DSDGLAPPQ
    ## 410  HLA-B*07:02       1    40  48      9 MLDLMLSPD
    ## 411  HLA-B*07:02       1   117 125      9 GTAKSVTCT
    ## 412  HLA-A*02:01       1   114 122      9 LHSGTAKSV
    ## 413  HLA-B*35:01       1     5  13      9 QSDPSVEPP
    ## 414  HLA-B*35:01       1    15  23      9 SQETFSDLW
    ## 415  HLA-B*35:01       1    21  29      9 DLWKLLPEN
    ## 416  HLA-B*35:01       1    80  88      9 PTPAAPAPA
    ## 417  HLA-B*07:02       1    23  31      9 WKLLPENNV
    ## 418  HLA-A*68:01       1     5  13      9 QSDPSVEPP
    ## 419  HLA-A*68:01       1   183 191      9 SDSDGLAPP
    ## 420  HLA-A*02:01       1    35  43      9 LPSQAMLDL
    ## 421  HLA-A*02:01       1    66  74      9 MPEAAPPVA
    ## 422  HLA-A*02:01       1    75  83      9 PAPAAPTPA
    ## 423  HLA-A*02:01       1   198 206      9 EGNLRVEYL
    ## 424  HLA-B*35:01       1    50  58      9 IEQWFTEDP
    ## 425  HLA-A*68:01       1   233 241      9 HYNYMCNSS
    ## 426  HLA-B*07:02       1    36  44      9 PSQAMLDLM
    ## 427  HLA-B*07:02       1    54  62      9 FTEDPGPDE
    ## 428  HLA-B*07:02       1   225 233      9 VGSDCTTIH
    ## 429  HLA-A*68:01       1    72  80      9 PVAPAPAAP
    ## 430  HLA-A*02:01       1    30  38      9 NVLSPLPSQ
    ## 431  HLA-A*02:01       1   107 115      9 YGFRLGFLH
    ## 432  HLA-A*02:01       1   209 217      9 RNTFVHSVV
    ## 433  HLA-B*35:01       1    45  53      9 LSPDDIEQW
    ## 434  HLA-A*68:01       1   127 135      9 SPALNKMFC
    ## 435  HLA-A*68:01       1   163 171      9 YKQSQHMTE
    ## 436  HLA-A*68:01       1   198 206      9 EGNLRVEYL
    ## 437  HLA-B*07:02       1     8  16      9 PSVEPPLSQ
    ## 438  HLA-B*07:02       1   118 126      9 TAKSVTCTY
    ## 439  HLA-A*68:01       1    19  27      9 FSDLWKLLP
    ## 440  HLA-A*68:01       1   115 123      9 HSGTAKSVT
    ## 441  HLA-A*68:01       1   187 195      9 GLAPPQHLI
    ## 442  HLA-A*02:01       1    15  23      9 SQETFSDLW
    ## 443  HLA-B*35:01       1    54  62      9 FTEDPGPDE
    ## 444  HLA-B*35:01       1   120 128      9 KSVTCTYSP
    ## 445  HLA-B*35:01       1   128 136      9 PALNKMFCQ
    ## 446  HLA-B*35:01       1   178 186      9 HHERCSDSD
    ## 447  HLA-B*35:01       1   217 225      9 VVPYEPPEV
    ## 448  HLA-A*68:01       1   132 140      9 KMFCQLAKT
    ## 449  HLA-A*68:01       1   205 213      9 YLDDRNTFV
    ## 450  HLA-A*02:01       1    20  28      9 SDLWKLLPE
    ## 451  HLA-A*02:01       1    91  99      9 WPLSSSVPS
    ## 452  HLA-A*02:01       1   156 164      9 RVRAMAIYK
    ## 453  HLA-B*35:01       1    39  47      9 AMLDLMLSP
    ## 454  HLA-B*35:01       1   159 167      9 AMAIYKQSQ
    ## 455  HLA-B*35:01       1   168 176      9 HMTEVVRRC
    ## 456  HLA-B*35:01       1   186 194      9 DGLAPPQHL
    ## 457  HLA-B*07:02       1    69  77      9 AAPPVAPAP
    ## 458  HLA-B*07:02       1   130 138      9 LNKMFCQLA
    ## 459  HLA-B*07:02       1   167 175      9 QHMTEVVRR
    ## 460  HLA-B*07:02       1   174 182      9 RRCPHHERC
    ## 461  HLA-B*07:02       1   178 186      9 HHERCSDSD
    ## 462  HLA-B*07:02       1   180 188      9 ERCSDSDGL
    ## 463  HLA-B*07:02       1   198 206      9 EGNLRVEYL
    ## 464  HLA-A*68:01       1   209 217      9 RNTFVHSVV
    ## 465  HLA-A*02:01       1    69  77      9 AAPPVAPAP
    ## 466  HLA-A*02:01       1   117 125      9 GTAKSVTCT
    ## 467  HLA-A*02:01       1   232 240      9 IHYNYMCNS
    ## 468  HLA-A*68:01       1    51  59      9 EQWFTEDPG
    ## 469  HLA-A*68:01       1   139 147      9 KTCPVQLWV
    ## 470  HLA-A*68:01       1   197 205      9 VEGNLRVEY
    ## 471  HLA-B*07:02       1   109 117      9 FRLGFLHSG
    ## 472  HLA-B*07:02       1   112 120      9 GFLHSGTAK
    ## 473  HLA-B*07:02       1   215 223      9 SVVVPYEPP
    ## 474  HLA-B*07:02       1   216 224      9 VVVPYEPPE
    ## 475  HLA-A*68:01       1    21  29      9 DLWKLLPEN
    ## 476  HLA-A*68:01       1    99 107      9 SQKTYQGSY
    ## 477  HLA-A*68:01       1   149 157      9 STPPPGTRV
    ## 478  HLA-A*68:01       1   238 246      9 CNSSCMGGM
    ## 479  HLA-A*02:01       1    27  35      9 PENNVLSPL
    ## 480  HLA-A*02:01       1    34  42      9 PLPSQAMLD
    ## 481  HLA-A*02:01       1    59  67      9 GPDEAPWMP
    ## 482  HLA-A*02:01       1   105 113      9 GSYGFRLGF
    ## 483  HLA-B*35:01       1    20  28      9 SDLWKLLPE
    ## 484  HLA-B*35:01       1    61  69      9 DEAPWMPEA
    ## 485  HLA-B*35:01       1    89  97      9 PSWPLSSSV
    ## 486  HLA-B*35:01       1   193 201      9 HLIRVEGNL
    ## 487  HLA-B*35:01       1   196 204      9 RVEGNLRVE
    ## 488  HLA-A*68:01       1    94 102      9 SSSVPSQKT
    ## 489  HLA-A*68:01       1   120 128      9 KSVTCTYSP
    ## 490  HLA-B*07:02       1   206 214      9 LDDRNTFVH
    ## 491  HLA-B*07:02       1   217 225      9 VVPYEPPEV
    ## 492  HLA-A*68:01       1   202 210      9 RVEYLDDRN
    ## 493  HLA-A*02:01       1   226 234      9 GSDCTTIHY
    ## 494  HLA-B*35:01       1    67  75      9 PEAAPPVAP
    ## 495  HLA-B*35:01       1   116 124      9 SGTAKSVTC
    ## 496  HLA-B*35:01       1   156 164      9 RVRAMAIYK
    ## 497  HLA-A*68:01       1    31  39      9 VLSPLPSQA
    ## 498  HLA-A*68:01       1    82  90      9 PAAPAPAPS
    ## 499  HLA-A*68:01       1   146 154      9 WVDSTPPPG
    ## 500  HLA-B*07:02       1    64  72      9 PWMPEAAPP
    ## 501  HLA-B*07:02       1   136 144      9 QLAKTCPVQ
    ## 502  HLA-B*07:02       1   155 163      9 TRVRAMAIY
    ## 503  HLA-B*07:02       1   179 187      9 HERCSDSDG
    ## 504  HLA-B*07:02       1   188 196      9 LAPPQHLIR
    ## 505  HLA-B*07:02       1   245 253      9 GMNRRPILT
    ## 506  HLA-A*68:01       1    25  33      9 LLPENNVLS
    ## 507  HLA-A*02:01       1    36  44      9 PSQAMLDLM
    ## 508  HLA-A*02:01       1    45  53      9 LSPDDIEQW
    ## 509  HLA-A*02:01       1    55  63      9 TEDPGPDEA
    ## 510  HLA-A*02:01       1   159 167      9 AMAIYKQSQ
    ## 511  HLA-A*02:01       1   214 222      9 HSVVVPYEP
    ## 512  HLA-A*02:01       1   248 256      9 RRPILTIIT
    ## 513  HLA-B*35:01       1    52  60      9 QWFTEDPGP
    ## 514  HLA-A*68:01       1   137 145      9 LAKTCPVQL
    ## 515  HLA-A*68:01       1   165 173      9 QSQHMTEVV
    ## 516  HLA-B*07:02       1   108 116      9 GFRLGFLHS
    ## 517  HLA-B*07:02       1   124 132      9 CTYSPALNK
    ## 518  HLA-A*68:01       1    73  81      9 VAPAPAAPT
    ## 519  HLA-A*68:01       1    77  85      9 PAAPTPAAP
    ## 520  HLA-B*35:01       1   112 120      9 GFLHSGTAK
    ## 521  HLA-A*68:01       1    29  37      9 NNVLSPLPS
    ## 522  HLA-A*68:01       1    40  48      9 MLDLMLSPD
    ## 523  HLA-A*68:01       1   168 176      9 HMTEVVRRC
    ## 524  HLA-B*07:02       1    92 100      9 PLSSSVPSQ
    ## 525  HLA-B*07:02       1   104 112      9 QGSYGFRLG
    ## 526  HLA-B*07:02       1   166 174      9 SQHMTEVVR
    ## 527  HLA-B*07:02       1   185 193      9 SDGLAPPQH
    ## 528  HLA-A*68:01       1    56  64      9 EDPGPDEAP
    ## 529  HLA-A*68:01       1    61  69      9 DEAPWMPEA
    ## 530  HLA-A*68:01       1   100 108      9 QKTYQGSYG
    ## 531  HLA-A*02:01       1    62  70      9 EAPWMPEAA
    ## 532  HLA-A*02:01       1    83  91      9 AAPAPAPSW
    ## 533  HLA-A*02:01       1   158 166      9 RAMAIYKQS
    ## 534  HLA-A*02:01       1   246 254      9 MNRRPILTI
    ## 535  HLA-B*35:01       1   130 138      9 LNKMFCQLA
    ## 536  HLA-B*35:01       1   185 193      9 SDGLAPPQH
    ## 537  HLA-A*68:01       1    50  58      9 IEQWFTEDP
    ## 538  HLA-A*68:01       1   130 138      9 LNKMFCQLA
    ## 539  HLA-A*68:01       1   172 180      9 VVRRCPHHE
    ## 540  HLA-A*68:01       1   196 204      9 RVEGNLRVE
    ## 541  HLA-B*07:02       1    44  52      9 MLSPDDIEQ
    ## 542  HLA-B*07:02       1   107 115      9 YGFRLGFLH
    ## 543  HLA-B*07:02       1   132 140      9 KMFCQLAKT
    ## 544  HLA-B*07:02       1   146 154      9 WVDSTPPPG
    ## 545  HLA-B*07:02       1   162 170      9 IYKQSQHMT
    ## 546  HLA-A*68:01       1    45  53      9 LSPDDIEQW
    ## 547  HLA-A*02:01       1    86  94      9 APAPSWPLS
    ## 548  HLA-A*02:01       1   124 132      9 CTYSPALNK
    ## 549  HLA-A*02:01       1   125 133      9 TYSPALNKM
    ## 550  HLA-A*02:01       1   126 134      9 YSPALNKMF
    ## 551  HLA-A*02:01       1   237 245      9 MCNSSCMGG
    ## 552  HLA-A*02:01       1   241 249      9 SCMGGMNRR
    ## 553  HLA-B*35:01       1    28  36      9 ENNVLSPLP
    ## 554  HLA-B*35:01       1   163 171      9 YKQSQHMTE
    ## 555  HLA-A*68:01       1    49  57      9 DIEQWFTED
    ## 556  HLA-A*68:01       1    69  77      9 AAPPVAPAP
    ## 557  HLA-B*07:02       1     7  15      9 DPSVEPPLS
    ## 558  HLA-B*07:02       1   142 150      9 PVQLWVDST
    ## 559  HLA-B*07:02       1   143 151      9 VQLWVDSTP
    ## 560  HLA-B*07:02       1   163 171      9 YKQSQHMTE
    ## 561  HLA-B*07:02       1   186 194      9 DGLAPPQHL
    ## 562  HLA-B*07:02       1   202 210      9 RVEYLDDRN
    ## 563  HLA-B*07:02       1   233 241      9 HYNYMCNSS
    ## 564  HLA-A*68:01       1    42  50      9 DLMLSPDDI
    ## 565  HLA-A*02:01       1    51  59      9 EQWFTEDPG
    ## 566  HLA-A*02:01       1   130 138      9 LNKMFCQLA
    ## 567  HLA-B*35:01       1   208 216      9 DRNTFVHSV
    ## 568  HLA-A*68:01       1    14  22      9 LSQETFSDL
    ## 569  HLA-A*68:01       1   159 167      9 AMAIYKQSQ
    ## 570  HLA-B*07:02       1    38  46      9 QAMLDLMLS
    ## 571  HLA-B*07:02       1    93 101      9 LSSSVPSQK
    ## 572  HLA-B*07:02       1   239 247      9 NSSCMGGMN
    ## 573  HLA-A*02:01       1    46  54      9 SPDDIEQWF
    ## 574  HLA-A*02:01       1   215 223      9 SVVVPYEPP
    ## 575  HLA-B*35:01       1   140 148      9 TCPVQLWVD
    ## 576  HLA-B*35:01       1   179 187      9 HERCSDSDG
    ## 577  HLA-A*68:01       1   133 141      9 MFCQLAKTC
    ## 578  HLA-B*07:02       1     2  10      9 EEPQSDPSV
    ## 579  HLA-B*07:02       1    42  50      9 DLMLSPDDI
    ## 580  HLA-B*07:02       1   100 108      9 QKTYQGSYG
    ## 581  HLA-B*07:02       1   197 205      9 VEGNLRVEY
    ## 582  HLA-B*07:02       1   240 248      9 SSCMGGMNR
    ## 583  HLA-A*68:01       1    20  28      9 SDLWKLLPE
    ## 584  HLA-A*68:01       1   225 233      9 VGSDCTTIH
    ## 585  HLA-A*02:01       1    10  18      9 VEPPLSQET
    ## 586  HLA-A*02:01       1    32  40      9 LSPLPSQAM
    ## 587  HLA-A*02:01       1    70  78      9 APPVAPAPA
    ## 588  HLA-A*02:01       1   142 150      9 PVQLWVDST
    ## 589  HLA-A*02:01       1   166 174      9 SQHMTEVVR
    ## 590  HLA-A*02:01       1   250 258      9 PILTIITLE
    ## 591  HLA-B*35:01       1     9  17      9 SVEPPLSQE
    ## 592  HLA-B*35:01       1    94 102      9 SSSVPSQKT
    ## 593  HLA-B*35:01       1   181 189      9 RCSDSDGLA
    ## 594  HLA-B*35:01       1   202 210      9 RVEYLDDRN
    ## 595  HLA-B*35:01       1   205 213      9 YLDDRNTFV
    ## 596  HLA-B*35:01       1   220 228      9 YEPPEVGSD
    ## 597  HLA-A*68:01       1   144 152      9 QLWVDSTPP
    ## 598  HLA-A*68:01       1   161 169      9 AIYKQSQHM
    ## 599  HLA-B*07:02       1    20  28      9 SDLWKLLPE
    ## 600  HLA-B*07:02       1    95 103      9 SSVPSQKTY
    ## 601  HLA-B*07:02       1   182 190      9 CSDSDGLAP
    ## 602  HLA-A*68:01       1    52  60      9 QWFTEDPGP
    ## 603  HLA-A*68:01       1   104 112      9 QGSYGFRLG
    ## 604  HLA-A*02:01       1     5  13      9 QSDPSVEPP
    ## 605  HLA-A*02:01       1   235 243      9 NYMCNSSCM
    ## 606  HLA-A*02:01       1   238 246      9 CNSSCMGGM
    ## 607  HLA-B*35:01       1    24  32      9 KLLPENNVL
    ## 608  HLA-B*35:01       1    42  50      9 DLMLSPDDI
    ## 609  HLA-B*35:01       1   148 156      9 DSTPPPGTR
    ## 610  HLA-B*35:01       1   166 174      9 SQHMTEVVR
    ## 611  HLA-A*68:01       1    37  45      9 SQAMLDLML
    ## 612  HLA-A*68:01       1    78  86      9 AAPTPAAPA
    ## 613  HLA-A*68:01       1   249 257      9 RPILTIITL
    ## 614  HLA-B*07:02       1    10  18      9 VEPPLSQET
    ## 615  HLA-B*07:02       1   148 156      9 DSTPPPGTR
    ## 616  HLA-B*07:02       1   242 250      9 CMGGMNRRP
    ## 617  HLA-A*68:01       1    46  54      9 SPDDIEQWF
    ## 618  HLA-A*68:01       1   206 214      9 LDDRNTFVH
    ## 619  HLA-A*02:01       1     2  10      9 EEPQSDPSV
    ## 620  HLA-B*35:01       1    13  21      9 PLSQETFSD
    ## 621  HLA-B*35:01       1    27  35      9 PENNVLSPL
    ## 622  HLA-B*35:01       1   170 178      9 TEVVRRCPH
    ## 623  HLA-B*35:01       1   194 202      9 LIRVEGNLR
    ## 624  HLA-B*35:01       1   242 250      9 CMGGMNRRP
    ## 625  HLA-B*35:01       1   247 255      9 NRRPILTII
    ## 626  HLA-B*07:02       1    60  68      9 PDEAPWMPE
    ## 627  HLA-B*07:02       1   171 179      9 EVVRRCPHH
    ## 628  HLA-A*68:01       1    91  99      9 WPLSSSVPS
    ## 629  HLA-A*68:01       1   129 137      9 ALNKMFCQL
    ## 630  HLA-A*68:01       1   157 165      9 VRAMAIYKQ
    ## 631  HLA-A*02:01       1    52  60      9 QWFTEDPGP
    ## 632  HLA-A*02:01       1    72  80      9 PVAPAPAAP
    ## 633  HLA-A*02:01       1   118 126      9 TAKSVTCTY
    ## 634  HLA-A*02:01       1   213 221      9 VHSVVVPYE
    ## 635  HLA-A*02:01       1   247 255      9 NRRPILTII
    ## 636  HLA-B*35:01       1    55  63      9 TEDPGPDEA
    ## 637  HLA-B*35:01       1   132 140      9 KMFCQLAKT
    ## 638  HLA-B*35:01       1   169 177      9 MTEVVRRCP
    ## 639  HLA-A*68:01       1     7  15      9 DPSVEPPLS
    ## 640  HLA-A*68:01       1    84  92      9 APAPAPSWP
    ## 641  HLA-A*02:01       1    43  51      9 LMLSPDDIE
    ## 642  HLA-A*02:01       1    64  72      9 PWMPEAAPP
    ## 643  HLA-A*02:01       1    82  90      9 PAAPAPAPS
    ## 644  HLA-A*02:01       1   186 194      9 DGLAPPQHL
    ## 645  HLA-B*35:01       1    23  31      9 WKLLPENNV
    ## 646  HLA-B*35:01       1    31  39      9 VLSPLPSQA
    ## 647  HLA-B*07:02       1    17  25      9 ETFSDLWKL
    ## 648  HLA-B*07:02       1    29  37      9 NNVLSPLPS
    ## 649  HLA-B*07:02       1    43  51      9 LMLSPDDIE
    ## 650  HLA-B*07:02       1   191 199      9 PQHLIRVEG
    ## 651  HLA-A*68:01       1    33  41      9 SPLPSQAML
    ## 652  HLA-A*68:01       1   154 162      9 GTRVRAMAI
    ## 653  HLA-A*02:01       1   160 168      9 MAIYKQSQH
    ## 654  HLA-A*02:01       1   181 189      9 RCSDSDGLA
    ## 655  HLA-A*02:01       1   227 235      9 SDCTTIHYN
    ## 656  HLA-A*02:01       1   243 251      9 MGGMNRRPI
    ## 657  HLA-B*35:01       1   227 235      9 SDCTTIHYN
    ## 658  HLA-A*68:01       1    74  82      9 APAPAAPTP
    ## 659  HLA-A*68:01       1   145 153      9 LWVDSTPPP
    ## 660  HLA-B*07:02       1   116 124      9 SGTAKSVTC
    ## 661  HLA-B*07:02       1   133 141      9 MFCQLAKTC
    ## 662  HLA-B*07:02       1   183 191      9 SDSDGLAPP
    ## 663  HLA-A*68:01       1   143 151      9 VQLWVDSTP
    ## 664  HLA-A*02:01       1    53  61      9 WFTEDPGPD
    ## 665  HLA-A*02:01       1   119 127      9 AKSVTCTYS
    ## 666  HLA-A*02:01       1   131 139      9 NKMFCQLAK
    ## 667  HLA-A*02:01       1   133 141      9 MFCQLAKTC
    ## 668  HLA-A*02:01       1   211 219      9 TFVHSVVVP
    ## 669  HLA-B*35:01       1   180 188      9 ERCSDSDGL
    ## 670  HLA-A*68:01       1     1   9      9 MEEPQSDPS
    ## 671  HLA-A*68:01       1    86  94      9 APAPSWPLS
    ## 672  HLA-A*68:01       1   128 136      9 PALNKMFCQ
    ## 673  HLA-A*02:01       1    29  37      9 NNVLSPLPS
    ## 674  HLA-A*02:01       1    74  82      9 APAPAAPTP
    ## 675  HLA-B*35:01       1   136 144      9 QLAKTCPVQ
    ## 676  HLA-B*07:02       1    87  95      9 PAPSWPLSS
    ## 677  HLA-B*07:02       1   220 228      9 YEPPEVGSD
    ## 678  HLA-A*68:01       1   109 117      9 FRLGFLHSG
    ## 679  HLA-A*02:01       1    58  66      9 PGPDEAPWM
    ## 680  HLA-A*02:01       1    63  71      9 APWMPEAAP
    ## 681  HLA-A*02:01       1    87  95      9 PAPSWPLSS
    ## 682  HLA-A*02:01       1   127 135      9 SPALNKMFC
    ## 683  HLA-B*35:01       1    90  98      9 SWPLSSSVP
    ## 684  HLA-A*68:01       1    66  74      9 MPEAAPPVA
    ## 685  HLA-B*07:02       1    67  75      9 PEAAPPVAP
    ## 686  HLA-A*68:01       1    36  44      9 PSQAMLDLM
    ## 687  HLA-A*68:01       1   217 225      9 VVPYEPPEV
    ## 688  HLA-A*02:01       1    47  55      9 PDDIEQWFT
    ## 689  HLA-A*02:01       1    50  58      9 IEQWFTEDP
    ## 690  HLA-A*02:01       1    84  92      9 APAPAPSWP
    ## 691  HLA-A*02:01       1    88  96      9 APSWPLSSS
    ## 692  HLA-B*35:01       1     4  12      9 PQSDPSVEP
    ## 693  HLA-B*35:01       1    60  68      9 PDEAPWMPE
    ## 694  HLA-B*35:01       1   147 155      9 VDSTPPPGT
    ## 695  HLA-B*35:01       1   230 238      9 TTIHYNYMC
    ## 696  HLA-A*68:01       1    39  47      9 AMLDLMLSP
    ## 697  HLA-A*68:01       1    80  88      9 PTPAAPAPA
    ## 698  HLA-A*68:01       1   141 149      9 CPVQLWVDS
    ## 699  HLA-B*07:02       1   128 136      9 PALNKMFCQ
    ## 700  HLA-A*68:01       1    15  23      9 SQETFSDLW
    ## 701  HLA-A*68:01       1   111 119      9 LGFLHSGTA
    ## 702  HLA-A*02:01       1   225 233      9 VGSDCTTIH
    ## 703  HLA-B*35:01       1   154 162      9 GTRVRAMAI
    ## 704  HLA-A*68:01       1   110 118      9 RLGFLHSGT
    ## 705  HLA-A*68:01       1    92 100      9 PLSSSVPSQ
    ## 706  HLA-A*68:01       1   179 187      9 HERCSDSDG
    ## 707  HLA-A*68:01       1   246 254      9 MNRRPILTI
    ## 708  HLA-A*02:01       1    41  49      9 LDLMLSPDD
    ## 709  HLA-A*02:01       1    97 105      9 VPSQKTYQG
    ## 710  HLA-A*02:01       1   157 165      9 VRAMAIYKQ
    ## 711  HLA-A*02:01       1   233 241      9 HYNYMCNSS
    ## 712  HLA-B*35:01       1     2  10      9 EEPQSDPSV
    ## 713  HLA-B*35:01       1   167 175      9 QHMTEVVRR
    ## 714  HLA-B*35:01       1   172 180      9 VVRRCPHHE
    ## 715  HLA-A*68:01       1    97 105      9 VPSQKTYQG
    ## 716  HLA-A*02:01       1    93 101      9 LSSSVPSQK
    ## 717  HLA-A*02:01       1   108 116      9 GFRLGFLHS
    ## 718  HLA-A*02:01       1   138 146      9 AKTCPVQLW
    ## 719  HLA-A*02:01       1   182 190      9 CSDSDGLAP
    ## 720  HLA-A*02:01       1   200 208      9 NLRVEYLDD
    ## 721  HLA-B*35:01       1     8  16      9 PSVEPPLSQ
    ## 722  HLA-B*35:01       1   138 146      9 AKTCPVQLW
    ## 723  HLA-A*68:01       1    32  40      9 LSPLPSQAM
    ## 724  HLA-A*68:01       1    65  73      9 WMPEAAPPV
    ## 725  HLA-A*68:01       1   199 207      9 GNLRVEYLD
    ## 726  HLA-A*68:01       1   221 229      9 EPPEVGSDC
    ## 727  HLA-A*68:01       1   245 253      9 GMNRRPILT
    ## 728  HLA-B*07:02       1   157 165      9 VRAMAIYKQ
    ## 729  HLA-A*68:01       1   218 226      9 VPYEPPEVG
    ## 730  HLA-A*02:01       1   199 207      9 GNLRVEYLD
    ## 731  HLA-B*35:01       1    96 104      9 SVPSQKTYQ
    ## 732  HLA-B*35:01       1   157 165      9 VRAMAIYKQ
    ## 733  HLA-B*35:01       1   164 172      9 KQSQHMTEV
    ## 734  HLA-A*68:01       1   162 170      9 IYKQSQHMT
    ## 735  HLA-A*68:01       1   182 190      9 CSDSDGLAP
    ## 736  HLA-B*07:02       1    15  23      9 SQETFSDLW
    ## 737  HLA-B*07:02       1   144 152      9 QLWVDSTPP
    ## 738  HLA-B*07:02       1   177 185      9 PHHERCSDS
    ## 739  HLA-B*07:02       1   208 216      9 DRNTFVHSV
    ## 740  HLA-A*68:01       1    88  96      9 APSWPLSSS
    ## 741  HLA-A*68:01       1   103 111      9 YQGSYGFRL
    ## 742  HLA-A*02:01       1   128 136      9 PALNKMFCQ
    ## 743  HLA-A*02:01       1   206 214      9 LDDRNTFVH
    ## 744  HLA-A*02:01       1   218 226      9 VPYEPPEVG
    ## 745  HLA-A*68:01       1   208 216      9 DRNTFVHSV
    ## 746  HLA-B*07:02       1    41  49      9 LDLMLSPDD
    ## 747  HLA-B*07:02       1   175 183      9 RCPHHERCS
    ## 748  HLA-A*68:01       1     6  14      9 SDPSVEPPL
    ## 749  HLA-A*68:01       1   106 114      9 SYGFRLGFL
    ## 750  HLA-A*68:01       1   207 215      9 DDRNTFVHS
    ## 751  HLA-A*02:01       1   167 175      9 QHMTEVVRR
    ## 752  HLA-A*02:01       1   201 209      9 LRVEYLDDR
    ## 753  HLA-B*35:01       1    47  55      9 PDDIEQWFT
    ## 754  HLA-B*35:01       1   117 125      9 GTAKSVTCT
    ## 755  HLA-B*35:01       1   245 253      9 GMNRRPILT
    ## 756  HLA-B*35:01       1   250 258      9 PILTIITLE
    ## 757  HLA-A*68:01       1    83  91      9 AAPAPAPSW
    ## 758  HLA-B*07:02       1     4  12      9 PQSDPSVEP
    ## 759  HLA-B*07:02       1    25  33      9 LLPENNVLS
    ## 760  HLA-B*07:02       1    90  98      9 SWPLSSSVP
    ## 761  HLA-B*07:02       1   119 127      9 AKSVTCTYS
    ## 762  HLA-B*07:02       1   134 142      9 FCQLAKTCP
    ## 763  HLA-B*07:02       1   147 155      9 VDSTPPPGT
    ## 764  HLA-B*07:02       1   203 211      9 VEYLDDRNT
    ## 765  HLA-B*07:02       1   226 234      9 GSDCTTIHY
    ## 766  HLA-A*68:01       1   119 127      9 AKSVTCTYS
    ## 767  HLA-A*02:01       1     4  12      9 PQSDPSVEP
    ## 768  HLA-A*02:01       1    26  34      9 LPENNVLSP
    ## 769  HLA-A*02:01       1    71  79      9 PPVAPAPAA
    ## 770  HLA-A*02:01       1    96 104      9 SVPSQKTYQ
    ## 771  HLA-A*02:01       1   194 202      9 LIRVEGNLR
    ## 772  HLA-A*02:01       1   231 239      9 TIHYNYMCN
    ## 773  HLA-A*02:01       1   240 248      9 SSCMGGMNR
    ## 774  HLA-B*35:01       1   195 203      9 IRVEGNLRV
    ## 775  HLA-B*35:01       1   199 207      9 GNLRVEYLD
    ## 776  HLA-A*68:01       1   192 200      9 QHLIRVEGN
    ## 777  HLA-A*68:01       1   242 250      9 CMGGMNRRP
    ## 778  HLA-B*07:02       1     1   9      9 MEEPQSDPS
    ## 779  HLA-B*07:02       1    13  21      9 PLSQETFSD
    ## 780  HLA-B*07:02       1    55  63      9 TEDPGPDEA
    ## 781  HLA-B*07:02       1   102 110      9 TYQGSYGFR
    ## 782  HLA-A*02:01       1    77  85      9 PAAPTPAAP
    ## 783  HLA-A*02:01       1   134 142      9 FCQLAKTCP
    ## 784  HLA-A*02:01       1   191 199      9 PQHLIRVEG
    ## 785  HLA-A*68:01       1    90  98      9 SWPLSSSVP
    ## 786  HLA-A*68:01       1   116 124      9 SGTAKSVTC
    ## 787  HLA-B*07:02       1    61  69      9 DEAPWMPEA
    ## 788  HLA-B*07:02       1   145 153      9 LWVDSTPPP
    ## 789  HLA-A*68:01       1    79  87      9 APTPAAPAP
    ## 790  HLA-A*02:01       1    79  87      9 APTPAAPAP
    ## 791  HLA-A*02:01       1   220 228      9 YEPPEVGSD
    ## 792  HLA-B*35:01       1   114 122      9 LHSGTAKSV
    ## 793  HLA-B*35:01       1   124 132      9 CTYSPALNK
    ## 794  HLA-A*68:01       1   185 193      9 SDGLAPPQH
    ## 795  HLA-B*07:02       1    21  29      9 DLWKLLPEN
    ## 796  HLA-B*07:02       1    28  36      9 ENNVLSPLP
    ## 797  HLA-B*07:02       1   192 200      9 QHLIRVEGN
    ## 798  HLA-A*68:01       1    76  84      9 APAAPTPAA
    ## 799  HLA-A*02:01       1     1   9      9 MEEPQSDPS
    ## 800  HLA-A*02:01       1   140 148      9 TCPVQLWVD
    ## 801  HLA-B*35:01       1   142 150      9 PVQLWVDST
    ## 802  HLA-B*35:01       1   200 208      9 NLRVEYLDD
    ## 803  HLA-B*35:01       1   209 217      9 RNTFVHSVV
    ## 804  HLA-B*35:01       1   248 256      9 RRPILTIIT
    ## 805  HLA-A*68:01       1     2  10      9 EEPQSDPSV
    ## 806  HLA-A*68:01       1    57  65      9 DPGPDEAPW
    ## 807  HLA-A*68:01       1    89  97      9 PSWPLSSSV
    ## 808  HLA-A*68:01       1   180 188      9 ERCSDSDGL
    ## 809  HLA-B*07:02       1    58  66      9 PGPDEAPWM
    ## 810  HLA-B*07:02       1   214 222      9 HSVVVPYEP
    ## 811  HLA-A*68:01       1   135 143      9 CQLAKTCPV
    ## 812  HLA-A*02:01       1     9  17      9 SVEPPLSQE
    ## 813  HLA-A*02:01       1   116 124      9 SGTAKSVTC
    ## 814  HLA-A*02:01       1   180 188      9 ERCSDSDGL
    ## 815  HLA-A*02:01       1   192 200      9 QHLIRVEGN
    ## 816  HLA-A*02:01       1   203 211      9 VEYLDDRNT
    ## 817  HLA-B*35:01       1   207 215      9 DDRNTFVHS
    ## 818  HLA-B*07:02       1   207 215      9 DDRNTFVHS
    ## 819  HLA-B*07:02       1   230 238      9 TTIHYNYMC
    ## 820  HLA-A*68:01       1    35  43      9 LPSQAMLDL
    ## 821  HLA-A*68:01       1    85  93      9 PAPAPSWPL
    ## 822  HLA-A*02:01       1    49  57      9 DIEQWFTED
    ## 823  HLA-A*02:01       1    54  62      9 FTEDPGPDE
    ## 824  HLA-A*02:01       1    81  89      9 TPAAPAPAP
    ## 825  HLA-A*02:01       1   147 155      9 VDSTPPPGT
    ## 826  HLA-A*02:01       1   172 180      9 VVRRCPHHE
    ## 827  HLA-B*35:01       1    10  18      9 VEPPLSQET
    ## 828  HLA-B*07:02       1    45  53      9 LSPDDIEQW
    ## 829  HLA-B*07:02       1   200 208      9 NLRVEYLDD
    ## 830  HLA-B*07:02       1   237 245      9 MCNSSCMGG
    ## 831  HLA-A*02:01       1    11  19      9 EPPLSQETF
    ## 832  HLA-A*02:01       1   184 192      9 DSDGLAPPQ
    ## 833  HLA-A*02:01       1   188 196      9 LAPPQHLIR
    ## 834  HLA-A*02:01       1   204 212      9 EYLDDRNTF
    ## 835  HLA-A*68:01       1    26  34      9 LPENNVLSP
    ## 836  HLA-B*07:02       1    98 106      9 PSQKTYQGS
    ## 837  HLA-B*07:02       1   219 227      9 PYEPPEVGS
    ## 838  HLA-A*68:01       1     8  16      9 PSVEPPLSQ
    ## 839  HLA-A*68:01       1   134 142      9 FCQLAKTCP
    ## 840  HLA-A*02:01       1   197 205      9 VEGNLRVEY
    ## 841  HLA-B*35:01       1   108 116      9 GFRLGFLHS
    ## 842  HLA-B*35:01       1   219 227      9 PYEPPEVGS
    ## 843  HLA-A*68:01       1    60  68      9 PDEAPWMPE
    ## 844  HLA-B*07:02       1    22  30      9 LWKLLPENN
    ## 845  HLA-B*07:02       1   223 231      9 PEVGSDCTT
    ## 846  HLA-B*07:02       1   227 235      9 SDCTTIHYN
    ## 847  HLA-B*07:02       1   231 239      9 TIHYNYMCN
    ## 848  HLA-A*68:01       1    63  71      9 APWMPEAAP
    ## 849  HLA-A*02:01       1    99 107      9 SQKTYQGSY
    ## 850  HLA-A*02:01       1   102 110      9 TYQGSYGFR
    ## 851  HLA-A*02:01       1   163 171      9 YKQSQHMTE
    ## 852  HLA-B*35:01       1   223 231      9 PEVGSDCTT
    ## 853  HLA-A*68:01       1    55  63      9 TEDPGPDEA
    ## 854  HLA-B*07:02       1   184 192      9 DSDGLAPPQ
    ## 855  HLA-B*35:01       1    92 100      9 PLSSSVPSQ
    ## 856  HLA-B*35:01       1   240 248      9 SSCMGGMNR
    ## 857  HLA-A*68:01       1    75  83      9 PAPAAPTPA
    ## 858  HLA-A*68:01       1   142 150      9 PVQLWVDST
    ## 859  HLA-B*07:02       1    49  57      9 DIEQWFTED
    ## 860  HLA-B*07:02       1    56  64      9 EDPGPDEAP
    ## 861  HLA-A*68:01       1   176 184      9 CPHHERCSD
    ## 862  HLA-A*02:01       1    94 102      9 SSSVPSQKT
    ## 863  HLA-A*02:01       1   162 170      9 IYKQSQHMT
    ## 864  HLA-A*02:01       1   169 177      9 MTEVVRRCP
    ## 865  HLA-B*35:01       1   213 221      9 VHSVVVPYE
    ## 866  HLA-A*68:01       1   181 189      9 RCSDSDGLA
    ## 867  HLA-A*68:01       1   243 251      9 MGGMNRRPI
    ## 868  HLA-B*07:02       1    19  27      9 FSDLWKLLP
    ## 869  HLA-B*07:02       1   232 240      9 IHYNYMCNS
    ## 870  HLA-B*07:02       1   236 244      9 YMCNSSCMG
    ## 871  HLA-A*68:01       1    13  21      9 PLSQETFSD
    ## 872  HLA-A*68:01       1    34  42      9 PLPSQAMLD
    ## 873  HLA-A*02:01       1    48  56      9 DDIEQWFTE
    ## 874  HLA-A*02:01       1   104 112      9 QGSYGFRLG
    ## 875  HLA-A*02:01       1   171 179      9 EVVRRCPHH
    ## 876  HLA-B*35:01       1   149 157      9 STPPPGTRV
    ## 877  HLA-B*35:01       1   175 183      9 RCPHHERCS
    ## 878  HLA-B*35:01       1   187 195      9 GLAPPQHLI
    ## 879  HLA-A*68:01       1    53  61      9 WFTEDPGPD
    ## 880  HLA-A*68:01       1   247 255      9 NRRPILTII
    ## 881  HLA-B*07:02       1   123 131      9 TCTYSPALN
    ## 882  HLA-B*07:02       1   228 236      9 DCTTIHYNY
    ## 883  HLA-A*68:01       1    24  32      9 KLLPENNVL
    ## 884  HLA-A*68:01       1   223 231      9 PEVGSDCTT
    ## 885  HLA-A*02:01       1    22  30      9 LWKLLPENN
    ## 886  HLA-A*02:01       1   141 149      9 CPVQLWVDS
    ## 887  HLA-B*35:01       1   162 170      9 IYKQSQHMT
    ## 888  HLA-B*35:01       1   232 240      9 IHYNYMCNS
    ## 889  HLA-A*68:01       1    22  30      9 LWKLLPENN
    ## 890  HLA-B*07:02       1    53  61      9 WFTEDPGPD
    ## 891  HLA-A*68:01       1     4  12      9 PQSDPSVEP
    ## 892  HLA-A*68:01       1   114 122      9 LHSGTAKSV
    ## 893  HLA-A*68:01       1   191 199      9 PQHLIRVEG
    ## 894  HLA-A*02:01       1     8  16      9 PSVEPPLSQ
    ## 895  HLA-A*02:01       1    12  20      9 PPLSQETFS
    ## 896  HLA-A*02:01       1    95 103      9 SSVPSQKTY
    ## 897  HLA-A*02:01       1   196 204      9 RVEGNLRVE
    ## 898  HLA-B*35:01       1    16  24      9 QETFSDLWK
    ## 899  HLA-B*35:01       1    22  30      9 LWKLLPENN
    ## 900  HLA-A*68:01       1   138 146      9 AKTCPVQLW
    ## 901  HLA-A*68:01       1    64  72      9 PWMPEAAPP
    ## 902  HLA-A*68:01       1    67  75      9 PEAAPPVAP
    ## 903  HLA-A*68:01       1   147 155      9 VDSTPPPGT
    ## 904  HLA-A*68:01       1   200 208      9 NLRVEYLDD
    ## 905  HLA-B*35:01       1   192 200      9 QHLIRVEGN
    ## 906  HLA-A*68:01       1    59  67      9 GPDEAPWMP
    ## 907  HLA-B*07:02       1     5  13      9 QSDPSVEPP
    ## 908  HLA-B*07:02       1   211 219      9 TFVHSVVVP
    ## 909  HLA-A*68:01       1    27  35      9 PENNVLSPL
    ## 910  HLA-A*68:01       1   140 148      9 TCPVQLWVD
    ## 911  HLA-A*02:01       1    28  36      9 ENNVLSPLP
    ## 912  HLA-A*02:01       1    57  65      9 DPGPDEAPW
    ## 913  HLA-A*02:01       1    90  98      9 SWPLSSSVP
    ## 914  HLA-A*02:01       1   174 182      9 RRCPHHERC
    ## 915  HLA-A*02:01       1   228 236      9 DCTTIHYNY
    ## 916  HLA-B*35:01       1   100 108      9 QKTYQGSYG
    ## 917  HLA-B*35:01       1   153 161      9 PGTRVRAMA
    ## 918  HLA-B*35:01       1   201 209      9 LRVEYLDDR
    ## 919  HLA-A*68:01       1   190 198      9 PPQHLIRVE
    ## 920  HLA-B*07:02       1    52  60      9 QWFTEDPGP
    ## 921  HLA-A*68:01       1    41  49      9 LDLMLSPDD
    ## 922  HLA-A*68:01       1   178 186      9 HHERCSDSD
    ## 923  HLA-A*02:01       1   112 120      9 GFLHSGTAK
    ## 924  HLA-A*02:01       1   185 193      9 SDGLAPPQH
    ## 925  HLA-A*68:01       1    87  95      9 PAPSWPLSS
    ## 926  HLA-A*68:01       1   153 161      9 PGTRVRAMA
    ## 927  HLA-A*68:01       1   220 228      9 YEPPEVGSD
    ## 928  HLA-B*07:02       1   213 221      9 VHSVVVPYE
    ## 929  HLA-A*68:01       1    12  20      9 PPLSQETFS
    ## 930  HLA-A*68:01       1    70  78      9 APPVAPAPA
    ## 931  HLA-A*68:01       1   244 252      9 GGMNRRPIL
    ## 932  HLA-B*35:01       1   102 110      9 TYQGSYGFR
    ## 933  HLA-B*35:01       1   106 114      9 SYGFRLGFL
    ## 934  HLA-A*68:01       1   203 211      9 VEYLDDRNT
    ## 935  HLA-B*07:02       1   250 258      9 PILTIITLE
    ## 936  HLA-A*68:01       1   248 256      9 RRPILTIIT
    ## 937  HLA-A*02:01       1     7  15      9 DPSVEPPLS
    ## 938  HLA-A*02:01       1    60  68      9 PDEAPWMPE
    ## 939  HLA-A*02:01       1   152 160      9 PPGTRVRAM
    ## 940  HLA-A*02:01       1   170 178      9 TEVVRRCPH
    ## 941  HLA-A*02:01       1   202 210      9 RVEYLDDRN
    ## 942  HLA-B*35:01       1   110 118      9 RLGFLHSGT
    ## 943  HLA-A*68:01       1    10  18      9 VEPPLSQET
    ## 944  HLA-A*68:01       1   186 194      9 DGLAPPQHL
    ## 945  HLA-A*68:01       1   195 203      9 IRVEGNLRV
    ## 946  HLA-A*02:01       1   100 108      9 QKTYQGSYG
    ## 947  HLA-A*02:01       1   150 158      9 TPPPGTRVR
    ## 948  HLA-A*02:01       1   207 215      9 DDRNTFVHS
    ## 949  HLA-A*02:01       1   239 247      9 NSSCMGGMN
    ## 950  HLA-B*35:01       1   139 147      9 KTCPVQLWV
    ## 951  HLA-B*35:01       1   191 199      9 PQHLIRVEG
    ## 952  HLA-B*35:01       1   203 211      9 VEYLDDRNT
    ## 953  HLA-B*07:02       1    34  42      9 PLPSQAMLD
    ## 954  HLA-B*07:02       1   201 209      9 LRVEYLDDR
    ## 955  HLA-A*68:01       1    98 106      9 PSQKTYQGS
    ## 956  HLA-A*02:01       1   190 198      9 PPQHLIRVE
    ## 957  HLA-B*35:01       1    98 106      9 PSQKTYQGS
    ## 958  HLA-A*68:01       1   108 116      9 GFRLGFLHS
    ## 959  HLA-A*68:01       1   164 172      9 KQSQHMTEV
    ## 960  HLA-B*07:02       1    16  24      9 QETFSDLWK
    ## 961  HLA-B*07:02       1    50  58      9 IEQWFTEDP
    ## 962  HLA-A*02:01       1    16  24      9 QETFSDLWK
    ## 963  HLA-A*02:01       1   123 131      9 TCTYSPALN
    ## 964  HLA-A*02:01       1   155 163      9 TRVRAMAIY
    ## 965  HLA-A*02:01       1   221 229      9 EPPEVGSDC
    ## 966  HLA-B*35:01       1    34  42      9 PLPSQAMLD
    ## 967  HLA-B*35:01       1   119 127      9 AKSVTCTYS
    ## 968  HLA-B*07:02       1    48  56      9 DDIEQWFTE
    ## 969  HLA-A*68:01       1    71  79      9 PPVAPAPAA
    ## 970  HLA-A*02:01       1    67  75      9 PEAAPPVAP
    ## 971  HLA-A*02:01       1    98 106      9 PSQKTYQGS
    ## 972  HLA-A*02:01       1   148 156      9 DSTPPPGTR
    ## 973  HLA-A*02:01       1   153 161      9 PGTRVRAMA
    ## 974  HLA-A*02:01       1   223 231      9 PEVGSDCTT
    ## 975  HLA-B*35:01       1   173 181      9 VRRCPHHER
    ## 976  HLA-A*68:01       1    23  31      9 WKLLPENNV
    ## 977  HLA-A*68:01       1    47  55      9 PDDIEQWFT
    ## 978  HLA-A*68:01       1   189 197      9 APPQHLIRV
    ## 979  HLA-A*02:01       1   173 181      9 VRRCPHHER
    ## 980  HLA-A*68:01       1   219 227      9 PYEPPEVGS
    ## 981  HLA-A*68:01       1   174 182      9 RRCPHHERC
    ## 982  HLA-A*02:01       1   151 159      9 PPPGTRVRA
    ## 983  HLA-B*35:01       1   174 182      9 RRCPHHERC
    ## 984  HLA-B*07:02       1    51  59      9 EQWFTEDPG
    ## 985  HLA-A*68:01       1   151 159      9 PPPGTRVRA
    ## 986  HLA-A*68:01       1   177 185      9 PHHERCSDS
    ## 987  HLA-A*02:01       1   115 123      9 HSGTAKSVT
    ## 988  HLA-A*02:01       1   177 185      9 PHHERCSDS
    ## 989  HLA-A*02:01       1   219 227      9 PYEPPEVGS
    ## 990  HLA-A*02:01       1   175 183      9 RCPHHERCS
    ## 991  HLA-B*07:02       1   140 148      9 TCPVQLWVD
    ## 992  HLA-A*68:01       1    58  66      9 PGPDEAPWM
    ## 993  HLA-A*02:01       1     3  11      9 EPQSDPSVE
    ## 994  HLA-A*02:01       1    56  64      9 EDPGPDEAP
    ## 995  HLA-A*02:01       1   176 184      9 CPHHERCSD
    ## 996  HLA-A*02:01       1   178 186      9 HHERCSDSD
    ## 997  HLA-A*02:01       1   222 230      9 PPEVGSDCT
    ## 998  HLA-B*35:01       1   177 185      9 PHHERCSDS
    ## 999  HLA-A*68:01       1   222 230      9 PPEVGSDCT
    ## 1000 HLA-A*02:01       1   179 187      9 HERCSDSDG
    ## 1001 HLA-A*68:01       1   152 160      9 PPGTRVRAM
    ## 1002 HLA-A*68:01       1   175 183      9 RCPHHERCS
    ## 1003 HLA-B*07:02       1    47  55      9 PDDIEQWFT
    ## 1004 HLA-B*07:02       1   199 207      9 GNLRVEYLD
    ##                                      method Percentile.Rank ann_ic50
    ## 1    Consensus (ann/comblib_sidney2008/smm)            0.20    15.70
    ## 2    Consensus (ann/comblib_sidney2008/smm)            0.20    31.53
    ## 3    Consensus (ann/comblib_sidney2008/smm)            0.20     4.05
    ## 4    Consensus (ann/comblib_sidney2008/smm)            0.20     5.41
    ## 5    Consensus (ann/comblib_sidney2008/smm)            0.40    43.33
    ## 6    Consensus (ann/comblib_sidney2008/smm)            0.40     5.78
    ## 7    Consensus (ann/comblib_sidney2008/smm)            0.50    35.11
    ## 8    Consensus (ann/comblib_sidney2008/smm)            0.67   205.15
    ## 9                       Consensus (ann/smm)            0.70    24.58
    ## 10   Consensus (ann/comblib_sidney2008/smm)            0.70    35.81
    ## 11   Consensus (ann/comblib_sidney2008/smm)            0.80    23.88
    ## 12   Consensus (ann/comblib_sidney2008/smm)            0.92   322.96
    ## 13                      Consensus (ann/smm)            1.08    52.53
    ## 14   Consensus (ann/comblib_sidney2008/smm)            1.10   782.76
    ## 15   Consensus (ann/comblib_sidney2008/smm)            1.20   112.47
    ## 16   Consensus (ann/comblib_sidney2008/smm)            1.20    33.65
    ## 17   Consensus (ann/comblib_sidney2008/smm)            1.20    25.08
    ## 18                      Consensus (ann/smm)            1.50   237.77
    ## 19                      Consensus (ann/smm)            1.80   242.30
    ## 20   Consensus (ann/comblib_sidney2008/smm)            2.10  1265.82
    ## 21   Consensus (ann/comblib_sidney2008/smm)            2.10    97.93
    ## 22   Consensus (ann/comblib_sidney2008/smm)            2.10   828.85
    ## 23                      Consensus (ann/smm)            2.10    74.54
    ## 24   Consensus (ann/comblib_sidney2008/smm)            2.20    67.78
    ## 25   Consensus (ann/comblib_sidney2008/smm)            2.20  1940.03
    ## 26   Consensus (ann/comblib_sidney2008/smm)            2.30    91.94
    ## 27   Consensus (ann/comblib_sidney2008/smm)            2.30   418.20
    ## 28   Consensus (ann/comblib_sidney2008/smm)            2.40  1324.56
    ## 29                      Consensus (ann/smm)            2.50   376.71
    ## 30   Consensus (ann/comblib_sidney2008/smm)            2.50  2293.86
    ## 31   Consensus (ann/comblib_sidney2008/smm)            2.50   181.96
    ## 32   Consensus (ann/comblib_sidney2008/smm)            2.80  1648.70
    ## 33                      Consensus (ann/smm)            2.90   216.72
    ## 34   Consensus (ann/comblib_sidney2008/smm)            3.00  1689.14
    ## 35   Consensus (ann/comblib_sidney2008/smm)            3.00   153.24
    ## 36   Consensus (ann/comblib_sidney2008/smm)            3.10  2891.73
    ## 37   Consensus (ann/comblib_sidney2008/smm)            3.10   308.77
    ## 38   Consensus (ann/comblib_sidney2008/smm)            3.10   277.15
    ## 39   Consensus (ann/comblib_sidney2008/smm)            3.20   330.64
    ## 40   Consensus (ann/comblib_sidney2008/smm)            3.20   113.70
    ## 41   Consensus (ann/comblib_sidney2008/smm)            3.30   966.96
    ## 42                      Consensus (ann/smm)            3.60   768.06
    ## 43   Consensus (ann/comblib_sidney2008/smm)            3.60  1444.51
    ## 44   Consensus (ann/comblib_sidney2008/smm)            3.90  4473.95
    ## 45   Consensus (ann/comblib_sidney2008/smm)            4.00   642.57
    ## 46   Consensus (ann/comblib_sidney2008/smm)            4.10   676.09
    ## 47                      Consensus (ann/smm)            4.20   552.47
    ## 48   Consensus (ann/comblib_sidney2008/smm)            4.20  5013.09
    ## 49   Consensus (ann/comblib_sidney2008/smm)            4.20   660.99
    ## 50   Consensus (ann/comblib_sidney2008/smm)            4.30  3503.40
    ## 51                      Consensus (ann/smm)            4.40   479.12
    ## 52   Consensus (ann/comblib_sidney2008/smm)            4.50  3796.88
    ## 53   Consensus (ann/comblib_sidney2008/smm)            4.50   927.66
    ## 54   Consensus (ann/comblib_sidney2008/smm)            4.60   401.06
    ## 55   Consensus (ann/comblib_sidney2008/smm)            4.60  1762.82
    ## 56                      Consensus (ann/smm)            4.65  1614.52
    ## 57   Consensus (ann/comblib_sidney2008/smm)            4.80  4247.62
    ## 58   Consensus (ann/comblib_sidney2008/smm)            4.80  1095.51
    ## 59   Consensus (ann/comblib_sidney2008/smm)            4.80   778.18
    ## 60   Consensus (ann/comblib_sidney2008/smm)            4.80   424.00
    ## 61                      Consensus (ann/smm)            4.85  2521.10
    ## 62   Consensus (ann/comblib_sidney2008/smm)            4.90  1154.10
    ## 63   Consensus (ann/comblib_sidney2008/smm)            5.10  1185.21
    ## 64   Consensus (ann/comblib_sidney2008/smm)            5.10  1116.59
    ## 65   Consensus (ann/comblib_sidney2008/smm)            5.20  1071.67
    ## 66   Consensus (ann/comblib_sidney2008/smm)            5.20  1736.36
    ## 67   Consensus (ann/comblib_sidney2008/smm)            5.30  1307.05
    ## 68   Consensus (ann/comblib_sidney2008/smm)            5.30  2779.55
    ## 69   Consensus (ann/comblib_sidney2008/smm)            5.30  1227.15
    ## 70   Consensus (ann/comblib_sidney2008/smm)            5.60  6237.16
    ## 71   Consensus (ann/comblib_sidney2008/smm)            6.00  3852.53
    ## 72   Consensus (ann/comblib_sidney2008/smm)            6.10  2529.24
    ## 73   Consensus (ann/comblib_sidney2008/smm)            6.20  6167.30
    ## 74   Consensus (ann/comblib_sidney2008/smm)            6.20  6204.52
    ## 75   Consensus (ann/comblib_sidney2008/smm)            6.40  6379.05
    ## 76   Consensus (ann/comblib_sidney2008/smm)            6.40  6614.29
    ## 77   Consensus (ann/comblib_sidney2008/smm)            6.40   932.21
    ## 78   Consensus (ann/comblib_sidney2008/smm)            6.50  2194.30
    ## 79                      Consensus (ann/smm)            6.55  1370.33
    ## 80   Consensus (ann/comblib_sidney2008/smm)            6.60  8634.42
    ## 81                      Consensus (ann/smm)            6.85  2101.02
    ## 82   Consensus (ann/comblib_sidney2008/smm)            6.90  2037.29
    ## 83   Consensus (ann/comblib_sidney2008/smm)            7.10  7627.18
    ## 84   Consensus (ann/comblib_sidney2008/smm)            7.70  8628.82
    ## 85   Consensus (ann/comblib_sidney2008/smm)            7.70  1075.00
    ## 86                      Consensus (ann/smm)            8.30  1975.57
    ## 87   Consensus (ann/comblib_sidney2008/smm)            8.30 11019.75
    ## 88   Consensus (ann/comblib_sidney2008/smm)            8.40 15942.34
    ## 89   Consensus (ann/comblib_sidney2008/smm)            8.40  9831.95
    ## 90                      Consensus (ann/smm)            8.40  7223.26
    ## 91   Consensus (ann/comblib_sidney2008/smm)            8.50  2005.42
    ## 92                      Consensus (ann/smm)            8.55  5430.03
    ## 93                      Consensus (ann/smm)            8.60  2555.53
    ## 94                      Consensus (ann/smm)            8.85  3024.01
    ## 95   Consensus (ann/comblib_sidney2008/smm)            8.90  8067.39
    ## 96   Consensus (ann/comblib_sidney2008/smm)            9.00 10694.38
    ## 97   Consensus (ann/comblib_sidney2008/smm)            9.10  7919.84
    ## 98   Consensus (ann/comblib_sidney2008/smm)            9.20 13296.47
    ## 99   Consensus (ann/comblib_sidney2008/smm)            9.20  3087.66
    ## 100  Consensus (ann/comblib_sidney2008/smm)            9.20 12339.15
    ## 101                     Consensus (ann/smm)            9.25  3943.42
    ## 102  Consensus (ann/comblib_sidney2008/smm)            9.60  7374.40
    ## 103  Consensus (ann/comblib_sidney2008/smm)            9.60 10855.02
    ## 104  Consensus (ann/comblib_sidney2008/smm)            9.80 13127.78
    ## 105                     Consensus (ann/smm)            9.90  4337.95
    ## 106  Consensus (ann/comblib_sidney2008/smm)           10.00 11825.98
    ## 107  Consensus (ann/comblib_sidney2008/smm)           10.00  4211.87
    ## 108                     Consensus (ann/smm)           10.95  8634.14
    ## 109  Consensus (ann/comblib_sidney2008/smm)           12.00 10762.39
    ## 110  Consensus (ann/comblib_sidney2008/smm)           12.00 10308.10
    ## 111  Consensus (ann/comblib_sidney2008/smm)           12.00 11581.96
    ## 112  Consensus (ann/comblib_sidney2008/smm)           12.00 12610.85
    ## 113  Consensus (ann/comblib_sidney2008/smm)           12.00  6666.74
    ## 114  Consensus (ann/comblib_sidney2008/smm)           12.00 12125.27
    ## 115  Consensus (ann/comblib_sidney2008/smm)           12.00  2594.76
    ## 116  Consensus (ann/comblib_sidney2008/smm)           12.00 14191.21
    ## 117  Consensus (ann/comblib_sidney2008/smm)           12.00 14396.12
    ## 118  Consensus (ann/comblib_sidney2008/smm)           12.00  6985.98
    ## 119  Consensus (ann/comblib_sidney2008/smm)           12.00  4337.62
    ## 120  Consensus (ann/comblib_sidney2008/smm)           12.00  2842.44
    ## 121  Consensus (ann/comblib_sidney2008/smm)           12.00  5053.82
    ## 122  Consensus (ann/comblib_sidney2008/smm)           12.00 14032.11
    ## 123  Consensus (ann/comblib_sidney2008/smm)           13.00 14966.15
    ## 124  Consensus (ann/comblib_sidney2008/smm)           13.00  4548.48
    ## 125  Consensus (ann/comblib_sidney2008/smm)           13.00  2285.56
    ## 126  Consensus (ann/comblib_sidney2008/smm)           13.00  6749.78
    ## 127  Consensus (ann/comblib_sidney2008/smm)           13.00  7380.87
    ## 128  Consensus (ann/comblib_sidney2008/smm)           13.00  5508.38
    ## 129  Consensus (ann/comblib_sidney2008/smm)           13.00  3210.47
    ## 130  Consensus (ann/comblib_sidney2008/smm)           13.00  3903.77
    ## 131  Consensus (ann/comblib_sidney2008/smm)           13.00  2229.46
    ## 132  Consensus (ann/comblib_sidney2008/smm)           13.00  3531.64
    ## 133  Consensus (ann/comblib_sidney2008/smm)           14.00 15929.41
    ## 134  Consensus (ann/comblib_sidney2008/smm)           14.00 14113.88
    ## 135  Consensus (ann/comblib_sidney2008/smm)           14.00  9664.25
    ## 136  Consensus (ann/comblib_sidney2008/smm)           14.00 11608.68
    ## 137  Consensus (ann/comblib_sidney2008/smm)           14.00  5378.23
    ## 138  Consensus (ann/comblib_sidney2008/smm)           14.00 11249.36
    ## 139                     Consensus (ann/smm)           14.50  8620.04
    ## 140                     Consensus (ann/smm)           14.50  8703.83
    ## 141  Consensus (ann/comblib_sidney2008/smm)           15.00 16803.62
    ## 142  Consensus (ann/comblib_sidney2008/smm)           15.00 16980.37
    ## 143  Consensus (ann/comblib_sidney2008/smm)           15.00 15862.33
    ## 144  Consensus (ann/comblib_sidney2008/smm)           15.00 21038.05
    ## 145                     Consensus (ann/smm)           15.00 11625.77
    ## 146                     Consensus (ann/smm)           15.00 16795.45
    ## 147  Consensus (ann/comblib_sidney2008/smm)           15.00 17897.15
    ## 148  Consensus (ann/comblib_sidney2008/smm)           15.00  8924.70
    ## 149  Consensus (ann/comblib_sidney2008/smm)           15.00  2309.60
    ## 150  Consensus (ann/comblib_sidney2008/smm)           15.00 15248.43
    ## 151                     Consensus (ann/smm)           15.20  3797.24
    ## 152  Consensus (ann/comblib_sidney2008/smm)           16.00 15900.99
    ## 153  Consensus (ann/comblib_sidney2008/smm)           16.00 18475.22
    ## 154  Consensus (ann/comblib_sidney2008/smm)           16.00 17507.21
    ## 155  Consensus (ann/comblib_sidney2008/smm)           16.00 15298.51
    ## 156  Consensus (ann/comblib_sidney2008/smm)           16.00 17146.15
    ## 157                     Consensus (ann/smm)           16.00  9235.91
    ## 158  Consensus (ann/comblib_sidney2008/smm)           16.00  7755.50
    ## 159  Consensus (ann/comblib_sidney2008/smm)           16.00  7431.44
    ## 160  Consensus (ann/comblib_sidney2008/smm)           16.00  6776.41
    ## 161  Consensus (ann/comblib_sidney2008/smm)           16.00  6858.21
    ## 162  Consensus (ann/comblib_sidney2008/smm)           16.00 17900.83
    ## 163  Consensus (ann/comblib_sidney2008/smm)           16.00  7703.15
    ## 164  Consensus (ann/comblib_sidney2008/smm)           16.00 11018.91
    ## 165  Consensus (ann/comblib_sidney2008/smm)           16.00  9368.76
    ## 166  Consensus (ann/comblib_sidney2008/smm)           16.00 18042.59
    ## 167  Consensus (ann/comblib_sidney2008/smm)           17.00 20296.40
    ## 168                     Consensus (ann/smm)           17.00 13847.05
    ## 169  Consensus (ann/comblib_sidney2008/smm)           17.00  7337.56
    ## 170  Consensus (ann/comblib_sidney2008/smm)           17.00  7890.85
    ## 171  Consensus (ann/comblib_sidney2008/smm)           17.00  7225.84
    ## 172  Consensus (ann/comblib_sidney2008/smm)           17.00  7100.06
    ## 173  Consensus (ann/comblib_sidney2008/smm)           17.00  2183.20
    ## 174  Consensus (ann/comblib_sidney2008/smm)           17.00  7327.87
    ## 175  Consensus (ann/comblib_sidney2008/smm)           17.00 11962.78
    ## 176  Consensus (ann/comblib_sidney2008/smm)           17.00  8775.60
    ## 177  Consensus (ann/comblib_sidney2008/smm)           17.00 12806.23
    ## 178  Consensus (ann/comblib_sidney2008/smm)           17.00 18788.69
    ## 179                     Consensus (ann/smm)           17.50 16670.71
    ## 180  Consensus (ann/comblib_sidney2008/smm)           18.00 19879.97
    ## 181  Consensus (ann/comblib_sidney2008/smm)           18.00 14912.32
    ## 182  Consensus (ann/comblib_sidney2008/smm)           18.00 16207.57
    ## 183                     Consensus (ann/smm)           18.00 23181.47
    ## 184                     Consensus (ann/smm)           18.00 16233.54
    ## 185  Consensus (ann/comblib_sidney2008/smm)           18.00 15834.38
    ## 186  Consensus (ann/comblib_sidney2008/smm)           18.00 11423.03
    ## 187  Consensus (ann/comblib_sidney2008/smm)           18.00 17855.96
    ## 188  Consensus (ann/comblib_sidney2008/smm)           18.00 11776.18
    ## 189  Consensus (ann/comblib_sidney2008/smm)           18.00  7828.09
    ## 190                     Consensus (ann/smm)           18.50 10837.41
    ## 191  Consensus (ann/comblib_sidney2008/smm)           19.00 21066.98
    ## 192  Consensus (ann/comblib_sidney2008/smm)           19.00 11186.12
    ## 193  Consensus (ann/comblib_sidney2008/smm)           19.00 20975.09
    ## 194                     Consensus (ann/smm)           19.00 25262.66
    ## 195                     Consensus (ann/smm)           19.00 13818.01
    ## 196  Consensus (ann/comblib_sidney2008/smm)           19.00  9299.68
    ## 197  Consensus (ann/comblib_sidney2008/smm)           19.00 20534.52
    ## 198  Consensus (ann/comblib_sidney2008/smm)           19.00  4967.68
    ## 199  Consensus (ann/comblib_sidney2008/smm)           19.00  8670.84
    ## 200  Consensus (ann/comblib_sidney2008/smm)           19.00 16802.17
    ## 201  Consensus (ann/comblib_sidney2008/smm)           19.00  8076.30
    ## 202  Consensus (ann/comblib_sidney2008/smm)           20.00 21892.85
    ## 203  Consensus (ann/comblib_sidney2008/smm)           20.00 11902.48
    ## 204  Consensus (ann/comblib_sidney2008/smm)           20.00 21242.54
    ## 205  Consensus (ann/comblib_sidney2008/smm)           20.00 18572.62
    ## 206  Consensus (ann/comblib_sidney2008/smm)           20.00 10185.15
    ## 207  Consensus (ann/comblib_sidney2008/smm)           20.00 15361.70
    ## 208  Consensus (ann/comblib_sidney2008/smm)           20.00  8560.84
    ## 209  Consensus (ann/comblib_sidney2008/smm)           20.00 15288.74
    ## 210  Consensus (ann/comblib_sidney2008/smm)           20.00 13258.83
    ## 211  Consensus (ann/comblib_sidney2008/smm)           20.00 21399.18
    ## 212  Consensus (ann/comblib_sidney2008/smm)           21.00 22217.86
    ## 213  Consensus (ann/comblib_sidney2008/smm)           21.00 22437.71
    ## 214  Consensus (ann/comblib_sidney2008/smm)           21.00 18309.06
    ## 215  Consensus (ann/comblib_sidney2008/smm)           21.00 16606.26
    ## 216  Consensus (ann/comblib_sidney2008/smm)           21.00 19835.71
    ## 217                     Consensus (ann/smm)           21.00 17329.68
    ## 218  Consensus (ann/comblib_sidney2008/smm)           21.00 18864.27
    ## 219                     Consensus (ann/smm)           21.50 16986.06
    ## 220                     Consensus (ann/smm)           21.50 25851.64
    ## 221  Consensus (ann/comblib_sidney2008/smm)           22.00 23350.63
    ## 222  Consensus (ann/comblib_sidney2008/smm)           22.00 23047.92
    ## 223  Consensus (ann/comblib_sidney2008/smm)           22.00 16491.48
    ## 224                     Consensus (ann/smm)           22.00 18248.54
    ## 225  Consensus (ann/comblib_sidney2008/smm)           22.00 14450.89
    ## 226  Consensus (ann/comblib_sidney2008/smm)           22.00  9660.39
    ## 227  Consensus (ann/comblib_sidney2008/smm)           22.00  9394.34
    ## 228                     Consensus (ann/smm)           22.50 14894.26
    ## 229  Consensus (ann/comblib_sidney2008/smm)           23.00 21201.89
    ## 230  Consensus (ann/comblib_sidney2008/smm)           23.00 24098.58
    ## 231  Consensus (ann/comblib_sidney2008/smm)           23.00 12048.64
    ## 232  Consensus (ann/comblib_sidney2008/smm)           23.00 20913.00
    ## 233  Consensus (ann/comblib_sidney2008/smm)           23.00 19123.41
    ## 234  Consensus (ann/comblib_sidney2008/smm)           23.00 18199.44
    ## 235  Consensus (ann/comblib_sidney2008/smm)           23.00  9557.35
    ## 236  Consensus (ann/comblib_sidney2008/smm)           23.00 23724.50
    ## 237  Consensus (ann/comblib_sidney2008/smm)           23.00 13095.87
    ## 238                     Consensus (ann/smm)           23.15 32944.45
    ## 239  Consensus (ann/comblib_sidney2008/smm)           24.00 24867.79
    ## 240  Consensus (ann/comblib_sidney2008/smm)           24.00 19803.54
    ## 241  Consensus (ann/comblib_sidney2008/smm)           24.00 24618.29
    ## 242  Consensus (ann/comblib_sidney2008/smm)           24.00 21252.65
    ## 243                     Consensus (ann/smm)           24.00 23962.87
    ## 244  Consensus (ann/comblib_sidney2008/smm)           24.00 12880.99
    ## 245  Consensus (ann/comblib_sidney2008/smm)           24.00 12396.15
    ## 246  Consensus (ann/comblib_sidney2008/smm)           24.00 23526.64
    ## 247  Consensus (ann/comblib_sidney2008/smm)           24.00 19889.44
    ## 248                     Consensus (ann/smm)           24.50 22317.85
    ## 249                     Consensus (ann/smm)           24.50 14770.53
    ## 250                     Consensus (ann/smm)           24.50 20797.24
    ## 251  Consensus (ann/comblib_sidney2008/smm)           25.00 18460.83
    ## 252  Consensus (ann/comblib_sidney2008/smm)           25.00 24675.90
    ## 253  Consensus (ann/comblib_sidney2008/smm)           25.00 22094.89
    ## 254  Consensus (ann/comblib_sidney2008/smm)           25.00 24508.26
    ## 255  Consensus (ann/comblib_sidney2008/smm)           25.00 13148.96
    ## 256  Consensus (ann/comblib_sidney2008/smm)           25.00  8484.85
    ## 257                     Consensus (ann/smm)           25.50 24459.25
    ## 258  Consensus (ann/comblib_sidney2008/smm)           26.00 25744.16
    ## 259                     Consensus (ann/smm)           26.00 17978.28
    ## 260  Consensus (ann/comblib_sidney2008/smm)           26.00 12700.95
    ## 261  Consensus (ann/comblib_sidney2008/smm)           26.00 14433.39
    ## 262  Consensus (ann/comblib_sidney2008/smm)           26.00 25316.84
    ## 263  Consensus (ann/comblib_sidney2008/smm)           26.00 25334.11
    ## 264  Consensus (ann/comblib_sidney2008/smm)           27.00 24913.05
    ## 265                     Consensus (ann/smm)           27.00 28596.66
    ## 266                     Consensus (ann/smm)           27.00 18720.30
    ## 267                     Consensus (ann/smm)           27.00 18697.63
    ## 268                     Consensus (ann/smm)           27.00 24109.80
    ## 269                     Consensus (ann/smm)           27.00 28218.30
    ## 270  Consensus (ann/comblib_sidney2008/smm)           27.00 15647.04
    ## 271  Consensus (ann/comblib_sidney2008/smm)           27.00 12757.97
    ## 272  Consensus (ann/comblib_sidney2008/smm)           27.00 11363.37
    ## 273  Consensus (ann/comblib_sidney2008/smm)           27.00 10746.57
    ## 274                     Consensus (ann/smm)           27.50 13029.30
    ## 275  Consensus (ann/comblib_sidney2008/smm)           28.00 23246.28
    ## 276  Consensus (ann/comblib_sidney2008/smm)           28.00 15040.98
    ## 277  Consensus (ann/comblib_sidney2008/smm)           28.00 15809.22
    ## 278  Consensus (ann/comblib_sidney2008/smm)           28.00 24432.01
    ## 279  Consensus (ann/comblib_sidney2008/smm)           28.00 18573.23
    ## 280  Consensus (ann/comblib_sidney2008/smm)           28.00 15817.26
    ## 281  Consensus (ann/comblib_sidney2008/smm)           29.00 27649.80
    ## 282  Consensus (ann/comblib_sidney2008/smm)           29.00 27382.15
    ## 283  Consensus (ann/comblib_sidney2008/smm)           29.00 19536.87
    ## 284                     Consensus (ann/smm)           29.00 25117.40
    ## 285  Consensus (ann/comblib_sidney2008/smm)           29.00 36512.89
    ## 286  Consensus (ann/comblib_sidney2008/smm)           29.00 19024.54
    ## 287  Consensus (ann/comblib_sidney2008/smm)           29.00 27250.33
    ## 288  Consensus (ann/comblib_sidney2008/smm)           29.00 13934.98
    ## 289                     Consensus (ann/smm)           29.50 24629.49
    ## 290                     Consensus (ann/smm)           29.50 17237.67
    ## 291  Consensus (ann/comblib_sidney2008/smm)           30.00 25016.23
    ## 292  Consensus (ann/comblib_sidney2008/smm)           30.00 27800.08
    ## 293  Consensus (ann/comblib_sidney2008/smm)           30.00 25765.34
    ## 294  Consensus (ann/comblib_sidney2008/smm)           30.00 28083.66
    ## 295  Consensus (ann/comblib_sidney2008/smm)           30.00 19910.75
    ## 296  Consensus (ann/comblib_sidney2008/smm)           30.00 22722.32
    ## 297  Consensus (ann/comblib_sidney2008/smm)           30.00 26910.46
    ## 298                     Consensus (ann/smm)           30.00 32555.75
    ## 299                     Consensus (ann/smm)           30.00 17663.81
    ## 300  Consensus (ann/comblib_sidney2008/smm)           30.00 17305.32
    ## 301  Consensus (ann/comblib_sidney2008/smm)           30.00 18578.66
    ## 302  Consensus (ann/comblib_sidney2008/smm)           30.00 17530.34
    ## 303  Consensus (ann/comblib_sidney2008/smm)           30.00 17953.79
    ## 304  Consensus (ann/comblib_sidney2008/smm)           30.00 26627.20
    ## 305  Consensus (ann/comblib_sidney2008/smm)           31.00 27053.21
    ## 306  Consensus (ann/comblib_sidney2008/smm)           31.00 28267.18
    ## 307  Consensus (ann/comblib_sidney2008/smm)           31.00 21177.82
    ## 308  Consensus (ann/comblib_sidney2008/smm)           31.00 23002.59
    ## 309  Consensus (ann/comblib_sidney2008/smm)           31.00 12178.39
    ## 310  Consensus (ann/comblib_sidney2008/smm)           31.00 25590.86
    ## 311  Consensus (ann/comblib_sidney2008/smm)           31.00 27433.46
    ## 312  Consensus (ann/comblib_sidney2008/smm)           31.00 27208.50
    ## 313  Consensus (ann/comblib_sidney2008/smm)           31.00 24211.76
    ## 314  Consensus (ann/comblib_sidney2008/smm)           31.00 12074.22
    ## 315                     Consensus (ann/smm)           31.50 21584.50
    ## 316  Consensus (ann/comblib_sidney2008/smm)           32.00 29003.62
    ## 317  Consensus (ann/comblib_sidney2008/smm)           32.00 25303.15
    ## 318  Consensus (ann/comblib_sidney2008/smm)           32.00 28939.98
    ## 319                     Consensus (ann/smm)           32.00 27362.61
    ## 320  Consensus (ann/comblib_sidney2008/smm)           32.00 18340.58
    ## 321  Consensus (ann/comblib_sidney2008/smm)           32.00 32574.78
    ## 322  Consensus (ann/comblib_sidney2008/smm)           32.00 20713.93
    ## 323  Consensus (ann/comblib_sidney2008/smm)           32.00 26657.46
    ## 324  Consensus (ann/comblib_sidney2008/smm)           32.00 14150.11
    ## 325  Consensus (ann/comblib_sidney2008/smm)           32.00 33373.55
    ## 326  Consensus (ann/comblib_sidney2008/smm)           32.00 22411.26
    ## 327  Consensus (ann/comblib_sidney2008/smm)           32.00 23416.43
    ## 328                     Consensus (ann/smm)           32.50 21351.99
    ## 329  Consensus (ann/comblib_sidney2008/smm)           33.00 23878.49
    ## 330  Consensus (ann/comblib_sidney2008/smm)           33.00 24242.16
    ## 331  Consensus (ann/comblib_sidney2008/smm)           33.00 29251.95
    ## 332  Consensus (ann/comblib_sidney2008/smm)           33.00 29149.90
    ## 333  Consensus (ann/comblib_sidney2008/smm)           33.00 19038.76
    ## 334  Consensus (ann/comblib_sidney2008/smm)           33.00 21030.99
    ## 335  Consensus (ann/comblib_sidney2008/smm)           33.00 29233.92
    ## 336  Consensus (ann/comblib_sidney2008/smm)           33.00 19175.82
    ## 337  Consensus (ann/comblib_sidney2008/smm)           33.00 22984.42
    ## 338  Consensus (ann/comblib_sidney2008/smm)           34.00 29503.38
    ## 339                     Consensus (ann/smm)           34.00 26468.06
    ## 340                     Consensus (ann/smm)           34.00 34089.97
    ## 341                     Consensus (ann/smm)           34.00 26327.55
    ## 342  Consensus (ann/comblib_sidney2008/smm)           34.00 19540.68
    ## 343  Consensus (ann/comblib_sidney2008/smm)           34.00 21360.76
    ## 344  Consensus (ann/comblib_sidney2008/smm)           34.00 23205.82
    ## 345  Consensus (ann/comblib_sidney2008/smm)           34.00 18300.15
    ## 346  Consensus (ann/comblib_sidney2008/smm)           35.00 30199.05
    ## 347                     Consensus (ann/smm)           35.00 32923.79
    ## 348                     Consensus (ann/smm)           35.00 27578.09
    ## 349                     Consensus (ann/smm)           35.00 29427.83
    ## 350  Consensus (ann/comblib_sidney2008/smm)           35.00 25958.98
    ## 351  Consensus (ann/comblib_sidney2008/smm)           35.00 22832.49
    ## 352  Consensus (ann/comblib_sidney2008/smm)           35.00 22639.37
    ## 353  Consensus (ann/comblib_sidney2008/smm)           35.00 29763.07
    ## 354  Consensus (ann/comblib_sidney2008/smm)           35.00 22713.22
    ## 355  Consensus (ann/comblib_sidney2008/smm)           35.00 23243.51
    ## 356  Consensus (ann/comblib_sidney2008/smm)           35.00 18543.31
    ## 357  Consensus (ann/comblib_sidney2008/smm)           36.00 30434.90
    ## 358  Consensus (ann/comblib_sidney2008/smm)           36.00 30222.26
    ## 359  Consensus (ann/comblib_sidney2008/smm)           36.00 28874.92
    ## 360  Consensus (ann/comblib_sidney2008/smm)           36.00 24192.12
    ## 361                     Consensus (ann/smm)           36.00 26782.94
    ## 362  Consensus (ann/comblib_sidney2008/smm)           36.00 35501.96
    ## 363  Consensus (ann/comblib_sidney2008/smm)           36.00 31469.97
    ## 364  Consensus (ann/comblib_sidney2008/smm)           36.00 27305.53
    ## 365  Consensus (ann/comblib_sidney2008/smm)           36.00 20778.58
    ## 366  Consensus (ann/comblib_sidney2008/smm)           36.00 22780.17
    ## 367  Consensus (ann/comblib_sidney2008/smm)           36.00 20045.64
    ## 368                     Consensus (ann/smm)           36.50 32211.68
    ## 369  Consensus (ann/comblib_sidney2008/smm)           37.00 18616.08
    ## 370  Consensus (ann/comblib_sidney2008/smm)           37.00 27774.53
    ## 371                     Consensus (ann/smm)           37.00 32758.93
    ## 372  Consensus (ann/comblib_sidney2008/smm)           37.00 21418.63
    ## 373  Consensus (ann/comblib_sidney2008/smm)           37.00 19359.27
    ## 374  Consensus (ann/comblib_sidney2008/smm)           37.00 19439.24
    ## 375  Consensus (ann/comblib_sidney2008/smm)           37.00 30464.22
    ## 376  Consensus (ann/comblib_sidney2008/smm)           37.00 22690.13
    ## 377  Consensus (ann/comblib_sidney2008/smm)           37.00 21138.21
    ## 378                     Consensus (ann/smm)           37.50 28535.46
    ## 379                     Consensus (ann/smm)           37.50 28313.11
    ## 380  Consensus (ann/comblib_sidney2008/smm)           38.00 31227.45
    ## 381  Consensus (ann/comblib_sidney2008/smm)           38.00 23511.62
    ## 382  Consensus (ann/comblib_sidney2008/smm)           38.00 26219.80
    ## 383  Consensus (ann/comblib_sidney2008/smm)           38.00 32906.70
    ## 384  Consensus (ann/comblib_sidney2008/smm)           38.00 27175.85
    ## 385  Consensus (ann/comblib_sidney2008/smm)           38.00 18742.19
    ## 386  Consensus (ann/comblib_sidney2008/smm)           38.00 28616.16
    ## 387  Consensus (ann/comblib_sidney2008/smm)           38.00 30820.30
    ## 388                     Consensus (ann/smm)           38.50 36715.72
    ## 389                     Consensus (ann/smm)           38.50 35583.49
    ## 390  Consensus (ann/comblib_sidney2008/smm)           39.00 23958.97
    ## 391  Consensus (ann/comblib_sidney2008/smm)           39.00 29187.77
    ## 392  Consensus (ann/comblib_sidney2008/smm)           39.00 25334.11
    ## 393  Consensus (ann/comblib_sidney2008/smm)           39.00 29516.15
    ## 394                     Consensus (ann/smm)           39.00 30542.10
    ## 395  Consensus (ann/comblib_sidney2008/smm)           39.00 35472.78
    ## 396  Consensus (ann/comblib_sidney2008/smm)           39.00 31059.32
    ## 397  Consensus (ann/comblib_sidney2008/smm)           39.00 25156.82
    ## 398  Consensus (ann/comblib_sidney2008/smm)           39.00 29466.68
    ## 399  Consensus (ann/comblib_sidney2008/smm)           39.00 16637.02
    ## 400  Consensus (ann/comblib_sidney2008/smm)           39.00 29180.50
    ## 401                     Consensus (ann/smm)           39.50 41077.93
    ## 402  Consensus (ann/comblib_sidney2008/smm)           40.00 30029.29
    ## 403  Consensus (ann/comblib_sidney2008/smm)           40.00 27956.03
    ## 404  Consensus (ann/comblib_sidney2008/smm)           40.00 31634.18
    ## 405  Consensus (ann/comblib_sidney2008/smm)           40.00 33088.43
    ## 406  Consensus (ann/comblib_sidney2008/smm)           40.00 22881.94
    ## 407  Consensus (ann/comblib_sidney2008/smm)           40.00 17483.92
    ## 408  Consensus (ann/comblib_sidney2008/smm)           40.00 15032.03
    ## 409                     Consensus (ann/smm)           40.50 29375.64
    ## 410  Consensus (ann/comblib_sidney2008/smm)           41.00 23760.20
    ## 411  Consensus (ann/comblib_sidney2008/smm)           41.00 25502.69
    ## 412  Consensus (ann/comblib_sidney2008/smm)           41.00 31023.71
    ## 413  Consensus (ann/comblib_sidney2008/smm)           41.00 22626.64
    ## 414  Consensus (ann/comblib_sidney2008/smm)           41.00 25241.08
    ## 415  Consensus (ann/comblib_sidney2008/smm)           41.00 24801.97
    ## 416  Consensus (ann/comblib_sidney2008/smm)           41.00 31773.11
    ## 417  Consensus (ann/comblib_sidney2008/smm)           42.00 31569.21
    ## 418                     Consensus (ann/smm)           42.00 33996.77
    ## 419                     Consensus (ann/smm)           42.00 35611.23
    ## 420  Consensus (ann/comblib_sidney2008/smm)           42.00 23975.82
    ## 421  Consensus (ann/comblib_sidney2008/smm)           42.00 32574.42
    ## 422  Consensus (ann/comblib_sidney2008/smm)           42.00 36123.48
    ## 423  Consensus (ann/comblib_sidney2008/smm)           42.00 24100.15
    ## 424  Consensus (ann/comblib_sidney2008/smm)           42.00 31496.20
    ## 425                     Consensus (ann/smm)           42.50 30330.68
    ## 426  Consensus (ann/comblib_sidney2008/smm)           43.00 25324.78
    ## 427  Consensus (ann/comblib_sidney2008/smm)           43.00 32621.32
    ## 428  Consensus (ann/comblib_sidney2008/smm)           43.00 25963.48
    ## 429                     Consensus (ann/smm)           43.00 35738.59
    ## 430  Consensus (ann/comblib_sidney2008/smm)           43.00 28978.21
    ## 431  Consensus (ann/comblib_sidney2008/smm)           43.00 21119.92
    ## 432  Consensus (ann/comblib_sidney2008/smm)           43.00 27402.61
    ## 433  Consensus (ann/comblib_sidney2008/smm)           43.00 27467.01
    ## 434                     Consensus (ann/smm)           43.50 35848.98
    ## 435                     Consensus (ann/smm)           43.50 40225.99
    ## 436                     Consensus (ann/smm)           43.50 35706.52
    ## 437  Consensus (ann/comblib_sidney2008/smm)           44.00 32800.43
    ## 438  Consensus (ann/comblib_sidney2008/smm)           44.00 17879.73
    ## 439                     Consensus (ann/smm)           44.00 35848.59
    ## 440                     Consensus (ann/smm)           44.00 34061.95
    ## 441                     Consensus (ann/smm)           44.00 29335.00
    ## 442  Consensus (ann/comblib_sidney2008/smm)           44.00 25237.52
    ## 443  Consensus (ann/comblib_sidney2008/smm)           44.00 21387.37
    ## 444  Consensus (ann/comblib_sidney2008/smm)           44.00 23533.77
    ## 445  Consensus (ann/comblib_sidney2008/smm)           44.00 32958.38
    ## 446  Consensus (ann/comblib_sidney2008/smm)           44.00 33046.91
    ## 447  Consensus (ann/comblib_sidney2008/smm)           44.00 23130.37
    ## 448                     Consensus (ann/smm)           44.50 29835.95
    ## 449                     Consensus (ann/smm)           45.00 30003.32
    ## 450  Consensus (ann/comblib_sidney2008/smm)           45.00 25543.29
    ## 451  Consensus (ann/comblib_sidney2008/smm)           45.00 32479.04
    ## 452  Consensus (ann/comblib_sidney2008/smm)           45.00 25413.45
    ## 453  Consensus (ann/comblib_sidney2008/smm)           45.00 27148.80
    ## 454  Consensus (ann/comblib_sidney2008/smm)           45.00 33342.88
    ## 455  Consensus (ann/comblib_sidney2008/smm)           45.00 23589.86
    ## 456  Consensus (ann/comblib_sidney2008/smm)           45.00 26618.27
    ## 457  Consensus (ann/comblib_sidney2008/smm)           46.00 28363.38
    ## 458  Consensus (ann/comblib_sidney2008/smm)           46.00 33437.52
    ## 459  Consensus (ann/comblib_sidney2008/smm)           46.00 33373.92
    ## 460  Consensus (ann/comblib_sidney2008/smm)           46.00 33552.41
    ## 461  Consensus (ann/comblib_sidney2008/smm)           46.00 33551.68
    ## 462  Consensus (ann/comblib_sidney2008/smm)           46.00 33440.06
    ## 463  Consensus (ann/comblib_sidney2008/smm)           46.00 33408.24
    ## 464                     Consensus (ann/smm)           46.00 34078.52
    ## 465  Consensus (ann/comblib_sidney2008/smm)           46.00 32308.01
    ## 466  Consensus (ann/comblib_sidney2008/smm)           46.00 25851.64
    ## 467  Consensus (ann/comblib_sidney2008/smm)           46.00 30111.93
    ## 468                     Consensus (ann/smm)           46.50 36702.21
    ## 469                     Consensus (ann/smm)           46.50 31617.41
    ## 470                     Consensus (ann/smm)           46.50 29048.52
    ## 471  Consensus (ann/comblib_sidney2008/smm)           47.00 33613.81
    ## 472  Consensus (ann/comblib_sidney2008/smm)           47.00 27746.91
    ## 473  Consensus (ann/comblib_sidney2008/smm)           47.00 31487.69
    ## 474  Consensus (ann/comblib_sidney2008/smm)           47.00 25097.29
    ## 475                     Consensus (ann/smm)           47.00 37222.11
    ## 476                     Consensus (ann/smm)           47.00 29728.96
    ## 477                     Consensus (ann/smm)           47.00 29857.58
    ## 478                     Consensus (ann/smm)           47.00 38230.26
    ## 479  Consensus (ann/comblib_sidney2008/smm)           47.00 30991.51
    ## 480  Consensus (ann/comblib_sidney2008/smm)           47.00 36359.52
    ## 481  Consensus (ann/comblib_sidney2008/smm)           47.00 33777.88
    ## 482  Consensus (ann/comblib_sidney2008/smm)           47.00 18876.71
    ## 483  Consensus (ann/comblib_sidney2008/smm)           47.00 33901.99
    ## 484  Consensus (ann/comblib_sidney2008/smm)           47.00 21641.09
    ## 485  Consensus (ann/comblib_sidney2008/smm)           47.00 22913.90
    ## 486  Consensus (ann/comblib_sidney2008/smm)           47.00 18117.71
    ## 487  Consensus (ann/comblib_sidney2008/smm)           47.00 33842.99
    ## 488                     Consensus (ann/smm)           47.50 31655.75
    ## 489                     Consensus (ann/smm)           47.50 37013.26
    ## 490  Consensus (ann/comblib_sidney2008/smm)           48.00 30762.99
    ## 491  Consensus (ann/comblib_sidney2008/smm)           48.00 33889.53
    ## 492                     Consensus (ann/smm)           48.00 36626.04
    ## 493  Consensus (ann/comblib_sidney2008/smm)           48.00 27063.75
    ## 494  Consensus (ann/comblib_sidney2008/smm)           48.00 34238.56
    ## 495  Consensus (ann/comblib_sidney2008/smm)           48.00 25937.07
    ## 496  Consensus (ann/comblib_sidney2008/smm)           48.00 34213.00
    ## 497                     Consensus (ann/smm)           48.50 34192.66
    ## 498                     Consensus (ann/smm)           48.50 33249.21
    ## 499                     Consensus (ann/smm)           48.50 37697.12
    ## 500  Consensus (ann/comblib_sidney2008/smm)           49.00 34187.83
    ## 501  Consensus (ann/comblib_sidney2008/smm)           49.00 25902.02
    ## 502  Consensus (ann/comblib_sidney2008/smm)           49.00 23909.00
    ## 503  Consensus (ann/comblib_sidney2008/smm)           49.00 34267.10
    ## 504  Consensus (ann/comblib_sidney2008/smm)           49.00 30325.44
    ## 505  Consensus (ann/comblib_sidney2008/smm)           49.00 32561.02
    ## 506                     Consensus (ann/smm)           49.00 31334.06
    ## 507  Consensus (ann/comblib_sidney2008/smm)           49.00 27523.54
    ## 508  Consensus (ann/comblib_sidney2008/smm)           49.00 32634.39
    ## 509  Consensus (ann/comblib_sidney2008/smm)           49.00 30752.00
    ## 510  Consensus (ann/comblib_sidney2008/smm)           49.00 27314.09
    ## 511  Consensus (ann/comblib_sidney2008/smm)           49.00 26677.38
    ## 512  Consensus (ann/comblib_sidney2008/smm)           49.00 27579.28
    ## 513  Consensus (ann/comblib_sidney2008/smm)           49.00 24453.70
    ## 514                     Consensus (ann/smm)           49.50 36520.40
    ## 515                     Consensus (ann/smm)           49.50 33197.81
    ## 516  Consensus (ann/comblib_sidney2008/smm)           50.00 30419.75
    ## 517  Consensus (ann/comblib_sidney2008/smm)           50.00 30117.48
    ## 518                     Consensus (ann/smm)           50.00 30002.35
    ## 519                     Consensus (ann/smm)           50.00 38859.57
    ## 520  Consensus (ann/comblib_sidney2008/smm)           50.00 34839.46
    ## 521                     Consensus (ann/smm)           50.50 33551.68
    ## 522                     Consensus (ann/smm)           50.50 34201.90
    ## 523                     Consensus (ann/smm)           50.50 33874.50
    ## 524  Consensus (ann/comblib_sidney2008/smm)           51.00 34713.04
    ## 525  Consensus (ann/comblib_sidney2008/smm)           51.00 34618.14
    ## 526  Consensus (ann/comblib_sidney2008/smm)           51.00 26976.35
    ## 527  Consensus (ann/comblib_sidney2008/smm)           51.00 34684.87
    ## 528                     Consensus (ann/smm)           51.00 38849.07
    ## 529                     Consensus (ann/smm)           51.00 38144.75
    ## 530                     Consensus (ann/smm)           51.00 40383.84
    ## 531  Consensus (ann/comblib_sidney2008/smm)           51.00 30525.92
    ## 532  Consensus (ann/comblib_sidney2008/smm)           51.00 34173.79
    ## 533  Consensus (ann/comblib_sidney2008/smm)           51.00 29946.89
    ## 534  Consensus (ann/comblib_sidney2008/smm)           51.00 23844.15
    ## 535  Consensus (ann/comblib_sidney2008/smm)           51.00 35095.21
    ## 536  Consensus (ann/comblib_sidney2008/smm)           51.00 30178.47
    ## 537                     Consensus (ann/smm)           51.50 37553.40
    ## 538                     Consensus (ann/smm)           51.50 36965.24
    ## 539                     Consensus (ann/smm)           51.50 41461.05
    ## 540                     Consensus (ann/smm)           51.50 41857.24
    ## 541  Consensus (ann/comblib_sidney2008/smm)           52.00 29585.84
    ## 542  Consensus (ann/comblib_sidney2008/smm)           52.00 23866.09
    ## 543  Consensus (ann/comblib_sidney2008/smm)           52.00 28131.41
    ## 544  Consensus (ann/comblib_sidney2008/smm)           52.00 28386.11
    ## 545  Consensus (ann/comblib_sidney2008/smm)           52.00 34869.25
    ## 546                     Consensus (ann/smm)           52.00 35215.03
    ## 547  Consensus (ann/comblib_sidney2008/smm)           52.00 37705.27
    ## 548  Consensus (ann/comblib_sidney2008/smm)           52.00 28660.76
    ## 549  Consensus (ann/comblib_sidney2008/smm)           52.00 30579.80
    ## 550  Consensus (ann/comblib_sidney2008/smm)           52.00 26002.56
    ## 551  Consensus (ann/comblib_sidney2008/smm)           52.00 28829.96
    ## 552  Consensus (ann/comblib_sidney2008/smm)           52.00 34630.87
    ## 553  Consensus (ann/comblib_sidney2008/smm)           52.00 27630.66
    ## 554  Consensus (ann/comblib_sidney2008/smm)           52.00 24543.03
    ## 555                     Consensus (ann/smm)           52.50 36891.31
    ## 556                     Consensus (ann/smm)           52.50 37158.12
    ## 557  Consensus (ann/comblib_sidney2008/smm)           53.00 35114.59
    ## 558  Consensus (ann/comblib_sidney2008/smm)           53.00 35178.85
    ## 559  Consensus (ann/comblib_sidney2008/smm)           53.00 31112.12
    ## 560  Consensus (ann/comblib_sidney2008/smm)           53.00 29682.68
    ## 561  Consensus (ann/comblib_sidney2008/smm)           53.00 35129.02
    ## 562  Consensus (ann/comblib_sidney2008/smm)           53.00 35109.27
    ## 563  Consensus (ann/comblib_sidney2008/smm)           53.00 35762.96
    ## 564                     Consensus (ann/smm)           53.00 36229.54
    ## 565  Consensus (ann/comblib_sidney2008/smm)           53.00 31526.54
    ## 566  Consensus (ann/comblib_sidney2008/smm)           53.00 21627.04
    ## 567  Consensus (ann/comblib_sidney2008/smm)           53.00 35430.21
    ## 568                     Consensus (ann/smm)           53.50 37717.50
    ## 569                     Consensus (ann/smm)           53.50 32160.12
    ## 570  Consensus (ann/comblib_sidney2008/smm)           54.00 23185.75
    ## 571  Consensus (ann/comblib_sidney2008/smm)           54.00 31099.67
    ## 572  Consensus (ann/comblib_sidney2008/smm)           54.00 35273.77
    ## 573  Consensus (ann/comblib_sidney2008/smm)           54.00 32499.09
    ## 574  Consensus (ann/comblib_sidney2008/smm)           54.00 29307.39
    ## 575  Consensus (ann/comblib_sidney2008/smm)           54.00 36121.12
    ## 576  Consensus (ann/comblib_sidney2008/smm)           54.00 25114.68
    ## 577                     Consensus (ann/smm)           54.50 34962.94
    ## 578  Consensus (ann/comblib_sidney2008/smm)           55.00 35609.30
    ## 579  Consensus (ann/comblib_sidney2008/smm)           55.00 35302.39
    ## 580  Consensus (ann/comblib_sidney2008/smm)           55.00 35528.09
    ## 581  Consensus (ann/comblib_sidney2008/smm)           55.00 27630.36
    ## 582  Consensus (ann/comblib_sidney2008/smm)           55.00 31726.04
    ## 583                     Consensus (ann/smm)           55.00 40176.83
    ## 584                     Consensus (ann/smm)           55.00 34865.11
    ## 585  Consensus (ann/comblib_sidney2008/smm)           55.00 36653.00
    ## 586  Consensus (ann/comblib_sidney2008/smm)           55.00 25235.34
    ## 587  Consensus (ann/comblib_sidney2008/smm)           55.00 30474.11
    ## 588  Consensus (ann/comblib_sidney2008/smm)           55.00 29749.56
    ## 589  Consensus (ann/comblib_sidney2008/smm)           55.00 26786.71
    ## 590  Consensus (ann/comblib_sidney2008/smm)           55.00 24733.89
    ## 591  Consensus (ann/comblib_sidney2008/smm)           55.00 31534.74
    ## 592  Consensus (ann/comblib_sidney2008/smm)           55.00 32923.45
    ## 593  Consensus (ann/comblib_sidney2008/smm)           55.00 29546.51
    ## 594  Consensus (ann/comblib_sidney2008/smm)           55.00 24162.56
    ## 595  Consensus (ann/comblib_sidney2008/smm)           55.00 25722.72
    ## 596  Consensus (ann/comblib_sidney2008/smm)           55.00 34884.72
    ## 597                     Consensus (ann/smm)           55.50 37508.75
    ## 598                     Consensus (ann/smm)           55.50 38077.53
    ## 599  Consensus (ann/comblib_sidney2008/smm)           56.00 29698.42
    ## 600  Consensus (ann/comblib_sidney2008/smm)           56.00 25910.99
    ## 601  Consensus (ann/comblib_sidney2008/smm)           56.00 33782.63
    ## 602                     Consensus (ann/smm)           56.00 40235.12
    ## 603                     Consensus (ann/smm)           56.00 40070.89
    ## 604  Consensus (ann/comblib_sidney2008/smm)           56.00 32742.26
    ## 605  Consensus (ann/comblib_sidney2008/smm)           56.00 32152.82
    ## 606  Consensus (ann/comblib_sidney2008/smm)           56.00 30284.79
    ## 607  Consensus (ann/comblib_sidney2008/smm)           56.00 19002.54
    ## 608  Consensus (ann/comblib_sidney2008/smm)           56.00 26161.43
    ## 609  Consensus (ann/comblib_sidney2008/smm)           56.00 28682.18
    ## 610  Consensus (ann/comblib_sidney2008/smm)           56.00 27345.75
    ## 611                     Consensus (ann/smm)           56.50 34573.96
    ## 612                     Consensus (ann/smm)           56.50 36658.96
    ## 613                     Consensus (ann/smm)           56.50 37245.07
    ## 614  Consensus (ann/comblib_sidney2008/smm)           57.00 31870.90
    ## 615  Consensus (ann/comblib_sidney2008/smm)           57.00 35309.27
    ## 616  Consensus (ann/comblib_sidney2008/smm)           57.00 35998.22
    ## 617                     Consensus (ann/smm)           57.00 40372.05
    ## 618                     Consensus (ann/smm)           57.00 38533.01
    ## 619  Consensus (ann/comblib_sidney2008/smm)           57.00 38906.69
    ## 620  Consensus (ann/comblib_sidney2008/smm)           57.00 35308.13
    ## 621  Consensus (ann/comblib_sidney2008/smm)           57.00 28518.48
    ## 622  Consensus (ann/comblib_sidney2008/smm)           57.00 25862.54
    ## 623  Consensus (ann/comblib_sidney2008/smm)           57.00 32956.23
    ## 624  Consensus (ann/comblib_sidney2008/smm)           57.00 34746.48
    ## 625  Consensus (ann/comblib_sidney2008/smm)           57.00 36536.21
    ## 626  Consensus (ann/comblib_sidney2008/smm)           58.00 34956.88
    ## 627  Consensus (ann/comblib_sidney2008/smm)           58.00 34423.16
    ## 628                     Consensus (ann/smm)           58.00 36686.33
    ## 629                     Consensus (ann/smm)           58.00 35508.48
    ## 630                     Consensus (ann/smm)           58.00 36044.22
    ## 631  Consensus (ann/comblib_sidney2008/smm)           58.00 40832.00
    ## 632  Consensus (ann/comblib_sidney2008/smm)           58.00 40401.77
    ## 633  Consensus (ann/comblib_sidney2008/smm)           58.00 31137.38
    ## 634  Consensus (ann/comblib_sidney2008/smm)           58.00 30933.88
    ## 635  Consensus (ann/comblib_sidney2008/smm)           58.00 26600.99
    ## 636  Consensus (ann/comblib_sidney2008/smm)           58.00 22472.69
    ## 637  Consensus (ann/comblib_sidney2008/smm)           58.00 32804.68
    ## 638  Consensus (ann/comblib_sidney2008/smm)           58.00 28402.08
    ## 639                     Consensus (ann/smm)           58.50 40444.62
    ## 640                     Consensus (ann/smm)           58.50 41325.78
    ## 641  Consensus (ann/comblib_sidney2008/smm)           59.00 31347.30
    ## 642  Consensus (ann/comblib_sidney2008/smm)           59.00 41313.26
    ## 643  Consensus (ann/comblib_sidney2008/smm)           59.00 40240.34
    ## 644  Consensus (ann/comblib_sidney2008/smm)           59.00 35118.01
    ## 645  Consensus (ann/comblib_sidney2008/smm)           59.00 32181.37
    ## 646  Consensus (ann/comblib_sidney2008/smm)           59.00 26387.72
    ## 647  Consensus (ann/comblib_sidney2008/smm)           60.00 29413.80
    ## 648  Consensus (ann/comblib_sidney2008/smm)           60.00 32115.27
    ## 649  Consensus (ann/comblib_sidney2008/smm)           60.00 32012.93
    ## 650  Consensus (ann/comblib_sidney2008/smm)           60.00 31178.83
    ## 651                     Consensus (ann/smm)           60.00 38342.53
    ## 652                     Consensus (ann/smm)           60.00 37345.53
    ## 653  Consensus (ann/comblib_sidney2008/smm)           60.00 41458.34
    ## 654  Consensus (ann/comblib_sidney2008/smm)           60.00 31571.61
    ## 655  Consensus (ann/comblib_sidney2008/smm)           60.00 36044.99
    ## 656  Consensus (ann/comblib_sidney2008/smm)           60.00 32640.03
    ## 657  Consensus (ann/comblib_sidney2008/smm)           60.00 36455.24
    ## 658                     Consensus (ann/smm)           60.50 40928.41
    ## 659                     Consensus (ann/smm)           60.50 38973.70
    ## 660  Consensus (ann/comblib_sidney2008/smm)           61.00 30667.28
    ## 661  Consensus (ann/comblib_sidney2008/smm)           61.00 36767.40
    ## 662  Consensus (ann/comblib_sidney2008/smm)           61.00 32162.22
    ## 663                     Consensus (ann/smm)           61.00 36469.05
    ## 664  Consensus (ann/comblib_sidney2008/smm)           61.00 42878.54
    ## 665  Consensus (ann/comblib_sidney2008/smm)           61.00 32037.88
    ## 666  Consensus (ann/comblib_sidney2008/smm)           61.00 32193.20
    ## 667  Consensus (ann/comblib_sidney2008/smm)           61.00 23947.82
    ## 668  Consensus (ann/comblib_sidney2008/smm)           61.00 30820.96
    ## 669  Consensus (ann/comblib_sidney2008/smm)           61.00 30301.49
    ## 670                     Consensus (ann/smm)           61.50 39191.89
    ## 671                     Consensus (ann/smm)           61.50 39543.29
    ## 672                     Consensus (ann/smm)           61.50 37879.88
    ## 673  Consensus (ann/comblib_sidney2008/smm)           62.00 32486.08
    ## 674  Consensus (ann/comblib_sidney2008/smm)           62.00 40640.27
    ## 675  Consensus (ann/comblib_sidney2008/smm)           62.00 25122.29
    ## 676  Consensus (ann/comblib_sidney2008/smm)           63.00 37616.84
    ## 677  Consensus (ann/comblib_sidney2008/smm)           63.00 37099.48
    ## 678                     Consensus (ann/smm)           63.00 40131.64
    ## 679  Consensus (ann/comblib_sidney2008/smm)           63.00 40729.61
    ## 680  Consensus (ann/comblib_sidney2008/smm)           63.00 32672.19
    ## 681  Consensus (ann/comblib_sidney2008/smm)           63.00 37147.68
    ## 682  Consensus (ann/comblib_sidney2008/smm)           63.00 33691.01
    ## 683  Consensus (ann/comblib_sidney2008/smm)           63.00 28701.73
    ## 684                     Consensus (ann/smm)           63.50 42880.86
    ## 685  Consensus (ann/comblib_sidney2008/smm)           64.00 35118.01
    ## 686                     Consensus (ann/smm)           64.00 39086.86
    ## 687                     Consensus (ann/smm)           64.00 37924.97
    ## 688  Consensus (ann/comblib_sidney2008/smm)           64.00 38522.18
    ## 689  Consensus (ann/comblib_sidney2008/smm)           64.00 33000.46
    ## 690  Consensus (ann/comblib_sidney2008/smm)           64.00 41097.03
    ## 691  Consensus (ann/comblib_sidney2008/smm)           64.00 36549.64
    ## 692  Consensus (ann/comblib_sidney2008/smm)           64.00 34070.05
    ## 693  Consensus (ann/comblib_sidney2008/smm)           64.00 38130.71
    ## 694  Consensus (ann/comblib_sidney2008/smm)           64.00 36075.43
    ## 695  Consensus (ann/comblib_sidney2008/smm)           64.00 23143.38
    ## 696                     Consensus (ann/smm)           64.50 37852.43
    ## 697                     Consensus (ann/smm)           64.50 40159.45
    ## 698                     Consensus (ann/smm)           64.50 40826.68
    ## 699  Consensus (ann/comblib_sidney2008/smm)           65.00 33204.62
    ## 700                     Consensus (ann/smm)           65.00 38289.06
    ## 701                     Consensus (ann/smm)           65.00 41477.65
    ## 702  Consensus (ann/comblib_sidney2008/smm)           65.00 38446.38
    ## 703  Consensus (ann/comblib_sidney2008/smm)           65.00 38250.53
    ## 704                     Consensus (ann/smm)           65.50 38593.09
    ## 705                     Consensus (ann/smm)           66.00 38440.97
    ## 706                     Consensus (ann/smm)           66.00 41765.40
    ## 707                     Consensus (ann/smm)           66.00 38528.41
    ## 708  Consensus (ann/comblib_sidney2008/smm)           66.00 40560.75
    ## 709  Consensus (ann/comblib_sidney2008/smm)           66.00 40697.48
    ## 710  Consensus (ann/comblib_sidney2008/smm)           66.00 33560.39
    ## 711  Consensus (ann/comblib_sidney2008/smm)           66.00 36128.93
    ## 712  Consensus (ann/comblib_sidney2008/smm)           66.00 29250.69
    ## 713  Consensus (ann/comblib_sidney2008/smm)           66.00 38482.17
    ## 714  Consensus (ann/comblib_sidney2008/smm)           66.00 36651.42
    ## 715                     Consensus (ann/smm)           66.50 43899.07
    ## 716  Consensus (ann/comblib_sidney2008/smm)           67.00 35197.89
    ## 717  Consensus (ann/comblib_sidney2008/smm)           67.00 25770.07
    ## 718  Consensus (ann/comblib_sidney2008/smm)           67.00 33056.57
    ## 719  Consensus (ann/comblib_sidney2008/smm)           67.00 34090.69
    ## 720  Consensus (ann/comblib_sidney2008/smm)           67.00 31087.21
    ## 721  Consensus (ann/comblib_sidney2008/smm)           67.00 33728.95
    ## 722  Consensus (ann/comblib_sidney2008/smm)           67.00 36759.03
    ## 723                     Consensus (ann/smm)           67.50 40219.89
    ## 724                     Consensus (ann/smm)           67.50 38265.04
    ## 725                     Consensus (ann/smm)           67.50 38639.04
    ## 726                     Consensus (ann/smm)           67.50 42436.38
    ## 727                     Consensus (ann/smm)           67.50 39332.50
    ## 728  Consensus (ann/comblib_sidney2008/smm)           68.00 29064.87
    ## 729                     Consensus (ann/smm)           68.00 43682.07
    ## 730  Consensus (ann/comblib_sidney2008/smm)           68.00 39890.07
    ## 731  Consensus (ann/comblib_sidney2008/smm)           68.00 32969.43
    ## 732  Consensus (ann/comblib_sidney2008/smm)           68.00 38946.71
    ## 733  Consensus (ann/comblib_sidney2008/smm)           68.00 31710.59
    ## 734                     Consensus (ann/smm)           68.50 42003.32
    ## 735                     Consensus (ann/smm)           68.50 43186.75
    ## 736  Consensus (ann/comblib_sidney2008/smm)           69.00 29976.38
    ## 737  Consensus (ann/comblib_sidney2008/smm)           69.00 28789.44
    ## 738  Consensus (ann/comblib_sidney2008/smm)           69.00 38128.64
    ## 739  Consensus (ann/comblib_sidney2008/smm)           69.00 39889.64
    ## 740                     Consensus (ann/smm)           69.00 41031.72
    ## 741                     Consensus (ann/smm)           69.00 40335.38
    ## 742  Consensus (ann/comblib_sidney2008/smm)           69.00 37349.17
    ## 743  Consensus (ann/comblib_sidney2008/smm)           69.00 38658.71
    ## 744  Consensus (ann/comblib_sidney2008/smm)           69.00 36732.02
    ## 745                     Consensus (ann/smm)           69.50 41509.07
    ## 746  Consensus (ann/comblib_sidney2008/smm)           70.00 38207.93
    ## 747  Consensus (ann/comblib_sidney2008/smm)           70.00 38216.21
    ## 748                     Consensus (ann/smm)           70.00 41017.52
    ## 749                     Consensus (ann/smm)           70.00 41195.42
    ## 750                     Consensus (ann/smm)           70.00 41664.30
    ## 751  Consensus (ann/comblib_sidney2008/smm)           70.00 36402.03
    ## 752  Consensus (ann/comblib_sidney2008/smm)           70.00 35058.79
    ## 753  Consensus (ann/comblib_sidney2008/smm)           70.00 39321.44
    ## 754  Consensus (ann/comblib_sidney2008/smm)           70.00 35910.69
    ## 755  Consensus (ann/comblib_sidney2008/smm)           70.00 36569.02
    ## 756  Consensus (ann/comblib_sidney2008/smm)           70.00 39319.31
    ## 757                     Consensus (ann/smm)           70.50 39724.69
    ## 758  Consensus (ann/comblib_sidney2008/smm)           71.00 38388.60
    ## 759  Consensus (ann/comblib_sidney2008/smm)           71.00 34815.34
    ## 760  Consensus (ann/comblib_sidney2008/smm)           71.00 33098.10
    ## 761  Consensus (ann/comblib_sidney2008/smm)           71.00 31861.24
    ## 762  Consensus (ann/comblib_sidney2008/smm)           71.00 38410.22
    ## 763  Consensus (ann/comblib_sidney2008/smm)           71.00 38864.64
    ## 764  Consensus (ann/comblib_sidney2008/smm)           71.00 34575.46
    ## 765  Consensus (ann/comblib_sidney2008/smm)           71.00 31277.17
    ## 766                     Consensus (ann/smm)           71.00 40199.43
    ## 767  Consensus (ann/comblib_sidney2008/smm)           71.00 40221.19
    ## 768  Consensus (ann/comblib_sidney2008/smm)           71.00 35163.63
    ## 769  Consensus (ann/comblib_sidney2008/smm)           71.00 41818.30
    ## 770  Consensus (ann/comblib_sidney2008/smm)           71.00 40303.97
    ## 771  Consensus (ann/comblib_sidney2008/smm)           71.00 31285.62
    ## 772  Consensus (ann/comblib_sidney2008/smm)           71.00 35130.18
    ## 773  Consensus (ann/comblib_sidney2008/smm)           71.00 34189.33
    ## 774  Consensus (ann/comblib_sidney2008/smm)           71.00 33819.21
    ## 775  Consensus (ann/comblib_sidney2008/smm)           71.00 38411.04
    ## 776                     Consensus (ann/smm)           71.50 42180.03
    ## 777                     Consensus (ann/smm)           71.50 42724.79
    ## 778  Consensus (ann/comblib_sidney2008/smm)           72.00 32824.91
    ## 779  Consensus (ann/comblib_sidney2008/smm)           72.00 38523.00
    ## 780  Consensus (ann/comblib_sidney2008/smm)           72.00 30757.99
    ## 781  Consensus (ann/comblib_sidney2008/smm)           72.00 32752.55
    ## 782  Consensus (ann/comblib_sidney2008/smm)           72.00 40989.56
    ## 783  Consensus (ann/comblib_sidney2008/smm)           72.00 35424.06
    ## 784  Consensus (ann/comblib_sidney2008/smm)           72.00 33477.34
    ## 785                     Consensus (ann/smm)           72.50 42917.99
    ## 786                     Consensus (ann/smm)           72.50 39791.36
    ## 787  Consensus (ann/comblib_sidney2008/smm)           73.00 32692.00
    ## 788  Consensus (ann/comblib_sidney2008/smm)           73.00 31512.90
    ## 789                     Consensus (ann/smm)           73.00 43582.01
    ## 790  Consensus (ann/comblib_sidney2008/smm)           73.00 41322.21
    ## 791  Consensus (ann/comblib_sidney2008/smm)           73.00 41817.88
    ## 792  Consensus (ann/comblib_sidney2008/smm)           73.00 34174.89
    ## 793  Consensus (ann/comblib_sidney2008/smm)           73.00 36527.89
    ## 794                     Consensus (ann/smm)           73.50 42517.27
    ## 795  Consensus (ann/comblib_sidney2008/smm)           74.00 37034.89
    ## 796  Consensus (ann/comblib_sidney2008/smm)           74.00 38658.71
    ## 797  Consensus (ann/comblib_sidney2008/smm)           74.00 36312.75
    ## 798                     Consensus (ann/smm)           74.00 43412.10
    ## 799  Consensus (ann/comblib_sidney2008/smm)           74.00 40772.40
    ## 800  Consensus (ann/comblib_sidney2008/smm)           74.00 33673.87
    ## 801  Consensus (ann/comblib_sidney2008/smm)           74.00 33706.68
    ## 802  Consensus (ann/comblib_sidney2008/smm)           74.00 39317.18
    ## 803  Consensus (ann/comblib_sidney2008/smm)           74.00 31115.15
    ## 804  Consensus (ann/comblib_sidney2008/smm)           74.00 40002.03
    ## 805                     Consensus (ann/smm)           74.50 42457.97
    ## 806                     Consensus (ann/smm)           74.50 43473.68
    ## 807                     Consensus (ann/smm)           74.50 41303.88
    ## 808                     Consensus (ann/smm)           74.50 43439.83
    ## 809  Consensus (ann/comblib_sidney2008/smm)           75.00 36700.62
    ## 810  Consensus (ann/comblib_sidney2008/smm)           75.00 35405.29
    ## 811                     Consensus (ann/smm)           75.00 39015.46
    ## 812  Consensus (ann/comblib_sidney2008/smm)           75.00 36448.54
    ## 813  Consensus (ann/comblib_sidney2008/smm)           75.00 36346.95
    ## 814  Consensus (ann/comblib_sidney2008/smm)           75.00 39869.80
    ## 815  Consensus (ann/comblib_sidney2008/smm)           75.00 36420.16
    ## 816  Consensus (ann/comblib_sidney2008/smm)           75.00 38459.70
    ## 817  Consensus (ann/comblib_sidney2008/smm)           75.00 40176.83
    ## 818  Consensus (ann/comblib_sidney2008/smm)           76.00 39201.22
    ## 819  Consensus (ann/comblib_sidney2008/smm)           76.00 31434.25
    ## 820                     Consensus (ann/smm)           76.00 43401.77
    ## 821                     Consensus (ann/smm)           76.00 41566.61
    ## 822  Consensus (ann/comblib_sidney2008/smm)           76.00 36609.80
    ## 823  Consensus (ann/comblib_sidney2008/smm)           76.00 37963.59
    ## 824  Consensus (ann/comblib_sidney2008/smm)           76.00 42159.50
    ## 825  Consensus (ann/comblib_sidney2008/smm)           76.00 37147.68
    ## 826  Consensus (ann/comblib_sidney2008/smm)           76.00 36804.81
    ## 827  Consensus (ann/comblib_sidney2008/smm)           76.00 31032.11
    ## 828  Consensus (ann/comblib_sidney2008/smm)           77.00 34427.65
    ## 829  Consensus (ann/comblib_sidney2008/smm)           77.00 37264.02
    ## 830  Consensus (ann/comblib_sidney2008/smm)           77.00 39310.79
    ## 831  Consensus (ann/comblib_sidney2008/smm)           77.00 37079.41
    ## 832  Consensus (ann/comblib_sidney2008/smm)           77.00 37165.77
    ## 833  Consensus (ann/comblib_sidney2008/smm)           77.00 37162.55
    ## 834  Consensus (ann/comblib_sidney2008/smm)           77.00 41315.07
    ## 835                     Consensus (ann/smm)           77.50 44654.55
    ## 836  Consensus (ann/comblib_sidney2008/smm)           78.00 39430.94
    ## 837  Consensus (ann/comblib_sidney2008/smm)           78.00 37969.73
    ## 838                     Consensus (ann/smm)           78.00 41834.14
    ## 839                     Consensus (ann/smm)           78.00 43503.80
    ## 840  Consensus (ann/comblib_sidney2008/smm)           78.00 34995.11
    ## 841  Consensus (ann/comblib_sidney2008/smm)           78.00 40719.06
    ## 842  Consensus (ann/comblib_sidney2008/smm)           78.00 40100.83
    ## 843                     Consensus (ann/smm)           78.50 45876.93
    ## 844  Consensus (ann/comblib_sidney2008/smm)           79.00 39222.01
    ## 845  Consensus (ann/comblib_sidney2008/smm)           79.00 34926.28
    ## 846  Consensus (ann/comblib_sidney2008/smm)           79.00 39665.84
    ## 847  Consensus (ann/comblib_sidney2008/smm)           79.00 33871.94
    ## 848                     Consensus (ann/smm)           79.00 44743.05
    ## 849  Consensus (ann/comblib_sidney2008/smm)           79.00 37719.16
    ## 850  Consensus (ann/comblib_sidney2008/smm)           79.00 39887.06
    ## 851  Consensus (ann/comblib_sidney2008/smm)           79.00 40751.66
    ## 852  Consensus (ann/comblib_sidney2008/smm)           79.00 30636.44
    ## 853                     Consensus (ann/smm)           79.50 43995.61
    ## 854  Consensus (ann/comblib_sidney2008/smm)           80.00 33693.20
    ## 855  Consensus (ann/comblib_sidney2008/smm)           80.00 35401.84
    ## 856  Consensus (ann/comblib_sidney2008/smm)           80.00 35840.45
    ## 857                     Consensus (ann/smm)           80.50 43462.86
    ## 858                     Consensus (ann/smm)           80.50 42301.15
    ## 859  Consensus (ann/comblib_sidney2008/smm)           81.00 37141.23
    ## 860  Consensus (ann/comblib_sidney2008/smm)           81.00 39861.61
    ## 861                     Consensus (ann/smm)           81.00 44784.71
    ## 862  Consensus (ann/comblib_sidney2008/smm)           81.00 38145.15
    ## 863  Consensus (ann/comblib_sidney2008/smm)           81.00 41698.14
    ## 864  Consensus (ann/comblib_sidney2008/smm)           81.00 34214.85
    ## 865  Consensus (ann/comblib_sidney2008/smm)           81.00 36486.03
    ## 866                     Consensus (ann/smm)           81.50 43524.52
    ## 867                     Consensus (ann/smm)           81.50 44210.83
    ## 868  Consensus (ann/comblib_sidney2008/smm)           82.00 34821.00
    ## 869  Consensus (ann/comblib_sidney2008/smm)           82.00 33773.85
    ## 870  Consensus (ann/comblib_sidney2008/smm)           82.00 34179.34
    ## 871                     Consensus (ann/smm)           82.00 43580.58
    ## 872                     Consensus (ann/smm)           82.00 42850.70
    ## 873  Consensus (ann/comblib_sidney2008/smm)           82.00 38492.60
    ## 874  Consensus (ann/comblib_sidney2008/smm)           82.00 38354.97
    ## 875  Consensus (ann/comblib_sidney2008/smm)           82.00 40085.21
    ## 876  Consensus (ann/comblib_sidney2008/smm)           82.00 36587.23
    ## 877  Consensus (ann/comblib_sidney2008/smm)           82.00 38681.73
    ## 878  Consensus (ann/comblib_sidney2008/smm)           82.00 33946.77
    ## 879                     Consensus (ann/smm)           82.50 43493.90
    ## 880                     Consensus (ann/smm)           82.50 42337.31
    ## 881  Consensus (ann/comblib_sidney2008/smm)           83.00 37859.38
    ## 882  Consensus (ann/comblib_sidney2008/smm)           83.00 40245.14
    ## 883                     Consensus (ann/smm)           83.00 42709.53
    ## 884                     Consensus (ann/smm)           83.00 42499.78
    ## 885  Consensus (ann/comblib_sidney2008/smm)           83.00 35738.59
    ## 886  Consensus (ann/comblib_sidney2008/smm)           83.00 28100.69
    ## 887  Consensus (ann/comblib_sidney2008/smm)           83.00 33598.55
    ## 888  Consensus (ann/comblib_sidney2008/smm)           83.00 37011.27
    ## 889                     Consensus (ann/smm)           83.50 44659.39
    ## 890  Consensus (ann/comblib_sidney2008/smm)           84.00 34143.10
    ## 891                     Consensus (ann/smm)           84.00 43933.29
    ## 892                     Consensus (ann/smm)           84.00 43772.93
    ## 893                     Consensus (ann/smm)           84.00 44832.71
    ## 894  Consensus (ann/comblib_sidney2008/smm)           84.00 38988.02
    ## 895  Consensus (ann/comblib_sidney2008/smm)           84.00 45071.03
    ## 896  Consensus (ann/comblib_sidney2008/smm)           84.00 39665.84
    ## 897  Consensus (ann/comblib_sidney2008/smm)           84.00 36651.42
    ## 898  Consensus (ann/comblib_sidney2008/smm)           84.00 34853.42
    ## 899  Consensus (ann/comblib_sidney2008/smm)           84.00 35453.20
    ## 900                     Consensus (ann/smm)           84.50 43142.38
    ## 901                     Consensus (ann/smm)           85.00 44392.03
    ## 902                     Consensus (ann/smm)           85.00 45004.26
    ## 903                     Consensus (ann/smm)           85.00 44072.31
    ## 904                     Consensus (ann/smm)           85.00 43119.07
    ## 905  Consensus (ann/comblib_sidney2008/smm)           85.00 41776.25
    ## 906                     Consensus (ann/smm)           85.50 46076.43
    ## 907  Consensus (ann/comblib_sidney2008/smm)           86.00 34352.11
    ## 908  Consensus (ann/comblib_sidney2008/smm)           86.00 35036.77
    ## 909                     Consensus (ann/smm)           86.00 44625.56
    ## 910                     Consensus (ann/smm)           86.00 43903.35
    ## 911  Consensus (ann/comblib_sidney2008/smm)           86.00 39556.99
    ## 912  Consensus (ann/comblib_sidney2008/smm)           86.00 39659.42
    ## 913  Consensus (ann/comblib_sidney2008/smm)           86.00 39672.72
    ## 914  Consensus (ann/comblib_sidney2008/smm)           86.00 41626.00
    ## 915  Consensus (ann/comblib_sidney2008/smm)           86.00 35239.82
    ## 916  Consensus (ann/comblib_sidney2008/smm)           86.00 31066.37
    ## 917  Consensus (ann/comblib_sidney2008/smm)           86.00 37543.67
    ## 918  Consensus (ann/comblib_sidney2008/smm)           86.00 37206.01
    ## 919                     Consensus (ann/smm)           86.50 46710.89
    ## 920  Consensus (ann/comblib_sidney2008/smm)           87.00 38869.25
    ## 921                     Consensus (ann/smm)           87.00 43683.03
    ## 922                     Consensus (ann/smm)           87.00 44597.11
    ## 923  Consensus (ann/comblib_sidney2008/smm)           87.00 40094.31
    ## 924  Consensus (ann/comblib_sidney2008/smm)           87.00 39982.56
    ## 925                     Consensus (ann/smm)           87.50 44257.73
    ## 926                     Consensus (ann/smm)           87.50 45434.81
    ## 927                     Consensus (ann/smm)           87.50 44451.12
    ## 928  Consensus (ann/comblib_sidney2008/smm)           88.00 31508.82
    ## 929                     Consensus (ann/smm)           88.00 45036.92
    ## 930                     Consensus (ann/smm)           88.00 45012.56
    ## 931                     Consensus (ann/smm)           88.00 44768.25
    ## 932  Consensus (ann/comblib_sidney2008/smm)           88.00 34931.19
    ## 933  Consensus (ann/comblib_sidney2008/smm)           88.00 34885.85
    ## 934                     Consensus (ann/smm)           88.50 44501.67
    ## 935  Consensus (ann/comblib_sidney2008/smm)           89.00 31481.56
    ## 936                     Consensus (ann/smm)           89.00 43552.31
    ## 937  Consensus (ann/comblib_sidney2008/smm)           89.00 42293.38
    ## 938  Consensus (ann/comblib_sidney2008/smm)           89.00 40690.42
    ## 939  Consensus (ann/comblib_sidney2008/smm)           89.00 38679.21
    ## 940  Consensus (ann/comblib_sidney2008/smm)           89.00 40507.25
    ## 941  Consensus (ann/comblib_sidney2008/smm)           89.00 40516.44
    ## 942  Consensus (ann/comblib_sidney2008/smm)           89.00 38780.61
    ## 943                     Consensus (ann/smm)           89.50 44110.50
    ## 944                     Consensus (ann/smm)           90.00 45119.83
    ## 945                     Consensus (ann/smm)           90.00 44697.08
    ## 946  Consensus (ann/comblib_sidney2008/smm)           90.00 44261.07
    ## 947  Consensus (ann/comblib_sidney2008/smm)           90.00 42284.21
    ## 948  Consensus (ann/comblib_sidney2008/smm)           90.00 37589.58
    ## 949  Consensus (ann/comblib_sidney2008/smm)           90.00 40923.98
    ## 950  Consensus (ann/comblib_sidney2008/smm)           90.00 36495.89
    ## 951  Consensus (ann/comblib_sidney2008/smm)           90.00 37034.51
    ## 952  Consensus (ann/comblib_sidney2008/smm)           90.00 35256.59
    ## 953  Consensus (ann/comblib_sidney2008/smm)           91.00 38680.45
    ## 954  Consensus (ann/comblib_sidney2008/smm)           91.00 34281.93
    ## 955                     Consensus (ann/smm)           91.00 45490.90
    ## 956  Consensus (ann/comblib_sidney2008/smm)           91.00 40201.61
    ## 957  Consensus (ann/comblib_sidney2008/smm)           91.00 39381.05
    ## 958                     Consensus (ann/smm)           91.50 44740.62
    ## 959                     Consensus (ann/smm)           91.50 45255.25
    ## 960  Consensus (ann/comblib_sidney2008/smm)           92.00 33941.28
    ## 961  Consensus (ann/comblib_sidney2008/smm)           92.00 41771.73
    ## 962  Consensus (ann/comblib_sidney2008/smm)           92.00 38028.52
    ## 963  Consensus (ann/comblib_sidney2008/smm)           92.00 41439.07
    ## 964  Consensus (ann/comblib_sidney2008/smm)           92.00 32891.40
    ## 965  Consensus (ann/comblib_sidney2008/smm)           92.00 41377.25
    ## 966  Consensus (ann/comblib_sidney2008/smm)           92.00 42432.24
    ## 967  Consensus (ann/comblib_sidney2008/smm)           92.00 37660.43
    ## 968  Consensus (ann/comblib_sidney2008/smm)           93.00 38524.26
    ## 969                     Consensus (ann/smm)           93.00 46309.83
    ## 970  Consensus (ann/comblib_sidney2008/smm)           93.00 41970.18
    ## 971  Consensus (ann/comblib_sidney2008/smm)           93.00 42938.42
    ## 972  Consensus (ann/comblib_sidney2008/smm)           93.00 42046.06
    ## 973  Consensus (ann/comblib_sidney2008/smm)           93.00 41775.34
    ## 974  Consensus (ann/comblib_sidney2008/smm)           93.00 43413.98
    ## 975  Consensus (ann/comblib_sidney2008/smm)           93.00 39970.00
    ## 976                     Consensus (ann/smm)           94.00 45572.18
    ## 977                     Consensus (ann/smm)           94.00 46016.14
    ## 978                     Consensus (ann/smm)           94.00 46009.67
    ## 979  Consensus (ann/comblib_sidney2008/smm)           94.00 42066.10
    ## 980                     Consensus (ann/smm)           94.50 45714.41
    ## 981                     Consensus (ann/smm)           95.00 45820.37
    ## 982  Consensus (ann/comblib_sidney2008/smm)           95.00 42543.02
    ## 983  Consensus (ann/comblib_sidney2008/smm)           95.00 40868.67
    ## 984  Consensus (ann/comblib_sidney2008/smm)           96.00 33665.14
    ## 985                     Consensus (ann/smm)           96.00 46941.91
    ## 986                     Consensus (ann/smm)           96.00 46649.27
    ## 987  Consensus (ann/comblib_sidney2008/smm)           96.00 43183.02
    ## 988  Consensus (ann/comblib_sidney2008/smm)           96.00 43029.12
    ## 989  Consensus (ann/comblib_sidney2008/smm)           96.00 42987.24
    ## 990  Consensus (ann/comblib_sidney2008/smm)           97.00 44239.07
    ## 991  Consensus (ann/comblib_sidney2008/smm)           98.00 38445.56
    ## 992                     Consensus (ann/smm)           98.00 46779.17
    ## 993  Consensus (ann/comblib_sidney2008/smm)           98.00 43782.39
    ## 994  Consensus (ann/comblib_sidney2008/smm)           98.00 44094.74
    ## 995  Consensus (ann/comblib_sidney2008/smm)           98.00 43675.00
    ## 996  Consensus (ann/comblib_sidney2008/smm)           98.00 44003.70
    ## 997  Consensus (ann/comblib_sidney2008/smm)           98.00 44106.66
    ## 998  Consensus (ann/comblib_sidney2008/smm)           98.00 40474.84
    ## 999                     Consensus (ann/smm)           99.00 47114.94
    ## 1000 Consensus (ann/comblib_sidney2008/smm)           99.00 44289.82
    ## 1001                    Consensus (ann/smm)           99.50 47626.95
    ## 1002                    Consensus (ann/smm)           99.50 47424.88
    ## 1003 Consensus (ann/comblib_sidney2008/smm)          100.00 43756.82
    ## 1004 Consensus (ann/comblib_sidney2008/smm)          100.00 36587.63
    ##      ann_rank     smm_ic50 smm_rank comblib_sidney2008_score
    ## 1        0.06        25.58      0.2                 7.42e-06
    ## 2        0.13        24.54      0.2                 6.61e-05
    ## 3        0.02         3.90      0.2                 3.63e-06
    ## 4        0.02         6.16      0.2                 0.000698
    ## 5        0.18        50.11      0.4                 0.000137
    ## 6        0.05        17.66      0.4                 9.93e-06
    ## 7        0.14        66.51      0.5                 6.56e-05
    ## 8        0.67       440.44      1.8                 1.06e-06
    ## 9        0.20        69.26      1.2                        -
    ## 10       0.39        41.03      0.7                 1.91e-05
    ## 11       0.10        43.91      0.8                 0.000261
    ## 12       0.92        97.25      0.6                 6.75e-05
    ## 13       0.47       108.02      1.7                        -
    ## 14       1.80       238.72      1.1                 1.68e-05
    ## 15       1.20       197.29      2.7                 8.28e-06
    ## 16       0.13        87.41      1.3                 0.000117
    ## 17       0.10        77.37      1.2                  0.00216
    ## 18       1.40       103.15      1.6                        -
    ## 19       1.40       149.10      2.2                        -
    ## 20       2.40       563.49      2.1                 4.45e-05
    ## 21       0.95       133.08      2.1                  0.00118
    ## 22       1.30       165.04      2.1                  0.00052
    ## 23       0.61       273.84      3.6                        -
    ## 24       0.24       170.44      2.2                   0.0026
    ## 25       2.20       710.53      5.8                 0.000187
    ## 26       0.90       164.10      2.3                 6.61e-05
    ## 27       0.75       179.30      2.3                 0.000226
    ## 28       2.40       420.62      1.8                 0.000172
    ## 29       1.90       216.52      3.1                        -
    ## 30       2.50      1289.97      8.7                 0.000212
    ## 31       0.43       253.27      3.0                 0.000228
    ## 32       2.80       899.27      3.1                 3.26e-05
    ## 33       1.40       347.93      4.4                        -
    ## 34       2.80       850.92      3.0                  0.00194
    ## 35       1.40       228.09      3.0                 0.000537
    ## 36       3.90       918.10      3.1                 6.62e-05
    ## 37       2.20       232.33      3.1                 9.57e-05
    ## 38       0.57       267.66      3.1                 0.000541
    ## 39       2.30       246.67      3.2                 0.000234
    ## 40       1.20       246.67      3.2                  0.00462
    ## 41       2.00      1051.70      3.3                 0.000925
    ## 42       2.80       352.77      4.4                        -
    ## 43       1.80       333.87      3.6                  0.00142
    ## 44       3.90       848.36      6.5                 0.000256
    ## 45       3.50       358.19      4.0                 0.000736
    ## 46       3.60       373.34      4.1                 0.000361
    ## 47       2.40       561.68      6.0                        -
    ## 48       4.20      1195.58      8.3                 9.91e-05
    ## 49       1.10       427.15      4.2                  0.00256
    ## 50       4.30      1221.49      3.7                 0.000609
    ## 51       2.20       637.51      6.6                        -
    ## 52       4.50      2403.75      5.7                 0.000126
    ## 53       1.40       529.15      4.9                 0.000409
    ## 54       2.60       466.78      4.6                 0.000205
    ## 55       2.10       480.37      4.6                  0.00104
    ## 56       4.10       459.72      5.2                        -
    ## 57       4.90      1896.23      4.8                 6.67e-05
    ## 58       1.60      1100.47      7.7                 0.000442
    ## 59       1.30       500.70      4.8                 0.000552
    ## 60       0.75       507.67      4.8                  0.00264
    ## 61       5.20       360.99      4.5                        -
    ## 62       1.60       514.73      4.9                     0.02
    ## 63       2.30      2079.17      5.1                  0.00327
    ## 64       4.80       563.78      5.1                 0.000327
    ## 65       1.50       592.35      5.2                  0.00267
    ## 66       2.10       589.63      5.2                   0.0024
    ## 67       5.30       920.68      7.0                 8.36e-06
    ## 68       2.80       608.95      5.3                  0.00368
    ## 69       1.60       603.36      5.3                    0.002
    ## 70       6.20      2359.88      5.6                 0.000102
    ## 71       3.50      1612.80     11.0                 0.000568
    ## 72       3.60      2703.27      6.1                 0.000275
    ## 73       6.20      5139.13      9.3                 2.27e-05
    ## 74       6.20      2295.57      5.5                 0.000424
    ## 75       6.30      2909.98      6.4                  0.00239
    ## 76       6.40      2557.94      5.9                 0.000279
    ## 77       1.40       797.22      6.4                     0.02
    ## 78       2.40      1041.31      7.5                 0.000605
    ## 79       3.80      1110.43      9.3                        -
    ## 80       6.60      5100.12     21.0                 0.000598
    ## 81       4.70      1050.73      9.0                        -
    ## 82       6.90       899.73      6.9                  0.00457
    ## 83       7.10      1142.59      3.6                 0.000265
    ## 84       7.70      5859.90     11.0                 5.71e-05
    ## 85       4.70      1104.36      7.7                     0.01
    ## 86       4.60      1394.73     12.0                        -
    ## 87       8.30      3728.89     18.0                  0.00016
    ## 88      14.00      2376.24      5.6                 0.000274
    ## 89       8.40     17453.80     20.0                 2.75e-05
    ## 90       9.00       854.06      7.8                        -
    ## 91       6.90      1315.56      8.5                  0.00124
    ## 92       7.70      1141.54      9.4                        -
    ## 93       5.20      1433.80     12.0                        -
    ## 94       5.70      1572.14     12.0                        -
    ## 95      18.00      1429.26      8.9                 3.44e-06
    ## 96       9.00      1900.60      4.8                 0.000432
    ## 97       6.10      2948.36     16.0                 0.000891
    ## 98      12.00      5056.97      9.2                 5.89e-05
    ## 99       9.00      1527.95      9.2                 0.000376
    ## 100      9.20      7287.52     24.0                 0.000861
    ## 101      6.50      1347.38     12.0                        -
    ## 102      5.70      1993.33     13.0                 0.000953
    ## 103      8.20      1481.09      9.6                     0.01
    ## 104      9.80      2521.04     14.0                 0.000523
    ## 105      6.80      1627.38     13.0                        -
    ## 106      9.80      5687.09     10.0                 0.000644
    ## 107      3.70      1572.46     10.0                  0.00316
    ## 108     12.00      1257.45      9.9                        -
    ## 109      9.10      6712.59     12.0                  0.00333
    ## 110      8.80      6605.26     12.0                 0.000434
    ## 111      9.60      6821.66     12.0                 0.000762
    ## 112     12.00      3989.24      8.1                 0.000698
    ## 113      6.50      6884.78     12.0                   0.0021
    ## 114     10.00      6395.73     12.0                  0.00054
    ## 115      8.00      1824.36     12.0                 0.000434
    ## 116     12.00      1298.91      8.8                     0.02
    ## 117     12.00      4174.26     19.0                   0.0011
    ## 118      5.50      1700.51     12.0                   0.0016
    ## 119      3.80      1776.56     12.0                     0.01
    ## 120      2.90      1732.13     12.0                  0.00333
    ## 121      4.20      1650.36     12.0                     0.01
    ## 122     12.00     16277.21     35.0                 0.000889
    ## 123     13.00     37058.68     27.0                 0.000297
    ## 124     13.00      1531.48      9.2                 0.000348
    ## 125      2.50      2087.28     13.0                     0.01
    ## 126      5.30      1956.95     13.0                     0.01
    ## 127      5.70      1894.87     13.0                  0.00166
    ## 128      4.50      2039.76     13.0                  0.00473
    ## 129      3.10      2016.42     13.0                     0.01
    ## 130      3.50      1993.33     13.0                   0.0026
    ## 131      2.40      1970.52     13.0                  0.00175
    ## 132      3.30      2092.09     13.0                     0.01
    ## 133     14.00      4354.02      8.4                  0.00111
    ## 134     13.00      8450.65     14.0                 0.000557
    ## 135      8.30      8450.65     14.0                 0.000496
    ## 136     22.00      2679.85     14.0                 0.000152
    ## 137     14.00      1875.47     12.0                     0.01
    ## 138      8.40      4330.92     19.0                  0.00136
    ## 139     11.00      3129.61     18.0                        -
    ## 140     12.00      3030.33     17.0                        -
    ## 141     15.00     10277.56     15.0                  0.00203
    ## 142     15.00      6666.38     12.0                 0.000869
    ## 143     14.00     16629.91     19.0                 0.000481
    ## 144     19.00     10113.23     15.0                 0.000347
    ## 145     14.00      2480.22     16.0                        -
    ## 146     18.00      1504.84     12.0                        -
    ## 147     31.00      3192.35     15.0                 5.88e-05
    ## 148      6.80      2609.64     15.0                  0.00306
    ## 149      2.50      2726.34     15.0                   0.0027
    ## 150     13.00      2868.01     15.0                     0.04
    ## 151      6.40      6004.68     24.0                        -
    ## 152     14.00     11063.44     16.0                  0.00219
    ## 153     16.00      6868.94     12.0                  0.00448
    ## 154     16.00     11611.54     16.0                  0.00012
    ## 155     14.00     11584.84     16.0                 0.000906
    ## 156     15.00     11037.99     16.0                  0.00121
    ## 157     12.00      4144.67     20.0                        -
    ## 158     17.00      3733.45     16.0                  9.5e-05
    ## 159     17.00      3707.75     16.0                 2.29e-05
    ## 160     16.00      2524.12     13.0                  0.00255
    ## 161     16.00      7296.42     21.0                 0.000167
    ## 162     16.00      7917.35     25.0                 0.000658
    ## 163      6.00      3144.71     16.0                     0.01
    ## 164      8.30     10754.25     29.0                  0.00153
    ## 165      7.10      3073.12     16.0                  0.00242
    ## 166     16.00     13079.16     32.0                  0.00137
    ## 167     18.00     12790.57     17.0                 0.000399
    ## 168     15.00      3618.18     19.0                        -
    ## 169     17.00      3991.26     16.0                  0.00296
    ## 170     17.00      1578.01      9.4                 0.000379
    ## 171     16.00      4257.06     17.0                  0.00228
    ## 172      5.60      3361.86     17.0                  0.00265
    ## 173      2.40      3369.61     17.0                     0.01
    ## 174      5.70      3408.63     17.0                  0.00408
    ## 175      9.00      3504.13     17.0                  0.00443
    ## 176      6.70      3323.38     17.0                     0.01
    ## 177      9.60      3480.01     17.0                     0.01
    ## 178     17.00     10461.16     29.0                 0.000611
    ## 179     18.00      2707.01     17.0                        -
    ## 180     18.00     19764.69     21.0                 0.000509
    ## 181     13.00     14089.32     18.0                  0.00112
    ## 182     14.00     15166.66     18.0                     0.01
    ## 183     24.00      1325.84     12.0                        -
    ## 184     17.00      3634.88     19.0                        -
    ## 185     28.00      5059.53     18.0                 0.000181
    ## 186     22.00      5371.68     18.0                 0.000345
    ## 187     16.00     11955.84     31.0                  0.00199
    ## 188      8.80      3746.11     18.0                     0.01
    ## 189      6.00      3763.40     18.0                     0.01
    ## 190     13.00      5681.85     24.0                        -
    ## 191     19.00     30895.13     25.0                 0.000386
    ## 192      9.40     16783.79     19.0                  0.00127
    ## 193     19.00     30122.43     25.0                 0.000295
    ## 194     26.00      1487.61     12.0                        -
    ## 195     15.00      5376.38     23.0                        -
    ## 196     19.00      4406.66     17.0                  0.00121
    ## 197     19.00      9853.26     28.0                 0.000723
    ## 198      4.20      4350.91     19.0                     0.02
    ## 199      6.60      7007.77     24.0                  0.00214
    ## 200     15.00      5171.07     21.0                    0.002
    ## 201      6.20      4555.96     19.0                     0.02
    ## 202     20.00     77426.57     37.0                 0.000726
    ## 203      9.80     17655.91     20.0                  0.00131
    ## 204     19.00     18488.00     20.0                     0.01
    ## 205     16.00     19226.05     20.0                     0.01
    ## 206     20.00      5509.47     19.0                  0.00435
    ## 207     28.00      6563.11     20.0                 0.000213
    ## 208      6.50      4619.34     20.0                     0.01
    ## 209     13.00     18054.27     36.0                  0.00223
    ## 210      9.90      4759.70     20.0                  0.00477
    ## 211     20.00     17281.44     35.0                  0.00103
    ## 212     21.00     17942.79     20.0                  0.00103
    ## 213     21.00     39526.65     28.0                 0.000205
    ## 214     16.00     22850.20     22.0                 0.000788
    ## 215     15.00     20839.63     21.0                 0.000873
    ## 216     18.00     20696.17     21.0                     0.01
    ## 217     18.00      5963.35     24.0                        -
    ## 218     33.00      7380.91     21.0                 0.000159
    ## 219     18.00      6345.85     25.0                        -
    ## 220     27.00      2603.09     16.0                        -
    ## 221     22.00     70613.87     36.0                 0.000873
    ## 222     22.00     10089.97     15.0                  0.00112
    ## 223     15.00     22227.47     22.0                     0.01
    ## 224     19.00      6737.36     25.0                        -
    ## 225     12.00      7474.46     25.0                  0.00266
    ## 226      7.30      5992.11     22.0                     0.01
    ## 227      7.10      5762.09     22.0                     0.01
    ## 228     16.00      8719.47     29.0                        -
    ## 229     19.00     23817.16     23.0                  0.00259
    ## 230     23.00     37660.84     28.0                 0.000373
    ## 231      9.90     24710.98     23.0                 0.000887
    ## 232     19.00     36382.29     27.0                  0.00094
    ## 233     17.00     23707.73     23.0                  0.00421
    ## 234     32.00      9122.42     23.0                 7.71e-05
    ## 235      7.20      6435.47     23.0                  0.00318
    ## 236     23.00     50070.28     52.0                  0.00273
    ## 237      9.80      6231.32     23.0                     0.02
    ## 238     39.00       762.94      7.3                        -
    ## 239     24.00     20506.43     21.0                  0.00305
    ## 240     18.00     27854.16     24.0                  0.00245
    ## 241     24.00     17494.04     20.0                  0.00451
    ## 242     19.00     27982.72     24.0                     0.03
    ## 243     25.00      5099.06     23.0                        -
    ## 244     24.00      8812.72     22.0                  0.00161
    ## 245      9.30      7204.10     24.0                     0.01
    ## 246     23.00      7171.00     24.0                     0.01
    ## 247     18.00     10293.90     29.0                  0.00293
    ## 248     23.00      7038.66     26.0                        -
    ## 249     16.00     11925.87     33.0                        -
    ## 250     21.00      8250.68     28.0                        -
    ## 251     16.00     28966.10     25.0                  0.00106
    ## 252     43.00     11300.82     25.0                    4e-05
    ## 253     21.00     40418.48     49.0                  0.00321
    ## 254     24.00     29012.16     43.0                  0.00314
    ## 255      9.90     14111.72     33.0                  0.00313
    ## 256      6.50      7683.87     25.0                     0.01
    ## 257     25.00      7038.66     26.0                        -
    ## 258     26.00     34426.27     26.0                  0.00338
    ## 259     19.00     11681.27     33.0                        -
    ## 260     24.00     12885.76     26.0                 0.000853
    ## 261     26.00      5310.19     18.0                 0.000962
    ## 262     26.00     60754.72     56.0                  0.00341
    ## 263     26.00     38688.33     48.0                 0.000787
    ## 264     24.00     74625.97     37.0                  0.00115
    ## 265     31.00      5413.65     23.0                        -
    ## 266     19.00     13567.19     35.0                        -
    ## 267     19.00     14239.34     35.0                        -
    ## 268     25.00      8902.05     29.0                        -
    ## 269     30.00      6004.68     24.0                        -
    ## 270     28.00     15420.91     27.0                 0.000191
    ## 271      9.50      9628.97     28.0                  0.00349
    ## 272      8.50      9153.35     27.0                     0.03
    ## 273      8.10      8641.32     27.0                     0.03
    ## 274     15.00     19565.46     40.0                        -
    ## 275     22.00     37921.89     28.0                  0.00491
    ## 276     13.00     37834.67     28.0                     0.01
    ## 277     28.00     11860.69     25.0                  0.00454
    ## 278     24.00      9540.69     28.0                     0.01
    ## 279     16.00      9695.72     28.0                  0.00497
    ## 280     14.00     10013.36     28.0                     0.05
    ## 281     29.00     34824.91     27.0                  0.00448
    ## 282     29.00    206485.71     51.0                 0.000733
    ## 283     17.00     43841.96     29.0                     0.01
    ## 284     26.00     10851.51     32.0                        -
    ## 285     75.00     17746.39     29.0                 4.37e-05
    ## 286     33.00     18412.38     29.0                 6.63e-05
    ## 287     29.00     59508.64     55.0                  0.00159
    ## 288     12.00     10509.45     29.0                     0.01
    ## 289     26.00     11953.36     33.0                        -
    ## 290     18.00     21403.76     41.0                        -
    ## 291     24.00     92233.78     39.0                  0.00138
    ## 292     30.00     45278.29     30.0                  0.00224
    ## 293     26.00     47194.35     30.0                  0.00384
    ## 294     30.00    157358.42     47.0                 0.000995
    ## 295     18.00     46226.39     30.0                  0.00209
    ## 296     21.00     47194.35     30.0                   0.0026
    ## 297     28.00     46546.82     30.0                   0.0034
    ## 298     38.00      4925.95     22.0                        -
    ## 299     19.00     20253.03     41.0                        -
    ## 300     30.00     19458.53     30.0                  0.00319
    ## 301     16.00     11004.75     30.0                     0.02
    ## 302     15.00     11004.75     30.0                     0.04
    ## 303     16.00     13727.14     32.0                  0.00405
    ## 304     28.00     61741.90     56.0                  0.00404
    ## 305     28.00     47961.20     31.0                  0.00173
    ## 306     31.00    161394.97     47.0                  0.00064
    ## 307     19.00    122149.02     43.0                   0.0015
    ## 308     40.00     22548.10     31.0                 0.000223
    ## 309      9.10     12781.45     31.0                     0.01
    ## 310     26.00     12178.11     31.0                     0.04
    ## 311     30.00     12664.27     31.0                     0.01
    ## 312     29.00     73889.04     59.0                  0.00425
    ## 313     24.00     12290.80     31.0                     0.01
    ## 314      9.00     12752.05     31.0                     0.01
    ## 315     22.00     20964.77     41.0                        -
    ## 316     32.00     97698.97     40.0                 0.000918
    ## 317     25.00    141217.98     45.0                  0.00157
    ## 318     32.00    373155.63     59.0                 0.000813
    ## 319     29.00     14173.92     35.0                        -
    ## 320     32.00     27932.51     33.0                 0.000549
    ## 321     63.00     25888.69     32.0                 0.000311
    ## 322     36.00     17502.90     28.0                 0.000849
    ## 323     47.00     25651.34     32.0                 0.000223
    ## 324     26.00     24666.64     32.0                     0.01
    ## 325     65.00     25125.23     32.0                 0.000324
    ## 326     21.00     12870.04     32.0                     0.01
    ## 327     23.00     13049.08     32.0                     0.01
    ## 328     22.00     23631.43     43.0                        -
    ## 329     23.00     58464.20     33.0                  0.00224
    ## 330     23.00     59005.16     33.0                     0.02
    ## 331     33.00    139280.40     45.0                  0.00105
    ## 332     33.00    105169.55     41.0                  0.00153
    ## 333     33.00     12305.80     25.0                     0.01
    ## 334     36.00     27296.69     33.0                 0.000304
    ## 335     53.00     27612.77     33.0                 0.000131
    ## 336     33.00     15743.82     27.0                  0.00241
    ## 337     22.00     14947.89     33.0                     0.06
    ## 338     34.00     72092.49     36.0                 0.000416
    ## 339     28.00     19746.49     40.0                        -
    ## 340     42.00      7136.58     26.0                        -
    ## 341     28.00     19120.09     40.0                        -
    ## 342     34.00     15350.06     27.0                     0.01
    ## 343     37.00     29047.58     34.0                 0.000208
    ## 344     22.00     15296.07     34.0                     0.02
    ## 345     16.00     16053.88     34.0                     0.01
    ## 346     35.00    127318.06     44.0                   0.0013
    ## 347     39.00     10604.50     31.0                        -
    ## 348     30.00     18857.76     40.0                        -
    ## 349     32.00     17198.48     38.0                        -
    ## 350     46.00     31923.46     35.0                 0.000155
    ## 351     40.00     13004.99     26.0                  0.00104
    ## 352     22.00     16277.21     35.0                     0.01
    ## 353     35.00     68011.13     58.0                   0.0026
    ## 354     22.00     17481.55     35.0                     0.06
    ## 355     22.00     16390.04     35.0                     0.01
    ## 356     16.00     17481.55     35.0                     0.01
    ## 357     36.00     88489.15     39.0                  0.00197
    ## 358     36.00     92021.65     39.0                 0.000418
    ## 359     32.00     74625.97     37.0                  0.00202
    ## 360     23.00    182763.72     49.0                  0.00202
    ## 361     28.00     24631.45     44.0                        -
    ## 362     72.00     36907.11     36.0                 9.42e-05
    ## 363     59.00     34364.50     36.0                 0.000713
    ## 364     49.00     35327.26     36.0                 0.000742
    ## 365     36.00     21682.53     31.0                  0.00256
    ## 366     22.00     18263.33     36.0                     0.03
    ## 367     18.00     21507.01     39.0                     0.01
    ## 368     37.00     14504.07     36.0                        -
    ## 369     17.00     74625.97     37.0                     0.01
    ## 370     30.00     79047.84     37.0                     0.02
    ## 371     39.00     13819.43     35.0                        -
    ## 372     37.00     18412.38     29.0                  0.00207
    ## 373     34.00     38824.87     37.0                     0.01
    ## 374     17.00     19479.60     37.0                     0.01
    ## 375     37.00     45769.90     51.0                     0.01
    ## 376     22.00     32402.61     45.0                     0.01
    ## 377     19.00     19750.59     37.0                     0.02
    ## 378     31.00     25614.74     44.0                        -
    ## 379     31.00     24349.50     44.0                        -
    ## 380     38.00    323511.71     57.0                 0.000732
    ## 381     22.00    101132.33     41.0                  0.00217
    ## 382     46.00     43965.30     38.0                 0.000653
    ## 383     64.00     40654.63     38.0                 5.27e-05
    ## 384     29.00     21211.92     38.0                     0.01
    ## 385     17.00     20586.38     38.0                     0.01
    ## 386     32.00     20776.86     38.0                     0.02
    ## 387     38.00     51710.65     53.0                     0.01
    ## 388     49.00      8639.53     28.0                        -
    ## 389     46.00     10678.00     31.0                        -
    ## 390     23.00     87879.99     39.0                  0.00288
    ## 391     33.00     91810.00     39.0                     0.01
    ## 392     25.00     92233.78     39.0                  0.00238
    ## 393     34.00    229028.75     52.0                  0.00232
    ## 394     34.00     25555.83     44.0                        -
    ## 395     72.00     46785.36     39.0                 0.000452
    ## 396     58.00     46143.44     39.0                  0.00108
    ## 397     26.00     22262.81     39.0                     0.01
    ## 398     34.00     70401.19     58.0                     0.01
    ## 399     14.00     21957.35     39.0                     0.02
    ## 400     34.00     39589.50     48.0                     0.01
    ## 401     65.00      1934.15     14.0                        -
    ## 402     35.00     95695.17     40.0                     0.01
    ## 403     30.00     93301.80     40.0                     0.01
    ## 404     40.00    579281.95     65.0                  0.00147
    ## 405     64.00     49786.32     40.0                 3.75e-05
    ## 406     40.00     42180.33     38.0                     0.01
    ## 407     15.00     24579.89     40.0                     0.01
    ## 408     13.00     24636.56     40.0                     0.02
    ## 409     32.00     32545.43     49.0                        -
    ## 410     23.00    322767.65     57.0                  0.00252
    ## 411     25.00    103965.68     41.0                     0.05
    ## 412     58.00     55221.73     41.0                 0.000801
    ## 413     22.00     25036.87     41.0                     0.01
    ## 414     26.00    127814.46     69.0                     0.01
    ## 415     25.00     25036.87     41.0                     0.02
    ## 416     41.00     98079.90     64.0                     0.01
    ## 417     39.00    108865.43     42.0                     0.01
    ## 418     41.00     23631.43     43.0                        -
    ## 419     46.00     17119.46     38.0                        -
    ## 420     42.00     44989.38     39.0                     0.01
    ## 421     63.00     62821.75     42.0                 0.000616
    ## 422     74.00     63695.68     42.0                 0.000953
    ## 423     42.00    208022.35     57.0                 0.000752
    ## 424     40.00    200253.45     76.0                     0.01
    ## 425     34.00     38414.04     51.0                        -
    ## 426     25.00    118274.19     43.0                     0.02
    ## 427     43.00    744543.37     69.0                  0.00156
    ## 428     26.00    123848.29     43.0                     0.02
    ## 429     46.00     19208.35     40.0                        -
    ## 430     53.00     68566.19     43.0                 0.000179
    ## 431     36.00     69041.47     43.0                  0.00354
    ## 432     49.00     55476.62     41.0                  0.00148
    ## 433     30.00     28614.09     43.0                     0.02
    ## 434     46.00     20206.45     41.0                        -
    ## 435     62.00      6644.92     25.0                        -
    ## 436     46.00     21453.10     41.0                        -
    ## 437     44.00    436405.28     61.0                  0.00176
    ## 438     16.00    125860.66     44.0                  0.00471
    ## 439     46.00     22672.01     42.0                        -
    ## 440     41.00     29887.53     47.0                        -
    ## 441     32.00     50059.90     56.0                        -
    ## 442     44.00     63842.52     43.0                     0.03
    ## 443     20.00     30100.94     44.0                     0.01
    ## 444     23.00     30590.04     44.0                     0.01
    ## 445     44.00     75610.13     60.0                     0.01
    ## 446     44.00     49043.34     52.0                     0.01
    ## 447     22.00     30031.71     44.0                     0.05
    ## 448     33.00     50175.30     56.0                        -
    ## 449     33.00     52178.31     57.0                        -
    ## 450     45.00    265527.80     60.0                 0.000363
    ## 451     62.00     78362.81     45.0                 0.000515
    ## 452     45.00    106441.26     49.0                 3.78e-05
    ## 453     29.00     32777.82     45.0                     0.03
    ## 454     45.00    152608.95     71.0                     0.01
    ## 455     23.00     32179.55     45.0                     0.01
    ## 456     28.00     33005.02     45.0                     0.01
    ## 457     31.00    168224.79     48.0                  0.00338
    ## 458     46.00    449665.95     62.0                  0.00192
    ## 459     46.00   5222638.91     91.0                  0.00219
    ## 460     46.00    963584.93     73.0                  0.00118
    ## 461     46.00   4245120.28     90.0                 0.000879
    ## 462     46.00    915988.46     72.0                    0.003
    ## 463     46.00    225886.36     52.0                  0.00154
    ## 464     42.00     36015.55     50.0                        -
    ## 465     62.00     83967.26     46.0                 0.000707
    ## 466     46.00     17543.25     29.0                     0.01
    ## 467     56.00     83581.47     46.0                  0.00135
    ## 468     49.00     24916.67     44.0                        -
    ## 469     36.00     54261.28     57.0                        -
    ## 470     32.00     66909.84     61.0                        -
    ## 471     47.00   2697056.22     85.0                  0.00178
    ## 472     30.00    158449.18     47.0                     0.01
    ## 473     39.00    152717.92     47.0                  0.00401
    ## 474     25.00    153069.97     47.0                     0.05
    ## 475     50.00     24518.28     44.0                        -
    ## 476     33.00     68626.21     61.0                        -
    ## 477     33.00     66143.93     61.0                        -
    ## 478     54.00     19341.49     40.0                        -
    ## 479     58.00     88738.07     47.0                 0.000286
    ## 480     75.00     92920.17     47.0                 0.000262
    ## 481     66.00     93134.37     47.0                  0.00157
    ## 482     33.00    101416.82     48.0                  0.00173
    ## 483     47.00     40140.24     48.0                     0.01
    ## 484     20.00     35692.75     47.0                     0.03
    ## 485     22.00     37032.24     47.0                     0.01
    ## 486     16.00     36777.31     47.0                     0.01
    ## 487     47.00    131093.15     69.0                     0.01
    ## 488     36.00     59222.95     59.0                        -
    ## 489     50.00     26151.10     45.0                        -
    ## 490     37.00    174940.35     48.0                     0.02
    ## 491     48.00    101599.13     41.0                     0.01
    ## 492     49.00     29750.21     47.0                        -
    ## 493     48.00    195033.85     56.0                 0.000758
    ## 494     48.00    114704.38     67.0                  0.00182
    ## 495     27.00     61599.90     56.0                     0.01
    ## 496     48.00     73043.24     59.0                  0.00365
    ## 497     42.00     46934.26     55.0                        -
    ## 498     40.00     52298.59     57.0                        -
    ## 499     52.00     26151.10     45.0                        -
    ## 500     49.00   2511250.29     84.0                  0.00211
    ## 501     26.00    186161.56     49.0                     0.05
    ## 502     23.00    972500.87     73.0                  0.00389
    ## 503     49.00    690065.00     68.0                  0.00235
    ## 504     36.00    179015.24     49.0                     0.02
    ## 505     43.00    185306.22     49.0                     0.02
    ## 506     36.00     71695.19     62.0                        -
    ## 507     49.00    219336.04     58.0                 0.000553
    ## 508     63.00     70001.93     44.0                  0.00193
    ## 509     57.00     50016.12     40.0                  0.00189
    ## 510     49.00     19103.37     29.0                  0.00346
    ## 511     47.00    103540.44     49.0                  0.00265
    ## 512     49.00    366530.40     64.0                  0.00152
    ## 513     24.00     66157.64     57.0                     0.01
    ## 514     48.00     36939.41     51.0                        -
    ## 515     39.00     65236.40     60.0                        -
    ## 516     36.00    262355.40     54.0                    0.004
    ## 517     35.00    699664.76     68.0                  0.00401
    ## 518     33.00     97160.56     67.0                        -
    ## 519     56.00     24518.28     44.0                        -
    ## 520     50.00     73719.10     59.0                   0.0031
    ## 521     40.00     66143.93     61.0                        -
    ## 522     42.00     61587.13     59.0                        -
    ## 523     41.00     62587.85     60.0                        -
    ## 524     51.00    373155.63     59.0                  0.00209
    ## 525     51.00   3466490.39     88.0                  0.00247
    ## 526     28.00    208876.70     51.0                     0.02
    ## 527     51.00    732638.94     69.0                  0.00243
    ## 528     56.00     28215.65     46.0                        -
    ## 529     53.00     32247.05     49.0                        -
    ## 530     62.00     19120.09     40.0                        -
    ## 531     57.00    123626.05     51.0                  0.00111
    ## 532     68.00    125057.57     51.0                 0.000585
    ## 533     55.00     73639.36     44.0                  0.00211
    ## 534     41.00    121090.48     51.0                  0.00393
    ## 535     51.00    300317.06     82.0                     0.01
    ## 536     36.00     46087.17     51.0                     0.04
    ## 537     51.00     40596.63     52.0                        -
    ## 538     50.00     42804.56     53.0                        -
    ## 539     67.00     15013.78     36.0                        -
    ## 540     69.00     13167.10     34.0                        -
    ## 541     34.00    227452.13     52.0                     0.04
    ## 542     23.00    220236.86     52.0                     0.01
    ## 543     30.00    226407.08     52.0                     0.01
    ## 544     31.00    229028.75     52.0                     0.01
    ## 545     52.00    147873.38     46.0                     0.01
    ## 546     45.00     59633.46     59.0                        -
    ## 547     79.00    139672.21     52.0                 0.000909
    ## 548     52.00    294516.75     61.0                 0.000499
    ## 549     57.00     61533.27     42.0                   0.0022
    ## 550     46.00    132163.03     52.0                  0.00363
    ## 551     52.00    173424.32     55.0                  0.00182
    ## 552     69.00    136178.96     52.0                  0.00109
    ## 553     30.00     49156.39     52.0                     0.02
    ## 554     24.00     48259.19     52.0                     0.03
    ## 555     49.00     49259.50     56.0                        -
    ## 556     50.00     47150.90     55.0                        -
    ## 557     53.00    255793.79     54.0                  0.00417
    ## 558     53.00     89720.15     39.0                     0.01
    ## 559     38.00   1815055.88     81.0                  0.00459
    ## 560     34.00    336426.35     58.0                  0.00464
    ## 561     53.00    246541.48     53.0                 0.000373
    ## 562     53.00   1431825.19     78.0                  0.00217
    ## 563     56.00    234363.51     53.0                 0.000571
    ## 564     47.00     59359.47     59.0                        -
    ## 565     60.00    147608.04     53.0                 0.000509
    ## 566     37.00    156354.36     53.0                     0.01
    ## 567     53.00    263985.46     80.0                  0.00388
    ## 568     52.00     48027.50     55.0                        -
    ## 569     37.00    117893.54     70.0                        -
    ## 570     22.00    252284.17     54.0                     0.01
    ## 571     38.00    551937.62     65.0                   0.0047
    ## 572     54.00   1224306.06     76.0                  0.00323
    ## 573     62.00    159261.21     54.0                 0.000179
    ## 574     54.00    138073.39     52.0                  0.00295
    ## 575     55.00     53774.95     54.0                  0.00387
    ## 576     25.00     78991.43     60.0                     0.01
    ## 577     44.00     87395.69     65.0                        -
    ## 578     55.00    626455.17     66.0                  0.00338
    ## 579     54.00    281118.87     55.0                     0.01
    ## 580     55.00   5246745.52     92.0                  0.00492
    ## 581     29.00    760133.72     70.0                     0.01
    ## 582     40.00    271575.13     55.0                     0.01
    ## 583     61.00     32247.05     49.0                        -
    ## 584     44.00     89637.55     66.0                        -
    ## 585     76.00    171834.36     55.0                  0.00255
    ## 586     44.00    172230.48     55.0                     0.01
    ## 587     57.00     47875.13     39.0                  0.00252
    ## 588     55.00     64581.78     43.0                  0.00272
    ## 589     48.00    175029.00     55.0                  0.00435
    ## 590     43.00    172627.51     55.0                  0.00252
    ## 591     40.00     58963.06     55.0                     0.05
    ## 592     44.00    134146.70     69.0                     0.01
    ## 593     35.00     57092.62     55.0                     0.04
    ## 594     24.00     57488.37     55.0                     0.15
    ## 595     27.00     56439.09     55.0                     0.04
    ## 596     51.00     58020.30     55.0                     0.04
    ## 597     51.00     63458.53     60.0                        -
    ## 598     53.00     57608.96     58.0                        -
    ## 599     34.00    490783.55     63.0                     0.01
    ## 600     26.00    290328.72     56.0                     0.03
    ## 601     47.00    683738.45     68.0                     0.01
    ## 602     62.00     35767.62     50.0                        -
    ## 603     61.00     37109.92     51.0                        -
    ## 604     63.00    184973.71     56.0                 0.000186
    ## 605     61.00     21832.83     31.0                  0.00263
    ## 606     56.00    183700.36     56.0                  0.00111
    ## 607     17.00     61175.85     56.0                     0.02
    ## 608     27.00    100827.73     65.0                     0.01
    ## 609     33.00     61316.87     56.0                     0.05
    ## 610     30.00    109289.89     66.0                     0.01
    ## 611     43.00    117622.39     70.0                        -
    ## 612     49.00     81562.40     64.0                        -
    ## 613     50.00     73873.73     63.0                        -
    ## 614     40.00    939485.32     72.0                     0.01
    ## 615     54.00   1632638.37     79.0                     0.01
    ## 616     57.00   1455090.48     78.0                   0.0035
    ## 617     62.00     38858.86     52.0                        -
    ## 618     55.00     59770.93     59.0                        -
    ## 619     84.00    199576.77     57.0                 0.000388
    ## 620     52.00     63325.70     57.0                     0.05
    ## 621     32.00     70563.48     58.0                     0.01
    ## 622     27.00     63180.06     57.0                     0.02
    ## 623     44.00    163523.43     72.0                     0.01
    ## 624     50.00    127520.50     69.0                     0.01
    ## 625     57.00   1152338.31     95.0                     0.01
    ## 626     52.00   1819240.02     81.0                     0.01
    ## 627     50.00    341892.84     58.0                     0.01
    ## 628     49.00     96269.78     67.0                        -
    ## 629     45.00    122317.90     71.0                        -
    ## 630     47.00    110278.28     69.0                        -
    ## 631     90.00    214837.46     58.0                  0.00273
    ## 632     88.00    225481.02     58.0                  0.00238
    ## 633     58.00   1002559.14     76.0                  0.00125
    ## 634     58.00    796361.03     74.0                 0.000773
    ## 635     47.00    220856.41     58.0                  0.00408
    ## 636     21.00     68640.43     58.0                     0.06
    ## 637     44.00    157246.14     72.0                     0.01
    ## 638     32.00     68640.43     58.0                     0.02
    ## 639     63.00     43400.03     54.0                        -
    ## 640     67.00     35195.73     50.0                        -
    ## 641     59.00     73132.43     44.0                  0.00394
    ## 642     91.00    232332.52     59.0                 9.36e-05
    ## 643     88.00    240497.19     59.0                 0.000533
    ## 644     71.00    252412.00     59.0                  0.00108
    ## 645     42.00    456646.36     87.0                     0.02
    ## 646     28.00     72875.24     59.0                     0.06
    ## 647     33.00    622142.69     66.0                     0.01
    ## 648     41.00    392545.50     60.0                     0.07
    ## 649     41.00   1513177.94     78.0                     0.01
    ## 650     38.00   4785088.78     91.0                     0.01
    ## 651     54.00     90258.89     66.0                        -
    ## 652     51.00    108265.48     69.0                        -
    ## 653     92.00    260681.37     60.0                  0.00273
    ## 654     60.00     73301.02     44.0                     0.01
    ## 655     74.00    218831.58     58.0                  0.00313
    ## 656     63.00    104980.83     49.0                   0.0031
    ## 657     57.00     78991.43     60.0                     0.03
    ## 658     65.00     51938.57     56.0                        -
    ## 659     56.00     85209.89     65.0                        -
    ## 660     37.00    433401.09     61.0                     0.03
    ## 661     61.00   1606534.29     79.0                  0.00413
    ## 662     41.00    607980.99     66.0                     0.01
    ## 663     48.00    144374.34     74.0                        -
    ## 664     96.00    289807.75     61.0                  0.00328
    ## 665     61.00    219841.66     58.0                     0.01
    ## 666     61.00    316307.87     62.0                 0.000416
    ## 667     42.00    287150.78     61.0                  0.00457
    ## 668     57.00    285831.44     61.0                     0.01
    ## 669     36.00     82714.19     61.0                     0.07
    ## 670     57.00     90051.30     66.0                        -
    ## 671     59.00     81000.93     64.0                        -
    ## 672     53.00    113891.16     70.0                        -
    ## 673     62.00    893531.77     75.0                  0.00141
    ## 674     89.00    313407.94     62.0                 0.000221
    ## 675     25.00     84835.96     62.0                     0.04
    ## 676     66.00    480717.57     63.0                  0.00457
    ## 677     63.00   9814993.13     96.0                   0.0021
    ## 678     61.00     85603.20     65.0                        -
    ## 679     90.00    347624.20     63.0                 0.000546
    ## 680     63.00    420833.21     66.0                  0.00298
    ## 681     77.00    289807.75     61.0                  0.00348
    ## 682     66.00    340494.42     63.0                  0.00179
    ## 683     33.00     89862.81     63.0                     0.03
    ## 684     74.00     43101.26     53.0                        -
    ## 685     53.00   1502761.29     78.0                     0.01
    ## 686     57.00    119258.68     71.0                        -
    ## 687     53.00    156851.98     75.0                        -
    ## 688     82.00    371629.35     64.0                  0.00107
    ## 689     64.00    939961.36     76.0                 0.000971
    ## 690     91.00    363170.03     64.0                  0.00118
    ## 691     75.00    371629.35     64.0                  0.00308
    ## 692     48.00    163523.43     72.0                     0.02
    ## 693     64.00    244669.59     79.0                  0.00212
    ## 694     55.00    146413.12     71.0                     0.02
    ## 695     22.00    100133.64     64.0                     0.03
    ## 696     52.00    181338.49     77.0                        -
    ## 697     61.00    101272.14     68.0                        -
    ## 698     64.00     83270.28     65.0                        -
    ## 699     45.00    570019.88     65.0                      0.1
    ## 700     54.00    168845.70     76.0                        -
    ## 701     67.00     75943.39     63.0                        -
    ## 702     82.00    399125.98     65.0                 0.000582
    ## 703     65.00    631800.55     90.0                     0.01
    ## 704     55.00    168457.36     76.0                        -
    ## 705     54.00    189447.99     78.0                        -
    ## 706     69.00     76293.93     63.0                        -
    ## 707     55.00    176396.51     77.0                        -
    ## 708     89.00    420833.21     66.0                  0.00325
    ## 709     89.00    429645.24     66.0                 0.000719
    ## 710     66.00    608289.05     70.0                 0.000698
    ## 711     74.00    418899.65     66.0                  0.00214
    ## 712     34.00    106311.44     66.0                     0.06
    ## 713     66.00    492697.09     87.0                  0.00109
    ## 714     57.00    107048.36     66.0                     0.08
    ## 715     80.00     42023.29     53.0                        -
    ## 716     71.00    453012.31     67.0                  0.00285
    ## 717     45.00    477650.24     67.0                     0.01
    ## 718     64.00    684084.89     72.0                  0.00429
    ## 719     67.00    442700.49     66.0                  0.00423
    ## 720     58.00    446796.74     67.0                     0.01
    ## 721     47.00    114177.36     67.0                     0.05
    ## 722     58.00    780872.27     92.0                     0.02
    ## 723     62.00    133195.64     73.0                        -
    ## 724     54.00    231467.49     81.0                        -
    ## 725     55.00    221049.74     80.0                        -
    ## 726     72.00     75943.39     63.0                        -
    ## 727     58.00    175182.21     77.0                        -
    ## 728     33.00    986029.71     73.0                     0.01
    ## 729     79.00     53640.15     57.0                        -
    ## 730     87.00    499010.86     68.0                 0.000492
    ## 731     44.00    123475.27     68.0                     0.06
    ## 732     68.00    878172.84     93.0                     0.01
    ## 733     40.00    125192.99     68.0                     0.08
    ## 734     70.00     95167.79     67.0                        -
    ## 735     76.00     67218.68     61.0                        -
    ## 736     35.00    719266.78     69.0                     0.01
    ## 737     32.00    739417.97     69.0                     0.05
    ## 738     69.00   3089512.81     87.0                  0.00498
    ## 739     81.00    719266.78     69.0                 0.000623
    ## 740     65.00    135048.57     73.0                        -
    ## 741     62.00    162738.38     76.0                        -
    ## 742     78.00    559899.40     69.0                  0.00152
    ## 743     83.00    549680.08     69.0                 0.000961
    ## 744     76.00    545896.11     69.0                   0.0015
    ## 745     67.00    128970.39     72.0                        -
    ## 746     70.00  21227067.45     99.0                     0.01
    ## 747     70.00   1013654.61     73.0                  0.00183
    ## 748     65.00    150137.78     75.0                        -
    ## 749     66.00    144042.28     74.0                        -
    ## 750     68.00    130463.79     72.0                        -
    ## 751     75.00    571623.40     70.0                   0.0019
    ## 752     70.00    429645.24     66.0                     0.01
    ## 753     70.00   1092898.93     94.0                  0.00173
    ## 754     54.00    142751.28     70.0                     0.04
    ## 755     57.00    135387.95     70.0                     0.02
    ## 756     70.00    429121.23     86.0                     0.01
    ## 757     59.00    247451.45     82.0                        -
    ## 758     71.00   5955112.91     93.0                     0.01
    ## 759     52.00    845064.78     71.0                     0.07
    ## 760     45.00   1166514.12     75.0                     0.01
    ## 761     40.00    831553.13     71.0                     0.01
    ## 762     71.00   5045334.91     91.0                     0.01
    ## 763     74.00    831553.13     71.0                  0.00196
    ## 764     51.00    816375.57     71.0                     0.03
    ## 765     38.00    852884.06     71.0                     0.04
    ## 766     62.00    226720.09     80.0                        -
    ## 767     88.00    202819.64     57.0                     0.01
    ## 768     71.00   1219298.39     78.0                  0.00196
    ## 769     93.00    657824.43     71.0                 0.000494
    ## 770     88.00    239944.06     59.0                     0.01
    ## 771     59.00    629665.65     71.0                     0.03
    ## 772     71.00    169476.70     55.0                     0.02
    ## 773     68.00    650294.38     71.0                     0.03
    ## 774     47.00    144737.14     71.0                     0.03
    ## 775     66.00    330050.20     83.0                     0.03
    ## 776     71.00    128673.76     72.0                        -
    ## 777     74.00    107520.18     69.0                        -
    ## 778     44.00    872750.29     72.0                     0.02
    ## 779     72.00   4054058.39     89.0                   0.0031
    ## 780     37.00   1314891.75     77.0                     0.01
    ## 781     43.00    939485.32     72.0                     0.03
    ## 782     90.00    726289.89     72.0                  0.00449
    ## 783     72.00    700019.28     72.0                  0.00177
    ## 784     65.00   1164420.92     78.0                     0.01
    ## 785     75.00    111812.41     70.0                        -
    ## 786     60.00    318779.22     85.0                        -
    ## 787     43.00   1261507.97     76.0                     0.01
    ## 788     39.00   1015991.33     73.0                     0.02
    ## 789     78.00     99423.72     68.0                        -
    ## 790     91.00    762272.06     73.0                  0.00044
    ## 791     93.00    753546.40     73.0                  0.00332
    ## 792     48.00    164278.22     73.0                     0.05
    ## 793     57.00    164656.92     73.0                     0.03
    ## 794     72.00    160505.53     75.0                        -
    ## 795     63.00  22797645.70     99.0                     0.01
    ## 796     73.00  22176346.56     99.0                     0.01
    ## 797     59.00  43943030.05    100.0                     0.01
    ## 798     77.00    121475.86     71.0                        -
    ## 799     90.00    809300.86     74.0                  0.00279
    ## 800     66.00    833892.37     74.0                     0.01
    ## 801     46.00    183054.33     74.0                     0.04
    ## 802     70.00    179299.88     74.0                     0.06
    ## 803     39.00    182633.31     74.0                     0.04
    ## 804     74.00   1307916.44     96.0                  0.00228
    ## 805     72.00    177619.24     77.0                        -
    ## 806     78.00    124305.40     71.0                        -
    ## 807     66.00    268837.59     83.0                        -
    ## 808     78.00    120917.73     71.0                        -
    ## 809     61.00   1153161.14     75.0                     0.04
    ## 810     54.00   2930150.99     86.0                     0.01
    ## 811     57.00    737038.20     93.0                        -
    ## 812     75.00   1552780.26     81.0                  0.00352
    ## 813     75.00    441682.30     66.0                     0.01
    ## 814     87.00    800036.87     74.0                     0.01
    ## 815     75.00   3540870.14     88.0                  0.00172
    ## 816     82.00    605494.22     70.0                     0.01
    ## 817     75.00    385993.51     85.0                     0.01
    ## 818     76.00   2454087.26     84.0                     0.01
    ## 819     39.00   1252823.81     76.0                     0.07
    ## 820     77.00    161618.10     75.0                        -
    ## 821     68.00    292745.35     84.0                        -
    ## 822     76.00    388248.69     65.0                     0.01
    ## 823     80.00   1009508.55     76.0                 0.000395
    ## 824     94.00   1018849.41     76.0                 0.000339
    ## 825     77.00    173424.32     55.0                     0.01
    ## 826     76.00    622457.92     71.0                     0.01
    ## 827     38.00    203976.44     76.0                     0.04
    ## 828     50.00   1314891.75     77.0                     0.04
    ## 829     64.00   2088767.01     82.0                     0.01
    ## 830     77.00   8334700.53     95.0                     0.01
    ## 831     77.00  16869802.57     97.0                  0.00418
    ## 832     77.00   1270895.96     79.0                 0.000112
    ## 833     77.00    420833.21     66.0                     0.02
    ## 834     91.00   1119721.46     77.0                  0.00334
    ## 835     85.00    117351.87     70.0                        -
    ## 836     78.00   2599501.07     85.0                     0.01
    ## 837     69.00   6681746.58     93.0                     0.01
    ## 838     69.00    401319.26     87.0                        -
    ## 839     78.00    188143.84     78.0                        -
    ## 840     70.00   2366519.02     85.0                     0.01
    ## 841     78.00    639116.46     90.0                     0.01
    ## 842     75.00   2615652.22     99.0                     0.03
    ## 843     92.00     83270.28     65.0                        -
    ## 844     76.00  53937399.02    100.0                     0.02
    ## 845     52.00   1613949.72     79.0                     0.07
    ## 846     79.00  15448631.00     98.0                     0.01
    ## 847     48.00   3844943.83     89.0                     0.02
    ## 848     85.00    134428.08     73.0                        -
    ## 849     79.00    389143.70     65.0                     0.01
    ## 850     87.00   1191543.77     78.0                     0.01
    ## 851     90.00   1244829.87     79.0                     0.01
    ## 852     37.00    253267.81     79.0                     0.05
    ## 853     81.00    189012.27     78.0                        -
    ## 854     47.00   1640174.29     80.0                     0.02
    ## 855     52.00    271381.35     80.0                     0.04
    ## 856     54.00    365241.40     84.0                     0.03
    ## 857     78.00    277006.53     83.0                        -
    ## 858     71.00    550161.25     90.0                        -
    ## 859     64.00  15131779.36     98.0                     0.02
    ## 860     81.00  16978135.68     98.0                     0.01
    ## 861     85.00    178028.69     77.0                        -
    ## 862     81.00    467853.63     67.0                     0.02
    ## 863     92.00    404678.38     65.0                     0.01
    ## 864     68.00   1585294.67     81.0                     0.06
    ## 865     57.00    280918.28     81.0                     0.04
    ## 866     78.00    315130.18     85.0                        -
    ## 867     82.00    237405.08     81.0                        -
    ## 868     52.00   2103245.65     82.0                     0.07
    ## 869     47.00   2069617.08     82.0                     0.02
    ## 870     49.00   1994757.01     82.0                     0.02
    ## 871     78.00    347128.28     86.0                        -
    ## 872     74.00    511081.31     90.0                        -
    ## 873     82.00   2178261.42     84.0                  0.00311
    ## 874     82.00   1472685.46     80.0                     0.03
    ## 875     87.00   1766485.19     82.0                  0.00432
    ## 876     57.00    670779.84     90.0                     0.04
    ## 877     67.00    302398.76     82.0                     0.09
    ## 878     47.00    314470.56     82.0                     0.05
    ## 879     78.00    393994.36     87.0                        -
    ## 880     72.00    712016.41     93.0                        -
    ## 881     68.00  20601080.54     99.0                     0.02
    ## 882     83.00  46226392.23    100.0                     0.02
    ## 883     73.00    752471.40     93.0                        -
    ## 884     72.00    844286.80     94.0                        -
    ## 885     73.00   2565133.66     86.0                     0.01
    ## 886     51.00   1832778.58     83.0                     0.02
    ## 887     46.00    340863.11     83.0                     0.05
    ## 888     59.00    661576.39     90.0                     0.04
    ## 889     85.00    248593.63     82.0                        -
    ## 890     49.00   2488227.01     84.0                     0.03
    ## 891     80.00    405032.62     88.0                        -
    ## 892     79.00    451325.63     89.0                        -
    ## 893     86.00    255558.31     82.0                        -
    ## 894     84.00   5384061.35     91.0                     0.01
    ## 895    100.00   2143433.43     84.0                 0.000285
    ## 896     86.00   2000368.47     84.0                     0.01
    ## 897     76.00   2153327.07     84.0                     0.01
    ## 898     50.00    348000.61     84.0                      0.1
    ## 899     53.00    449345.09     86.0                     0.04
    ## 900     76.00    737038.20     93.0                        -
    ## 901     83.00    371954.66     87.0                        -
    ## 902     87.00    265149.00     83.0                        -
    ## 903     81.00    457604.20     89.0                        -
    ## 904     76.00    826970.47     94.0                        -
    ## 905     85.00    830959.77     92.0                  0.00278
    ## 906     93.00    197464.94     78.0                        -
    ## 907     50.00   2837200.32     86.0                     0.06
    ## 908     53.00   2759878.73     86.0                     0.06
    ## 909     84.00    413513.79     88.0                        -
    ## 910     80.00    666024.19     92.0                        -
    ## 911     86.00   5297976.16     91.0                     0.01
    ## 912     86.00   3516494.97     88.0                 0.000654
    ## 913     86.00    621026.31     71.0                     0.01
    ## 914     92.00   2729669.08     86.0                  0.00457
    ## 915     71.00   7229528.93     93.0                     0.01
    ## 916     39.00    449345.09     86.0                     0.05
    ## 917     62.00    440129.02     86.0                     0.06
    ## 918     60.00    436093.89     86.0                     0.04
    ## 919     96.00    179262.73     77.0                        -
    ## 920     74.00 121029154.68    100.0                     0.02
    ## 921     79.00   1043494.11     95.0                        -
    ## 922     84.00    501753.03     90.0                        -
    ## 923     87.00    631117.18     71.0                     0.02
    ## 924     87.00   3119679.65     87.0                   0.0019
    ## 925     82.00    720261.17     93.0                        -
    ## 926     89.00    359327.12     86.0                        -
    ## 927     83.00    687844.07     92.0                        -
    ## 928     39.00   9308720.70     95.0                     0.03
    ## 929     87.00    470424.57     89.0                        -
    ## 930     87.00    478068.36     89.0                        -
    ## 931     85.00    584103.76     91.0                        -
    ## 932     51.00    545230.32     88.0                     0.07
    ## 933     51.00    520690.91     88.0                     0.08
    ## 934     84.00    730281.00     93.0                        -
    ## 935     39.00   3731556.31     89.0                     0.03
    ## 936     78.00   3239589.63    100.0                        -
    ## 937     94.00   3991259.82     89.0                  0.00491
    ## 938     89.00  81303641.95    100.0                  0.00229
    ## 939     83.00   3606699.84     89.0                     0.02
    ## 940     89.00  12592443.18     96.0                     0.01
    ## 941     89.00   1004870.28     76.0                     0.04
    ## 942     68.00    606149.85     89.0                     0.08
    ## 943     81.00   1601363.78     98.0                        -
    ## 944     87.00    759433.94     93.0                        -
    ## 945     85.00    958274.65     95.0                        -
    ## 946     99.00   3508407.25     88.0                     0.01
    ## 947     94.00   4366264.09     90.0                  0.00297
    ## 948     79.00  10118357.04     95.0                     0.01
    ## 949     90.00   5013141.93     91.0                     0.01
    ## 950     57.00    678547.10     90.0                     0.12
    ## 951     59.00    680111.31     91.0                     0.05
    ## 952     52.00    655511.02     90.0                     0.06
    ## 953     73.00  19049781.56     99.0                     0.03
    ## 954     49.00   4730314.32     91.0                     0.06
    ## 955     89.00    728601.40     93.0                        -
    ## 956     88.00  71467731.97    100.0                     0.01
    ## 957     71.00    705634.81     91.0                     0.06
    ## 958     85.00   1616181.01     98.0                        -
    ## 959     88.00    982856.24     95.0                        -
    ## 960     48.00   5927751.65     92.0                     0.13
    ## 961     92.00   5319735.02     92.0                  0.00165
    ## 962     81.00   6041016.19     92.0                     0.02
    ## 963     92.00   2065903.35     84.0                     0.02
    ## 964     64.00   5782424.89     92.0                     0.02
    ## 965     92.00  11300821.11     96.0                     0.01
    ## 966     89.00    775496.78     92.0                     0.07
    ## 967     62.00    804599.95     92.0                     0.07
    ## 968     72.00  14252465.55     97.0                     0.04
    ## 969     94.00    684683.72     92.0                        -
    ## 970     93.00   6936014.62     93.0                  0.00451
    ## 971     96.00   6282174.56     93.0                     0.01
    ## 972     93.00  20096017.49     98.0                     0.01
    ## 973     93.00   2421642.33     85.0                     0.03
    ## 974     97.00   3236756.29     88.0                     0.02
    ## 975     74.00   1724169.67     97.0                     0.06
    ## 976     90.00   1605055.30     98.0                        -
    ## 977     92.00   1198091.54     96.0                        -
    ## 978     92.00   1077680.44     96.0                        -
    ## 979     93.00   8000368.66     94.0                     0.04
    ## 980     91.00   1864189.25     98.0                        -
    ## 981     91.00   2457480.04     99.0                        -
    ## 982     95.00   2679847.00     86.0                     0.02
    ## 983     79.00   7423009.22    100.0                     0.06
    ## 984     47.00  11140123.36     96.0                     0.09
    ## 985     97.00   1001128.90     95.0                        -
    ## 986     96.00   1058010.55     96.0                        -
    ## 987     96.00    964073.18     76.0                     0.03
    ## 988     96.00  24105158.97     98.0                     0.01
    ## 989     96.00  19369124.91     98.0                  0.00366
    ## 990     99.00   3648463.45     89.0                     0.03
    ## 991     72.00  86275999.65    100.0                     0.06
    ## 992     97.00   2125641.40     99.0                        -
    ## 993     98.00  62102631.06    100.0                  0.00342
    ## 994     98.00  39455722.46    100.0                     0.02
    ## 995     98.00  14794830.71     97.0                     0.04
    ## 996     98.00  20946429.29     98.0                     0.02
    ## 997     98.00  17462643.98     97.0                     0.07
    ## 998     77.00   2053903.33     98.0                     0.12
    ## 999     98.00   2688375.94    100.0                        -
    ## 1000    99.00  29724188.04     99.0                     0.05
    ## 1001   100.00   2106153.40     99.0                        -
    ## 1002    99.00   8269704.67    100.0                        -
    ## 1003   100.00  19493507.97     99.0                     0.12
    ## 1004    60.00  31469511.40    100.0                     0.08
    ##      comblib_sidney2008_rank netmhcpan_score netmhcpan_rank
    ## 1                        0.3               -              -
    ## 2                        2.2               -              -
    ## 3                        0.3               -              -
    ## 4                        7.3               -              -
    ## 5                        4.6               -              -
    ## 6                        0.7               -              -
    ## 7                        2.2               -              -
    ## 8                        0.2               -              -
    ## 9                          -               -              -
    ## 10                       1.1               -              -
    ## 11                       2.9               -              -
    ## 12                       2.2               -              -
    ## 13                         -               -              -
    ## 14                       0.6               -              -
    ## 15                       0.6               -              -
    ## 16                       1.2               -              -
    ## 17                        19               -              -
    ## 18                         -               -              -
    ## 19                         -               -              -
    ## 20                       1.5               -              -
    ## 21                        38               -              -
    ## 22                       5.6               -              -
    ## 23                         -               -              -
    ## 24                        22               -              -
    ## 25                       2.1               -              -
    ## 26                       3.8               -              -
    ## 27                       2.5               -              -
    ## 28                       5.6               -              -
    ## 29                         -               -              -
    ## 30                       2.3               -              -
    ## 31                       2.5               -              -
    ## 32                       1.1               -              -
    ## 33                         -               -              -
    ## 34                        35               -              -
    ## 35                        23               -              -
    ## 36                       2.2               -              -
    ## 37                       5.5               -              -
    ## 38                       5.8               -              -
    ## 39                        13               -              -
    ## 40                        69               -              -
    ## 41                        23               -              -
    ## 42                         -               -              -
    ## 43                        15               -              -
    ## 44                       2.8               -              -
    ## 45                        29               -              -
    ## 46                        18               -              -
    ## 47                         -               -              -
    ## 48                         1               -              -
    ## 49                        22               -              -
    ## 50                        18               -              -
    ## 51                         -               -              -
    ## 52                       4.2               -              -
    ## 53                       4.5               -              -
    ## 54                        12               -              -
    ## 55                        12               -              -
    ## 56                         -               -              -
    ## 57                       2.2               -              -
    ## 58                       4.8               -              -
    ## 59                       5.9               -              -
    ## 60                        22               -              -
    ## 61                         -               -              -
    ## 62                        58               -              -
    ## 63                        46               -              -
    ## 64                        17               -              -
    ## 65                        22               -              -
    ## 66                        21               -              -
    ## 67                       0.6               -              -
    ## 68                        28               -              -
    ## 69                        19               -              -
    ## 70                       3.3               -              -
    ## 71                         6               -              -
    ## 72                       8.4               -              -
    ## 73                       0.8               -              -
    ## 74                        14               -              -
    ## 75                        40               -              -
    ## 76                       8.5               -              -
    ## 77                        59               -              -
    ## 78                       6.5               -              -
    ## 79                         -               -              -
    ## 80                       6.4               -              -
    ## 81                         -               -              -
    ## 82                        69               -              -
    ## 83                       8.2               -              -
    ## 84                       1.9               -              -
    ## 85                        75               -              -
    ## 86                         -               -              -
    ## 87                       1.7               -              -
    ## 88                       8.4               -              -
    ## 89                       0.9               -              -
    ## 90                         -               -              -
    ## 91                        39               -              -
    ## 92                         -               -              -
    ## 93                         -               -              -
    ## 94                         -               -              -
    ## 95                       0.3               -              -
    ## 96                        14               -              -
    ## 97                       9.1               -              -
    ## 98                         2               -              -
    ## 99                        18               -              -
    ## 100                      8.7               -              -
    ## 101                        -               -              -
    ## 102                      9.6               -              -
    ## 103                       36               -              -
    ## 104                      5.6               -              -
    ## 105                        -               -              -
    ## 106                       19               -              -
    ## 107                       25               -              -
    ## 108                        -               -              -
    ## 109                       46               -              -
    ## 110                       14               -              -
    ## 111                       20               -              -
    ## 112                       19               -              -
    ## 113                       37               -              -
    ## 114                       16               -              -
    ## 115                       20               -              -
    ## 116                       69               -              -
    ## 117                       12               -              -
    ## 118                       16               -              -
    ## 119                       49               -              -
    ## 120                       26               -              -
    ## 121                       34               -              -
    ## 122                      9.1               -              -
    ## 123                        9               -              -
    ## 124                       17               -              -
    ## 125                       43               -              -
    ## 126                       38               -              -
    ## 127                       16               -              -
    ## 128                       33               -              -
    ## 129                       45               -              -
    ## 130                       22               -              -
    ## 131                       17               -              -
    ## 132                       53               -              -
    ## 133                       26               -              -
    ## 134                       17               -              -
    ## 135                       15               -              -
    ## 136                      8.2               -              -
    ## 137                       74               -              -
    ## 138                       14               -              -
    ## 139                        -               -              -
    ## 140                        -               -              -
    ## 141                       36               -              -
    ## 142                       22               -              -
    ## 143                       15               -              -
    ## 144                       12               -              -
    ## 145                        -               -              -
    ## 146                        -               -              -
    ## 147                      3.4               -              -
    ## 148                       24               -              -
    ## 149                       22               -              -
    ## 150                       84               -              -
    ## 151                        -               -              -
    ## 152                       38               -              -
    ## 153                       53               -              -
    ## 154                        4               -              -
    ## 155                       23               -              -
    ## 156                       27               -              -
    ## 157                        -               -              -
    ## 158                      5.4               -              -
    ## 159                      1.4               -              -
    ## 160                       55               -              -
    ## 161                      8.9               -              -
    ## 162                        7               -              -
    ## 163                       49               -              -
    ## 164                       16               -              -
    ## 165                       21               -              -
    ## 166                       14               -              -
    ## 167                       13               -              -
    ## 168                        -               -              -
    ## 169                       59               -              -
    ## 170                       19               -              -
    ## 171                       53               -              -
    ## 172                       22               -              -
    ## 173                       47               -              -
    ## 174                       30               -              -
    ## 175                       31               -              -
    ## 176                       39               -              -
    ## 177                       46               -              -
    ## 178                      6.5               -              -
    ## 179                        -               -              -
    ## 180                       16               -              -
    ## 181                       26               -              -
    ## 182                       62               -              -
    ## 183                        -               -              -
    ## 184                        -               -              -
    ## 185                      9.5               -              -
    ## 186                       17               -              -
    ## 187                       18               -              -
    ## 188                       37               -              -
    ## 189                       56               -              -
    ## 190                        -               -              -
    ## 191                       13               -              -
    ## 192                       28               -              -
    ## 193                      8.9               -              -
    ## 194                        -               -              -
    ## 195                        -               -              -
    ## 196                       38               -              -
    ## 197                      7.5               -              -
    ## 198                       67               -              -
    ## 199                       19               -              -
    ## 200                       19               -              -
    ## 201                       59               -              -
    ## 202                       20               -              -
    ## 203                       29               -              -
    ## 204                       67               -              -
    ## 205                       66               -              -
    ## 206                       68               -              -
    ## 207                       12               -              -
    ## 208                       35               -              -
    ## 209                       20               -              -
    ## 210                       33               -              -
    ## 211                       12               -              -
    ## 212                       25               -              -
    ## 213                      6.7               -              -
    ## 214                       21               -              -
    ## 215                       22               -              -
    ## 216                       75               -              -
    ## 217                        -               -              -
    ## 218                      8.5               -              -
    ## 219                        -               -              -
    ## 220                        -               -              -
    ## 221                       22               -              -
    ## 222                       26               -              -
    ## 223                       67               -              -
    ## 224                        -               -              -
    ## 225                       22               -              -
    ## 226                       58               -              -
    ## 227                       44               -              -
    ## 228                        -               -              -
    ## 229                       41               -              -
    ## 230                       12               -              -
    ## 231                       23               -              -
    ## 232                       23               -              -
    ## 233                       51               -              -
    ## 234                      4.4               -              -
    ## 235                       25               -              -
    ## 236                       22               -              -
    ## 237                       59               -              -
    ## 238                        -               -              -
    ## 239                       44               -              -
    ## 240                       40               -              -
    ## 241                       53               -              -
    ## 242                       90               -              -
    ## 243                        -               -              -
    ## 244                       45               -              -
    ## 245                       47               -              -
    ## 246                       37               -              -
    ## 247                       24               -              -
    ## 248                        -               -              -
    ## 249                        -               -              -
    ## 250                        -               -              -
    ## 251                       25               -              -
    ## 252                      2.3               -              -
    ## 253                       25               -              -
    ## 254                       25               -              -
    ## 255                       25               -              -
    ## 256                       42               -              -
    ## 257                        -               -              -
    ## 258                       46               -              -
    ## 259                        -               -              -
    ## 260                       32               -              -
    ## 261                       34               -              -
    ## 262                       26               -              -
    ## 263                      8.1               -              -
    ## 264                       27               -              -
    ## 265                        -               -              -
    ## 266                        -               -              -
    ## 267                        -               -              -
    ## 268                        -               -              -
    ## 269                        -               -              -
    ## 270                       11               -              -
    ## 271                       27               -              -
    ## 272                       78               -              -
    ## 273                       80               -              -
    ## 274                        -               -              -
    ## 275                       55               -              -
    ## 276                       58               -              -
    ## 277                       68               -              -
    ## 278                       50               -              -
    ## 279                       34               -              -
    ## 280                       92               -              -
    ## 281                       53               -              -
    ## 282                       20               -              -
    ## 283                       65               -              -
    ## 284                        -               -              -
    ## 285                      2.5               -              -
    ## 286                      3.8               -              -
    ## 287                       16               -              -
    ## 288                       54               -              -
    ## 289                        -               -              -
    ## 290                        -               -              -
    ## 291                       30               -              -
    ## 292                       38               -              -
    ## 293                       49               -              -
    ## 294                       24               -              -
    ## 295                       37               -              -
    ## 296                       41               -              -
    ## 297                       46               -              -
    ## 298                        -               -              -
    ## 299                        -               -              -
    ## 300                       61               -              -
    ## 301                       64               -              -
    ## 302                       86               -              -
    ## 303                       30               -              -
    ## 304                       30               -              -
    ## 305                       33               -              -
    ## 306                       19               -              -
    ## 307                       31               -              -
    ## 308                       13               -              -
    ## 309                       47               -              -
    ## 310                       85               -              -
    ## 311                       49               -              -
    ## 312                       31               -              -
    ## 313                       46               -              -
    ## 314                       40               -              -
    ## 315                        -               -              -
    ## 316                       23               -              -
    ## 317                       32               -              -
    ## 318                       21               -              -
    ## 319                        -               -              -
    ## 320                       24               -              -
    ## 321                       16               -              -
    ## 322                       32               -              -
    ## 323                       13               -              -
    ## 324                       88               -              -
    ## 325                       17               -              -
    ## 326                       56               -              -
    ## 327                       54               -              -
    ## 328                        -               -              -
    ## 329                       38               -              -
    ## 330                       85               -              -
    ## 331                       25               -              -
    ## 332                       31               -              -
    ## 333                       75               -              -
    ## 334                       16               -              -
    ## 335                      7.2               -              -
    ## 336                       54               -              -
    ## 337                       92               -              -
    ## 338                       14               -              -
    ## 339                        -               -              -
    ## 340                        -               -              -
    ## 341                        -               -              -
    ## 342                       85               -              -
    ## 343                       12               -              -
    ## 344                       64               -              -
    ## 345                       56               -              -
    ## 346                       29               -              -
    ## 347                        -               -              -
    ## 348                        -               -              -
    ## 349                        -               -              -
    ## 350                      8.3               -              -
    ## 351                       35               -              -
    ## 352                       44               -              -
    ## 353                       22               -              -
    ## 354                       93               -              -
    ## 355                       51               -              -
    ## 356                       35               -              -
    ## 357                       36               -              -
    ## 358                       14               -              -
    ## 359                       36               -              -
    ## 360                       36               -              -
    ## 361                        -               -              -
    ## 362                      5.4               -              -
    ## 363                       28               -              -
    ## 364                       29               -              -
    ## 365                       56               -              -
    ## 366                       78               -              -
    ## 367                       36               -              -
    ## 368                        -               -              -
    ## 369                       64               -              -
    ## 370                       85               -              -
    ## 371                        -               -              -
    ## 372                       51               -              -
    ## 373                       71               -              -
    ## 374                       47               -              -
    ## 375                       37               -              -
    ## 376                       37               -              -
    ## 377                       69               -              -
    ## 378                        -               -              -
    ## 379                        -               -              -
    ## 380                       20               -              -
    ## 381                       38               -              -
    ## 382                       27               -              -
    ## 383                        3               -              -
    ## 384                       51               -              -
    ## 385                       45               -              -
    ## 386                       65               -              -
    ## 387                       37               -              -
    ## 388                        -               -              -
    ## 389                        -               -              -
    ## 390                       43               -              -
    ## 391                       69               -              -
    ## 392                       39               -              -
    ## 393                       39               -              -
    ## 394                        -               -              -
    ## 395                       21               -              -
    ## 396                       36               -              -
    ## 397                       52               -              -
    ## 398                       39               -              -
    ## 399                       63               -              -
    ## 400                       39               -              -
    ## 401                        -               -              -
    ## 402                       74               -              -
    ## 403                       78               -              -
    ## 404                       31               -              -
    ## 405                      2.1               -              -
    ## 406                       71               -              -
    ## 407                       57               -              -
    ## 408                       63               -              -
    ## 409                        -               -              -
    ## 410                       41               -              -
    ## 411                       97               -              -
    ## 412                       30               -              -
    ## 413                       50               -              -
    ## 414                       41               -              -
    ## 415                       60               -              -
    ## 416                       34               -              -
    ## 417                       60               -              -
    ## 418                        -               -              -
    ## 419                        -               -              -
    ## 420                       74               -              -
    ## 421                       26               -              -
    ## 422                       34               -              -
    ## 423                       29               -              -
    ## 424                       42               -              -
    ## 425                        -               -              -
    ## 426                       79               -              -
    ## 427                       32               -              -
    ## 428                       84               -              -
    ## 429                        -               -              -
    ## 430                      9.5               -              -
    ## 431                       63               -              -
    ## 432                       43               -              -
    ## 433                       69               -              -
    ## 434                        -               -              -
    ## 435                        -               -              -
    ## 436                        -               -              -
    ## 437                       34               -              -
    ## 438                       54               -              -
    ## 439                        -               -              -
    ## 440                        -               -              -
    ## 441                        -               -              -
    ## 442                       98               -              -
    ## 443                       55               -              -
    ## 444                       55               -              -
    ## 445                       42               -              -
    ## 446                       40               -              -
    ## 447                       91               -              -
    ## 448                        -               -              -
    ## 449                        -               -              -
    ## 450                       18               -              -
    ## 451                       23               -              -
    ## 452                      2.1               -              -
    ## 453                       77               -              -
    ## 454                       39               -              -
    ## 455                       45               -              -
    ## 456                       45               -              -
    ## 457                       46               -              -
    ## 458                       35               -              -
    ## 459                       38               -              -
    ## 460                       27               -              -
    ## 461                       23               -              -
    ## 462                       44               -              -
    ## 463                       31               -              -
    ## 464                        -               -              -
    ## 465                       28               -              -
    ## 466                       72               -              -
    ## 467                       41               -              -
    ## 468                        -               -              -
    ## 469                        -               -              -
    ## 470                        -               -              -
    ## 471                       34               -              -
    ## 472                       67               -              -
    ## 473                       50               -              -
    ## 474                       96               -              -
    ## 475                        -               -              -
    ## 476                        -               -              -
    ## 477                        -               -              -
    ## 478                        -               -              -
    ## 479                       15               -              -
    ## 480                       14               -              -
    ## 481                       44               -              -
    ## 482                       47               -              -
    ## 483                       42               -              -
    ## 484                       80               -              -
    ## 485                       58               -              -
    ## 486                       50               -              -
    ## 487                       40               -              -
    ## 488                        -               -              -
    ## 489                        -               -              -
    ## 490                       85               -              -
    ## 491                       73               -              -
    ## 492                        -               -              -
    ## 493                       29               -              -
    ## 494                       17               -              -
    ## 495                       48               -              -
    ## 496                       27               -              -
    ## 497                        -               -              -
    ## 498                        -               -              -
    ## 499                        -               -              -
    ## 500                       37               -              -
    ## 501                       97               -              -
    ## 502                       49               -              -
    ## 503                       39               -              -
    ## 504                       80               -              -
    ## 505                       81               -              -
    ## 506                        -               -              -
    ## 507                       24               -              -
    ## 508                       49               -              -
    ## 509                       49               -              -
    ## 510                       62               -              -
    ## 511                       56               -              -
    ## 512                       44               -              -
    ## 513                       49               -              -
    ## 514                        -               -              -
    ## 515                        -               -              -
    ## 516                       50               -              -
    ## 517                       50               -              -
    ## 518                        -               -              -
    ## 519                        -               -              -
    ## 520                       25               -              -
    ## 521                        -               -              -
    ## 522                        -               -              -
    ## 523                        -               -              -
    ## 524                       37               -              -
    ## 525                       40               -              -
    ## 526                       85               -              -
    ## 527                       40               -              -
    ## 528                        -               -              -
    ## 529                        -               -              -
    ## 530                        -               -              -
    ## 531                       36               -              -
    ## 532                       25               -              -
    ## 533                       51               -              -
    ## 534                       65               -              -
    ## 535                       35               -              -
    ## 536                       83               -              -
    ## 537                        -               -              -
    ## 538                        -               -              -
    ## 539                        -               -              -
    ## 540                        -               -              -
    ## 541                       95               -              -
    ## 542                       58               -              -
    ## 543                       68               -              -
    ## 544                       75               -              -
    ## 545                       62               -              -
    ## 546                        -               -              -
    ## 547                       33               -              -
    ## 548                       22               -              -
    ## 549                       52               -              -
    ## 550                       63               -              -
    ## 551                       48               -              -
    ## 552                       36               -              -
    ## 553                       61               -              -
    ## 554                       78               -              -
    ## 555                        -               -              -
    ## 556                        -               -              -
    ## 557                       51               -              -
    ## 558                       56               -              -
    ## 559                       53               -              -
    ## 560                       53               -              -
    ## 561                       12               -              -
    ## 562                       38               -              -
    ## 563                       17               -              -
    ## 564                        -               -              -
    ## 565                       23               -              -
    ## 566                       72               -              -
    ## 567                       29               -              -
    ## 568                        -               -              -
    ## 569                        -               -              -
    ## 570                       63               -              -
    ## 571                       54               -              -
    ## 572                       45               -              -
    ## 573                      9.5               -              -
    ## 574                       59               -              -
    ## 575                       29               -              -
    ## 576                       54               -              -
    ## 577                        -               -              -
    ## 578                       46               -              -
    ## 579                       63               -              -
    ## 580                       55               -              -
    ## 581                       55               -              -
    ## 582                       60               -              -
    ## 583                        -               -              -
    ## 584                        -               -              -
    ## 585                       55               -              -
    ## 586                       80               -              -
    ## 587                       55               -              -
    ## 588                       57               -              -
    ## 589                       68               -              -
    ## 590                       55               -              -
    ## 591                       88               -              -
    ## 592                       55               -              -
    ## 593                       85               -              -
    ## 594                      100               -              -
    ## 595                       86               -              -
    ## 596                       83               -              -
    ## 597                        -               -              -
    ## 598                        -               -              -
    ## 599                       56               -              -
    ## 600                       91               -              -
    ## 601                       56               -              -
    ## 602                        -               -              -
    ## 603                        -               -              -
    ## 604                      9.9               -              -
    ## 605                       56               -              -
    ## 606                       36               -              -
    ## 607                       59               -              -
    ## 608                       56               -              -
    ## 609                       89               -              -
    ## 610                       56               -              -
    ## 611                        -               -              -
    ## 612                        -               -              -
    ## 613                        -               -              -
    ## 614                       57               -              -
    ## 615                       57               -              -
    ## 616                       47               -              -
    ## 617                        -               -              -
    ## 618                        -               -              -
    ## 619                       19               -              -
    ## 620                       91               -              -
    ## 621                       57               -              -
    ## 622                       67               -              -
    ## 623                       57               -              -
    ## 624                       57               -              -
    ## 625                       52               -              -
    ## 626                       58               -              -
    ## 627                       74               -              -
    ## 628                        -               -              -
    ## 629                        -               -              -
    ## 630                        -               -              -
    ## 631                       57               -              -
    ## 632                       54               -              -
    ## 633                       39               -              -
    ## 634                       30               -              -
    ## 635                       66               -              -
    ## 636                       93               -              -
    ## 637                       58               -              -
    ## 638                       62               -              -
    ## 639                        -               -              -
    ## 640                        -               -              -
    ## 641                       65               -              -
    ## 642                      5.4               -              -
    ## 643                       23               -              -
    ## 644                       36               -              -
    ## 645                       59               -              -
    ## 646                       94               -              -
    ## 647                       60               -              -
    ## 648                       99               -              -
    ## 649                       60               -              -
    ## 650                       60               -              -
    ## 651                        -               -              -
    ## 652                        -               -              -
    ## 653                       57               -              -
    ## 654                       75               -              -
    ## 655                       60               -              -
    ## 656                       60               -              -
    ## 657                       75               -              -
    ## 658                        -               -              -
    ## 659                        -               -              -
    ## 660                       92               -              -
    ## 661                       51               -              -
    ## 662                       61               -              -
    ## 663                        -               -              -
    ## 664                       61               -              -
    ## 665                       82               -              -
    ## 666                       20               -              -
    ## 667                       69               -              -
    ## 668                       87               -              -
    ## 669                       96               -              -
    ## 670                        -               -              -
    ## 671                        -               -              -
    ## 672                        -               -              -
    ## 673                       42               -              -
    ## 674                       13               -              -
    ## 675                       81               -              -
    ## 676                       53               -              -
    ## 677                       37               -              -
    ## 678                        -               -              -
    ## 679                       24               -              -
    ## 680                       59               -              -
    ## 681                       63               -              -
    ## 682                       48               -              -
    ## 683                       78               -              -
    ## 684                        -               -              -
    ## 685                       64               -              -
    ## 686                        -               -              -
    ## 687                        -               -              -
    ## 688                       36               -              -
    ## 689                       34               -              -
    ## 690                       38               -              -
    ## 691                       60               -              -
    ## 692                       64               -              -
    ## 693                       19               -              -
    ## 694                       64               -              -
    ## 695                       77               -              -
    ## 696                        -               -              -
    ## 697                        -               -              -
    ## 698                        -               -              -
    ## 699                      100               -              -
    ## 700                        -               -              -
    ## 701                        -               -              -
    ## 702                       25               -              -
    ## 703                       54               -              -
    ## 704                        -               -              -
    ## 705                        -               -              -
    ## 706                        -               -              -
    ## 707                        -               -              -
    ## 708                       61               -              -
    ## 709                       28               -              -
    ## 710                       28               -              -
    ## 711                       52               -              -
    ## 712                       93               -              -
    ## 713                       12               -              -
    ## 714                       98               -              -
    ## 715                        -               -              -
    ## 716                       58               -              -
    ## 717                       88               -              -
    ## 718                       67               -              -
    ## 719                       67               -              -
    ## 720                       75               -              -
    ## 721                       91               -              -
    ## 722                       67               -              -
    ## 723                        -               -              -
    ## 724                        -               -              -
    ## 725                        -               -              -
    ## 726                        -               -              -
    ## 727                        -               -              -
    ## 728                       68               -              -
    ## 729                        -               -              -
    ## 730                       22               -              -
    ## 731                       95               -              -
    ## 732                       40               -              -
    ## 733                       99               -              -
    ## 734                        -               -              -
    ## 735                        -               -              -
    ## 736                       78               -              -
    ## 737                       96               -              -
    ## 738                       55               -              -
    ## 739                       18               -              -
    ## 740                        -               -              -
    ## 741                        -               -              -
    ## 742                       44               -              -
    ## 743                       34               -              -
    ## 744                       43               -              -
    ## 745                        -               -              -
    ## 746                       64               -              -
    ## 747                       34               -              -
    ## 748                        -               -              -
    ## 749                        -               -              -
    ## 750                        -               -              -
    ## 751                       49               -              -
    ## 752                       82               -              -
    ## 753                       17               -              -
    ## 754                       87               -              -
    ## 755                       70               -              -
    ## 756                       41               -              -
    ## 757                        -               -              -
    ## 758                       71               -              -
    ## 759                       99               -              -
    ## 760                       71               -              -
    ## 761                       77               -              -
    ## 762                       64               -              -
    ## 763                       36               -              -
    ## 764                       88               -              -
    ## 765                       94               -              -
    ## 766                        -               -              -
    ## 767                       71               -              -
    ## 768                       49               -              -
    ## 769                       22               -              -
    ## 770                       71               -              -
    ## 771                       98               -              -
    ## 772                       94               -              -
    ## 773                       97               -              -
    ## 774                       78               -              -
    ## 775                       71               -              -
    ## 776                        -               -              -
    ## 777                        -               -              -
    ## 778                       80               -              -
    ## 779                       45               -              -
    ## 780                       72               -              -
    ## 781                       89               -              -
    ## 782                       68               -              -
    ## 783                       47               -              -
    ## 784                       72               -              -
    ## 785                        -               -              -
    ## 786                        -               -              -
    ## 787                       73               -              -
    ## 788                       82               -              -
    ## 789                        -               -              -
    ## 790                       21               -              -
    ## 791                       62               -              -
    ## 792                       87               -              -
    ## 793                       74               -              -
    ## 794                        -               -              -
    ## 795                       74               -              -
    ## 796                       74               -              -
    ## 797                       74               -              -
    ## 798                        -               -              -
    ## 799                       57               -              -
    ## 800                       87               -              -
    ## 801                       82               -              -
    ## 802                       92               -              -
    ## 803                       83               -              -
    ## 804                       20               -              -
    ## 805                        -               -              -
    ## 806                        -               -              -
    ## 807                        -               -              -
    ## 808                        -               -              -
    ## 809                       93               -              -
    ## 810                       75               -              -
    ## 811                        -               -              -
    ## 812                       63               -              -
    ## 813                       82               -              -
    ## 814                       75               -              -
    ## 815                       47               -              -
    ## 816                       75               -              -
    ## 817                       37               -              -
    ## 818                       70               -              -
    ## 819                      100               -              -
    ## 820                        -               -              -
    ## 821                        -               -              -
    ## 822                       80               -              -
    ## 823                       19               -              -
    ## 824                       17               -              -
    ## 825                       76               -              -
    ## 826                       83               -              -
    ## 827                       86               -              -
    ## 828                       94               -              -
    ## 829                       77               -              -
    ## 830                       68               -              -
    ## 831                       67               -              -
    ## 832                      6.2               -              -
    ## 833                       96               -              -
    ## 834                       62               -              -
    ## 835                        -               -              -
    ## 836                       78               -              -
    ## 837                       78               -              -
    ## 838                        -               -              -
    ## 839                        -               -              -
    ## 840                       78               -              -
    ## 841                       52               -              -
    ## 842                       78               -              -
    ## 843                        -               -              -
    ## 844                       79               -              -
    ## 845                       99               -              -
    ## 846                       64               -              -
    ## 847                       79               -              -
    ## 848                        -               -              -
    ## 849                       91               -              -
    ## 850                       79               -              -
    ## 851                       71               -              -
    ## 852                       92               -              -
    ## 853                        -               -              -
    ## 854                       83               -              -
    ## 855                       85               -              -
    ## 856                       80               -              -
    ## 857                        -               -              -
    ## 858                        -               -              -
    ## 859                       81               -              -
    ## 860                       71               -              -
    ## 861                        -               -              -
    ## 862                       92               -              -
    ## 863                       81               -              -
    ## 864                      100               -              -
    ## 865                       82               -              -
    ## 866                        -               -              -
    ## 867                        -               -              -
    ## 868                       99               -              -
    ## 869                       87               -              -
    ## 870                       87               -              -
    ## 871                        -               -              -
    ## 872                        -               -              -
    ## 873                       60               -              -
    ## 874                       97               -              -
    ## 875                       67               -              -
    ## 876                       82               -              -
    ## 877                      100               -              -
    ## 878                       88               -              -
    ## 879                        -               -              -
    ## 880                        -               -              -
    ## 881                       83               -              -
    ## 882                       80               -              -
    ## 883                        -               -              -
    ## 884                        -               -              -
    ## 885                       83               -              -
    ## 886                       92               -              -
    ## 887                       88               -              -
    ## 888                       83               -              -
    ## 889                        -               -              -
    ## 890                       92               -              -
    ## 891                        -               -              -
    ## 892                        -               -              -
    ## 893                        -               -              -
    ## 894                       81               -              -
    ## 895                       15               -              -
    ## 896                       76               -              -
    ## 897                       85               -              -
    ## 898                      100               -              -
    ## 899                       84               -              -
    ## 900                        -               -              -
    ## 901                        -               -              -
    ## 902                        -               -              -
    ## 903                        -               -              -
    ## 904                        -               -              -
    ## 905                       23               -              -
    ## 906                        -               -              -
    ## 907                       98               -              -
    ## 908                       98               -              -
    ## 909                        -               -              -
    ## 910                        -               -              -
    ## 911                       74               -              -
    ## 912                       27               -              -
    ## 913                       87               -              -
    ## 914                       69               -              -
    ## 915                       86               -              -
    ## 916                       88               -              -
    ## 917                       93               -              -
    ## 918                       86               -              -
    ## 919                        -               -              -
    ## 920                       87               -              -
    ## 921                        -               -              -
    ## 922                        -               -              -
    ## 923                       95               -              -
    ## 924                       49               -              -
    ## 925                        -               -              -
    ## 926                        -               -              -
    ## 927                        -               -              -
    ## 928                       88               -              -
    ## 929                        -               -              -
    ## 930                        -               -              -
    ## 931                        -               -              -
    ## 932                       95               -              -
    ## 933                       98               -              -
    ## 934                        -               -              -
    ## 935                       89               -              -
    ## 936                        -               -              -
    ## 937                       70               -              -
    ## 938                       53               -              -
    ## 939                       96               -              -
    ## 940                       73               -              -
    ## 941                       99               -              -
    ## 942                       99               -              -
    ## 943                        -               -              -
    ## 944                        -               -              -
    ## 945                        -               -              -
    ## 946                       90               -              -
    ## 947                       59               -              -
    ## 948                       90               -              -
    ## 949                       83               -              -
    ## 950                      100               -              -
    ## 951                       90               -              -
    ## 952                       94               -              -
    ## 953                       91               -              -
    ## 954                       99               -              -
    ## 955                        -               -              -
    ## 956                       91               -              -
    ## 957                       95               -              -
    ## 958                        -               -              -
    ## 959                        -               -              -
    ## 960                      100               -              -
    ## 961                       32               -              -
    ## 962                       96               -              -
    ## 963                       93               -              -
    ## 964                       94               -              -
    ## 965                       91               -              -
    ## 966                       96               -              -
    ## 967                       97               -              -
    ## 968                       93               -              -
    ## 969                        -               -              -
    ## 970                       68               -              -
    ## 971                       85               -              -
    ## 972                       90               -              -
    ## 973                       99               -              -
    ## 974                       93               -              -
    ## 975                       93               -              -
    ## 976                        -               -              -
    ## 977                        -               -              -
    ## 978                        -               -              -
    ## 979                       99               -              -
    ## 980                        -               -              -
    ## 981                        -               -              -
    ## 982                       96               -              -
    ## 983                       95               -              -
    ## 984                      100               -              -
    ## 985                        -               -              -
    ## 986                        -               -              -
    ## 987                       97               -              -
    ## 988                       72               -              -
    ## 989                       64               -              -
    ## 990                       97               -              -
    ## 991                       98               -              -
    ## 992                        -               -              -
    ## 993                       62               -              -
    ## 994                       94               -              -
    ## 995                       99               -              -
    ## 996                       93               -              -
    ## 997                      100               -              -
    ## 998                      100               -              -
    ## 999                        -               -              -
    ## 1000                     100               -              -
    ## 1001                       -               -              -
    ## 1002                       -               -              -
    ## 1003                     100               -              -
    ## 1004                     100               -              -
