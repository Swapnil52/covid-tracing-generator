from src.config import Config
from src.generator import Generator


def main():
    config = Config("./config/config.json")
    generator = Generator(config)
    generator.generate()
    generator.dump()


if __name__ == '__main__':
    main()
