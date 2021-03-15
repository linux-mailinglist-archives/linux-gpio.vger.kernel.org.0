Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893BA33AE4D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhCOJOd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhCOJOF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:14:05 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A3FC06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:05 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso19757796wmi.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7q9frKRyQfRE4B6MTRBlCEP/Flnqnclwy9pdxxLTvwI=;
        b=bzk3LhhcHOkhreIRdFUAb3eBRe5iFe9hp/x+X9PdLSDk3QlvrAQycVu4LhZ9enxjMt
         u7ZaPqtUEzdXkE/mRtbps3BdhM2iluXj/UwIiX4fbjhXwZ9sQBAZrqnKTu4O8e0XdZap
         rnlJBdwI/4/yuzaH10B3AauzX9xALmpEV2D7nw6QfJ49KWqqQLAbq0w1m2tlFwVTacnb
         q1Rca1wUD54C6CmfDLwwDiq+AMhFDK4Di1MmCKgrItgZfSCLtIvAiWnlVKEtNLks4iDs
         602nvN+TN3hAZBH+CtY0h06MdrUROgmfJ/130GLxNHtSiWyM3zpEcSMcoxxXkZwa0ycW
         IuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7q9frKRyQfRE4B6MTRBlCEP/Flnqnclwy9pdxxLTvwI=;
        b=rnPX7Hnt3fwPNCYYDwRJ4Jghi0jBVcPoAa9FdknBKDfcApde6TkLRtgfk1ZGlfclnt
         39qPbDJCjFmgOb3r+ZwilBUyqsY94N/UEgppJLZmZnrchLcHxU/jaI6iKWurju2nifsM
         2cOiu0VI1btyYqV1nyGju7uI2B/2W6JHVFbvZbHrCAjWk5kzot55o/024yPuVHsh82+q
         lWTdiwTl/q3sLdZo/mcCiC0meQb6/mpaQRkvssGoMENpB5qRos5FGq7iOBHk/UzNysjK
         oYf+NRg7hFEHbu1+yk3lji4Cf+saWGruDdQcovP3dwPkPXMLub8WdwKysGIUTdKz6pgp
         8KDw==
X-Gm-Message-State: AOAM531daXUT5iBAglZpeAhIubEOhnyDDF/sMaQp89Mna0bgbmH0L7BS
        bs/JjTwrKSKeztOYkZjjz2QMnQ==
X-Google-Smtp-Source: ABdhPJxWj/OPcRAt0JL7G9FO0RU0kAhusdVeP7JKPaNGFKhZ1Img5B6pk44bPzlWF7FR7FW/WbDydg==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr25370863wmq.143.1615799644012;
        Mon, 15 Mar 2021 02:14:04 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 00/11] gpio: implement the configfs testing module
Date:   Mon, 15 Mar 2021 10:13:49 +0100
Message-Id: <20210315091400.13772-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series adds a new GPIO testing module based on configfs committable items
and sysfs. The goal is to provide a testing driver that will be configurable
at runtime (won't need module reload) and easily extensible. The control over
the attributes is also much more fine-grained than in gpio-mockup.

This series also contains a respin of the patches I sent separately to the
configfs maintainers - these patches implement the concept of committable
items that was well defined for a long time but never actually completed.

Apart from the new driver itself, its selftests and the configfs patches, this
series contains some changes to the bitmap API - most importantly: it adds
devres managed variants of bitmap_alloc() and bitmap_zalloc().

v1 -> v2:
- add selftests for gpio-sim
- add helper programs for selftests
- update the configfs rename callback to work with the new API introduced in
  v5.11
- fix a missing quote in the documentation
- use !! whenever using bits operation that are required to return 0 or 1
- use provided bitmap API instead of reimplementing copy or fill operations
- fix a deadlock in gpio_sim_direction_output()
- add new read-only configfs attributes for mapping of configfs items to GPIO
  device names
- and address other minor issues pointed out in reviews of v1

v2 -> v3:
- use devm_bitmap_alloc() instead of the zalloc variant if we're initializing
  the bitmap with 1s
- drop the patch exporting device_is_bound()
- don't return -ENODEV from dev_nam and chip_name configfs attributes, return
  a string indicating that the device is not available yet ('n/a')
- fix indentation where it makes sense
- don't protect IDA functions which use their own locking and where it's not
  needed
- use kmemdup() instead of kzalloc() + memcpy()
- collected review tags
- minor coding style fixes

v3 -> v4:
- return 'none' instead of 'n/a' from dev_name and chip_name before the device
  is registered
- use sysfs_emit() instead of s*printf()
- drop GPIO_SIM_MAX_PROP as it's only used in an array's definition where it's
  fine to hardcode the value

v4 -> v5:
- export devm bitmap functions with EXPORT_SYMBOL_GPL() instead of a simple
  EXPORT_SYMBOL()

Bartosz Golaszewski (11):
  configfs: increase the item name length
  configfs: use (1UL << bit) for internal flags
  configfs: implement committable items
  samples: configfs: add a committable group
  lib: bitmap: remove the 'extern' keyword from function declarations
  lib: bitmap: order includes alphabetically
  lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
  gpio: sim: new testing module
  selftests: gpio: provide a helper for reading chip info
  selftests: gpio: add a helper for reading GPIO line names
  selftests: gpio: add test cases for gpio-sim

 Documentation/admin-guide/gpio/gpio-sim.rst   |  72 ++
 Documentation/filesystems/configfs.rst        |   6 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sim.c                       | 874 ++++++++++++++++++
 fs/configfs/configfs_internal.h               |  22 +-
 fs/configfs/dir.c                             | 245 ++++-
 include/linux/bitmap.h                        | 127 +--
 include/linux/configfs.h                      |   3 +-
 lib/bitmap.c                                  |  42 +-
 samples/configfs/configfs_sample.c            | 153 +++
 tools/testing/selftests/gpio/.gitignore       |   2 +
 tools/testing/selftests/gpio/Makefile         |   4 +-
 tools/testing/selftests/gpio/config           |   1 +
 tools/testing/selftests/gpio/gpio-chip-info.c |  57 ++
 tools/testing/selftests/gpio/gpio-line-name.c |  55 ++
 tools/testing/selftests/gpio/gpio-sim.sh      | 229 +++++
 17 files changed, 1815 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh

-- 
2.30.1

