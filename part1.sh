#!/bin/bash

# 1kb test
echo "Performing 1KB Test"
for i in {1..1000}
do
    dd if=/dev/urandom of=M bs=1024 count=1 2>/dev/null 1>/dev/null
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)' ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/1k-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key bob_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/1k-dec.result
    rm M
done

# 10kb test
echo "Performing 10KB Test"
for i in {1..1000}
do
    dd if=/dev/urandom of=M bs=1024 count=10 2>/dev/null 1>/dev/null
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)' ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/10k-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key bob_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/10k-dec.result
    rm M
done

# 100KB test
echo "Performing 100KB Test"
dd if=/dev/urandom of=M bs=1024 count=100 2>/dev/null 1>/dev/null
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)' ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/100k-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key bob_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/100k-dec.result
done

# 1MB test
echo "Performing 1MB Test"
for i in {1..1000}
do
    dd if=/dev/urandom of=M bs=1024 count=1024 2>/dev/null 1>/dev/null
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)' ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/1m-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key bob_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/1m-dec.result
    rm M
done

