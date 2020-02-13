Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D79715BBFC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 10:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgBMJr7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 04:47:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37556 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgBMJr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 04:47:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so5808081wru.4
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHhqByU1qcpq0o8TX732f3dGHWa1ufmoYT93p3DuujY=;
        b=OKq3DMlyaU4EgPKOXE6dLrkH0COvse2RVwFlIJp4dfSh3OLIQLmyu03nLadGHUun/q
         Pz9OKXViWH/dWbaiZHZKG7oB/KNFAhNzIUhHbFJni1P/7YSC8b42bYKQLPles+b4l9L1
         /B3JA+lDY8SjXBGfFfiu1fmXkwy3AHzGuefCWS6ji7hMe+eQ10x7CDWgncbI6s2Ob1EC
         GToYvPK3hpVg6/a+7a1vV+RwsUBAhnz6n8+MIWbp6VxUUiHg9Amt9M2rCJ7+eHz2hqCk
         91jA8Pps5KWfWEo1V1LsVy9VIbU7NW5rFTIuOGACgbhHnh1Vtj/THAPPbixhJQ5Saog+
         9hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHhqByU1qcpq0o8TX732f3dGHWa1ufmoYT93p3DuujY=;
        b=GMvqCX4n3d7525rJ4Z896f7DEELMiWKgmmjQ8ADMj99iGDu2dj4phfxaEu2uy0vtnP
         YBfMZPxlzE1+yEdmLC766WTkuQ6IPWPNt13ZLKwv32BIDVSn5wbIjUAU4fK6kTt1X6Oq
         Ns1BWWu5Me6X3xv2E9JkcZ6lrzONFADIyJ5FjE/4RA6YBkTorF2nS3Hq8dsx/4PMgLQ5
         JZt+d9qUGBbqTfYQjpnYvojs3L9xyIFHQGCg6nagf5OeQrPcePkPwSYrUpc7NuPnfp75
         ZMuXnrcNkIOkqdZ/qG/s+mZGWvBMqutEchKtHTB/AULAlTqVFkfeqtMAjT1v2TTVcoCR
         GwdA==
X-Gm-Message-State: APjAAAVbjoPsKxkBYM4ile+oRJZp63pjfAOYzp31VTT/sz8eQXkpD4SZ
        ZF2iXAOivrZKJkq0UBgP0xch4Q==
X-Google-Smtp-Source: APXvYqwBrSSYq7Nsx5y9cJDAtZBIKBoS7Gxij9SoR+Ur1MWRkEQFPHvjNSM6HrWTtQ7TndQFE2483A==
X-Received: by 2002:a5d:61c2:: with SMTP id q2mr19981421wrv.425.1581587277177;
        Thu, 13 Feb 2020 01:47:57 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id p11sm2171207wrn.40.2020.02.13.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 01:47:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.7 part1
Date:   Thu, 13 Feb 2020 10:47:54 +0100
Message-Id: <20200213094754.17808-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

as discussed this is the pull-request containing the line watch ioctl()
as well as a couple patches picked up during the merge window. Details
are in the signed tag. Please pull.

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.7-part1

for you to fetch changes up to 33f0c47b8fb4724792b16351a32b24902a5d3b07:

  tools: gpio: implement gpio-watch (2020-02-12 12:05:47 +0100)

----------------------------------------------------------------
gpio updates for v5.7 part 1

- make irqs optional in gpio-pxa
- improve the logic behind the get() and set() callbacks in gpio-wcd934x
- add new kfifo helpers (acked by kfifo maintainer)
- rework the locking mechanism for lineevent kfifo
- implement a new ioctl() for watching changes on GPIO lines

----------------------------------------------------------------
Axel Lin (2):
      gpio: wcd934x: Don't change gpio direction in wcd_gpio_set
      gpio: wcd934x: Fix logic of wcd_gpio_get

Bartosz Golaszewski (7):
      kfifo: provide noirqsave variants of spinlocked in and out helpers
      kfifo: provide kfifo_is_empty_spinlocked()
      gpiolib: rework the locking mechanism for lineevent kfifo
      gpiolib: emit a debug message when adding events to a full kfifo
      gpiolib: provide a dedicated function for setting lineinfo
      gpiolib: add new ioctl() for monitoring changes in line info
      tools: gpio: implement gpio-watch

Lubomir Rintel (1):
      gpio: pxa: Avoid a warning when gpio0 and gpio1 IRQS are not there

 drivers/gpio/gpio-pxa.c     |   4 +-
 drivers/gpio/gpio-wcd934x.c |   9 +-
 drivers/gpio/gpiolib.c      | 350 ++++++++++++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.h      |   1 +
 include/linux/kfifo.h       |  73 +++++++++
 include/uapi/linux/gpio.h   |  30 ++++
 tools/gpio/.gitignore       |   1 +
 tools/gpio/Build            |   1 +
 tools/gpio/Makefile         |  11 +-
 tools/gpio/gpio-watch.c     |  99 +++++++++++++
 10 files changed, 493 insertions(+), 86 deletions(-)
 create mode 100644 tools/gpio/gpio-watch.c
