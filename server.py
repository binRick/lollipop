#!/usr/bin/env python3
import logging, tempfile, shutil, os, sys, base64
from lollipop.agent import Agent
from lollipop.config import Config
from lollipop.multiplex import multiplexer

REQUIRED_ENV_KEYS = ['REQUIRED_PID_ENV_VAR_KEY','JWT_PUBLIC_KEY_B64','JWT_AUDIENCE','JWT_ISSUER']

for k in REQUIRED_ENV_KEYS:
    if not k in os.environ.keys():
        print("Unable to find {} in env".format(k))
        sys.exit(1)

logging.basicConfig(
    format='%(asctime)-15s [%(name)s:%(lineno)d]: %(msg)s',
    level=logging.INFO,
)
logger = logging.getLogger(__name__)
logger.info('test')


def run():
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('-C', '--config')
    args = parser.parse_args()

    if args.config is None:
        for path in Config.DEFAULT_PATH:
            if os.access(path, os.R_OK):
                args.config = path
                break
    if args.config is None:
        return parser.error("Can't find default configuration file")

    config = Config(args.config)
    config.REQUIRED_PID_ENV_VAR_KEY = os.environ['REQUIRED_PID_ENV_VAR_KEY']
    config.JWT = {
        "public_key": base64.b64decode(os.environ['JWT_PUBLIC_KEY_B64']).decode(),
        "algorithm": "RS256",
        "audience": os.environ['JWT_AUDIENCE'],
        "issuer": os.environ['JWT_ISSUER'],
    }
    tempdir = tempfile.mkdtemp(
        prefix=config.get('socket.prefix', 'lollipop-'),
        dir=config.get('socket.dir'),
    )

    try:
        agent = Agent(tempdir, config)
        print('listening on', agent.sockname)
        server = multiplexer()
        server.register(agent.remote)
        server.loop()
    except Exception as error:
        logger.exception('unhandled exception')
    finally:
        shutil.rmtree(tempdir)


if __name__ == '__main__':
    run()
