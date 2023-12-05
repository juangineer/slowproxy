# Copyright (c) 2023 juangineer
FROM nginx:1.25.3-bookworm AS base
RUN apt-get update && \
    apt-get install iproute2 iputils-ping -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM base AS final
COPY run-tc.sh /run-tc.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
