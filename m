Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFA62D3F35
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 10:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgLIJxd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 04:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbgLIJxd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 04:53:33 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA56DC0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 01:52:52 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t4so1001541wrr.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3sd9mFkwtlJz1bMC4aKy7JUgsdUK35uJBW0lV0ddyE=;
        b=Ofg7TCLRNZYTdwKs9qqBQqiBhOC0FXRwgsNjumnKeRygEOWTU6glq12VOebCg9Ee6R
         c00DRNdb2dsq6gTJDt91bakxb6MDWpPcOPyOXUL+lqEJLjUe/v4XJlH2NkBNjgTrLPfz
         /dBXEBdAtaGCfd2nXUVby/jf4JVvexBhIwGqkGVZ05a1ozqb2CJvh6lE9yuUfjycOs3x
         +FWKNgmFJwBTPbtt5mmqMptrJguWsqdf3u7c3Z0YFgpb0uazxoPfKos2BbV4UFlpHPl6
         8K/Tm1qbAPlIf5kw5c2Eg4LmiIhePrqY2xqh/xA7XILNmRU+2PHvPXTajF03/HIJDKs5
         uKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3sd9mFkwtlJz1bMC4aKy7JUgsdUK35uJBW0lV0ddyE=;
        b=Bd/x7AIHe2dl9L09IVc6STps/QQLjeIrspBJ3dxLZpbs2dBXuDi5DpZP7v0ocNbLHr
         RRN7FzF8qO0UdkF/GrIHS53thHTFgpPzbVT6HaeOeSWlaV7cK+6aXJD8fReuxZ6tHzo0
         yYLmyznDq9t3HDdj/a/7Q2Nzf7PMYi3JajHHsMPOFiJNgpBZNdKzaiENCdHYPlviCt8c
         8QWFf5yM8tOGJQnZ6KoxkT0V10+ViMlVSuLqpLMiVHJsFguIgNKOD1wRerZtj3UZUHpK
         XEqHXPzKN7z0cKYvKi2GaW0A77IjZJLe4YU9p/hXulZz7QA+LI/AaAdeuO5nOrXMHh/6
         8nHg==
X-Gm-Message-State: AOAM530szjPDWZS2x/7Bov0qEDZ6uOdc8fPtq6vQq1wmoTvg8Jmdaxv+
        qBtzh2mRvmyrpMIaQcC92pOGhg==
X-Google-Smtp-Source: ABdhPJwMeHKqCiNpLmGX/GoAEu0njXZmkCFQ4fHnGM8Wse1eJjSKqZkyBqMYUQvPt3nzuiyhWagMRQ==
X-Received: by 2002:adf:eecc:: with SMTP id a12mr1712610wrp.312.1607507571596;
        Wed, 09 Dec 2020 01:52:51 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m21sm2228192wml.13.2020.12.09.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 01:52:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.11-rc1
Date:   Wed,  9 Dec 2020 10:52:48 +0100
Message-Id: <20201209095248.22408-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

These are the patches I collected over this release cycle. Nothing all
too exciting - mainly just updates to drivers and refactoring of the
core code. Please pull.

Bartosz

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.11

for you to fetch changes up to b5252196d08abd82f3b21532354f71a40dd2801d:

  gpio: put virtual gpio device into their own submenu (2020-12-08 10:13:51 +0100)

----------------------------------------------------------------
gpio updates for v5.11-rc1

- several refactoring patches of the core gpiolib code
- add support for NXP PCAL9554B/C to gpio-pca953x
- allow probing mockup devices from device tree
- refactoring and improvements to gpio-rcar
- improvements to locking in gpio-tegra
- code shrink in gpiolib devres
- get the irq offset from device tree in gpio-sifive
- major refactoring of gpio-exar
- convert gpio-mvebu pwm access to regmap
- create a new submenu for virtual GPIO drivers
- fix clang fall-through warnings treewide
- minor driver refactoring and tweaks sprinkled all over

----------------------------------------------------------------
Alexandru Ardelean (1):
      gpio: xra1403: remove unneeded spi_set_drvdata()

Andy Shevchenko (4):
      gpiolib: Extract gpiod_not_found() helper
      gpiolib: of: Use named item for enum gpiod_flags variable
      gpiolib: Unify expectations about ->request() returned value
      gpiolib: split error path in gpiod_request_commit()

Bartosz Golaszewski (8):
      gpiolib: devres: shrink devm_gpiochip_add_data_with_key()
      gpio: exar: add a newline after the copyright notice
      gpio: exar: include idr.h
      gpio: exar: switch to a simpler IDA interface
      gpio: exar: use a helper variable for &pdev->dev
      gpio: exar: unduplicate address and offset computation
      gpio: exar: switch to using regmap
      gpio: exar: use devm action for freeing the IDA and drop remove()

Baruch Siach (2):
      gpio: mvebu: update Armada XP per-CPU comment
      gpio: mvebu: switch pwm duration registers to regmap

Damien Le Moal (1):
      gpio: dwapb: Remove unnecessary error message

Dmitry Osipenko (2):
      gpio: tegra: Add lockdep class
      gpio: tegra: Use raw_spinlock

Enrico Weigelt, metux IT consult (1):
      gpio: put virtual gpio device into their own submenu

Geert Uytterhoeven (4):
      gpio: rcar: Cache gpiochip_get_data() return value
      gpio: rcar: Align register offsets
      gpio: rcar: Rework hardware features handling
      gpio: rcar: Implement gpio_chip.get_multiple()

Greentime Hu (1):
      gpio: sifive: To get gpio irq offset from device tree data

Grygorii Strashko (2):
      gpio: omap: handle deferred probe with dev_err_probe() for gpiochip_add_data()
      gpiolib: do not print err message for EPROBE_DEFER

Gustavo A. R. Silva (2):
      gpiolib: acpi: Fix fall-through warnings for Clang
      gpio: ath79: Fix fall-through warning for Clang

Kent Gibson (2):
      gpiolib: cdev: document that line eflags are shared
      gpiolib: cdev: add GPIO_V2_LINE_FLAG_EDGE_BOTH and use it in edge_irq_thread()

Mike Looijmans (1):
      dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C

Vincent Whitchurch (1):
      gpio: mockup: Allow probing from device tree

 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |   1 +
 drivers/gpio/Kconfig                               |   5 +
 drivers/gpio/gpio-ath79.c                          |   1 +
 drivers/gpio/gpio-dwapb.c                          |   7 +-
 drivers/gpio/gpio-exar.c                           | 155 ++++++++++-----------
 drivers/gpio/gpio-mockup.c                         |  11 +-
 drivers/gpio/gpio-mvebu.c                          |  71 +++++-----
 drivers/gpio/gpio-omap.c                           |   7 +-
 drivers/gpio/gpio-rcar.c                           |  87 ++++++++----
 drivers/gpio/gpio-sifive.c                         |  14 +-
 drivers/gpio/gpio-tegra.c                          |  22 ++-
 drivers/gpio/gpio-xra1403.c                        |  10 +-
 drivers/gpio/gpiolib-acpi.c                        |   1 +
 drivers/gpio/gpiolib-cdev.c                        |  33 +++--
 drivers/gpio/gpiolib-devres.c                      |  27 +---
 drivers/gpio/gpiolib-of.c                          |  14 +-
 drivers/gpio/gpiolib-sysfs.c                       |   2 +-
 drivers/gpio/gpiolib.c                             |  39 +++---
 drivers/gpio/gpiolib.h                             |   2 +
 19 files changed, 280 insertions(+), 229 deletions(-)
