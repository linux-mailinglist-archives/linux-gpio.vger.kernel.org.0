Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15236373D68
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 16:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbhEEOPG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 10:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhEEOPG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 10:15:06 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B37C061574
        for <linux-gpio@vger.kernel.org>; Wed,  5 May 2021 07:14:09 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h4so2010306wrt.12
        for <linux-gpio@vger.kernel.org>; Wed, 05 May 2021 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LGCdpREbfD/YWDwLyE6sY9IYpJiH6j7QDDmk3lJWP4=;
        b=GF8D9UTF/OquU+sEsnG0z7NaYJthuGzMV88GlGqAut2nI4qKuXvJGQaO+g+G/4uj5K
         H+B4OSx3A3J9qdI5FaIWheVi7FsOkExLA3xFuiBKoWzVF7+G8I6h3I5vllLPseZCafFv
         SjIyAjjJU8/4NhRzGJ/lVnMxxw51hQo2+cCAXHmTMuyiFLW090pQr+HkILMmhtACIhgn
         1tIId31dJ/zBmuHgJPPtBrEBpXiK0At1sdIelT+mNOtgPA3ZCeJfkyetkI3ReffL9Mzj
         sPg7NN4hDP0hV7CBExIMnq/adxvfXYjwek9AuLCYaDH5OYdvptXlCAtofBokpz/HO/CA
         9y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LGCdpREbfD/YWDwLyE6sY9IYpJiH6j7QDDmk3lJWP4=;
        b=gO5UyoC5xefzJm3OhaRHO2A/IY96DcaG14zIKPWZvMxbJJfL0NLPMi3CeXG49dli7P
         S5CDkcqZ7BxhrM4KAcxG2ETk+hV8WnfAi58tOUB2/uskQCmcvA5BGdjS/OofJJNldcSm
         cPvso+b4ZYAXpcH2Xa0laIYp3yhrXL63m8xaRR1pnmk+iULpKH6TWUjkDtHyhOl65AnM
         7C+xRo9rwwaePVXDy/qoDDgBhT5WD5BlXYh8F7cvAOnyPEmZqtc7ZbxhLSCy8QvV0rSl
         Ry1s7fjW4j2w8bYKhgKiILNjri7JISuVG/DGdpFT+LycoDTWpjMBzRvFjwzhPy437LG7
         DlQA==
X-Gm-Message-State: AOAM533/xBM1exavdVoLMaoZ4wMFTN8Zt90f1VWkQI80Xs/MJwtuje4m
        nC36zRbHmmdMrrU0CD4n/MZwEg==
X-Google-Smtp-Source: ABdhPJwbUzl2duqqXXrePhzv2T0owX8HSUZiNTe+9J4croOVrST04Ov0Az+JEMoEvq3r7WBhKAch/Q==
X-Received: by 2002:adf:e611:: with SMTP id p17mr12298279wrm.161.1620224048047;
        Wed, 05 May 2021 07:14:08 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id s6sm5969750wms.0.2021.05.05.07.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:14:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Al Viro <viro@zeniv.linux.org.uk>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL v2] gpio: updates for v5.13
Date:   Wed,  5 May 2021 16:13:58 +0200
Message-Id: <20210505141358.6065-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

This is the big pull-request for GPIO for this release cycle minus the configfs
changes and the gpio-sim driver that was based on it as these will have to sit
one more release out.

The resulting pull-request is even smaller than before and there's nothing
controversial left. The details are in the signed tag. Please pull!

Bartosz

The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.13-v2

for you to fetch changes up to 444952956f34a5de935159561d56a34276ffffd6:

  dt-bindings: gpio: add YAML description for rockchip,gpio-bank (2021-05-05 16:07:41 +0200)

----------------------------------------------------------------
gpio updates for v5.13

- new driver for the Realtek Otto GPIO controller
- ACPI support for gpio-mpc8xxx
- edge event support for gpio-sch (+ Kconfig fixes)
- Kconfig improvements in gpio-ich
- fixes to older issues in gpio-mockup
- ACPI quirk for ignoring EC wakeups on Dell Venue 10 Pro 5055
- improve the GPIO aggregator code by using more generic interfaces instead of
  reimplementing them in the driver
- convert the DT bindings for gpio-74x164 to yaml
- documentation improvements
- a slew of other minor fixes and improvements to GPIO drivers

----------------------------------------------------------------
Alexander Dahl (2):
      docs: kernel-parameters: Move gpio-mockup for alphabetic order
      docs: kernel-parameters: Add gpio_mockup_named_lines

