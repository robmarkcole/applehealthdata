---

# comorbidity

`comorbidity` is an R package for computing comorbidity scores such as the weighted Charlson score and the Elixhauser comorbidity score; both ICD-10 and ICD-9 coding systems are supported.

## Installation

`comorbidity` is on CRAN. You can install it as usual with:

```{r cran-installation, eval = FALSE}
install.packages("comorbidity")
```


## Citation

If you find `comorbidity` useful, please cite it in your publications:

```{r citation}
citation("comorbidity")
```

## References

This package is based on the ICD-10-based formulations of the Charlson score and Elixhauser score proposed by Quan _et al_. in 2005. The ICD-9 formulation of the Charlson score is also from Quan _et al_. The ICD-9-based Elixhauser score is according to the AHRQ formulation (Moore _et al_., 2017). Weights for the Charlson score are based on the original formulation by Charlson _et al_. in 1987, while weights for the Elixhauser score are based on work by van Walraven _et al_. Finally, the categorisation of scores and weighted scores is based on work by Menendez _et al_.
 
* Quan H, Sundararajan V, Halfon P, Fong A, Burnand B, Luthi JC, et al. _Coding algorithms for defining comorbidities in ICD-9-CM and ICD-10 administrative data_. Medical Care 2005; 43(11):1130-1139. DOI: [10.1097/01.mlr.0000182534.19832.83](https://doi.org/10.1097/01.mlr.0000182534.19832.83)