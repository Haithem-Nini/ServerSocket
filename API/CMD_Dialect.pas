unit CMD_Dialect;

interface

const
  CMD_SocketMain = '<|SocketMain|>';
  CMD_PRINCIPAL = '<|PRINCIPAL|>';
  CMD_CLOSE = '<|Close|>';
  CMD_WRONG_PWD = '<|WRONGPassword|>';
  CMD_OK = '<|OK|>';
  CMD_OKOK = '<|okok|>';
  CMD_INFO = '<|Info|>';
  CMD_PING = '<|PING|>';
  CMD_PONG = '<|PONG|>';

  // CHAT SECRET PROTOCOLS ...
  CMD_OPEN_CHAT = '<|OpenChat|>';
  CMD_CHAT = '<|Chat|>';
  CMD_CLOSE_CHAT = '<|CloseChat|>';

  // REMOTE DESKTOP  PROTOCOLS ...
  CMD_DESKTOP = '<|DESKTOP|>';
  CMD_REQUEST_DESKTOP = '<|REQUEST_DESKTOP|>';
  CMD_STREAM_SIZE = '<|STREAM_SIZE|>';
  CMD_GET_SCREEN = '<|GetS|>';

  // KEYBOARD PROTOCOLS ....
  CMD_KEYBOARD = '<|KEYBOARD|>';
  CMD_REQUEST_KEYBOARD = '<|REQUESTKEYBOARD|>';

  // MOUSE MOVE SECRET PROTOCOLS ...
  CMD_MOUSE_POS = '<|MousePos|>';
  CMD_MOUSE_LD = '<|MouseLD|>';
  CMD_MOUSE_DC = '<|MouseDC|>';
  CMD_MOUSE_LU = '<|MouseLU|>';
  CMD_MOUSE_RD = '<|MouseRD|>';
  CMD_MOUSE_RU = '<|MouseRU|>';

  // SHARING FOLDERS & FILES PROTOCOLS ...
  CMD_FOLDER = '<|Folder|>';
  CMD_FILES = '<|Files|>';

  // DOWNLOAD PROTOCOLS ...
  CMD_DOWNLOAD = '<|DOWNLOAD|>';
  CMD_DOWNLOAD_FILE = '<|DownloadFile|>';

  // UPLOAD PROTOCOLS ...
  CMD_UPLOAD = '<|UPLOAD|>';
  CMD_UPLOAD_FILE = '<|UploadFile|>';
  CMD_UPLOAD_SIZE = '<|Size|>';
  CMD_PROGRESS_UPLOAD = '<|ProgressUP|>';
  CMD_SEND = '<|Sent|>';
  CMD_IS_UPLOADED = '<|ISUploaded|>';

implementation

end.

