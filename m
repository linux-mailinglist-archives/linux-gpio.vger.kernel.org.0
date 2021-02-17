Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC2631D9EF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhBQNDT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhBQNDS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 08:03:18 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE68C061756
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:36 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id n8so17282659wrm.10
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJpQ7mQFxdYAwANLNc1NzqchKvO/AebmR2wYrOiuIMs=;
        b=uWJyi+GSCig8ZB/KSEZYKOzIxh/CkYnw5zZOzLpRnqO1leaJ2ZWg+nMjWDFCQJAzT4
         yA6H2Uvl0XbsA72fOMO7KF6EL89ZpVo+TlDED0s3oze5gCcukVqhLV9hfinJ126INeyw
         VP3t8mxKIAqp+hJKy/qCXlAmGF1P/1y1SBz1UlIlxIW+vH4kwIu4ot9jqRkWP13LXFed
         4R1G4vgTg1ftUoFTuYt79CHxKUxcrnFy4Qzow3F79sURHnjZ+JuoBbkLTmcF0A/ENoon
         hyRp+yewpbYZMEy8UQOh0rrxN4uSaAtBmWqO5QVlk/J935XCNP/gzhqpVZd0ECbFFYDY
         ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJpQ7mQFxdYAwANLNc1NzqchKvO/AebmR2wYrOiuIMs=;
        b=rmdTf+7PAe0Z/NryGdgnmOKvhC/c/+0UlnPS5SQEV57O446qCL50KFrbTYF+xijiW9
         Q4JK934f7PYNCaJnhCTMzcff9E1MddnLl9dB16ngJYgBqGPGdZN1k89HsHr/qcUrGazu
         fV9crUnjNIheX7TCzTEWjjaBHfD/toRAbznoCx6/g2K4J4lG1+kBs6vD5u8nWUlCGh1M
         KKcO5nZesMLGogaXH6YEPPBq4zcle2YN6XK9kEOg/MqsWoe36/bucF6IasnLXjRz6DAm
         npxVM4URd0eInJWMcfiJfJPc+XWr9FoMmWoZePvRruMTTwf+kr8Lh2GHRNw/HAtcpQHr
         IFwA==
X-Gm-Message-State: AOAM532YNGmLpGo1m9k57ZWf6EDBzE6q2DnyobHAJ0AXUDuNzc63pJ6V
        GR10bctRkAHhtFcCBlnW17ZI9Hc7ybMIBA==
X-Google-Smtp-Source: ABdhPJxPESPm6yIvsee0vBDJB0kZlhQvlywWAvuebFtZ/exZsLYXRgAcXkrEAFlYyVBvTt1uMK6UdQ==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr18611862wro.185.1613566954775;
        Wed, 17 Feb 2021 05:02:34 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id w8sm3910789wrm.21.2021.02.17.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 05:02:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 0/3] licensing: try to get licensing right
Date:   Wed, 17 Feb 2021 14:02:22 +0100
Message-Id: <20210217130225.6378-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series tries to improve the licensing situation of libgpiod before we
proceed with v2.0.

The first patch is rather uncotroversial: it makes the project compliant
with the REUSE v3.0 specification.

Next two patches propose to change the licenses for certain files:
non-library source files are relicensed under GPL-2.0-or-later while C++
library code's license is upgraded to LGPL-3.0-or-later.

