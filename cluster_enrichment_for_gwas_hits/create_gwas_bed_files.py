#bin gwas snps by log10 scale, create bed files 
import argparse
import pandas as pd
import numpy as np 
import math
import pdb

def parse_args():
    parser=argparse.ArgumentParser(description="bin gws snps by log10 scale, create bed files")
    parser.add_argument("--gwas")
    parser.add_argument("--out_prefix")
    parser.add_argument("--append",action="store_true",default=False,help="prepends prefix 'chr' to chromosome name")
    parser.add_argument("--pval_thresh",type=float,default=None)
    return parser.parse_args()
def main():
    args=parse_args()
    gwas=pd.read_csv(args.gwas,header=0,delim_whitespace=True,dtype={'chr':'str'})
    if args.append is True: 
        gwas['chr']='chr'+gwas['chr']
    gwas['start_pos']=gwas['snp_pos']-1
    print("loaded gwas!")
    #gwas['logp']=np.log10(gwas['pvalue'])
    subset=gwas[['chr','start_pos','snp_pos','rsid','pvalue']]
    print(subset.head)
    if args.pval_thresh is not None:
        subset=subset[subset['pvalue']<args.pval_thresh]
    #sort by pvalue
    subset=subset.sort_values(by=["pvalue"],ascending=False)
    subset.to_csv(args.out_prefix+".bed",index=False,header=False,sep='\t')
if __name__=="__main__":
    main()
    
