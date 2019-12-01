Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E161210E035
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfLADYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:24:46 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39808 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:24:46 -0500
Received: by mail-pf1-f195.google.com with SMTP id x28so16623158pfo.6
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fMlN2/zsfjGV1oAzxOGC+Z6A5PepPisinauBeb+ASkY=;
        b=o9erL0BRcgjVglLJ6XVxJ5DQriBYAUd8GjmI+4StMz2cjUOkPZsoByLuFGJwC1OFeE
         O6Cy5cc8GPMyg52x4asOvt8sEfUYzT5N0lQOLB53nxY+TyCEkukKFRLVnvBLHT8YKTKm
         7SdnDsdIb/WWoC4PaoTLn45Qp4LDKdHHm8frkY2lZblarMjmwW9kf/J3RfxgXGLXURpZ
         aSu71wEIIUbT3EOF2p/lvlf2iiXrLgzgPgkWQ9wRiK60XFLqcKSN8mEbRHIWRySvwzRp
         Vq7eH0wl6BDMKHSefzymiERmqlbsgNes3WSdpKgQY0mzAIAAiq251PAJrBealRte4SYl
         RMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fMlN2/zsfjGV1oAzxOGC+Z6A5PepPisinauBeb+ASkY=;
        b=ZdAWscqu6JHdiIu915qfhcqlZ/Rla0Vn7clssf+lE3zc76r3NrR2RLcOmFW9l73wF+
         exD8KQOkrJg56VtibtW9S3dDYZCiM+Ol1HjRNVqb9J+ir6QHi956TKJB4IMoeaq7mIC3
         okDpTu3Rn7oSCbK1c6xG4ZYdO7ybaiUAOWEm9Uoom6YzeupF93ke9GPuydOJ+ugPZIHa
         63Sf5W35UT98+GLccQVvT7c8K8txho6hVGeO+OXw4L2aTfODGKhZcIBLC/3ed+q+h2Jh
         dnC1rndg4O1DGP/dRuqCUtKH/Sp88nTIMNjh7zeWqmZxPFog0WrHKDWMKVMCGpuqvjwZ
         mKsA==
X-Gm-Message-State: APjAAAUrs9aCs0d7/Iusww5m7G9zoN58EEz2HvsNQ1+MQM4gzXNUaeNJ
        So3YgulBjOKqd/Gocj/DI0E788SU
X-Google-Smtp-Source: APXvYqxqMzLUHEJYQkL3x+62D4kr/Jm2mQLp6gms0mztC6vyKZpIZN/7PMUELwa56Ka2uFgIkuWTdQ==
X-Received: by 2002:a63:9d8f:: with SMTP id i137mr2247793pgd.33.1575170684967;
        Sat, 30 Nov 2019 19:24:44 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:24:44 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 00/20] Add support for bias flags and SET_CONFIG
Date:   Sun,  1 Dec 2019 11:23:47 +0800
Message-Id: <20191201032407.23589-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 Changes v3 -> v4:
 - tests require kernel v5.5.0
 - use std::map for bias mappings in cxx bindings
 - drop gpiod_line_is_requested_values
 - various formatting and coding style fixes
 - relocate common tool code into tools-common
 - tools bail on bad command line parameters
 - add drive option to gpioset in a separate patch
 - split out documentation update for gpiod_line_set_value_bulk
 - split out change to vals variable in gpiod_Line_set_value

This patch series adds support for changes to the GPIO uAPI that are on
track to be included in the v5.5 kernel.  There are two components to the
uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.  This
series adds support to the libgpiod API, and to both C++ and Python
bindings, for both of those components.

The libgpiod tools are also updated, where appropriate, to support the bias
flags.

The series is based on the current libgpiod master:
 master@00418df tests: fix a typo in comment

Kent Gibson (20):
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
  bindings: python: move tuple to int array conversion into helper
    function
  bindings: python: add support for SET_CONFIG
  bindings: python: tests: add tests for SET_CONFIG methods
  tools: add support for bias flags
  tools: add tests for bias flags
  tools: gpioset: add support for drive flags
  tools: add tests for drive flags
  core: document gpiod_line_set_value_bulk NULL values behaviour
  bindings: cxx: fix indentation of wrapped field descriptions
  bindings: python: make vals in gpiod_Line_set_value consistent with
    other functions

 bindings/cxx/gpiod.hpp                 |  85 ++++-
 bindings/cxx/line.cpp                  |  56 +++
 bindings/cxx/line_bulk.cpp             |  89 +++++
 bindings/cxx/tests/gpiod-cxx-test.cpp  |   2 +-
 bindings/cxx/tests/tests-line.cpp      | 215 +++++++++++
 bindings/python/gpiodmodule.c          | 485 +++++++++++++++++++++++--
 bindings/python/tests/gpiod_py_test.py | 256 ++++++++++++-
 include/gpiod.h                        | 297 +++++++++++++++
 lib/core.c                             | 214 ++++++++++-
 lib/ctxless.c                          | 114 +++++-
 tests/gpiod-test.c                     |   4 +-
 tests/tests-ctxless.c                  |  64 +++-
 tests/tests-event.c                    | 120 ++++++
 tests/tests-line.c                     | 468 +++++++++++++++++++++++-
 tools/gpio-tools-test                  |   2 +-
 tools/gpio-tools-test.bats             | 175 +++++++++
 tools/gpioget.c                        |  17 +-
 tools/gpiomon.c                        |  21 +-
 tools/gpioset.c                        |  41 ++-
 tools/tools-common.c                   |  22 ++
 tools/tools-common.h                   |   2 +
 21 files changed, 2679 insertions(+), 70 deletions(-)

-- 
2.24.0

