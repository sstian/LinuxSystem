import os
import sys

os.system(sys.executable + " -m pytest --capture=no --unit-xml=test/result/test_result.xml test/case")
