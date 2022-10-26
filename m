Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8FD60E0BD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 14:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbiJZMeh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 08:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiJZMeh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 08:34:37 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21AB2195
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:34:30 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso1386361wma.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+qjp+46qdfkrJIipBgM7S6/c4rzIQJPIKdWxwNyXhM=;
        b=FSIR4nGUDmNV4MZ8Ibr7IV7INcwO6xLzBZfRwmyHNp8KX4wHa8HBNYfsIr9aPu+nV5
         pZyhd0+qOOfORKwftiOBOgpCpyl/VmpimO3L0zJ+Ju+ojzmQFbLJmLsFamaQE0WUFJVe
         W/OHIqKCWazZbqxsoPmecLUcYsc/rMX/WCggh2KSoEDPXkLIPF5do2+xSsKaXTL9ESb7
         plfF6PW+D5IR+V+EkzefsVtOrGg7xe1Q/UmzJAxBplqZyAFOdy07oRyOoi1fbfP1ylqM
         CAU+DY2F4L4BoenrMmTU4N3/IZ7zr1WYtmXZsBC1f9TcY02pmHXjTR6NbBOyE990Jaw5
         cldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+qjp+46qdfkrJIipBgM7S6/c4rzIQJPIKdWxwNyXhM=;
        b=uiK/YcBrcuz68tLaFaBUJ+qpg0sqkXKZ+t1+Q03u5eEc8ApBjfXQAYktTMG54bQjOe
         /hclnMYRGVYbkLR+DsG9EwqtW5lsp0F9zmcpD+FTfRon3FFviOlXv55VkVgoZ3TKFruw
         5ER5Z/CuLAvd4h4Whaf5ZGTChJuyAmQBSrX/yqIaxUKuUv9nTk2yjlNoadod14ddSCQF
         La4lMPCeqxTp7T6jszvrZMWT5SQoRhmibfHbUdY8adiRfz2a7B+P/fk0NEncqZpSc/rE
         i56RSb3Hd6wI5Gte/5I1q/xmerZpJFDrIYoc38CDH7QZGU/PXQg02gG+M19UauJdKReM
         aStw==
X-Gm-Message-State: ACrzQf1rPLnpd+1/HiBgo2ZDsxd3XXqvBcUZPxylVvGjeZ1zEW1p1cNN
        rG36Mefauq3WsjhzIkDZxYlASw==
X-Google-Smtp-Source: AMsMyM6Pw2s/g5W6Wo1CtAVmSvrPI/qHlaoSY5haAPEmpBFVCUrio8Lp2CivsiKS0NyvQNUj9EGczA==
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id c12-20020a05600c0a4c00b003b4fc1b0081mr2257694wmq.125.1666787668946;
        Wed, 26 Oct 2022 05:34:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7417:89f0:c4ec:a9c2])
        by smtp.gmail.com with ESMTPSA id t20-20020a0560001a5400b0022584c82c80sm5095880wry.19.2022.10.26.05.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 05:34:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v4 0/4] bindings: implement python bindings for libgpiod v2
Date:   Wed, 26 Oct 2022 14:34:21 +0200
Message-Id: <20221026123425.498912-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is the fourth iteration of python bindings for libgpiod v2.

The code has been split into high-level python and low-level C layers
with the latter only doing the bare minimum.

The data model is mostly based on the C++ one with the main difference
being utilizing dynamic typing and keyword arguments in place of the
builder pattern. That allows us to reduce the number of methods and
objects.

Because python doesn't have RAII, unlike C++, we provide a module-level
request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
could lead to the chip left dangling even after the last reference is
dropped.

Because python forces us to dynamically allocate objects all the time even
for fundamental types (which are also immutable) there's no point in trying
to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
just returns a list of events.

v3 -> v4:
- use list and dict comprehensions where applicable
- add a helper for detecting GPIO devices in examples
- remove commented out code
- fix whitespace errors
- cache chip_info in the chip object
- rename Chip.map_line() to Chip.line_name_from_id()
- disallow repeating line offsets/names as well as offset-name conflicts in request configs
- don't modify python objects with GIL released (self->chip assignment)
- fix type conversion strings
- fix error check in request_offsets()
- fix type comparison warnings

