Return-Path: <linux-gpio+bounces-10209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 541BA97AE1F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 11:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7A7C1F217E9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 09:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC05515C14F;
	Tue, 17 Sep 2024 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vx8DGg8Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95414D444
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726566006; cv=none; b=UKw4gPunndZ4k17TyoiliBZF3mf0Fh9Iq6u62H4Ayv2cOXjaPzriIgBmb990AnOow2A8xH0GEsGgLsI5JIXP1guEBfuu2J2C1hmxuShFIDzP+8neJg74lrQJl56N2tmySJkD5VJ9PBMw6y1V9mD68QNKQ6J8uTvrip7g9fvMVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726566006; c=relaxed/simple;
	bh=HgaR8i31OZOKdgAtsNRbBBn5aIv9PkySv7Q0I+sk7tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gmzKLciEEpW01xxNB68zS9lRIy3O4Lvm+Z0AsXQ4tOwGe7vlVVz+dQgFLSzmB1TjSfeyNsfcJfUoE9kgoxhfL14jt7wHIezmdt+9qYWGfBPZiEWy3Eu62CgAPDqDWH7BHNpnztf9IDzFqnCMkQMZwvqjxY/ISfRr/3niK8PqnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vx8DGg8Z; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5367ae52a01so4694724e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726566002; x=1727170802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2TdDc/xmkZrPPBH4u3xIlLvgo7tWE4DCUQljDV1YjAk=;
        b=vx8DGg8Zxj+VI1je52Skh4J1JCMsV0U/1NHJEOVqmlbirJ9CHkyr0lmNM+ureMoUSh
         Q1Ux8ZNWQohxUXLMRm6TORC42EleO0Grl/zjG+cII/zat5C2VbFp1n3/B4mlFUvZJRp7
         MR0hpny37HGeVmyec47dqqLEq70gmgiQ2pGFPklEVYktcxm8mFvjxfe/IUI4pCUL/6D5
         QhCsXc4pEpYbnvrkDAyk8Hp/VRIxQ8Vnj2HmLbVlAAEv15O5NAKroqa9es6LROyGgE32
         tRJYpPMiUtb+NLD9IKeJND4IpotCIloV/2+PqdT0X7DeZEYl0ZTiw59m/3685H19BRHf
         nwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726566002; x=1727170802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TdDc/xmkZrPPBH4u3xIlLvgo7tWE4DCUQljDV1YjAk=;
        b=BeB2b1aG+GGCGrANx7TXRK58W4R5HQRXyfv8MI5rwSah2KbqmgLaMPFCOm9T/Mk3tM
         hdYqg4na+lbKO6itZbxxEdJ0p8u6IODGvxwutX0TsxC29FGWTRWz5q3wIjYLqFWEKTdg
         OQOk+hMKgIhlKnnjV7TClMyjRvXMEm6sMVI87WbeqhTj5bmVTu0HUuQ9s/vhhAPSrzVj
         bFDBrG4ijSpZps95vX8nDoiwZmwo+O3fRFdbmG2RLjkdi3MtyW9ZJg9+HFm9Dm7/RUDw
         u8UeND3gDZ8s/+mWVJbgtUDuDFVqNPT8QqZ/erDCMQecO+atBp3EsaJti/Xy08VtDjX6
         ZEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYrX6bvVnzUKkvkyPHR86iHN15ktr/yvIDlsMOQJjTjW71iS2NrUeZPibs+RZH+DsKAtLnigr9BHkd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1KfYd6hBxfZouVUkz3RiS1Ugr4KlhX0X57eO9TID/8pxqSVA
	82k4Wyxdch11y7udhQm6vXgqwQ/BZRJc1H6P0y8oEuOszTsBV6mlqM3OLBcEQkY=
X-Google-Smtp-Source: AGHT+IH1oWcFaOPsJO/y2THHJ4b9NZbS7sU2H93ZXpNnxZIyw/06jdOgNys4oXb4al1qSWgDE9XEfw==
X-Received: by 2002:a05:6512:3f06:b0:536:52ed:a23f with SMTP id 2adb3069b0e04-5367fb5b53bmr7933105e87.0.1726566001820;
        Tue, 17 Sep 2024 02:40:01 -0700 (PDT)
Received: from brgl-uxlite.pool3009.local ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89d50sm3507188a12.78.2024.09.17.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 02:40:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.12-rc1
Date: Tue, 17 Sep 2024 11:39:56 +0200
Message-ID: <20240917093957.6073-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here are the updates from the GPIO tree for the next release. We have one
new driver, some improvements to core GPIO code, various changes in
drivers and their DT bindings as well fixes to kerneldocs.

Overall it has been a slow cycle, most likely due to the summertime
vacation period and the changelog reflects it.

The merge from the MFD tree is there to pull dependencies for the new
driver.

There is a trivial conflict with the SoC tree (just drop
arch/arm/mach-ep93xx/vision_ep9307.c).

Details are in the signed tag. Please pull.

Bartosz Golaszewski

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.12-rc1

for you to fetch changes up to 6b5e97c020060c2b8ad286002415106ab7034435:

  gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS() (2024-09-06 08:50:48 +0200)

