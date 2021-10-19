Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9829043391F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 16:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhJSOvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 10:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhJSOvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 10:51:31 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63F7C06161C
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 07:49:18 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m42so12116556wms.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eS6l377VdbApvDNfoSn7WNJh4L5MhlIJd5UxiCWKaI0=;
        b=p+cGwaFCRpisr8jDV95j8bZ6iso9EHxPP7UiF1FAABPVkUrfJZh0A4UkIoucRR1zg4
         A6/+Ctxbsjh7RQP8whD7bJzwQG3bCTB1yoNNtsS2VsEgInqgXA+5Tj23rR1NfrQt+xYO
         YQTQE/93lX5+RD1KXJpEgfFX6qW+yoKFAHLT9jT0YAIpK5t/OB+zAxEskCTceLKXHjuy
         qbRfA1XzrdN+SSBu90/qzPQqq5So0x4ggpxXrXEFoF0QDphTkuyhvCuUY+GUK/I7A8IC
         ZLV+TPLU1awEjNCKJhArfBq1K9wAZR2XLzaKXbhxI1qDDPfPKsT/nGGqcKnO/ovwg/zn
         bn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eS6l377VdbApvDNfoSn7WNJh4L5MhlIJd5UxiCWKaI0=;
        b=4QEs5VhFsqXzmVPwP2uPYF6EGCkr2LcV4IwsjU/DP8YJoTAekKZpibl7Ibj9DZluyj
         HokJar3wTNybIUA0gk5yOqPbALI/roM6yNb9OqG6czAaQAi4/FPfOh9sZMOB6dc+foLR
         rabCdycippMOm6pkMFliDQflcXbIFQZTeX+hu2ZCWG5V90oy/ucI5Q/DN3phB8I90dGY
         yaFtIT12OEc4ZUPxP9qwSKQqbCqt4Ah/gXA5F/ZIVM8BonIUvwbLV2T8C8c162bTOEhk
         S0Y8AvKLmHhtOuXOb0mN7v5ipUUkvRT5VleYQQvap7nZ1Eqfry1tGBa77UdUEz4GciEf
         SaNw==
X-Gm-Message-State: AOAM531Wmp+2nPU88jVG7IFwSJcMqwpXCUKVJYDqHVh4XKEDcDM3bxn8
        cV3vZuj7f0clHkJpwGbsSnZpTQ==
X-Google-Smtp-Source: ABdhPJzqgun7UjiWaUhdlTxVJOvRJbqsvJYSmLekLm4e5+UpjGk3jUPVNwubFMJTIIRHJ3RwoG3TXA==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr6518694wml.178.1634654957317;
        Tue, 19 Oct 2021 07:49:17 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm16212752wrd.28.2021.10.19.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:49:16 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v8 0/8] gpio: implement the configfs testing module
Date:   Tue, 19 Oct 2021 16:49:01 +0200
Message-Id: <20211019144909.21959-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm respinning this series now because I noticed that I need to start writing
tests for my work on the new libgpiod v2 code to make sense (it's just becoming
too complicated to make even remotely functional without test coverage). At the
same time I don't want to rewrite the tests using gpio-mockup if the goal is to
replace it with gpio-sim anyway.

I fixed issues pointed out by Al Viro and made sure that references are
correctly counted (including error paths) and that memory allocated for the
pending and live groups gets freed.

===

Cc'ing Viresh too.

Viresh: while there's still a long way to go before the libgpio v2.0 release,
in order to merge the Rust bindings, we'll need a test-suite similar to what
we have now for C++ and Python bindings, except that it will have to be based
on the gpio-sim module when it makes its way into mainline.

===

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
- drop lib patches that are already upstream
- use BIT() instead of (1UL << bit) for flags
- fix refcounting for the configfs_dirent in rename()
- drop d_move() from the rename() callback
- free memory allocated for the live and pending groups in configfs_d_iput()
  and not in detach_groups()
- make sure that if a group of some name is in the live directory, a new group
  with the same name cannot be created in the pending directory

v5 -> v6:
- go back to using (1UL << bit) instead of BIT()
- if the live group dentry doesn't exist for whatever reason at the time when
  mkdir() in the pending group is called (would be a BUG()), return -ENOENT
  instead of -EEXIST which should only be returned if given subsystem already
  exists in either live or pending group

v6 -> v7:
- as detailed by Andy in commit 6fda593f3082 ("gpio: mockup: Convert to use
  software nodes") removing device properties after the platform device is
  removed but before the GPIO device gets dropped can lead to a use-after-free
  bug - use software nodes to manually control the freeing of the properties

v7 -> v8:
- fixed some minor coding style issues as pointed out by Andy

Bartosz Golaszewski (8):
  configfs: increase the item name length
  configfs: use (1UL << bit) for internal flags
  configfs: implement committable items
  samples: configfs: add a committable group
  gpio: sim: new testing module
  selftests: gpio: provide a helper for reading chip info
  selftests: gpio: add a helper for reading GPIO line names
  selftests: gpio: add test cases for gpio-sim

 Documentation/admin-guide/gpio/gpio-sim.rst   |  72 ++
 Documentation/filesystems/configfs.rst        |   6 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sim.c                       | 882 ++++++++++++++++++
 fs/configfs/configfs_internal.h               |  22 +-
 fs/configfs/dir.c                             | 276 +++++-
 include/linux/configfs.h                      |   3 +-
 samples/configfs/configfs_sample.c            | 153 +++
 tools/testing/selftests/gpio/.gitignore       |   2 +
 tools/testing/selftests/gpio/Makefile         |   4 +-
 tools/testing/selftests/gpio/config           |   1 +
 tools/testing/selftests/gpio/gpio-chip-info.c |  57 ++
 tools/testing/selftests/gpio/gpio-line-name.c |  55 ++
 tools/testing/selftests/gpio/gpio-sim.sh      | 229 +++++
 15 files changed, 1748 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh

-- 
2.30.1

