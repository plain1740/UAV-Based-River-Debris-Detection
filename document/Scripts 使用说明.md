1_video2pic.bat  在/src/raw_pipeline/0_process_video.py修改存放视频地址的位置，剩下自动，输出路径在 data/2_deduplicated_image/kept
标注完后将图片和label文件夹放回2_deduplicated_image，使用2_pic2train.bat，输出路径为
data/5_train_data   
对训练集使用  dataset_pipeline/extract_image.py 后满足dataset_pipeline目录下文件的输入要求，        │   ├───A0_image_analyzer.py # 数据集分析工具
        │   ├───A1_10-4_filter.py    # 过滤掉小于10^-4的标注框
        │   ├───A1_isolation_forest.py # 孤立森林异常检测
        
使用 dataset_pipeline/RAW2TRAIN.py变回训练集
如果需要使用SAHI分割数据集，先dataset_pipeline/TO_COCO.py  将标注文件改成COCO格式的，  之后  dataset_pipeline/sahi_slice_dataset.py  再dataset_pipeline/TO_YOLO.py 转至TXT格式的标注文件，记得改py文件中的变量指向