----------------------------------------------------------------
gpio updates for v6.12-rc1

Core GPIOLIB:
- provide and add users for a macro allowing to iterate over accepted
  GPIO property names of consumer device nodes
- remove legacy definitions that are no longer used
- put legacy GPIO devres helpers together with the rest of the deprecated
  code
- implement and use swnode_gpio_get_reference(): a wrapper simplifying
  the underlying calls to fwnode_property_get_reference_args()
- use IS_ERR_OR_NULL() where it makes sense
- replace of_find_property() with of_property_present()
- simplify code with the scoped variant of OF-node children iterator

Documentation:
- update GPIO kerneldocs with Return sections
- fix "Excess struct member description" warnings now being triggered
  with W=1

New drivers:
- add support for Analog Devices ADP5585

Driver improvements:
- add support for wake-on-GPIO to gpio-mpc8xxx
- use GPIO_LOOKUP_IDX() in gpio-virtuser
- use devm_clk_get_[optional_]enabled() where applicable in several
  drivers
- replace OF-specific functions with provider-agnostic alternatives where
  possible
- drop support for legacy platform data from gpio-ath79 and gpio-davinci
- refactor gpio-stmpe
- improve error reporting in gpio-pca953x
- add support for reading the direction of pins for some models to
  gpio-vf610

DT bindings:
- convert the bindings for nxp,lpc3220 to YAML
- add gpio-reserved-ranges to gpio-davinci
- simplify the GPIO hog schema
- fix a GPIO hog issue in bindings for fcs,fxl6408

Other:
- fix format specifiers in user-space tools
- remove leftover files on make clean in tools/gpio/

----------------------------------------------------------------
Andy Shevchenko (22):
      gpiolib: Introduce for_each_gpio_property_name() helper
      gpiolib: swnode: Unify return code variable name
      gpiolib: swnode: Introduce swnode_gpio_get_reference() helper
      gpiolib: swnode: Make use of for_each_gpio_property_name()
      gpiolib: Replace gpio_suffix_count with NULL-terminated array
      gpio: virtuser: Use GPIO_LOOKUP_IDX() macro
      gpiolib: legacy: Kill GPIOF_INIT_* definitions
      gpiolib: legacy: Kill GPIOF_DIR_* definitions
      gpio: tegra: Replace of_node_to_fwnode() with more suitable API
      gpio: msc313: Replace of_node_to_fwnode() with more suitable API
      gpio: uniphier: Replace of_node_to_fwnode() with more suitable API
      gpio: tegra186: Replace of_node_to_fwnode() with more suitable API
      gpio: thunderx: Replace of_node_to_fwnode() with more suitable API
      gpio: visconti: Replace of_node_to_fwnode() with more suitable API
      gpio: ixp4xx: Replace of_node_to_fwnode() with more suitable API
      gpiolib: Update the kernel documentation - add Return sections
      gpiolib: legacy: Consolidate devm_gpio_*() with other legacy APIs
      gpio: stmpe: Fix IRQ related error messages
      gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
      gpio: stmpe: Utilise temporary variable for struct device
      gpio: stmpe: Make use of device properties
      gpio: stmpe: Sort headers

Animesh Agarwal (1):
      dt-bindings: gpio: nxp,lpc3220-gpio: Convert to dtschema

Bartosz Golaszewski (9):
      Merge tag 'ib-mfd-gpio-pwm-v6.12' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      gpio: ath79: order headers alphabetically
      gpio: ath79: add missing header
      gpio: ath79: use generic device property getters
      gpio: ath79: remove support for platform data
      gpio: davinci: drop platform data support
      gpio: davinci: use devm_clk_get_enabled()
      gpio: mpc8xxx: order headers alphabetically
      gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS()

Chen Ni (1):
      gpio: sama5d2-piobu: convert comma to semicolon

Clark Wang (1):
      pwm: adp5585: Add Analog Devices ADP5585 support

Dhruva Gole (1):
      gpio: syscon: fix excess struct member build warning

Fabio Estevam (1):
      gpio: pca953x: Print the error code on read/write failures

Haibo Chen (4):
      mfd: adp5585: Add Analog Devices ADP5585 core support
      gpio: adp5585: Add Analog Devices ADP5585 support
      gpio: gpio-vf610: use u32 mask to handle 32 number gpios
      gpio: vf610: add get_direction() support

Hongbo Li (1):
      gpio: Use IS_ERR_OR_NULL() helper function

Jared McArthur (1):
      dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property

Krzysztof Kozlowski (4):
      gpio: of: simplify with scoped for each OF child loop
      dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
      dt-bindings: gpio: simplify GPIO hog nodes schema
      gpio: pch: kerneldoc fixes for excess members

Laurent Pinchart (1):
      dt-bindings: mfd: Add Analog Devices ADP5585

Martyn Welch (1):
      gpio: mpc8xxx: Add wake on GPIO support

Rob Herring (Arm) (1):
      gpio: Use of_property_present()

Rong Qianfeng (2):
      gpio: stp-xway: Simplify using devm_clk_get_enabled()
      gpio: zynq: Simplify using devm_clk_get_enabled()

