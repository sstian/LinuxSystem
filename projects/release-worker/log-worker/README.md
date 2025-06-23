
## log-worker
```cmd
pip install -r requirements.txt
```

## open-worker
```
code --new-window \\server\share\folder\file1.log \\server\share\folder\file2.log

code --goto \\server\share\folder\file1.log
code --goto \\server\share\folder\file2.log
```

```python
open_command = f"code --new-window \\server\share\folder\file1.log \\server\share\folder\file2.log"
os.system(open_command)

goto_command = f"code --goto \\server\share\folder\file1.log"
os.system(goto_command)
```
