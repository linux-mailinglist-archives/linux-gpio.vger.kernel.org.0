Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8B12F76B4
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbhAOKbC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbhAOKbC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 05:31:02 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCAEC061757
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id k10so6865687wmi.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dF5oWfg7YyzHoExYAWf5XqxrBden5D7Wtz5slMNKvXs=;
        b=ql2HpekFjQ5XPIo41Z9cMy2gN74oyv0xlmNGdw9XkGK9rMbkDR1yN2oIryXVbUzLMT
         5Khm5bYC81chARwHdSho+FsfqyxPB9HmpHtfAjUTwjWsrinDBN2ktS6Os07QZFtTXLFK
         aYDoVKgD2HZD0JoMJnkYkhbJM6yk6hIbWo1miKYW3qRYKLjxaypCc0D4jnehoXMEK2UV
         YYDGI2ThVyj+Brmq038Md7hITZIYptTc2ep6KPgJUNUoeoBz/Sp6pbo2dMlJVjkokU2e
         COIPzo/bjwTbRAU4ZeyYaiAchhFvwW7cQ0BYwLyYN0eAmNsyXiBdFeBj3agKwA8+1/7z
         +cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dF5oWfg7YyzHoExYAWf5XqxrBden5D7Wtz5slMNKvXs=;
        b=CBKXpKefaF1ENJqi3FgnrPD8fdQdGs0hwdZpU6veBK6HLx3eadWIr6jWMm10HG7b6e
         wYOg1sU0ChFziRToQwt7Z0V0LRyON3nhPOchWV3BS2fkLh7DeHHviLyO3uVz4aCeQ+0E
         wKfzpFNT8JjG4zkUTvqIwK9mgPi1k0aUjUTaXgA+iydbfal2Zu+ZjsUJm1n9C1OUB53I
         3pdB2RKRmU7x54KxoR1yfq2xKMOoiXWfeJq4xEvRhgACMl/zSJ7JB6XTOqwYA5bqn4jr
         KNvZzSInGj7V7BBsoF2UbikT+phJEFSUb4/AZC6cEmjOISF/Qtwmxp6ywL7IxWiMJi5L
         SLuQ==
X-Gm-Message-State: AOAM530Z8uBTdzEIvUpedP/CCTpS/JVf/D/010AwaXbl4qzIqImRxjJA
        sKBMfi3m/7XqyV2zlxXyIJ1+zYZCdsAimw==
X-Google-Smtp-Source: ABdhPJyaBK3s/xPsY5IrIIZOlGaLO5991LvnyP7MlgU9luv3Lzp3NhbzbkyJYmYSdmm2kDRhDYr1XA==
X-Received: by 2002:a05:600c:40ca:: with SMTP id m10mr7912153wmh.54.1610706620896;
        Fri, 15 Jan 2021 02:30:20 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m14sm13815288wrh.94.2021.01.15.02.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:30:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2 0/7] treewide: remove more cruft and add some improvements
Date:   Fri, 15 Jan 2021 11:30:11 +0100
Message-Id: <20210115103018.27704-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is another batch of improvements to libgpiod before we overhaul the
data structure model.

The last patch adds the kernel uapi header to the repository so that we
no longer depend on its presence on the host system.

v1 -> v2:
- rename BIAS_NONE to BIAS_UNKNOWN
- rename DRIVE_NONE to DRIVE_PUSH_PULL
- rename BIAS_DISABLE to BIAS_DISABLED

Bartosz Golaszewski (7):
  treewide: remove helpers for opening chips by name & number
  treewide: simplify the active-low line property
  treewide: rename BIAS_AS_IS to BIAS_UNKNOWN
  treewide: rename BIAS_DISABLE to BIAS_DISABLED
  treewide: make drive settings an enum
  bindings: cxx: line: reorder bias mapping entries
  core: add the kernel uapi header to the repository

 bindings/cxx/chip.cpp                  |  41 +-
 bindings/cxx/examples/gpioinfocxx.cpp  |   3 +-
 bindings/cxx/gpiod.hpp                 |  61 +--
 bindings/cxx/line.cpp                  |  28 +-
 bindings/cxx/line_bulk.cpp             |   4 +-
 bindings/cxx/tests/tests-chip.cpp      |  97 +----
 bindings/cxx/tests/tests-event.cpp     |  14 +-
 bindings/cxx/tests/tests-iter.cpp      |   2 +-
 bindings/cxx/tests/tests-line.cpp      |  97 ++---
 bindings/python/examples/gpioinfo.py   |   4 +-
 bindings/python/gpiodmodule.c          | 187 +++------
 bindings/python/tests/gpiod_py_test.py | 177 ++++-----
 configure.ac                           |  12 +-
 include/gpiod.h                        |  69 +---
 lib/Makefile.am                        |   2 +-
 lib/core.c                             |  35 +-
 lib/helpers.c                          |  57 ---
 lib/uapi/gpio.h                        | 522 +++++++++++++++++++++++++
 tests/tests-chip.c                     |  41 --
 tests/tests-event.c                    |   2 +-
 tests/tests-line.c                     | 110 +++---
 tools/gpiodetect.c                     |   2 +-
 tools/gpiofind.c                       |   2 +-
 tools/gpioget.c                        |   2 +-
 tools/gpioinfo.c                       |  30 +-
 tools/gpiomon.c                        |   2 +-
 tools/gpioset.c                        |   2 +-
 tools/tools-common.c                   |  59 ++-
 tools/tools-common.h                   |   3 +
 29 files changed, 934 insertions(+), 733 deletions(-)
 create mode 100644 lib/uapi/gpio.h

-- 
2.29.1