Shen Lichuan (1):
      gpio: stmpe: Simplify with dev_err_probe()

Uwe Kleine-König (1):
      gpio: Drop explicit initialization of struct i2c_device_id::driver_data to 0

Zhang Zekun (4):
      gpio: cadence: Use helper function devm_clk_get_enabled()
      gpio: lpc18xx: Use helper function devm_clk_get_enabled()
      gpio: mb86s7x: Use helper function devm_clk_get_optional_enabled()
      gpio: xilinx: Use helper function devm_clk_get_optional_enabled()

Zhu Jun (1):
      tools: gpio: Fix the wrong format specifier

zhangjiao (1):
      tools: gpio: rm .*.cmd on make clean

 .../bindings/gpio/fairchild,74hc595.yaml           |  11 -
 .../devicetree/bindings/gpio/fcs,fxl6408.yaml      |   1 +
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     |  11 -
 .../devicetree/bindings/gpio/gpio-davinci.yaml     |   2 +
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |  11 -
 .../devicetree/bindings/gpio/gpio_lpc32xx.txt      |  43 ----
 .../bindings/gpio/microchip,mpfs-gpio.yaml         |  12 --
 .../devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml |  50 +++++
 .../bindings/gpio/socionext,uniphier-gpio.yaml     |  11 -
 .../devicetree/bindings/mfd/adi,adp5585.yaml       |  92 +++++++++
 .../devicetree/bindings/trivial-devices.yaml       |   4 -
 MAINTAINERS                                        |  11 +
 arch/arm/mach-ep93xx/vision_ep9307.c               |   6 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c          |   2 +-
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-adp5585.c                        | 229 +++++++++++++++++++++
 drivers/gpio/gpio-ath79.c                          |  31 +--
 drivers/gpio/gpio-cadence.c                        |  23 +--
 drivers/gpio/gpio-davinci.c                        | 102 +++------
 drivers/gpio/gpio-fxl6408.c                        |   2 +-
 drivers/gpio/gpio-ixp4xx.c                         |  10 +-
 drivers/gpio/gpio-lpc18xx.c                        |  23 +--
 drivers/gpio/gpio-max7300.c                        |   2 +-
 drivers/gpio/gpio-mb86s7x.c                        |  21 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  50 ++++-
 drivers/gpio/gpio-msc313.c                         |   5 +-
 drivers/gpio/gpio-pca953x.c                        |   4 +-
 drivers/gpio/gpio-pch.c                            |   1 -
 drivers/gpio/gpio-sama5d2-piobu.c                  |  18 +-
 drivers/gpio/gpio-stmpe.c                          |  55 ++---
 drivers/gpio/gpio-stp-xway.c                       |  10 +-
 drivers/gpio/gpio-syscon.c                         |   1 -
 drivers/gpio/gpio-tegra.c                          |   5 +-
 drivers/gpio/gpio-tegra186.c                       |   3 +-
 drivers/gpio/gpio-thunderx.c                       |   5 +-
 drivers/gpio/gpio-uniphier.c                       |   5 +-
 drivers/gpio/gpio-vf610.c                          |  31 ++-
 drivers/gpio/gpio-virtuser.c                       |  13 +-
 drivers/gpio/gpio-visconti.c                       |   5 +-
 drivers/gpio/gpio-xilinx.c                         |  11 +-
 drivers/gpio/gpio-zynq.c                           |  10 +-
 drivers/gpio/gpiolib-acpi.c                        |  43 ++--
 drivers/gpio/gpiolib-cdev.c                        |   8 +-
 drivers/gpio/gpiolib-devres.c                      | 120 ++++-------
 drivers/gpio/gpiolib-legacy.c                      |  94 ++++++++-
 drivers/gpio/gpiolib-of.c                          |  92 ++++-----
 drivers/gpio/gpiolib-swnode.c                      |  62 +++---
 drivers/gpio/gpiolib-sysfs.c                       |   6 +-
 drivers/gpio/gpiolib.c                             | 164 +++++++++++----
 drivers/gpio/gpiolib.h                             |  16 +-
 drivers/mfd/Kconfig                                |  12 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/adp5585.c                              | 205 ++++++++++++++++++
 drivers/pwm/Kconfig                                |   7 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-adp5585.c                          | 184 +++++++++++++++++
 include/linux/gpio.h                               |  12 +-
 include/linux/mfd/adp5585.h                        | 126 ++++++++++++
 include/linux/platform_data/gpio-ath79.h           |  16 --
 include/linux/platform_data/gpio-davinci.h         |  21 --
 tools/gpio/Makefile                                |   2 +-
 tools/gpio/gpio-hammer.c                           |   4 +-
 63 files changed, 1503 insertions(+), 643 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,adp5585.yaml
 create mode 100644 drivers/gpio/gpio-adp5585.c
 create mode 100644 drivers/mfd/adp5585.c
 create mode 100644 drivers/pwm/pwm-adp5585.c
 create mode 100644 include/linux/mfd/adp5585.h
 delete mode 100644 include/linux/platform_data/gpio-ath79.h
 delete mode 100644 include/linux/platform_data/gpio-davinci.h

