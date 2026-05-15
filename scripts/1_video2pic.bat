
call conda activate yolo_env

python ../src/raw_pipeline/0_process_video.py

python ../src/raw_pipeline/1_deduplicat_image.py

python ../src/raw_pipeline/2_past_audit.py

python ../src/raw_pipeline/2_pre_audit.py

pause