Andy Shevchenko (13):
      irqdomain: Introduce irq_domain_create_simple() API
      gpiolib: Unify the checks on fwnode type
      gpiolib: Move of_node operations to gpiolib-of and correct fwnode use
      gpiolib: Introduce acpi_gpio_dev_init() and call it from core
      gpiolib: Reuse device's fwnode to create IRQ domain
      gpiolib: Fold conditionals into a simple ternary operator
      gpio: mockup: Drop duplicate NULL check in gpio_mockup_unregister_pdevs()
      gpio: mockup: Adjust documentation to the code
      lib/cmdline: Export next_arg() for being used in modules
      gpio: aggregator: Replace custom get_arg() with a generic next_arg()
      gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
      gpio: sch: Drop MFD_CORE selection
      gpio: ich: Switch to be dependent on LPC_ICH

Barney Goette (1):
      gpio: 104-dio-48e: Fix coding style issues

Bartosz Golaszewski (3):
      lib: bitmap: remove the 'extern' keyword from function declarations
      lib: bitmap: order includes alphabetically
      lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()

Geert Uytterhoeven (1):
      dt-bindings: gpio: fairchild,74hc595: Convert to json-schema

Hans de Goede (1):
      gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055

Jan Kiszka (1):
      gpio: sch: Add edge event support

Jiapeng Chong (2):
      gpio: it87: remove unused code
      gpio: mxs: remove useless function

Johan Jonker (1):
      dt-bindings: gpio: add YAML description for rockchip,gpio-bank

Jonathan Neuschäfer (1):
      docs: driver-api: gpio: consumer: Mark another line of code as such

Linus Walleij (1):
      gpio: Mention GPIO MUX in docs

Ran Wang (1):
      gpio: mpc8xxx: Add ACPI support

Randy Dunlap (3):
      tools: gpio-utils: fix various kernel-doc warnings
      gpiolib: some edits of kernel docs for clarity
      gpio: sch: depends on LPC_SCH

Sander Vanheule (2):
      dt-bindings: gpio: Binding for Realtek Otto GPIO
      gpio: Add Realtek Otto GPIO support

Tian Tao (1):
      gpio: omap: Use device_get_match_data() helper

 Documentation/admin-guide/gpio/gpio-mockup.rst     |  11 +-
 Documentation/admin-guide/kernel-parameters.txt    |  10 +-
 Documentation/core-api/irq/irq-domain.rst          |  22 +-
 .../bindings/gpio/fairchild,74hc595.yaml           |  77 +++++
 .../devicetree/bindings/gpio/gpio-74x164.txt       |  27 --
 .../bindings/gpio/realtek,otto-gpio.yaml           |  78 +++++
 .../bindings/gpio/rockchip,gpio-bank.yaml          |  82 ++++++
 .../bindings/pinctrl/rockchip,pinctrl.txt          |  58 +---
 Documentation/driver-api/gpio/consumer.rst         |   2 +-
 Documentation/driver-api/gpio/drivers-on-gpio.rst  |   6 +
 drivers/gpio/Kconfig                               |  24 +-
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-104-dio-48e.c                    |  50 ++--
 drivers/gpio/gpio-aggregator.c                     |  39 +--
 drivers/gpio/gpio-ich.c                            |   2 -
 drivers/gpio/gpio-it87.c                           |   8 -
 drivers/gpio/gpio-mockup.c                         |   9 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  47 ++-
 drivers/gpio/gpio-mxs.c                            |   5 -
 drivers/gpio/gpio-omap.c                           |   5 +-
 drivers/gpio/gpio-realtek-otto.c                   | 325 +++++++++++++++++++++
 drivers/gpio/gpio-sch.c                            | 198 ++++++++++++-
 drivers/gpio/gpiolib-acpi.c                        |  21 ++
 drivers/gpio/gpiolib-acpi.h                        |   4 +
 drivers/gpio/gpiolib-of.c                          |   6 +-
 drivers/gpio/gpiolib.c                             |  62 ++--
 include/linux/bitmap.h                             | 127 ++++----
 include/linux/gpio/driver.h                        |  12 +-
 include/linux/irqdomain.h                          |  19 +-
 kernel/irq/irqdomain.c                             |  20 +-
 lib/bitmap.c                                       |  42 ++-
 lib/cmdline.c                                      |   1 +
 tools/gpio/gpio-utils.c                            |  18 +-
 33 files changed, 1068 insertions(+), 350 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74x164.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c
