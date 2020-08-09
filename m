Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB5E23FE69
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgHINZ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgHINZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:25:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E0EC061756;
        Sun,  9 Aug 2020 06:25:55 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y6so3459701plt.3;
        Sun, 09 Aug 2020 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R43SOBcX/qWQaB0U2Ki3jBO4Xp2XLzU0OwH0HpMONJ0=;
        b=NTVLosvBlU5z7SiX9HdASYFp2viir5lFTRBmpN4cD1cKF9JGVvKzp2A3u9EzmURdQS
         Vp8NwnuaFBcYUkr1lj9M0/48NIYvmHM7N9GNdr6WEvf/jA5t5D1VmvbNMpuT8KhEGfZx
         s7CCApvyxQ6rx7qgJ44qaPBNbGJgFqlXXCQM09bAUE+D0b6ZiCBgmaXuuPbgakoynv/g
         ERxX9KJD4XdizBsGBew85mrvkFQzskadLQOBAkQnr3FbvXacdbYk7bAdNXs3ITGaHv04
         2nHFRmrNjcpyqzgeOA/SoAZosw/A5Q2CdeqrTWfE68TlUtN5kMZ8vLFY8BrAzJvgHT4l
         9x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R43SOBcX/qWQaB0U2Ki3jBO4Xp2XLzU0OwH0HpMONJ0=;
        b=Yqlt0KDw7LmfqQ0YWmBUTeA0EVCpqRrFXZwpvGTWUjPdNRyTwVrc3Y4IPwQmodhUOk
         gyEM6iTshOBiC7FRKyVYc95381V9RbawZ4yj2IiVdX3pOrzP9oht+kGKb236jMbBck4J
         M5P6sLxrHcHOpGDuWMwtNwMW0wbQnlcmdcgtsYHnqnovwPXSLMi1k+8TEv21qkBV9NrS
         ewlN5POiI8DsXZsRjpnZrqEWCoOrUUwWDAUJOua9/WK3YfS5jICmXibG7rqSgsuXxA/W
         0HrF7JTd4C5nxfrPZxKAYUz3XyKJwQ9nCbN+ij/VUCeW9T0ort2wTsMBvX/stGkKF+Ao
         hlHg==
X-Gm-Message-State: AOAM530FVP6LgNruuWbmAEYKM5mY4EcIu34AiAqLaV4rh//kg54h1bGc
        EUdYVCu32mN/f3G15hmvfAr2qxER
X-Google-Smtp-Source: ABdhPJwmtEKJtyThuHogZLA4GR5gy6skdGQq6o8XA7/CTfOhi3bt/hCDtsyOle+uvHFRWvWsjS6gfw==
X-Received: by 2002:a17:902:6acc:: with SMTP id i12mr18835215plt.75.1596979551510;
        Sun, 09 Aug 2020 06:25:51 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:25:50 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 00/18] gpio: cdev: add uAPI v2
Date:   Sun,  9 Aug 2020 21:25:11 +0800
Message-Id: <20200809132529.264312-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset defines and implements adds a new version of the
GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
support for debounce, event sequence numbers, and allowing for requested
lines with different configurations.
It provides some future proofing by adding optional configuration fields
and padding reserved for future use.

The series can be partitioned into two sets; the first eleven
contain the v2 uAPI implementation, and the final seven port
the GPIO tools to the v2 uAPI and extend them to use new uAPI features.

The more complicated patches include their own commentary where
appropriate.

Cheers,
Kent.

Changes since v2:
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

Changes since v1:
 - split out cleanup patches into a separate series.
 - split implementation patch into a patch for each ioctl or major feature.
 - split tool port patch into a patch per tool.
 - rework uAPI to allow requested lines with different configurations.

Kent Gibson (18):
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
 drivers/gpio/gpiolib-cdev.c | 1333 ++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib-cdev.h |   15 +
 drivers/gpio/gpiolib.c      |    2 +
 drivers/gpio/gpiolib.h      |    6 +
 include/uapi/linux/gpio.h   |  315 ++++++++-
 tools/gpio/gpio-event-mon.c |  146 ++--
 tools/gpio/gpio-hammer.c    |   56 +-
 tools/gpio/gpio-utils.c     |  127 ++--
 tools/gpio/gpio-utils.h     |   50 +-
 tools/gpio/gpio-watch.c     |   16 +-
 tools/gpio/lsgpio.c         |   60 +-
 13 files changed, 1943 insertions(+), 214 deletions(-)


base-commit: 22cc422070d9a9a399f8a70b89f1b852945444cb
-- 
2.28.0

