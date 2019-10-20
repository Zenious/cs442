# generate master and public key
cpabe-setup

# generate key for alice
cpabe-keygen -o alice_priv_key pub_key master_key \
    doctor general_hospital allergy_centre 'id = 100203456'

# generate key for bob
cpabe-keygen -o bob_priv_key pub_key master_key \
    programmer engineering_department abc_pte_ltd 'id = 123456789'

# generate key for mallory
cpabe-keygen -o mallory_priv_key pub_key master_key \
    nurse general_hospital allergy_centre 'id = 123001234'

# create 1M file with random content named 'M'
dd if=/dev/urandom of=M bs=1024 count=1024

# encrypt file 'M' with policy
cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)'

# decryption by alice
cpabe-dec pub_key alice_priv_key M.cpabe

# encrypt file 'M' with policy
cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)'

# decryption by bob
cpabe-dec pub_key bob_priv_key M.cpabe

# encrypt file 'M' with policy
cpabe-enc pub_key M 'id=123456789 or (general_hospital and allergy_centre and doctor)'

# decryption by mallory
cpabe-dec pub_key mallory_priv_key M.cpabe