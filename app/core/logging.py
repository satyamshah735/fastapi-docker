import logging
import sys

import structlog


def configure_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        stream=sys.stdout,
        format="%(message)s",
    )

    structlog.configure(
        wrapper_class=structlog.make_filtering_bound_logger(logging.INFO),
    )