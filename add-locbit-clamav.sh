#!/bin/bash
#service clamav-freshclam stop

# Path ke file konfigurasi freshclam.conf
freshclam_conf="/etc/clamav/freshclam.conf"

# Path ke signature baru
#touch "/var/lib/clamav/lockbit.sig"
new_signature="/var/lib/clamav/lockbit.sig"

# Tambahkan konfigurasi pada freshclam.conf menggunakan sed
echo "" >> "$freshclam_conf"
echo "# Add Signature Custom By Script .sh" >> "$freshclam_conf"
echo "DatabaseCustomURL file:///var/lib/clamav/lockbit.sig" >> "$freshclam_conf"

# Tambahkan Signature Baru
echo "
# Lockbit 3.0 signature
signature Lockbit3_Ransomware {
    md5 \"8d1bf3ec9c7f819cb847383af51f2323\"; # Match on any LockBit ransom note
    md5 \"d6d0ba9b80e6e418a0c8f277cfba2996\"; # Match on any LockBit ransom note
    md5 \"e9ac9a0e9b29d9492a940eab8396a8e6\"; # Match on any LockBit ransom note
    md5 \"59c88b7a2c89e51744d6b58c6ca2477e\"; # Match on any LockBit ransom note
    md5 \"e0d8c778015a47a1a620e447e41f1d02\"; # Match on any LockBit ransom note

    # Detect LockBit 3.0 binary by its hash
    hash:sha256 = \"753e2a6c8b16de23b27a9a9b13f1e8b6a3d3aef16fde274af6d8c6f6092b42af\";
    hash:sha256 = \"d1a8aa6d8c977f7b6e94b28c8b27a23a9fc9d1fc710bfb3bf49f3d3c15ef42b3\";
    hash:sha256 = \"2e9a87c60d32f17f09b2ab7120a29e7e6b72a187d8d22ec240c9d7a576fde4b4\";
    hash:sha256 = \"6257a85edfe5c5d5e5b5c5af5b2f4a8bb8204e4d74eab1a39a1f8c13a45d9e7a\";
    # LockBit Update
    hash:sha256 = \"80e8defa5377018b093b5b90de0f2957f7062144c83a09a56bba1fe4eda932ce\";
    hash:sha256 = \"a56b41a6023f828cccaaef470874571d169fdb8f683a75edd430fbd31a2c3f6e\";
    hash:sha256 = \"d61af007f6c792b8fb6c677143b7d0e2533394e28c50737588e40da475c040ee\";
    hash:sha256 = \"506f3b12853375a1fbbf85c82ddf13341cf941c5acd4a39a51d6addf145a7a51\";
    hash:sha256 = \"c597c75c6b6b283e3b5c8caeee095d60902e7396536444b59513677a94667ff8\";
    hash:sha256 = \"917e115cc403e29b4388e0d175cbfac3e7e40ca1742299fbdb353847db2de7c2\";
    hash:sha256 = \"f9b9d45339db9164a3861bf61758b7f41e6bcfb5bc93404e296e2918e52ccc10\";
    hash:sha256 = \"a56b41a6023f828cccaaef470874571d169fdb8f683a75edd430fbd31a2c3f6e\";
    hash:sha256 = \"d61af007f6c792b8fb6c677143b7d0e2533394e28c50737588e40da475c040ee\";
    hash:sha256 = \"76a3d02ea57b1a5cb1d70e28a1b5ec1dbb74c702cc294c5d3948aa858adbb15d\";
    hash:sha256 = \"d47bf601b09f6e846536c88f961d25d6a902ce8d8bbf617b0ac21d0c19ce10a2\";
    hash:sha256 = \"f2a0a3b9139af0f27c73a510d5bc3c4f4f1dc019027c8f78697b78f6ea3f7b48\";
    hash:sha256 = \"69dc77103296dd4704527ba782f27e8d1b8c2944e7cbbf4a9b1b012f1a4d3612\";
    hash:sha256 = \"6a661f632af5dbf04bdc1f6f9f78c1ba95ad1c92e9d5d7f8f5f6d03e5733115d\";
    hash:sha256 = \"a9c9bdf3e082b259de56388a497c2b7993c547a5a2a114d7f12e1b64e5e24c77\";
    hash:sha256 = \"b75e8ee75f470f2b80a11f2b4804332cfe100d559b7a3ad643d8a03d450b2386\";
    hash:sha256 = \"c44b9c904ee8813edff67af7b9699f573f62ceff5ddce8f7b27e7fbd90c5b8ed\";
    hash:sha256 = \"ed3f3995a037e847ccf5d7b3f11cfefb430d18e6aeb5f4be5ad139d222cf2f2a\";
    hash:sha256 = \"506f3b12853375a1fbbf85c82ddf13341cf941c5acd4a39a51d6addf145a7a51\";
    hash:sha256 = \"506f3b12853375a1fbbf85c82ddf13341cf941c5acd4a39a51d6addf145a7a51\";
    #SHA1
    hash:sha1 = \"ced1c9fabfe7e187dd809e77c9ca28ea2e165fa8\";
    hash:sha1 = \"371353e9564c58ae4722a03205ac84ab34383d8c\";
    hash:sha1 = \"c2a321b6078acfab582a195c3eaf3fe05e095ce0\";
    #Extension
    any_extension = \".lockbit\";
    any_extension = \".abcd\";
    any_extension = \".qwerty\";
    any_extension = \".0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef\";
    #Contents
    any_contents = \"[\x4D\x5A]\";
    any_contents = \"[\x89\x50\x4E\x47\x0D\x0A\x1A\x0A]\";
    any_contents = \"[\xFF\xD8\xFF\xDB]\";
    any_contents = \"[\x50\x4B\x03\x04\x14\x00\x00\x00]\";
    any_contents = \"[\x4D\x5A]\";
    #Detect LockBit 3.0 binary by its signature
    sigtool = \"+Lockbit3_Ransomware.hdb\";

}" >> "$new_signature"
