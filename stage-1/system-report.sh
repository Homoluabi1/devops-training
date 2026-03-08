#!/bin/bash

# System Report Script
# This script collects system information and saves it to a file

REPORT_FILE=~/DevOpsTraining/stage-1/system-report.txt
DATE=$(date)

echo "Generating system report..."

# Write report to file
echo "========================================" > $REPORT_FILE
echo "SYSTEM REPORT" >> $REPORT_FILE
echo "Generated: $DATE" >> $REPORT_FILE
echo "========================================" >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "HOSTNAME:" >> $REPORT_FILE
hostname >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "LOGGED IN USER:" >> $REPORT_FILE
whoami >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "DISK USAGE:" >> $REPORT_FILE
df -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "MEMORY USAGE:" >> $REPORT_FILE
free -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "========================================" >> $REPORT_FILE
echo "END OF REPORT" >> $REPORT_FILE
echo "========================================" >> $REPORT_FILE

echo "Report saved to $REPORT_FILE"
