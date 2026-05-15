
call conda activate yolo_env

python ../src/raw_pipeline/3_pre_audit_back.py

python ../src/raw_pipeline/4_divide_data.py

pause