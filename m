Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814642D5B96
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389103AbgLJNYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729847AbgLJNYE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:04 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4916C061793
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:23 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id q75so5286948wme.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S91prYb6PRFJ2r2VEbGAjMiEszeuyDQqMxs9MDDY5xY=;
        b=WCebGyzR2FMsepy3U0NyOMz73jraWPQZ6EV/wIMUuvBhtRxpDnNOTl6IaHuiUGRLlo
         qxvGBhOhe2486JSyn9HLRvgnT15JtlJ8+ecGPMAjS+MQ5ektX4M5VThJRqpJvMWtPds3
         lk6oMIUYp9Sj3H0dORsoMoCC4P3DXapcbpDkkUbBWQgppNh8dfimco0u2kQzvVHu7ckT
         jx4nNdFqSTNAkgeGN7iSBL67dE/gZXNn6x63FibFRRg/7lbaP8p9zIj4f97jnGnupkPW
         N6wc7z9Irt18unS4hdvBSE1wMaJn59wFs3lpOMKh8cpLCpm48chMgDM3Yljw8bOn9AEu
         4vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S91prYb6PRFJ2r2VEbGAjMiEszeuyDQqMxs9MDDY5xY=;
        b=DjsNBVdkD3nTpvSwCMFL41iFQxWacvyPW2cEUVaZeCEPjVezXMSpEt9IUJcKrpuBZo
         jHP7QCfAE04WFCeoU96DaqCI/Xb6+4wL31yqXRxiOypZQ6Pn3vhqFcdtMvb/y1rn/72B
         NYEaC3looQs4XOkWFi3zlz9P49lQPM5X/q8UOXQP+FR3dUeL+CsWMHO6/ZG7QrajLN4y
         43IYTUk82VJKhuuov1fz4G3V2rRP5t5a/bhiED01PIujkC5Yu3h0hmOnNqrBBuYHhT2w
         IFRAA+jpCSTx0aPXjqbYyU+wpOSgieuNglh8Lqbcw3ZuUKuy7kzIqA2GadL+/zcvcFcz
         lkiw==
X-Gm-Message-State: AOAM533/KsgEufR2oCjyaEfSLvfOu4ACCF4OosGGLO9cXEJ63m5Cy4ha
        1aV6Si4LaTshYggtKd7nk2lCL/ocaRLaxQ==
X-Google-Smtp-Source: ABdhPJzV25ACWXm62xoRuXQNhk+3Y7HyUI89OFHefJYFbqIk/Z+fF/BUxpf72lhErDpnlGzph2nabQ==
X-Received: by 2002:a1c:220b:: with SMTP id i11mr8322570wmi.8.1607606602377;
        Thu, 10 Dec 2020 05:23:22 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 00/14] treewide: start shaving off cruft for v2.0
Date:   Thu, 10 Dec 2020 14:23:01 +0100
Message-Id: <20201210132315.5785-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The following series removes a lot of interfaces that were deemed overkill
in libgpiod and the removal of which was suggested to me before proceeding
with the new API.

This leaves a couple holes in the library but we'll follow them up with
more improvements all over the tree. We'll create a new object called
gpiod_request for dealing with line requests of arbitrary size. We'll
probably remove the the bulk objects from bindings and eventually we'll
switch to using the v2 kernel uAPI.

Andy - a note for you: I know you're always very thorough in your reviews
but in this case let's consider this series preparing a construction zone
for the new API. Please don't nitpick too much. :)

Bartosz Golaszewski (14):
  bindings: cxx: check for error from gpiod_line_bulk_new()
  build: drop the message about tests having been built successfully
  core: export gpiod_is_gpiochip_device()
  bulk: drop the limit on the max number of lines
  core: drop line iterators
  treewide: kill opening chips by label
  API: move gpiod_line_get_chip() to line attributes section
  core: kill gpiod_line_close_chip()
  core: kill gpiod_line_get()
  treewide: kill global line lookup
  treewide: kill find_lines()
  core: rework gpiod_chip_find_line()
  build: add a configure switch for building examples
  core: kill chip iterators

 bindings/cxx/Makefile.am                |   8 +-
 bindings/cxx/chip.cpp                   |  47 +--
 bindings/cxx/examples/Makefile.am       |   4 +-
 bindings/cxx/examples/gpiodetectcxx.cpp |  13 +-
 bindings/cxx/examples/gpiofindcxx.cpp   |  18 +-
 bindings/cxx/examples/gpioinfocxx.cpp   |  43 ++-
 bindings/cxx/gpiod.hpp                  | 147 +-------
 bindings/cxx/iter.cpp                   |  95 +----
 bindings/cxx/line.cpp                   |  15 -
 bindings/cxx/line_bulk.cpp              |  24 +-
 bindings/cxx/tests/tests-chip.cpp       |  62 ++--
 bindings/cxx/tests/tests-iter.cpp       |  37 --
 bindings/cxx/tests/tests-line.cpp       |  19 -
 bindings/python/Makefile.am             |  10 +-
 bindings/python/examples/gpiodetect.py  |  12 +-
 bindings/python/examples/gpiofind.py    |  15 +-
 bindings/python/examples/gpioinfo.py    |  33 +-
 bindings/python/gpiodmodule.c           | 473 +++++++-----------------
 bindings/python/tests/gpiod_py_test.py  | 100 +----
 configure.ac                            |  12 +
 include/gpiod.h                         | 258 ++-----------
 lib/Makefile.am                         |   2 +-
 lib/core.c                              |  12 +-
 lib/helpers.c                           | 176 +++------
 lib/iter.c                              | 171 ---------
 tests/Makefile.am                       |  13 -
 tests/gpiod-test.h                      |   4 -
 tests/tests-bulk.c                      |   9 -
 tests/tests-chip.c                      |  97 +----
 tests/tests-iter.c                      | 123 ------
 tests/tests-line.c                      |  52 ---
 tools/gpiodetect.c                      |  29 +-
 tools/gpiofind.c                        |  34 +-
 tools/gpioinfo.c                        |  41 +-
 tools/gpiomon.c                         |   5 +-
 tools/tools-common.c                    |  15 +
 tools/tools-common.h                    |   3 +
 37 files changed, 557 insertions(+), 1674 deletions(-)
 delete mode 100644 lib/iter.c
 delete mode 100644 tests/tests-iter.c

-- 
2.29.1

