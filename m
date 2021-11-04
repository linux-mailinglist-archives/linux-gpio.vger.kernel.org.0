Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AAD445A22
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 20:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhKDTEJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 15:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbhKDTEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 15:04:08 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3516BC061714
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 12:01:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so4953335wmb.5
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 12:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+uX5Ns056I9tnFIVcNyuYzIDAX+5rS74jXcNO8ZZKU=;
        b=emBNHheP8B0mR8OzksZJqloYZOJk0nyjriKh4F2bzGPy75wwbbA3JKL5fiQuzGd0DA
         ZEiwhvGaPXtzQocFdGEa5p/FntQ//GcNErwJqh0YvaO2U0Fy42flzGTP7+dbJPcfrwfo
         XeIQJSjB0X3hTMnA3Ta7r2lDlq0H4IsbNjGRaDDNlI5YfvwdfqaGw7AByTUgvnAnlmru
         gJTLXunmjBxJ0KoRTGqsLH+N0HVeEYR3/LBmyfYAKs+e/KTvO2UCqvrMzUzcEOnshD/c
         zvM+hhmCtZU65t0KsC0U9VMO2Vt7GALek4gMzRwTjFKHskTzsQQZ+tb1rFmRvwQ0QZD/
         z+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+uX5Ns056I9tnFIVcNyuYzIDAX+5rS74jXcNO8ZZKU=;
        b=eTf8fU/B8JcRMTZ00nXtd1JzzJWbGNSrjJ4bk+3ORS+AoBLQOBjB9YWeX1f9UIXnMT
         ZKDMm4fOnhGTatTcbFt/bK6aE3ukrY4MSRq++I7TftoR2PzFgu4u3EX8QNTCbBfoUOX8
         qS9J6OezfL3KDwMYn74H3CFXHBjv0aXDund4BiaQVwKRn7SPBfCB2aCH9qdFrSLVueRR
         f/GkOiGg4xyCDJPhxQB0K7G0s4cWD3qL3FV3ORVYnKXu1TmPQ3oop9YDrS27HpMX9uyP
         ByN0CUuodtScM0tzbUaxeeMsw+g+G36xV1FB34n4QOxr84h0uIYkWeEJsdjjTIdeJuCH
         EaAg==
X-Gm-Message-State: AOAM533wGsvcVd0Vb1w7AKjXEEkscrWnp4Cd0Twh8AZT5B4UU0xwDABz
        LVEFXiGL9BDTPdviSnVXy1Jflzp429bkKA==
X-Google-Smtp-Source: ABdhPJyoy6Zj81c/FZxLpOTVEnDQY4I0ACJcBtfBpoJoM1HZy0OMGDZXc7tiSYsTwIdMqlOkcbn2ZQ==
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr25597303wmq.26.1636052488813;
        Thu, 04 Nov 2021 12:01:28 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id n1sm3986245wmq.6.2021.11.04.12.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:01:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] configfs-based GPIO simulator for v5.16
Date:   Thu,  4 Nov 2021 20:00:30 +0100
Message-Id: <20211104190030.20660-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

A while ago I sent you a pull-request for the GPIO subsystem which, in addition
to regular GPIO updates, contained a new GPIO simulator module based on
configfs that we want to use to test the uAPI and its main user-space user -
libgpiod. The PR included changes to configfs itself in the form of an
implementation of the concept of committable items. The changes had been in
development for several months and the maintainers had been largely
unresponsive which made me send it directly to you eventually after gathering
some reviews on the linux-gpio mailing list. You then Cc'ed Al who raised some
concerns and the patches were pulled out.

A couple months have passed with a few more iterations and I still can't get
any meaningful reviews from the configfs maintainers (nor NAKs for that
matter). I decided to give it another try and send it to you directly again.

Since last time I've addressed issues raised by Al (to the best of my ability
anyway) and made sure all references are counted correctly (including error
paths) and all resources freed. This code has been tested a lot with
a development version of libgpiod. The branch I've tagged spent some time in
next too with a single issue reported and fixed.

Please consider pulling.

Best Regards,
Bartosz Golaszewski

The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-sim-for-v5.16

for you to fetch changes up to 5065e08e4ef3c3fd0daf141f601de4b4d1af2333:

  gpio: sim: fix missing unlock on error in gpio_sim_config_commit_item() (2021-10-30 17:10:47 +0200)

----------------------------------------------------------------
gpio simulator + configfs changes for v5.16

- implement committable items in configfs
- add sample code
- implement the GPIO simulator based on configfs committable items
- add tests

----------------------------------------------------------------
Bartosz Golaszewski (8):
      configfs: increase the item name length
      configfs: use (1UL << bit) for internal flags
      configfs: implement committable items
      samples: configfs: add a committable group
      gpio: sim: new testing module
      selftests: gpio: provide a helper for reading chip info
      selftests: gpio: add a helper for reading GPIO line names
      selftests: gpio: add test cases for gpio-sim

Wei Yongjun (1):
      gpio: sim: fix missing unlock on error in gpio_sim_config_commit_item()

 Documentation/admin-guide/gpio/gpio-sim.rst   |  72 +++
 Documentation/filesystems/configfs.rst        |   6 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sim.c                       | 884 ++++++++++++++++++++++++++
 fs/configfs/configfs_internal.h               |  22 +-
 fs/configfs/dir.c                             | 276 +++++++-
 include/linux/configfs.h                      |   3 +-
 samples/configfs/configfs_sample.c            | 153 +++++
 tools/testing/selftests/gpio/.gitignore       |   2 +
 tools/testing/selftests/gpio/Makefile         |   4 +-
 tools/testing/selftests/gpio/config           |   1 +
 tools/testing/selftests/gpio/gpio-chip-info.c |  57 ++
 tools/testing/selftests/gpio/gpio-line-name.c |  55 ++
 tools/testing/selftests/gpio/gpio-sim.sh      | 229 +++++++
 15 files changed, 1750 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh
