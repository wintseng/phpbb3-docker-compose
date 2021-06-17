#!/bin/sh
curl -o phpBB-3.3.4.zip https://download.phpbb.com/pub/release/3.3/3.3.4/phpBB-3.3.4.zip \
&& unzip phpBB-3.3.4.zip \
&& rm phpBB-3.3.4.zip

curl -o mandarin_chinese_traditional_script_3_3_4.zip https://www.phpbb.com/customise/db/download/189971 \
&& unzip mandarin_chinese_traditional_script_3_3_4.zip \
&& cp -r mandarin_chinese_traditional_script_3_3_4/* ./phpBB3/ \
&& rm mandarin_chinese_traditional_script_3_3_4.zip \
&& rm -rf mandarin_chinese_traditional_script_3_3_4

curl -o skeleton.zip https://www.phpbb.com/customise/db/download/190446 \
&& unzip skeleton.zip -d phpBB3/ext/ \
&& rm skeleton.zip
