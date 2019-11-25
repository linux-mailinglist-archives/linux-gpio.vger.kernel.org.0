Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EDC109004
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfKYOcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:32:32 -0500
Received: from mail-pg1-f181.google.com ([209.85.215.181]:41993 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOcb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:32:31 -0500
Received: by mail-pg1-f181.google.com with SMTP id q17so7273555pgt.9
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0107YiGTpiJiWhdw5U7cGLvbMxEhurSD7BJlqKMN77k=;
        b=OBTOJzU+vvTT+TWp0fQUc8Tgje5PkrB0sUpahNlsL71VmqInoMJi8oG7mrIPXYMER6
         Z4mQyBpc1EiiiJA4Qw9HCpk7tHYZJyJPWse7tkbd01kEqQzxSxby6zibkXaIRM0AjqFW
         3gCBHTWN24jGjfzcLrR1g803AFqwQyqIa2XQY+yDF8p6AqnP3aba8sdYW/p0MbmCdFCe
         fzN9TeTN5BfvzPk/s7EhlikzXxOAs1J6skgHwZPTBdmmA8S69z+gJqYzibyJhRMfHC5V
         OvX/4BvTYDkD42bpuQrbCHFDhB/mvmxTA+nMlC9p7cGSoSwjAL0dI9sYHU5nX8o4U3+6
         dcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0107YiGTpiJiWhdw5U7cGLvbMxEhurSD7BJlqKMN77k=;
        b=Vw3STuX3HwwQ2N1gGVee1XyG1xQeG9+1ooLmYqNgT1GSgOvl+OzclxLTaP/stDn6Xx
         rHT5U7Sy6ouhOVdnPjjrnpKxJ/CmEOf/Ve/Rxp3NWrP5E0K3mXaaJlv6oT4/U0cGXhTd
         fR+gyCpS9mhy61Vd7WOvM5Nm4DdLx5hsR5kDpZcahJILLkQEJj2jyk1kVob6SQadQoC8
         mq09+RjC2mslTwczitvRtyxgE0JqGXixnePc31HMopi/k+dSNFsv/0KfxKfiMuNNVuEp
         CeawHcYnbwr2tjzpydyF25WSZjWBAF8WMHuIDqbmHygIr1GRzRi1HrUpv5Eswuut+Cys
         Qthw==
X-Gm-Message-State: APjAAAWCGDe6iOAc31V0p4CYUY4GCGvUAolTUcWJaRnJPrer3sUtZ1zJ
        /sHSkfccNgcPw67wbLKQg0MXmITHVOTEng==
X-Google-Smtp-Source: APXvYqxzZhtQMBtWEisyeWuS8cw8wWYuwKjryEcFdWPUN7z2NXHQ5fB4B4NOWuFvGDzXUquAQ7rHZw==
X-Received: by 2002:a63:5a1b:: with SMTP id o27mr33198984pgb.251.1574692349498;
        Mon, 25 Nov 2019 06:32:29 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:28 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 00/14] Add support for bias flags and SET_CONFIG
Date:   Mon, 25 Nov 2019 22:31:43 +0800
Message-Id: <20191125143157.26154-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes v2 -> v3:
 - rebase on core: deprecate gpiod_needs_update()
 - rework needs_update related logic in core: add support for SET_CONFIG

Changes v1 -> v2:
 - address all v1 review comments
 - tools accept bias flag field rather than individual flags
 - add tests for tool changes
 
This patch series adds support for changes to the GPIO uAPI that are on
track to be included in the v5.5 kernel.  There are two components to the
uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.  This
series adds support to the libgpiod API, and to both C++ and Python
bindings, for both of those components.

The libgpiod tools are also updated, where appropriate, to support the bias
flags.

The series is based on the current libgpiod master:
 master@2964441 core: deprecate gpiod_needs_update()

Kent Gibson (14):
  core: add support for bias flags
  tests: add tests for bias flags
  bindings: cxx: add support for bias flags
  bindings: cxx: tests: add tests for bias flags
  bindings: python: add support for bias flags
  bindings: python: tests: add tests for bias flags
  core: add support for SET_CONFIG
  tests: add tests for SET_CONFIG
  bindings: cxx: add support for SET_CONFIG
  bindings: cxx: tests: add tests for SET_CONFIG methods
  bindings: python: add support for SET_CONFIG
  bindings: python: tests: add tests for SET_CONFIG methods
  tools: add support for bias flags
  tools: add tests for bias and drive flags

 bindings/cxx/gpiod.hpp                 |  81 +++++
 bindings/cxx/line.cpp                  |  56 +++
 bindings/cxx/line_bulk.cpp             |  89 +++++
 bindings/cxx/tests/tests-line.cpp      | 215 ++++++++++++
 bindings/python/gpiodmodule.c          | 463 +++++++++++++++++++++++-
 bindings/python/tests/gpiod_py_test.py | 254 ++++++++++++++
 include/gpiod.h                        | 306 ++++++++++++++++
 lib/core.c                             | 219 +++++++++++-
 lib/ctxless.c                          | 114 +++++-
 tests/tests-ctxless.c                  |  64 +++-
 tests/tests-event.c                    | 120 +++++++
 tests/tests-line.c                     | 468 ++++++++++++++++++++++++-
 tools/gpio-tools-test.bats             | 139 ++++++++
 tools/gpioget.c                        |  32 +-
 tools/gpiomon.c                        |  36 +-
 tools/gpioset.c                        |  54 ++-
 16 files changed, 2669 insertions(+), 41 deletions(-)

-- 
2.24.0

