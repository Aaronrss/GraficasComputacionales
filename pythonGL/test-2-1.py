from core.base import Base


class Test(Base):
    def initialize(self):
        print("Initializing program...")

    def update(self):
        pass


# create an instance of the Test class
Test().run()
