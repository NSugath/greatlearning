class VendorSessionModel:

    vendor_session_db = dict()

    def __init__(self):
        pass

    def login(self, username):
        VendorSessionModel.vendor_session_db[username] = True
        return True

    def logout(self, username):
        if (username in VendorSessionModel.vendor_session_db):
            del VendorSessionModel.vendor_session_db[username]
        return True

    def check_login(self, username):
        if (username in VendorSessionModel.vendor_session_db):
            return True
        else:
            return False
