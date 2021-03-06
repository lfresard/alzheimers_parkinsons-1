CUDA_VISIBLE_DEVICES=$2 kerasAC_cross_validate \
            --data_path /mnt/lab_data3/soumyak/adpd/deeplearning/inputs/microglia.input.hdf5 \
		    --model_hdf5 /mnt/lab_data3/soumyak/adpd/deeplearning/models/regression/single_cell/$1.old.model \
            --architecture_spec regression \
		    --batch_size 256 \
            --num_train 1000000 \
            --num_valid 500000 \
            --train_upsample 0.3 \
            --upsample_thresh 0.8 \
            --tasks $1 \
		    --num_tasks 1 \
            --splits $3 \
		    --threads 20 \
		    --max_queue_size 1000 \
		    --init_weights /mnt/lab_data3/soumyak/adpd/deeplearning/encode-roadmap.dnase_tf-chip.batch_256.params.npz \
		    --patience 5 \
		    --patience_lr 2 \
            --assembly hg38 \
            --chromsizes /mnt/data/annotations/by_release/hg38/hg38.chrom.sizes \
		    --ref_fasta /mnt/data/annotations/by_release/hg38/GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta \
		    --performance_metrics_regression_file /mnt/lab_data3/soumyak/adpd/deeplearning/predictions/regression/single_cell/performance/$1.old.perfs \
		    --predictions_pickle /mnt/lab_data3/soumyak/adpd/deeplearning/predictions/regression/single_cell/pickles/$1.old.preds \
			#--vcf_file $3 \
