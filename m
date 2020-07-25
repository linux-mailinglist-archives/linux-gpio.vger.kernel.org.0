Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0A222D49F
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgGYEUe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYEUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:20:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BE5C0619D3;
        Fri, 24 Jul 2020 21:20:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a23so6318571pfk.13;
        Fri, 24 Jul 2020 21:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sfk5gtagFj7YmZIk6i0tCwvqKzgSYsHyvZTbiJMmuNY=;
        b=OBdGItRI19BUrUCt2BShHy3fp+gs6X/rr6sgnFBjDTs9pCjg0K/wpvSW356B1UaSDL
         +BznRfNKDYZdef/t7b3k231OQE8/OdDs8/M0ccEQQ+AdVThZb7oRRr04Z5f3VDl9b99y
         2c1eDCCDgVe1Qlt78fLIv+LKCaKHkizK4jbOyu9tUZ1RXsYiHAWW14tppEsnaRV3VDv3
         oE3HwAaxkuUDZ3MSacSHcuAjx7tEEm3A7thTYq3paxwKs1i1uOHqk4PiFkRYsPAUmySS
         CG4bSIHMBN0nwZ93PZKdsJUAFb8sjph2OM63aCzdbMqUN2YlIYAXs5SCVTlJ/RS12nSZ
         IehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sfk5gtagFj7YmZIk6i0tCwvqKzgSYsHyvZTbiJMmuNY=;
        b=M/mbnH9sLDEbIBxsdB9GutBrf6K2YXibCt0zRfZv9PcUDh9dprw12u/oJmYe+TeRC0
         dw88Lxefi1gi7YhaREBmvpB2gtSDd/TpSKnjvuV03xciVhfCBr7Ei90qgEJNmWpsCc+6
         R4URdJl7T0qQDtwBg4xRmWUUR7NHERbVjd+hOHM9s9NLq6mNWAU9B/+M9jNYJrSbB/kP
         EEJ5PdQe/LuM15eX4vjL5NSEEnt9Dcs+mEMna88hxrUNVkYRP26xU7cZ1MuS7lIarW7+
         Y/GeAcHB4iaR3P5tylAQwvGMWzEPGfiIa2ucevIsG963HXPsSrOaAUxXdKESJUJDWd14
         isfg==
X-Gm-Message-State: AOAM533hF8V6AY1J7kaC+zOBDD/GO8q+MOc2ZZFx/aHlq30si6mpEtpS
        fOsj4icjuf69Dy1SFJhjmvQtVR9z
X-Google-Smtp-Source: ABdhPJxxkc5LytEVwf4QvQbMfyF+/rM0g3xHrSwbSVNtJRkAFf4JwlgnjkOgRZ+MNImiLG4nGUpShw==
X-Received: by 2002:a63:8949:: with SMTP id v70mr11073170pgd.256.1595650832575;
        Fri, 24 Jul 2020 21:20:32 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:20:31 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 00/18] gpio: cdev: add uAPI V2
Date:   Sat, 25 Jul 2020 12:19:37 +0800
Message-Id: <20200725041955.9985-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
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
contain the V2 uAPI implementation, and the final seven port
the GPIO tools to the V2 uAPI and extend them to use new uAPI features.

The more complicated patches include their own commentary where
appropriate.

Cheers,
Kent.

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
  gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
    GPIOLINE_GET_VALUES_IOCTL
  gpiolib: cdev: support GPIO_GET_LINEINFO_V2_IOCTL and
    GPIO_GET_LINEINFO_WATCH_V2_IOCTL
  gpiolib: cdev: support edge detection for uAPI v2
  gpiolib: cdev: support GPIOLINE_SET_CONFIG_IOCTL
  gpiolib: cdev: support GPIOLINE_SET_VALUES_IOCTL
  gpiolib: cdev: support setting debounce
  gpio: uapi: document uAPI v1 as deprecated
  tools: gpio: port lsgpio to v2 uAPI
  tools: gpio: port gpio-watch to v2 uAPI
  tools: gpio: rename nlines to num_lines
  tools: gpio: port gpio-hammer to v2 uAPI
  tools: gpio: port gpio-event-mon to v2 uAPI
  tools: gpio: add debounce support to gpio-event-mon
  tools: gpio: add multi-line monitoring to gpio-event-mon

 drivers/gpio/Kconfig        |   28 +-
 drivers/gpio/Makefile       |    2 +-
 drivers/gpio/gpiolib-cdev.c | 1296 ++++++++++++++++++++++++++++++++++-
 drivers/gpio/gpiolib-cdev.h |   15 +
 drivers/gpio/gpiolib.c      |    2 +
 drivers/gpio/gpiolib.h      |    6 +
 include/uapi/linux/gpio.h   |  327 ++++++++-
 tools/gpio/gpio-event-mon.c |  137 ++--
 tools/gpio/gpio-hammer.c    |   27 +-
 tools/gpio/gpio-utils.c     |  117 ++--
 tools/gpio/gpio-utils.h     |   48 +-
 tools/gpio/gpio-watch.c     |   10 +-
 tools/gpio/lsgpio.c         |  102 ++-
 13 files changed, 1882 insertions(+), 235 deletions(-)


base-commit: 8fc3ed3a474d76cd76dd0a154ea904373e9a5530
-- 
2.27.0