Bartosz Golaszewski (4):
  bindings: python: remove old version
  bindings: python: add examples
  bindings: python: add tests
  bindings: python: implement python bindings for libgpiod v2

 bindings/python/.gitignore                   |    8 +
 bindings/python/Makefile.am                  |   26 +-
 bindings/python/examples/Makefile.am         |   16 +-
 bindings/python/examples/gpiodetect.py       |   17 +-
 bindings/python/examples/gpiofind.py         |   14 +-
 bindings/python/examples/gpioget.py          |   32 +-
 bindings/python/examples/gpioinfo.py         |   38 +-
 bindings/python/examples/gpiomon.py          |   50 +-
 bindings/python/examples/gpioset.py          |   45 +-
 bindings/python/examples/helpers.py          |   15 +
 bindings/python/gpiod/Makefile.am            |   17 +
 bindings/python/gpiod/__init__.py            |   53 +
 bindings/python/gpiod/chip.py                |  329 +++
 bindings/python/gpiod/chip_info.py           |   21 +
 bindings/python/gpiod/edge_event.py          |   46 +
 bindings/python/gpiod/exception.py           |   20 +
 bindings/python/gpiod/ext/Makefile.am        |   11 +
 bindings/python/gpiod/ext/chip.c             |  339 +++
 bindings/python/gpiod/ext/common.c           |   92 +
 bindings/python/gpiod/ext/internal.h         |   21 +
 bindings/python/gpiod/ext/line-config.c      |  133 +
 bindings/python/gpiod/ext/line-settings.c    |  130 +
 bindings/python/gpiod/ext/module.c           |  193 ++
 bindings/python/gpiod/ext/request.c          |  402 +++
 bindings/python/gpiod/info_event.py          |   33 +
 bindings/python/gpiod/internal.py            |   19 +
 bindings/python/gpiod/line.py                |   56 +
 bindings/python/gpiod/line_info.py           |   73 +
 bindings/python/gpiod/line_request.py        |  247 ++
 bindings/python/gpiod/line_settings.py       |   62 +
 bindings/python/gpiodmodule.c                | 2662 ------------------
 bindings/python/setup.py                     |   47 +
 bindings/python/tests/Makefile.am            |   26 +-
 bindings/python/tests/__init__.py            |   17 +
 bindings/python/tests/__main__.py            |   16 +
 bindings/python/tests/gpiod_py_test.py       |  832 ------
 bindings/python/tests/gpiomockupmodule.c     |  309 --
 bindings/python/tests/gpiosim/Makefile.am    |    7 +
 bindings/python/tests/gpiosim/__init__.py    |    4 +
 bindings/python/tests/gpiosim/chip.py        |   65 +
 bindings/python/tests/gpiosim/ext.c          |  345 +++
 bindings/python/tests/helpers.py             |   16 +
 bindings/python/tests/tests_chip.py          |  231 ++
 bindings/python/tests/tests_chip_info.py     |   52 +
 bindings/python/tests/tests_edge_event.py    |  212 ++
 bindings/python/tests/tests_info_event.py    |  189 ++
 bindings/python/tests/tests_line_info.py     |  101 +
 bindings/python/tests/tests_line_request.py  |  485 ++++
 bindings/python/tests/tests_line_settings.py |   79 +
 bindings/python/tests/tests_module.py        |   59 +
 configure.ac                                 |    3 +
 51 files changed, 4386 insertions(+), 3929 deletions(-)
 create mode 100644 bindings/python/.gitignore
 create mode 100644 bindings/python/examples/helpers.py
 create mode 100644 bindings/python/gpiod/Makefile.am
 create mode 100644 bindings/python/gpiod/__init__.py
 create mode 100644 bindings/python/gpiod/chip.py
 create mode 100644 bindings/python/gpiod/chip_info.py
 create mode 100644 bindings/python/gpiod/edge_event.py
 create mode 100644 bindings/python/gpiod/exception.py
 create mode 100644 bindings/python/gpiod/ext/Makefile.am
 create mode 100644 bindings/python/gpiod/ext/chip.c
 create mode 100644 bindings/python/gpiod/ext/common.c
 create mode 100644 bindings/python/gpiod/ext/internal.h
 create mode 100644 bindings/python/gpiod/ext/line-config.c
 create mode 100644 bindings/python/gpiod/ext/line-settings.c
 create mode 100644 bindings/python/gpiod/ext/module.c
 create mode 100644 bindings/python/gpiod/ext/request.c
 create mode 100644 bindings/python/gpiod/info_event.py
 create mode 100644 bindings/python/gpiod/internal.py
 create mode 100644 bindings/python/gpiod/line.py
 create mode 100644 bindings/python/gpiod/line_info.py
 create mode 100644 bindings/python/gpiod/line_request.py
 create mode 100644 bindings/python/gpiod/line_settings.py
 delete mode 100644 bindings/python/gpiodmodule.c
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/tests/__init__.py
 create mode 100644 bindings/python/tests/__main__.py
 delete mode 100755 bindings/python/tests/gpiod_py_test.py
 delete mode 100644 bindings/python/tests/gpiomockupmodule.c
 create mode 100644 bindings/python/tests/gpiosim/Makefile.am
 create mode 100644 bindings/python/tests/gpiosim/__init__.py
 create mode 100644 bindings/python/tests/gpiosim/chip.py
 create mode 100644 bindings/python/tests/gpiosim/ext.c
 create mode 100644 bindings/python/tests/helpers.py
 create mode 100644 bindings/python/tests/tests_chip.py
 create mode 100644 bindings/python/tests/tests_chip_info.py
 create mode 100644 bindings/python/tests/tests_edge_event.py
 create mode 100644 bindings/python/tests/tests_info_event.py
 create mode 100644 bindings/python/tests/tests_line_info.py
 create mode 100644 bindings/python/tests/tests_line_request.py
 create mode 100644 bindings/python/tests/tests_line_settings.py
 create mode 100644 bindings/python/tests/tests_module.py

-- 
2.34.1

