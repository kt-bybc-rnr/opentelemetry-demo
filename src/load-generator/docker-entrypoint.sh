#!/bin/bash
# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0

set -e

# 실행 모드에 따라 적절한 Locust 명령을 실행
if [ "$LOCUST_MODE" = "worker" ]; then
  # Worker 모드: master에 연결
  LOCUST_OPTS="--worker --master-host=$LOCUST_MASTER"
elif [ "$LOCUST_MODE" = "master" ]; then
  # Master 모드: 웹 인터페이스를 제공
  LOCUST_OPTS="--master"
else
  # 단일 모드(기존 동작)
  LOCUST_OPTS=""
fi

# 나머지 로컬 옵션 추가
LOCUST_CMD="locust --skip-log-setup $LOCUST_OPTS"

# Locust 실행
exec $LOCUST_CMD "$@"