The only person other than myself who contributed significant code to the
relicensed files is Kent Gibson (Cc'ed) so these patches will need his
ack.

Bartosz Golaszewski (3):
  licensing: make the project REUSE-compliant
  licensing: relicense non-library code under GPL-2.0-or-later
  licensing: relicense C++ library code under LGPL-3.0-or-later

 .gitignore                                 |   3 +
 COPYING                                    | 511 +--------------------
 Doxyfile.in                                |   9 +-
 LICENSES/CC-BY-SA-4.0.txt                  | 427 +++++++++++++++++
 LICENSES/GPL-2.0-only.txt                  | 339 ++++++++++++++
 LICENSES/GPL-2.0-or-later.txt              |   1 +
 LICENSES/LGPL-2.1-or-later.txt             | 502 ++++++++++++++++++++
 LICENSES/LGPL-3.0-or-later.txt             | 165 +++++++
 LICENSES/Linux-syscall-note.txt            |  25 +
 Makefile.am                                |  19 +-
 NEWS                                       |   3 +
 README                                     |   3 +
 TODO                                       |   3 +
 autogen.sh                                 |  11 +-
 bindings/Makefile.am                       |   9 +-
 bindings/cxx/Makefile.am                   |   9 +-
 bindings/cxx/chip.cpp                      |   8 +-
 bindings/cxx/examples/.gitignore           |   3 +
 bindings/cxx/examples/Makefile.am          |   9 +-
 bindings/cxx/examples/gpiodetectcxx.cpp    |   8 +-
 bindings/cxx/examples/gpiofindcxx.cpp      |   8 +-
 bindings/cxx/examples/gpiogetcxx.cpp       |   8 +-
 bindings/cxx/examples/gpioinfocxx.cpp      |   8 +-
 bindings/cxx/examples/gpiomoncxx.cpp       |   8 +-
 bindings/cxx/examples/gpiosetcxx.cpp       |   8 +-
 bindings/cxx/gpiod.hpp                     |   8 +-
 bindings/cxx/iter.cpp                      |   8 +-
 bindings/cxx/libgpiodcxx.pc.in             |   3 +
 bindings/cxx/line.cpp                      |  10 +-
 bindings/cxx/line_bulk.cpp                 |   8 +-
 bindings/cxx/tests/.gitignore              |   3 +
 bindings/cxx/tests/Makefile.am             |   9 +-
 bindings/cxx/tests/gpio-mockup.cpp         |   8 +-
 bindings/cxx/tests/gpio-mockup.hpp         |   8 +-
 bindings/cxx/tests/gpiod-cxx-test-main.cpp |   8 +-
 bindings/cxx/tests/gpiod-cxx-test.cpp      |   8 +-
 bindings/cxx/tests/tests-chip.cpp          |   8 +-
 bindings/cxx/tests/tests-event.cpp         |   8 +-
 bindings/cxx/tests/tests-iter.cpp          |   8 +-
 bindings/cxx/tests/tests-line.cpp          |   8 +-
 bindings/python/Makefile.am                |   9 +-
 bindings/python/examples/Makefile.am       |   9 +-
 bindings/python/examples/gpiodetect.py     |   9 +-
 bindings/python/examples/gpiofind.py       |   9 +-
 bindings/python/examples/gpioget.py        |   9 +-
 bindings/python/examples/gpioinfo.py       |   9 +-
 bindings/python/examples/gpiomon.py        |   9 +-
 bindings/python/examples/gpioset.py        |   9 +-
 bindings/python/gpiodmodule.c              |   6 +-
 bindings/python/tests/Makefile.am          |   9 +-
 bindings/python/tests/gpiod_py_test.py     |   9 +-
 bindings/python/tests/gpiomockupmodule.c   |   6 +-
 configure.ac                               |   9 +-
 include/Makefile.am                        |   9 +-
 include/gpiod.h                            |   6 +-
 lib/Makefile.am                            |   9 +-
 lib/core.c                                 |   6 +-
 lib/helpers.c                              |   6 +-
 lib/libgpiod.pc.in                         |   4 +
 lib/misc.c                                 |   6 +-
 lib/uapi/gpio.h                            |  22 +-
 man/.gitignore                             |   3 +
 man/Makefile.am                            |   9 +-
 man/template                               |   3 +
 tests/.gitignore                           |   3 +
 tests/Makefile.am                          |   9 +-
 tests/gpiod-test.c                         |   8 +-
 tests/gpiod-test.h                         |   8 +-
 tests/mockup/Makefile.am                   |   9 +-
 tests/mockup/gpio-mockup.c                 |   8 +-
 tests/mockup/gpio-mockup.h                 |   6 +-
 tests/tests-bulk.c                         |   8 +-
 tests/tests-chip.c                         |   8 +-
 tests/tests-event.c                        |   8 +-
 tests/tests-line.c                         |   8 +-
 tests/tests-misc.c                         |   8 +-
 tools/.gitignore                           |   3 +
 tools/Makefile.am                          |   9 +-
 tools/gpio-tools-test                      |   9 +-
 tools/gpio-tools-test.bats                 |   9 +-
 tools/gpiodetect.c                         |   8 +-
 tools/gpiofind.c                           |   8 +-
 tools/gpioget.c                            |   8 +-
 tools/gpioinfo.c                           |   8 +-
 tools/gpiomon.c                            |   8 +-
 tools/gpioset.c                            |   8 +-
 tools/tools-common.c                       |   8 +-
 tools/tools-common.h                       |   8 +-
 88 files changed, 1663 insertions(+), 936 deletions(-)
 create mode 100644 LICENSES/CC-BY-SA-4.0.txt
 create mode 100644 LICENSES/GPL-2.0-only.txt
 create mode 120000 LICENSES/GPL-2.0-or-later.txt
 create mode 100644 LICENSES/LGPL-2.1-or-later.txt
 create mode 100644 LICENSES/LGPL-3.0-or-later.txt
 create mode 100644 LICENSES/Linux-syscall-note.txt

-- 
2.29.1

