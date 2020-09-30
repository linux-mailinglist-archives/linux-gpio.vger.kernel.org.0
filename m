Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDFD27E4EA
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgI3JRJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3JRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:17:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEB9C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:17:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e16so934050wrm.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zt56kUDTtsurMg9pqdUiu46fbE5N5n8RIxY0imAh3m8=;
        b=FPoi5rl8UDy+jYDRMqTkEEIlNFkPjdAODQCIn0BzdTDsMr/o6SX+uo7XYaO++6CA6A
         uSaf6GUyUCqA6g27dwWhdcQRSs6FdYUbaOgc9CkZXqMLPj1GOrBV3K0WFBWC6wywTXBT
         MIdf4b0PFfrYSke7X6YwTtyjnehI5Z6c1zIkaeot88yk6yFKSmK4gjwqSObxE8UQxlCH
         SenR0IoUgbiSXBpQCQqgOUUvQkE6wx/CzpGAzvfl9/Ddd9/IwJdZv/a42jYMJtew960v
         lJd4lDIoIsMLt++2q6115wgOfLfW+TvBRyD2SQ/p2oGBICpHCOEJcY6U2H8FDTOx55Fs
         cIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zt56kUDTtsurMg9pqdUiu46fbE5N5n8RIxY0imAh3m8=;
        b=gVzA/akhAjNNW7mHHQ0u/QSTw11aZTpfYmHwDE1KDlu0/j01r0tMiHYRA4vtmelbhn
         x9AtTl9yO0k7xz9U+y3sK4QMUyElMTzM79O3O6haqFbDfrJr1cXVEPJDRbZaw4j5R+xj
         3GuBuDrvA2sBFUTMEVxyCaQbHzgfPFdiQLK/WQxI4+RU6Uqg5spqRYUTY+9JWOGdRnvb
         Wll/s1my5wp63abXGJRGnwl3KBd+c517if5AFKNg925jhJ6rDqEVS+Grr6jvnJow0h5u
         hndh2U4zIOuKlP4w3M95mU8jvjMwUgjLVRjiLDKx1Bszw+I72Gt3nHMO4EUYz7buQUPi
         9V1g==
X-Gm-Message-State: AOAM530h/EYwupSskMKvFq1avk2MCKE3WgfdT1aaSoK23fk8BsV3s49X
        cnPVulM9OhesydUMj+UzwfYx84AwcH+WeQ==
X-Google-Smtp-Source: ABdhPJxb9YKwadpLQ8mspJRVobncPLwmGD6XAc6HoKZFGcVaMmQYKQtzM2dMPZYj2gOg7NToXprj4A==
X-Received: by 2002:adf:edcc:: with SMTP id v12mr1952114wro.240.1601457427734;
        Wed, 30 Sep 2020 02:17:07 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id j14sm1798713wrr.66.2020.09.30.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 02:17:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.10 - part 2
Date:   Wed, 30 Sep 2020 11:17:03 +0200
Message-Id: <20200930091703.8778-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

Here is the last batch of updates for v5.10 from my side. The biggest part of
this PR is the new uAPI by Kent Gibson - it's time to finally get them
upstream!

Other than that we have some refactoring of the gpio-mockup module and a code
shrink for gpio-mpc8xxx.

There's one commit here that's in your fixes branch but not in devel - the fix
of a resource leak in gpio-mockup. This is because the refactoring patches
depend on it.

Please pull.

The following changes since commit 12d16b397ce0a999d13762c4c0cae2fb82eb60ee:

  gpio: mxc: Support module build (2020-09-29 15:04:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.10-part2

for you to fetch changes up to cf048e05b68789e9fa35f246f8ecbe95d79f4173:

  tools: gpio: add debounce support to gpio-event-mon (2020-09-30 10:57:30 +0200)

----------------------------------------------------------------
gpio updates for v5.10 - part 2

- refactor gpio-mockup testing module
- simplify the code in gpio-mpc8xxx
- implement v2 of the GPIO user API

----------------------------------------------------------------
Bartosz Golaszewski (11):
      gpio: mockup: fix resource leak in error path
      lib: string_helpers: provide kfree_strarray()
      Documentation: gpio: add documentation for gpio-mockup
      gpio: mockup: drop unneeded includes
      gpio: mockup: use KBUILD_MODNAME
      gpio: mockup: use pr_fmt()
      gpio: mockup: remove unneeded return statement
      gpio: mockup: increase the number of supported device properties
      gpio: mockup: pass the chip label as device property
      gpio: mockup: use the generic 'gpio-line-names' property
      gpio: mockup: refactor the module init function

Kent Gibson (20):
      gpiolib: cdev: gpio_desc_to_lineinfo() should set info offset
      gpiolib: cdev: replace strncpy() with strscpy()
      gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
      gpio: uapi: define uAPI v2
      gpiolib: make cdev a build option
      gpiolib: add build option for CDEV v1 ABI
      gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL
      gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
      gpiolib: cdev: support edge detection for uAPI v2
      gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
      gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
      gpiolib: cdev: support setting debounce
      gpio: uapi: document uAPI v1 as deprecated
      tools: gpio: port lsgpio to v2 uAPI
      tools: gpio: port gpio-watch to v2 uAPI
      tools: gpio: rename nlines to num_lines
      tools: gpio: port gpio-hammer to v2 uAPI
      tools: gpio: port gpio-event-mon to v2 uAPI
      tools: gpio: add multi-line monitoring to gpio-event-mon
      tools: gpio: add debounce support to gpio-event-mon

Michael Walle (1):
      gpio: mpc8xxx: simplify ls1028a/ls1088a support

 Documentation/admin-guide/gpio/gpio-mockup.rst |   50 +
 drivers/gpio/Kconfig                           |   29 +-
 drivers/gpio/Makefile                          |    2 +-
 drivers/gpio/gpio-mockup.c                     |  160 +--
 drivers/gpio/gpio-mpc8xxx.c                    |   45 +-
 drivers/gpio/gpiolib-cdev.c                    | 1539 +++++++++++++++++++++---
 drivers/gpio/gpiolib-cdev.h                    |   15 +
 drivers/gpio/gpiolib.c                         |    5 +
 drivers/gpio/gpiolib.h                         |    6 +
 include/linux/string_helpers.h                 |    2 +
 include/uapi/linux/gpio.h                      |  334 ++++-
 lib/string_helpers.c                           |   23 +
 tools/gpio/gpio-event-mon.c                    |  146 ++-
 tools/gpio/gpio-hammer.c                       |   56 +-
 tools/gpio/gpio-utils.c                        |  176 ++-
 tools/gpio/gpio-utils.h                        |   48 +-
 tools/gpio/gpio-watch.c                        |   16 +-
 tools/gpio/lsgpio.c                            |   60 +-
 18 files changed, 2273 insertions(+), 439 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst
