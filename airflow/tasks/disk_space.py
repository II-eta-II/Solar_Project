import shutil

# 檢查根目錄（Linux/Mac: "/", Windows: "C:\\")
total, used, free = shutil.disk_usage("/")

print(f"總容量: {total // (2**30)} GB")
print(f"已使用: {used // (2**30)} GB")
print(f"可用空間: {free // (2**30)} GB")
