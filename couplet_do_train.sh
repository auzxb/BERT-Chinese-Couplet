export BERT_BASE_DIR=./pretrain_model/chinese_L-12_H-768_A-12
export Chinese_DIR=chinese

python run_couplet.py \
    --task_name=couplet \
    --do_train=true \
    --do_eval=true  \
    --do_predict=false  \
    --data_dir=$Chinese_DIR/couplet  \
    --vocab_file=$BERT_BASE_DIR/vocab.txt\
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \
    --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
    --max_seq_length=22 \
    --train_batch_size=4 \
    --learning_rate=2e-5 \
    --num_train_epochs=3.0 \
    --output_dir=./couplet_output/