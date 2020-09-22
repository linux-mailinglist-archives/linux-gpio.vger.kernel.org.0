Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D968C27389E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbgIVCeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgIVCeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:34:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBA3C061755;
        Mon, 21 Sep 2020 19:34:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x22so6254873pfo.12;
        Mon, 21 Sep 2020 19:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cY6zslVSQZLlEAN2kVJVnERqbRV/QHQK4LR19eILk7A=;
        b=q66sXBYllVbnBiwtYRMt8PaHRq9mnDeAx8QeHjhltRdRHkngFz/yg0L8tcYjCQ3sbv
         IDmKhpRhquTfnHRntvT7fF02wOh/vNK57b85/1O/nsMIU2caaWMWu95+xrlEJ53ale4W
         PbrxiNT5HNk5wFwGHVYNtKLS3DW1xvevSs+fq5YggaNLa4+uvRfOKZR+vCPMBplHXUgc
         0YUmyz3p0OfmH+W5WThZRbX5LYU41/e6Byn1nZGZcOOncS2y6IF/KgyADX2cO8pLIOjc
         cesCG6h3HDyB02s/+PP+g3hxjufPOJjNmyIXVF1v9AIkdRVz2cynDJz964cZeIj828Vx
         XppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cY6zslVSQZLlEAN2kVJVnERqbRV/QHQK4LR19eILk7A=;
        b=uFB26OaCyEXJSucvR6hmx8eA7jfcuidClZYawgs8VWjjC+/0n6BsdMYvjT++s91cvl
         sOwmSeSptLVRi8cvZGfFP6vyUsj1T2v3/lc2j1f9W+/YBTqWmkdpRc/zqnLDQSDf7Al4
         KGjVLV6XAe7BvFdFaVO8TJXBllnsBdSOkSxMCijaR+lrkfFfZA6BLr8ks+45aUHvG1Rx
         hsT/AEVPXOX3++llaHBZB1GDu5bBJihasP+ptQhPYknMzoq1x3Aslbift6dG86sYQQju
         ZHmKnoWuVRtv7Vuff7Nxdbu1WRIbPglhtc5sr+4N7zXFOzE5ZhMprlpn7jo/1xFgYmwi
         sCuQ==
X-Gm-Message-State: AOAM5317NGZqL4Y6c3wLr3eZrlSjXtd2BwXW8fArl7uIFyNVs6Ot3GOo
        BbhRmtb6qufLIR5ptTykFdoMwlib2qQ1uw==
X-Google-Smtp-Source: ABdhPJz2CBZOUJxH7jmFu3FEAJktkF6aSaaw1QmcJ1wl0F1MrfZwTXWUVxnPMHexOdzHsz92aDnOyg==
X-Received: by 2002:a17:902:b682:b029:d1:e5e7:bdeb with SMTP id c2-20020a170902b682b02900d1e5e7bdebmr2666194pls.75.1600742046444;
        Mon, 21 Sep 2020 19:34:06 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:34:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 00/20] gpio: cdev: add uAPI v2
Date:   Tue, 22 Sep 2020 10:31:31 +0800
Message-Id: <20200922023151.387447-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 1531 +++++++++++++++++++++++++++++++----
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
 13 files changed, 2098 insertions(+), 326 deletions(-)


base-commit: 36eccdb58fb55d2bea6a0e62932e4d7e5192d409
-- 
2.28.0

