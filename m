Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D533E27A4BA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgI1A2l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1A2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:28:41 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813DFC0613CE;
        Sun, 27 Sep 2020 17:28:41 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n14so7748855pff.6;
        Sun, 27 Sep 2020 17:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8lJYJoyFGkh3GtLGHBDnbip2nw5vOSI11R3c5nyP2g=;
        b=TDOg1NDOzSJp8dLkeH+w2ULDScWN2Jgmo2GWTmC2IAzymIzzB9ePx8RnX9l+LVTYKR
         RyRYEUWpALrA35QwoE0pZezqCtGpbASzG0c77BH9343L1w26XX/0qjXw1M6To4GZdf9x
         s47oPjOWKU205mLyMzVOqGnAfCNcVqts7zi6p7rdk7o8Mbo1wk/iJ7lWsKTEKCy3fALR
         V794gLMpmCaXItrc1H0zQLjj/moSrXLCYf4Jh0/7QZr0Tij3DGH7AMicBTF9/vMl210/
         ADXwwrxjv6rlcPq2eep1uPiLjlWHjJ1E7RQ3LDJZB5d0R6uotSzgi2EtXzQFbAiimHWr
         3OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8lJYJoyFGkh3GtLGHBDnbip2nw5vOSI11R3c5nyP2g=;
        b=MYvDso0nlhcPs3Yb6vu8k1F2yVGSpyDL3/6aNhXgUcCoECtQDgaUEEc74gOalX6M8i
         7J0fuxO9EXd9qTGSkhFy4pkJEdEEJaXLJQS/k7vV21Nbj+iiD+E+XtWv3KA3MUU7ZqC1
         UrNyDYPN9jHzHtfzmxfCXSFNcNRpN8brgYS3HvEElz7up80OAytxVILJW1GXFY7m5X78
         z35f0LXOxnv/lIhQc+UvfBdo6t6jkCJpOXf3v8vng9UfkLrga6r938GGohk4z+yTtI06
         p1r/w5L3U6gcux9r0LBdnsH7CQnzD9BnvqrRo3mobDQbZyaRNRoAmfISAaBwB6Jr3RPb
         DJ1Q==
X-Gm-Message-State: AOAM533mlSgyl7YAZ+IQMsdySHO1V3WduHvOdJtc4TEemIGdJuiG52x0
        8fKXI0QTbjwx/BM01O2uEhLC30RLBAKPpA==
X-Google-Smtp-Source: ABdhPJwpVRmh4SAx4f+RCXR5HWi0Zq459ubZGbNZHYDP0b6Z/sFt69Nkglx9e6ZU0njUoNmOW38qnw==
X-Received: by 2002:a63:595a:: with SMTP id j26mr7340193pgm.406.1601252920507;
        Sun, 27 Sep 2020 17:28:40 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:28:39 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 00/20] gpio: cdev: add uAPI v2
Date:   Mon, 28 Sep 2020 08:27:47 +0800
Message-Id: <20200928002807.12146-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset defines and implements a new version of the
GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
support for debounce, event sequence numbers, and allow for requested
lines with different configurations.
It provides some future proofing by adding optional configuration fields
and padding reserved for future use.

The series can be partitioned into three blocks; the first two patches
are minor fixes that impact later patches, the next eleven contain the
v2 uAPI definition and implementation, and the final seven port the GPIO
tools to the v2 uAPI and extend them to use new uAPI features.

The more complicated patches include their own commentary where
appropriate.

Cheers,
Kent.

Changes for v10:
 - improve comment readability - replacing '&' with 'and' (patch 07 and 09)
 - add comment regarding label initialization (patch 07)
 - don't wrap memcpy line (patch 08)
 - simplify lineinfo_ensure_watch_version() (patch 08)
 - reorder if/else in edge_irq_thread() (patch 09)
 - return ENXIO instead of ENODEV if IRQ request fails (patch 09 and 12)
 - convert test_bit() result to bool (patch 10)
 - debounced_value() now returns bool (patch 12)
 - add missing function () to comments (patch 12)
 - drop redundant '!= 0' (patch 12)
 - drop "and will be removed in the future" from comment (patch 13)
 - make use of _BITULL() (patch 17)

Changes for v9:
 - references to function names should include braces (patch 02)
 - add time scale suffixes to timestamp (_ns) and debounce period (_us)
   variables (patch 04 and later)
 - address multiple review comments (patch 04)
 - drop mention of future API removal (patch 06)
 - use static_assert() rather than BUILD_BUG_ON() (patch 07)
 - change event buffer overflow behaviour to discard old events rather
   than recent events (patch 09)
 - add spaces around '*' in '*16' (patch 09)
 - reword comments regarding field access and locking (patch 09 and 12)

