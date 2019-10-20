dd if=/dev/urandom of=M bs=1024 count=1024 2>/dev/null 1>/dev/null

echo "Performing 2-level 10 nodes Test"
# generate key for carol 
cpabe-keygen -o carol_priv_key pub_key master_key \
    a1 a2 a3 a4 a5 a6 a7 a8 a9 a10
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "a1 and a2 and a3 and a4 and a5 and a6 and a7 and a8 and a9 and a10" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l10n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key carol_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l10n-dec.result
done

echo "Performing 2-level 20 nodes Test"
# generate key for dave 
cpabe-keygen -o dave_priv_key pub_key master_key \
    a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "a1 and a2 and a3 and a4 and a5 and a6 and a7 and a8 and a9 and a10 and a11 and a12 and a13 and a14 and a15 and a16 and a17 and a18 and a19 and a20" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l20n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key dave_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l20n-dec.result
done

echo "Performing 2-level 30 nodes Test"
# generate key for ivan 
cpabe-keygen -o ivan_priv_key pub_key master_key \
    a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "a1 and a2 and a3 and a4 and a5 and a6 and a7 and a8 and a9 and a10 and a11 and a12 and a13 and a14 and a15 and a16 and a17 and a18 and a19 and a20 and a21 and a22 and a23 and a24 and a25 and a26 and a27 and a28 and a29 and a30" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l30n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key ivan_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l30n-dec.result
done


echo "Performing 2-level 40 nodes Test"
# generate key for eve
cpabe-keygen -o eve_priv_key pub_key master_key \
    a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "a1 and a2 and a3 and a4 and a5 and a6 and a7 and a8 and a9 and a10 and a11 and a12 and a13 and a14 and a15 and a16 and a17 and a18 and a19 and a20 and a21 and a22 and a23 and a24 and a25 and a26 and a27 and a28 and a29 and a30 and a31 and a32 and a33 and a34 and a35 and a36 and a37 and a38 and a39 and a40" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l40n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key eve_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/2l40n-dec.result
done

echo "Performing 3-level 10 nodes Test"
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "(a1 and a2 and a3 and a4 and a5) or (a6 and a7 and a8 and a9 and a10)" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/3l10n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key carol_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/3l10n-dec.result
done

echo "Performing 4-level 10 nodes Test"
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "((a1 and a2) or (a3 and a4 and a5)) or ((a6 and a7 and a8) or (a9 and a10))" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/4l10n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key carol_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/4l10n-dec.result
done

echo "Performing 5-level 10 nodes Test"
for i in {1..1000}
do
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-enc pub_key M "((a1 and a2) or ((a3 and a4) or a5)) or (((a6 and a7) or a8) or (a9 and a10))" ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/5l10n-enc.result    
    rtime="$( TIMEFORMAT='%lR';time ( cpabe-dec pub_key carol_priv_key M.cpabe ) 2>&1 1>/dev/null )"
    echo -e "$rtime" >> result/5l10n-dec.result
done

