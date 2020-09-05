Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F296025E7F2
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgIENiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbgIENgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:36:33 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0C5C061245;
        Sat,  5 Sep 2020 06:36:31 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x18so2419924pll.6;
        Sat, 05 Sep 2020 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQZ80LFA88ZvxsuB5GXh97wkMTlbjoteepSRvpUw2jQ=;
        b=JptF3z+tYDwf82Mv6lyPrGlYCQ/lUrJAP3M4ZbNDUND1KzSL0pa3okb/fKP7PJnb1G
         KEwJy1AkUVaHWnOs2i5DofeAwqNcgiTanNA3u5zlGG7e24OKOcvXc8MZ7g4VsxHIqHw1
         aDuzEzXvEq0hl+iCfOGeGBrRlYtZcDKGZo98uX64XF+boRJG9R/ANqY69joOcUWmOi2O
         fdSlxzKAbO+g2N2/NRgBPL+OGB4hc2nihFwkOSBrtmxYMY6sBBzlakybPC32tGCrtnln
         hf+1r8j2++dxZs1/YSvO+ZEhXSupyRup3sBKFeSQjXzwcB2qyChrC7vEcr1JmPqcLajq
         +ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQZ80LFA88ZvxsuB5GXh97wkMTlbjoteepSRvpUw2jQ=;
        b=iJ6TPSYKn+ZZsiWscVLFfH3sjPA3IdkECXfXU3VLeSz5mSvc6DduxehWYWk6FJ0dSa
         tzlalUsCYtT1S/7hJgxoGR0uqr4/4g+muez0UC4WZdXqMM8i65GGbYHqXfp7kueRgRsk
         Z6GeuRqn1h7LHbcNfpGotIL89W0Uuebkx07FAReR8fIQJOSPcRhI5xRP5wCkRG29BkDT
         +jmCd/66WUwd3Cc5O+pVW13eNqQu9BY3T1qdwhHg+TDrmhQ2hfnMMD8rnLgEMWjla/G0
         vMyFru/zc2/vDlcaxUf5dtH+0DFyUmP5kKGZLvK58gjoWqJAJ5tuU1vl/jT1O0Kw5qaB
         OAvg==
X-Gm-Message-State: AOAM530MO/OEOcfROLxsXmhc1nQbSQIFI7AsPvrkkHd44SY0SCd0cqUR
        TklF+5R4tyPpnRHhxrGZ1fIXQo7KPUU=
X-Google-Smtp-Source: ABdhPJwkhX8i7gLi5bhzmP98ZS9SYKWDm0Fk22/i0pyOGPUlrnlOLJ18Cwrx7w6nxwWov07XKD2caw==
X-Received: by 2002:a17:90a:c505:: with SMTP id k5mr11994540pjt.188.1599312981860;
        Sat, 05 Sep 2020 06:36:21 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:36:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 00/20] gpio: cdev: add uAPI v2
Date:   Sat,  5 Sep 2020 21:35:29 +0800
Message-Id: <20200905133549.24606-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 1277 +++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib-cdev.h |   15 +
 drivers/gpio/gpiolib.c      |    5 +
 drivers/gpio/gpiolib.h      |    6 +
 include/uapi/linux/gpio.h   |  317 ++++++++-
 tools/gpio/gpio-event-mon.c |  146 ++--
 tools/gpio/gpio-hammer.c    |   56 +-
 tools/gpio/gpio-utils.c     |  176 ++++-
 tools/gpio/gpio-utils.h     |   48 +-
 tools/gpio/gpio-watch.c     |   16 +-
 tools/gpio/lsgpio.c         |   60 +-
 13 files changed, 1948 insertions(+), 205 deletions(-)


base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
-- 
2.28.0

