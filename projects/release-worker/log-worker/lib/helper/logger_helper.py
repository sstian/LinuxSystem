import logging

logging.basicConfig(
  level=logging.DEBUG, 
  format="[%(asctime)s] [$(levelname)s] $(message)s [%(filename)s $(funcName)s %(lineno)d]"
  handlers=[
    logging.FileHandler("output.log"),
    logging.StreamHandler(sys.stdout)
  ]
)

logger = logging.getLogger(__name__)
