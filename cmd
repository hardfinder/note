>>> import os
>>> os.system('cls')
清除python解释器命令
在用Python3抓取最简单的网页内容时，出现了这个错误：
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x8b in position 1: invalid start byte
是抓到的数据被压缩了，并不是字符集编码的问题，使用zlib库进行解压缩即可，做如下修改：
import zlib  #http://blog.csdn.net/gavin_john/article/details/50279139 
fp = urllib.request.urlopen(url)  
mybytes = fp.read()  
decompressed_data = zlib.decompress(mybytes ,16+zlib.MAX_WBITS)  #decompressed
text = decompressed_data.decode('utf8')  //utf-8
fp.close()  
print(text) 
