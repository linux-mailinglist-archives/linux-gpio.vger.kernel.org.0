Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DBB254665
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgH0OEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgH0OCw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:02:52 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88581C061264;
        Thu, 27 Aug 2020 07:00:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d22so3573153pfn.5;
        Thu, 27 Aug 2020 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HHiTQMgzvjH+G+AdBdGM786zF/ovAENPhbS4ZRK9q48=;
        b=XSpz2J11rrX/krDA4SBhcljEd62TigqrDibHGaW/IAZi/Ra4uwQRNC/F89N7+8pVcp
         YMmjGCSz/K372oazHsY/LEt8a1bpBdD/w3xCe1fZI5tkN0+QtR3HlmPRlzfe1fMWvBC/
         nlF3OuoZQmC4taTd2VtpsnFB7neFsIYvTfRoYL6pl5aDN4sRLScMWRwTbp7KBK4TB9of
         iOarBYGu4W8p7F7uYnEsrW+ebHz3c+sbZnIHdC8XpljUzJ+Dx70kENS0huYtmQ4/1YC8
         B16hyW5cdKyJORUSjGO3rvO37zX0EX9fn8Jq82KdP0on+S1WLUleVJLMObTsMSYxFoKL
         XSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HHiTQMgzvjH+G+AdBdGM786zF/ovAENPhbS4ZRK9q48=;
        b=FRHKULIkF+bU1SqJwNZz1ANO1yYSeyUq4IQ7zwu181gosy+VUAXeKcr7Wa0kIpW5or
         +PA1ZVOXMKzqdm/wi6rjEcsi/O5SDxfuVLE+Jl2fp/9GQj0womGXYyLOkX7FPMdejkNd
         ctpBcVCYnRSloJUHwwgv63cS5Q/pEujVVstXeVf4mq2C3i6a5C1ld8CopHXH+D2VlQnD
         Scbbxnnr1f4oAZqFujTVnBF5X1DMkEFWurGhOUSm4A1eur8yhfGopoXj92i2plFDS8im
         R//fhTmV0P1RlgDP943lGiDxOnX1zGC8ihhG7onQJOLW+heiJGcYm+4FA8D+aQzZM67c
         QZ7Q==
X-Gm-Message-State: AOAM532aofQ5II0OUpAG/bfscwzP/FUmGb5vxuEsySJkDgAONyyLEA+M
        0CasLVjxCCnR0oMVbx0ByfaM/A8SBrU=
X-Google-Smtp-Source: ABdhPJyIS2SpCeWLBZGFayi/BJ5ksDWZV9Pl87atv1ACxENaI4X2kDuFEZpFF/gd1KOEmPrhGCZItA==
X-Received: by 2002:a17:902:6b46:: with SMTP id g6mr15919215plt.247.1598536852531;
        Thu, 27 Aug 2020 07:00:52 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:00:51 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 00/20] gpio: cdev: add uAPI v2
Date:   Thu, 27 Aug 2020 22:00:00 +0800
Message-Id: <20200827140020.159627-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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
  gpiolib: cdev: desc_to_lineinfo should set info offset
  gpiolib: cdev: replace strncpy with strscpy
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
 drivers/gpio/gpiolib-cdev.c | 1315 +++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib-cdev.h |   15 +
 drivers/gpio/gpiolib.c      |    2 +
 drivers/gpio/gpiolib.h      |    6 +
 include/uapi/linux/gpio.h   |  316 ++++++++-
 tools/gpio/gpio-event-mon.c |  146 ++--
 tools/gpio/gpio-hammer.c    |   56 +-
 tools/gpio/gpio-utils.c     |  127 ++--
 tools/gpio/gpio-utils.h     |   50 +-
 tools/gpio/gpio-watch.c     |   16 +-
 tools/gpio/lsgpio.c         |   60 +-
 13 files changed, 1910 insertions(+), 230 deletions(-)


base-commit: 22cc422070d9a9a399f8a70b89f1b852945444cb
-- 
2.28.0

