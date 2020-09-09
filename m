Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1EA262D0A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgIIK10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIIK1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:27:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88936C061573;
        Wed,  9 Sep 2020 03:27:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q4so1105950pjh.5;
        Wed, 09 Sep 2020 03:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pq6iorzMGS6C9lLjCdh1/LyFmGGybQFHsSIfyecTVKs=;
        b=rLgCRx5oFL53X0sS0i47qlITaLIRa2gzTUc00/5y7kFi5JABypiWCZTTbByYqpWhMf
         Z8TFagjxpjzkQJ2jnVhJJ60ri9+nOKJL3KL1SuNso07Twe0H41tk0vYbtvC4mSr8CfpD
         rE9LG5Yu/P4L2qe+BZmxs0o0n/A47jgeKUrxWhsDUtSjUOpQEeJThzou7ahGkbi2tHOu
         GdBwoeSnx6CY9W0BkyRuEZs68V9+asqvdFNAjTIklq9VvlTva09VIbaLb4x10PRPQRLP
         sek6wuhQLwcq7/qJwVI3xKp2pRjm+ZusRm4DllhZ91ZJ5+niXjqzRSlW22idjD1g5+VJ
         9hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pq6iorzMGS6C9lLjCdh1/LyFmGGybQFHsSIfyecTVKs=;
        b=BBEVoZ+w5pp4uGWndy3rP81O4qEG/LSKhVYhs6F1XTMGVAsxwdXgeGryMc901ueSzM
         tGkTDnPc3f5BvlbaN9/3zI+nkE/txZQ74TXan2NT/pWMoCoX4x9Kic9ADcTSI0AtP0++
         /Y/Hu7H5Kg52rF58bS46z5r6lJ15GH9q3PwrgIpjIqnkiCs9wJ4u8LRP1ad6hL0qL8vC
         gPsPVQyZBcxvsImm4hQ4JcERyveVa68t+46FJCYiu6zZ3F01pcsW/WZN9yTf4/mBW+/n
         b1KD6KbWlInAZTN5yfZmG2+LDeX8tkHJvQtOO6RF9GCUY7w5MWzQUMYHawES2X/I9hY9
         lvVg==
X-Gm-Message-State: AOAM531rbbqfvPXz0V/mJwt6v3NImMOyEvt5Mj2xnse+rEV3E8NAkmVs
        MkpyNWr67agBhZmFttB+KDiFZoRkAR8=
X-Google-Smtp-Source: ABdhPJxY6R+uvQaKG1AoZUaRDNCfm/66WTD2ET4XPrO9lXaLU+j0oJxrdepeRTDtl3KArP6mnuHV3g==
X-Received: by 2002:a17:90a:a50d:: with SMTP id a13mr244618pjq.180.1599647223494;
        Wed, 09 Sep 2020 03:27:03 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:27:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 00/20] gpio: cdev: add uAPI v2
Date:   Wed,  9 Sep 2020 18:26:20 +0800
Message-Id: <20200909102640.1657622-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 1278 +++++++++++++++++++++++++++++++++--
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
 13 files changed, 1949 insertions(+), 205 deletions(-)


base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
-- 
2.28.0

