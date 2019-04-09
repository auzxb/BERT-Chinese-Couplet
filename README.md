# BERT-Chinese-Couplet

## Introduction

**BERT**, or **B**idirectional **E**ncoder **R**epresentations from **T**ransformers, 
is a new method of pre-training language representations which obtains state-of-the-art results on 
a wide array of Natural Language Processing (NLP) tasks.

**BERT-Chinese-Couplet** is based on **Sentence (and sentence-pair) classification tasks** from google's 
open source BERT (Tensorflow Version). Here, we used the `get_sequence_output` to get the hidden state of down-part of the 
couplet(hidden state vector size = 768), and used KL divergence to measure how the sequence predicted output distribution 
is different from the target distribution. As is predefined in Chinse BERT based model, the vocab size is 21128, so it's a multi-classes (21128) 
prediction task rather than the origin true/false prediction task and the cross entropy is also used in this project.

Now see some examples:

Chinese Couplet 1
````
up part   : 观音山上观山水
down part : 流沙河下流河石
````
Chinese Couplet 2
````
up part   : 壮志豪情,爱国为民赢盛世
down part : 廉风善政,图强致富振神州
````
## File tree
````
├── chinese
│   └── couplet
│       ├── dev.tsv
│       ├── test.tsv
│       ├── train.tsv
│       └── vocab.txt
├── couplet_do_pred.sh
├── couplet_do_train.sh
├── couplet_output
│   ├── checkpoint
│   ├── model.ckpt-373000.data-00000-of-00001
│   ├── model.ckpt-373000.index
│   └── model.ckpt-373000.meta
├── extract_features.py
├── LICENSE
├── modeling.py
├── modeling_test.py
├── optimization.py
├── optimization_test.py
├── pretrain_model
│   └── chinese_L-12_H-768_A-12
│       ├── bert_config.json
│       ├── bert_model.ckpt.data-00000-of-00001
│       ├── bert_model.ckpt.index
│       ├── bert_model.ckpt.meta
│       └── vocab.txt
├── run_couplet.py
├── tokenization.py
└── tokenization_test.py
````

bert pretrain model download url:   [chinese_L-12_H-768_A-12](https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip)

chinese couplet model download url: [couplet_model baiduyun](https://pan.baidu.com/s/1htBauU3PnbpE1Y4by8UC7Q) [couplet model googlecloud](https://drive.google.com/drive/folders/1y6kg3tLcEDbEneTN6CvBc6eNgyvEqVG4?usp=sharing)
## Usage

Before using this project, please check the file tree and prepare the necessary files.

### step 1:

Generally, you should download the bert pretrain model [chinese_L-12_H-768_A-12](https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip).
You can modify the default parameters and train your own chinese couplet model based on the pretrain bert model, then run ```step 2```
If you want to fastly evaluate the couplet model, then skip the ```step2``` and download my pretrain model(37300 steps) please. 
However, **I can't guarantee the performance**. Any better experiment results can be added to the issues.

### step 2:

````
./couplet_do_train.sh
````
A Chinese couplet model will be saved in ```output_dir```( default dir is ```./couplet_output/```)

### step 3:
````
./couplet_do_pred.sh
````
Please open the ```$outputdir/test_results.tsv``` to see the results.

## result

Here gives some examples. Pred is the output of my model and label is the ground truth.
````
pred : 愿景天成无墨迹[SEP]	春情自起有诗声[SEP]
label: 愿景天成无墨迹[SEP]	万方乐奏有于[UNK][SEP]
pred : 日近京都多俊迈[SEP]	风临华海尽风流[SEP]
label: 日近京都多俊迈[SEP]	藻鸿骈俪用熙时[SEP]
pred : 请自今指海为盟,告我先生,所不同心如此水[SEP]	看从日登天作梦,问君后世,何能大手是斯山[SEP]
label: 请自今指海为盟,告我先生,所不同心如此水[SEP]	更愿人闻风而起,读公遗集,亦将有感于斯文[SEP]
pred : 通揽八方客[SEP]	通通四海春[SEP]
label: 通揽八方客[SEP]	运交四海情[SEP]
pred : 美稼秋登万石[SEP]	华风春照千山[SEP]
label: 美稼秋登万石[SEP]	垂杨春丽六桥[SEP]
pred : 养在诗山春未老[SEP]	修于墨海梦犹新[SEP]
label: 养在诗山春未老[SEP]	游于宦海气犹闲[SEP]
pred : 山林岂无作者[SEP]	天地自有天人[SEP]
label: 山林岂无作者[SEP]	宇宙不少清流[SEP]
pred : 愁多因睡少[SEP]	酒少为情多[SEP]
label: 愁多因睡少[SEP]	交浅莫言深[SEP]
pred : 大别山,金刚一柱擎豫楚[SEP]	中江水,玉子千年耀汉唐[SEP]
label: 大别山,金刚一柱擎豫楚[SEP]	温泉湖,碧波千顷汇江淮[SEP]
pred : 清华冠履气[SEP]	清雅玉人风[SEP]
label: 清华冠履气[SEP]	醇古鼎彝心[SEP]
pred : 小桥小店沽酒[SEP]	大水大山读茶[SEP]
label: 小桥小店沽酒[SEP]	初火初烟煮茶[SEP]
pred : 竹影临窗诗几许[SEP]	梅香入案画千分[SEP]
label: 竹影临窗诗几许[SEP]	花容照水韵何多[SEP]
pred : 松下问童子,桐子收成几许[SEP]	花前寻老人,梅花不尽三分[SEP]
label: 松下问童子,桐子收成几许[SEP]	田中访佳人,家人储蓄甚多[SEP]
pred : 疏钟几杵穿云湿[SEP]	小月一轮带月香[SEP]
label: 疏钟几杵穿云湿[SEP]	小月一弯枕梦香[SEP]
pred : 陌柳别君摇玉手[SEP]	山花送我醉金心[SEP]
label: 陌柳别君摇玉手[SEP]	春花向我送秋波[SEP]
pred : 蝉鸣春下课[SEP]	雁落月中书[SEP]
label: 蝉鸣春下课[SEP]	电闪夏登台[SEP]
````

## Acknowledge
[1] https://github.com/google-research/bert.git
