Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA2433306A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 22:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbhCIU7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 15:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhCIU7c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:59:32 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B61C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:59:32 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n22so3816240wmc.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gn8oZmKswy51LVCf8sN3lJck2uhZLKTyZKKw4qO3/6g=;
        b=UDX3QS1DRCeplsh6gFmESwbt2pMEFuxWcr+FuoZnUdkUlWo9itEc73DFwzsEpLjfT+
         E5wagj6hZNGuIT7+CeHPncNvW/Q/c5NPdtImBsjOuuBgipd5vJhfdg9TYwhUvFjN3G9/
         n11tsttpiBPHADZBrB9veeuJiOuX+SGYpaYNouxLoCZ4QAuuw7Xs5WGA4qMSAVXwkVXm
         /R9wXdHSreKTGEqmX/b9PseG8nzc4+56CWkKQGUcpkkH5MDW0SwtupQbDI2oUhq0v/wW
         8lntFISeo/gvfEUOClLj8xoJI/JQDTGu9UTazS2MJGTaGT0mFHVK5JpphuNtkMwTZst+
         yQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gn8oZmKswy51LVCf8sN3lJck2uhZLKTyZKKw4qO3/6g=;
        b=SlD/QOgad7fT+xshZ4xdU07d0vuksSvdfil3/BfUDMYsOu2kpmaBMZpsOq5YSyj3Pd
         2PQFITJ+UtiJ5dgf/LWkkdhBUtf2I02gxfUhGde4CuCmHbHOc1UOEZYem8m2fl/uJAES
         p7qSy6iOV0l/TfGXR8s4y8KelvJUsCYdXq6rnG6MxNrO9mjMm/wpQ50wIBy0rOoK7/gu
         hh3Q9ra9XAE+xd3XPHG2Ksy0rqcDFQLzjd8phOjcrzIQfq49Pupn8ylfO08zzffOI/MY
         55ZXM0xI7sdVvaIx8cZwFjKKdPlwsl97tBIEY4TlJ13zdVMq9ZwBi9iZ++TNhbiK5emr
         Th4Q==
X-Gm-Message-State: AOAM5328tupNs9izrnRixLMXqOK0FMoGXUdLpBikPisIAqGPG6jjIoxM
        cldb4gDWhTVXhI2ryAZ8UqCZBA==
X-Google-Smtp-Source: ABdhPJxR57vUb5NGWH1qFkeLmR1TeuTxCN5KbEEihvFE3AvKrW3UYjY0/yXwFRPWv24Adu+XXpUFog==
X-Received: by 2002:a05:600c:4a18:: with SMTP id c24mr5760941wmp.173.1615323571057;
        Tue, 09 Mar 2021 12:59:31 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:30 -0800 (PST)
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
Subject: [PATCH v3 00/11] gpio: implement the configfs testing module
Date:   Tue,  9 Mar 2021 21:59:10 +0100
Message-Id: <20210309205921.15992-1-brgl@bgdev.pl>
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
 drivers/gpio/gpio-sim.c                       | 879 ++++++++++++++++++
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
 17 files changed, 1820 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh

-- 
2.30.1