Changes for v8:
 - fix BUILD_BUG_ON conditions and relocate them before the return in
   gpiolib_cdev_register() (patch 07)

Changes for v7:
 - use _BITULL for ULL flag definitions (patch 04)
 - add check on kmalloc_array return value in linereq_get_values()
   (patch 07) and linereq_set_values_unlocked() (patch 11)
 - restore v1 functions used by gpio-mockup selftests (patch 17)

Changes for v6:
 - flags variable in linereq_create() should be u64 not unsigned long
   (patch 07)
 - remove restrictions on configuration changes - any change from one
   valid state to another valid state is allowed. (patches 09, 10, 12)

Changes for v5:

All changes for v5 fix issues with the gpiolib-cdev.c implementation,
in patches 07-12.
The uAPI is unchanged from v4, as is the port of the tools.

 - use IS_ALIGNED in BUILD_BUG_ON checks (patch 07)
 - relocate BUILD_BUG_ON checks to gpiolib_cdev_register (patch 07)
 - s/requies/requires/ (patch 07)
 - use unsigned int for variables that are never negative
 - change lineinfo_get() parameter from cmd to bool watch (patch 08)
 - flagsv2 in gpio_v2_line_info_to_v1() should be u64, not int (patch 08)
 - change "_locked" suffixed function names to "_unlocked" (patch 10 and
   11)
 - be less eager breaking long lines
 - move commentary into checkin comment where appropriate - particularly
   patch 12
 - restructure the request/line split - rename struct line to
   struct linereq, and struct edge_detector to struct line, and relocate
   the desc field from linereq to line.  The linereq name was selected
   over line_request as function names such as linereq_set_values() are
   more clearly associated with requests than line_request_set_values(),
   particularly as there is also a struct line.  And linereq is as
   informative as linerequest, so I went with the shortened form.
   
Changes for v4:
 - bitmap width clarification in gpiod.h (patch 04)
 - fix info offset initialisation bug (patch 08 and inserting patch 01)
 - replace strncpy with strscpy to remove compiler warnings
   (patch 08 and inserting patch 02)
 - fix mask handling in line_get_values (patch 07)

Changes for v3:
 - disabling the character device from the build requires EXPERT
 - uAPI revisions (see patch 02)
 - replace padding_not_zeroed with calls to memchr_inv
 - don't use bitops on 64-bit flags as that doesn't work on BE-32
 - accept first attribute matching a line in gpio_v2_line_config.attrs
   rather than the last
 - rework lsgpio port to uAPI v2 as flags reverted to v1 like layout
   (since patch v2)
 - swapped patches 17 and 18 to apply debounce to multiple monitored
   lines

Changes for v2:
 - split out cleanup patches into a separate series.
 - split implementation patch into a patch for each ioctl or major feature.
 - split tool port patch into a patch per tool.
 - rework uAPI to allow requested lines with different configurations.

Kent Gibson (20):
  gpiolib: cdev: gpio_desc_to_lineinfo() should set info offset
  gpiolib: cdev: replace strncpy() with strscpy()
  gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
  gpio: uapi: define uAPI v2
  gpiolib: make cdev a build option
  gpiolib: add build option for CDEV v1 ABI
  gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and
    GPIO_V2_LINE_GET_VALUES_IOCTL
  gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
    GPIO_V2_GET_LINEINFO_WATCH_IOCTL
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

 drivers/gpio/Kconfig        |   29 +-
 drivers/gpio/Makefile       |    2 +-
 drivers/gpio/gpiolib-cdev.c | 1539 +++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-cdev.h |   15 +
 drivers/gpio/gpiolib.c      |    5 +
 drivers/gpio/gpiolib.h      |    6 +
 include/uapi/linux/gpio.h   |  334 +++++++-
 tools/gpio/gpio-event-mon.c |  146 ++--
 tools/gpio/gpio-hammer.c    |   56 +-
 tools/gpio/gpio-utils.c     |  176 +++-
 tools/gpio/gpio-utils.h     |   48 +-
 tools/gpio/gpio-watch.c     |   16 +-
 tools/gpio/lsgpio.c         |   60 +-
 13 files changed, 2104 insertions(+), 328 deletions(-)


base-commit: 36eccdb58fb55d2bea6a0e62932e4d7e5192d409
-- 
2.28.0

