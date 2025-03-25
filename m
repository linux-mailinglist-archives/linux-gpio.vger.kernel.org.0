Return-Path: <linux-gpio+bounces-17958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4A4A6EFCB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 12:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9BD3B8B36
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 11:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475D12517B3;
	Tue, 25 Mar 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f0mVPKCA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE8718E351
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742901076; cv=none; b=M6r/wuJW+SnA2H89iGh4Rv2PrpX41BklxNvst5NDN3lD9t9apBsGBxfL+Y8sRoFzvQmNNc+ZrKeiWE3X/JNYvRs7yzz4KZuK6m069ap/ehpwszQW2QiI4otFNHuKtLBjfFeKbUtHCX0uyPUWPOL51oQ6WOC5ggHmR7Bh9ptSHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742901076; c=relaxed/simple;
	bh=bnVFgv3YKSHMdsQuClyqCSpGDpXid3cjdBjb64PGkhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzkJFbSuRYwIAEmqcrrqPkJncSckeIJTq87SR6/UTzujjP/urnZ5TXW5groNRNC2wV+yG8XvBOXyNL6JBMomBVJYHM4ctgoIRlOS6roxK2eN6Zv5RmmYesYqalLbmS8K65z8O2PcztYY6cgLRjgEcig9XIL6meejCZf6rlEZid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f0mVPKCA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso58545815e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742901072; x=1743505872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qq6osUrzmcbsA62ORjNzuinD+V3sUwdLLrS3i4GEDlA=;
        b=f0mVPKCAJmCGQwkBME1QcOsYX+XyM1Z22WPKnrIlZk+A4+EAc6PtYWeRUYo9UAl4ok
         NhRHuRP8I3Qu0WKPPp4yMd+ct7QgL0QgLpVHmL9Kgil4C86wUU5nI8vG5d/lI7RWowFr
         v5bKKauWOD9+stMxf1lHmW4g8FRjw7RJFrgWxYYY9xKwlKuKAQDytqeK/HNzOEoapOcO
         CyNr9Y2qPhu7PvzYtxrUQbu+qFKDINNbGwsrlUbL+8Zp3VhEvzS+VIHuYr9euacZnawL
         N+6YDKTgLF/NrTjAerLvwAMP/qtXjyQRMuu4ZjMxNon8vsriNoZTQU5fsTyqhqBlurDo
         +JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742901072; x=1743505872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq6osUrzmcbsA62ORjNzuinD+V3sUwdLLrS3i4GEDlA=;
        b=ifU8kN8CYR54M0U0tkrG2TMB1Pqy1nvqZW/xCG2E3ZnSOhh9XP5nxjyJIAdSQhn/pM
         oVNnqJ6uCyW7B87pnFr57helVFDqxCAlgF2DZMkhE2kPaSYNaCyg+TiOvJ3LsAO8Ehv5
         JhU5b3Gr6JZn15G0a1RSJlwet4Xs1oXMXwt9/G/vehHbBZfuAzS6z2gBIaIbD6V55auz
         sYJ1wshN+yQbk89VQR9Ntl6b39q/msjwh3ik9VRgUQAwbuRbFW5uqzJJ8DrggC6gYCCo
         gk/Nf5/6uPGBglF6kBN2Av+ue5d6D34DBxB+4bS+uFzIqalSvZWwaiFKL1imZfYqSEpz
         +8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUs2zek/DDdPZeB0ytKCzjZDXHx1sVzVH1hqb0AejpYBLbJQpolfm1Alsqfo7z24L/uk9Er0vOL86oL@vger.kernel.org
X-Gm-Message-State: AOJu0YziszzGG9csMjSRN757rE0ZFK6J+lWhcxUsVu+J9NHcaEHT3lE+
	ezgUnyD5N+riBE5ztNfJX0GUb7m8gkJqDEbER9qOx6Uh3ms7Wrg9K7BJ9KrWaFg=
X-Gm-Gg: ASbGncssTmMgYMpmB83Q/Pkt+H+AUaFxirPPuPR9iOK0XReMRd7QP4pOWdXx/uSylBY
	mNUhGSNZT6i4gV+cZRviwzQNXuVo6k9z5YDjTvWw3GZJnaaC2n3R4Gqvx7KtQVE3R5HWLDH9Qn9
	sCUr7HJVJlUBlDh0lt0AuQo+WHeN2jLxTPW1lIjNKsV3Qv/w4Jf7a8KfQTAGUO1igPvEMjiYUAU
	8/ba0/Oz7lcJ0P1IMDm8sL20lJ4WrhOrvQIixqyhqhFR4fmiWR5UhshE7jK/VfR2WJUPrYKOXwP
	diUAA7GuWbp9Jr8JcAAb/PGqIoN0EwOHiQmYVAX2nyXc
X-Google-Smtp-Source: AGHT+IEDalNg06SAgU1J0x5FreYEndgopRQkeUfu5YC3LGqvMmM/jKdjSH5+LByMY3aGh4NxikIXWw==
X-Received: by 2002:a5d:6c63:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-3997f90aa79mr16625620f8f.25.1742901071396;
        Tue, 25 Mar 2025 04:11:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de47:e58f:1059:b2fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea6ecsm148553465e9.5.2025.03.25.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:11:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.15-rc1
Date: Tue, 25 Mar 2025 12:11:07 +0100
Message-ID: <20250325111107.41070-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here's the big pull request from the GPIO tree for this merge window.

There are no new drivers this time but several changes to the core GPIO
framework and various driver updates.

This release cycle, we're starting a relatively straightforward but tedious
rework of the GPIO consumer API: for historical reasons, the gpiod_set_value()
variants would return void. Not only that but the GPIO provider interface does
not even allow drivers to return a value to GPIO core. This is because initial
GPIO controllers would be MMIO based and could not fail. We've had I2C, SPI
and USB controllers for years too but no way of indicating failures to callers.

This PR changes the consumer interface, adds new provider callbacks and starts
converting the drivers under drivers/gpio/ to using them. Once this gets
upstream, we'll keep on converting GPIO drivers that live elsewhere and once
there are no more users of the old callbacks, we'll remove them and rename the
new ones to the previous name. I imagine the last step would happen in one
sweeping change like what you did for the remove_new() -> remove() renaming.

We've also addressed an issue where invalid return values from GPIO drivers
would get propagated to user-space by adding some GPIO-core-level sanitization.
Again: not a complex change but way overdue.

Other than that: lots of driver and core refactoring, DT-bindings changes and
some other minor changes like coding style fixes or header reordering.

All changes (except for the TODO updates which I picked up yesterday) have
spent at least a week in linux-next (most way more than that) with regressions
nicely ironed out for most part.

Please pull,
Bartosz

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v6.15-rc1

for you to fetch changes up to af54a2fbdf45b1fd32cdcab916f422e6d097f430:

  gpio: TODO: add an item to track reworking the sysfs interface (2025-03-24 10:35:10 +0100)

----------------------------------------------------------------
gpio updates for v6.15-rc1

GPIO core:
- add sanitization of return values of GPIO provider callbacks so that invalid
  ones don't get propagated to user-space
- add new variants of the line setter callbacks for GPIO providers that return
  an integer and allow to indicate driver errors to the GPIO core
- change the interface of all gpiod_set_value() variants to return an integer
  thus becoming able to indicate failures in the underlying layer to callers
- drop unneeded ERR_CAST in gpiolib-acpi
- use for_each_if() where applicable
- provide gpiod_multi_set_value_cansleep() as a new, simpler interface to
  gpiod_set_array_value_cansleep() and use it across several drivers treewide
- reduce the number of atomic reads of the descriptor flags in gpiolib debugfs
  code
- simplify for_each_hwgpio_in_range() and for_each_requested_gpio_in_range()
- add support for three-cell GPIO specifiers in GPIO OF code
- don't build HTE (hardware timestamp engine) GPIO code with the HTE subsystem
  disabled in Kconfig
- unduplicate calls to gpiod_direction_input_nonotify()
- rework the handling of the valid_mask property of GPIO chips: don't allow
  drivers to set it as it should only be handled by GPIO core and start
  actually enforcing it in GPIO core for *all* drivers, not only the ones
  implementing a custom request() callback
- get the `ngpios` property from the fwnode of the GPIO chip, not its device in
  order to handle multi-bank GPIO chips

Driver improvements:
- convert a part of the GPIO drivers under drivers/gpio/ to using the new value
  setter callbacks
- convert several drivers to using automatic lock guards from cleanup.h
- allow building gpio-bt8xx with COMPILE_TEST=y
- refactor gpio-74x164 (use devres, cleanup helpers, __counted_by() and bits.h
  macros)
- refactor gpio-latch (use generic device properties, lock guards and some
  local variables for better readability)
- refactor gpio-xilinx (improve the usage of the bitmap API)
- support multiple virtual GPIO controller instances in gpio-virtio
- allow gpio-regmap to use the standard `ngpios` property from GPIOLIB
- factor out the common code for synchronous probing of virtual GPIO devices
  into its own library
- use str_enable_disable(), str_high_low() and other string helpers where
  applicable
- extend the gpio-mmio abstraction layer to allow calling into the pinctrl
  back-end when setting direction
- convert gpio-vf610 to using the gpio-mmio library
- use more devres in gpio-adnp
- add support for reset-gpios in gpio-pcf857x
- add support for more models to gpio-loongson-64bit

DT bindings:
- add new compatibles to gpio-vf610 and gpio-loongson
- add missing gpio-ranges property to gpio-mvebu
- add reset-gpios to nxp,pcf8575
- enable gpio-hog parsing in ast2400-gpio

Misc:
- coding style improvements
- kerneldoc fixes
- includes reordering
- updates to the TODO list

----------------------------------------------------------------
Andy Shevchenko (23):
      gpio: 74x164: Remove unneeded dependency to OF_GPIO
      gpio: 74x164: Simplify code with cleanup helpers
      gpio: 74x164: Annotate buffer with __counted_by()
      gpio: 74x164: Make use of the macros from bits.h
      gpio: 74x164: Fully convert to use managed resources
      gpio: 74x164: Switch to use dev_err_probe()
      gpio: 74x164: Utilise temporary variable for struct device
      gpiolib: Even more opportunities to use str_high_low() helper
      gpiolib: Deduplicate gpiod_direction_input_nonotify() call
      gpio: xilinx: Use better bitmap APIs where appropriate
      gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
      gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
      gpiolib: Simplify implementation of for_each_hwgpio_in_range()
      drm: Move for_each_if() to util_macros.h for wider use
      gpiolib: Switch to use for_each_if() helper
      gpio: loongson-64bit: Remove unneeded ngpio assignment
      gpiolib: Extract gpiochip_choose_fwnode() for wider use
      gpiolib: Use fwnode instead of device in gpiochip_get_ngpios()
      gpio: regmap: Group optional assignments together for better understanding
      gpio: regmap: Move optional assignments down in the code
      gpio: regmap: Allow ngpio to be read from the property
      gpiolib: Align FLAG_* definitions in the struct gpio_desc
      gpiolib-acpi: Drop unneeded ERR_CAST() in __acpi_find_gpio()

Bartosz Golaszewski (76):
      Merge tag 'gpio-set-array-helper-v6.15-rc1' into gpio/for-next
      gpio: latch: use generic device properties
      gpio: latch: store the address of pdev->dev in a helper variable
      gpiolib: move all includes to the top of gpio/consumer.h
      gpiolib: don't build HTE code with CONFIG_HTE disabled
      Merge tag 'v6.14-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into HEAD
      gpiolib: sanitize the return value of gpio_chip::request()
      gpiolib: sanitize the return value of gpio_chip::set_config()
      gpiolib: sanitize the return value of gpio_chip::get()
      gpiolib: sanitize the return value of gpio_chip::get_multiple()
      gpiolib: sanitize the return value of gpio_chip::direction_output()
      gpiolib: sanitize the return value of gpio_chip::direction_input()
      gpiolib: sanitize the return value of gpio_chip::get_direction()
      gpiolib: read descriptor flags once in gpiolib_dbg_show()
      gpiolib: use the required minimum set of headers
      leds: aw200xx: don't use return with gpiod_set_value() variants
      gpiolib: make value setters have return values
      gpiolib: wrap gpio_chip::set()
      gpiolib: rework the wrapper around gpio_chip::set_multiple()
      gpiolib: introduce gpio_chip setters that return values
      gpio: sim: use value returning setters
      gpio: regmap: use value returning setters
      gpio: pca953x: use value returning setters
      gpio: mockup: use value returning setters
      gpio: aggregator: use value returning setters
      gpio: max77650: use value returning setters
      gpio: latch: use lock guards
      gpio: latch: use value returning setters
      gpio: davinci: use value returning setters
      gpio: mvebu: use value returning setters
      gpiolib: don't use gpiochip_get_direction() when registering a chip
      gpiolib: use a more explicit retval logic in gpiochip_get_direction()
      gpiolib: don't double-check the gc->get callback's existence
      Merge tag 'v6.14-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
      gpiolib: deprecate gpio_chip::set and gpio_chip::set_multiple
      gpiolib: update kerneldocs for value setters
      gpiolib: fix kerneldoc
      gpio: 74x164: use new line value setter callbacks
      gpio: adnp: use devm_mutex_init()
      gpio: adp5520: use new line value setter callbacks
      gpio: adp5585: use new line value setter callbacks
      gpio: altera-a10sr: use new line value setter callbacks
      gpio: altera: use new line value setter callbacks
      gpio: amd8111: use new line value setter callbacks
      gpio: amd-fch: use new line value setter callbacks
      gpio: arizona: use new line value setter callbacks
      gpio: aspeed: use lock guards
      gpio: aspeed: use new line value setter callbacks
      gpio: aspeed-sgpio: use lock guards
      gpio: aspeed-sgpio: use new line value setter callbacks
      gpio: adnp: use lock guards for the I2C lock
      gpio: adnp: use new line value setter callbacks
      Merge tag 'intel-gpio-v6.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next
      Merge tag 'v6.14-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: bcm-kona: use lock guards
      gpio: bcm-kona: use new line value setter callbacks
      gpio: bd71815: use new line value setter callbacks
      gpio: bd71828: use new line value setter callbacks
      gpio: bd9571mwv: use new line value setter callbacks
      gpio: bt8xx: allow to build the module with COMPILE_TEST=y
      gpio: bt8xx: use lock guards
      gpio: bt8xx: use new line value setter callbacks
      gpio: cgbc: use new line value setter callbacks
      gpio: creg-snps: use new line value setter callbacks
      gpio: cros-ec: use new line value setter callbacks
      gpio: crystalcove: use new line value setter callbacks
      gpio: cs5535: use new line value setter callbacks
      gpio: da9052: use new line value setter callbacks
      gpio: da9055: use new line value setter callbacks
      gpio: TODO: remove the item about the new debugfs interface
      gpio: TODO: remove task duplication
      gpio: TODO: remove the pinctrl integration task
      gpio: TODO: add delimiters between tasks for better readability
      gpio: TODO: add an item to track the conversion to the new value setters
      gpio: TODO: add an item to track reworking the sysfs interface

Binbin Zhou (2):
      dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
      gpio: loongson-64bit: Add more gpio chip support

David Lechner (5):
      gpiolib: add gpiod_multi_set_value_cansleep()
      gpio: max3191x: use gpiod_multi_set_value_cansleep
      mmc: pwrseq_simple: use gpiod_multi_set_value_cansleep
      mux: gpio: use gpiod_multi_set_value_cansleep
      phy: mapphone-mdm6600: use gpiod_multi_set_value_cansleep

Frank Li (1):
      dt-bindings: gpio: vf610: Add i.MX94 support

Koichiro Den (3):
      gpio: introduce utilities for synchronous fake device creation
      gpio: sim: convert to use dev-sync-probe utilities
      gpio: virtuser: convert to use dev-sync-probe utilities

Krzysztof Kozlowski (1):
      gpio: Use str_enable_disable-like helpers

Linus Walleij (4):
      gpio: mmio: Add flag for calling pinctrl back-end
      gpio: vf610: Switch to gpio-mmio
      gpiolib: of: Use local variables
      gpiolib: of: Handle threecell GPIO chips

Matti Vaittinen (4):
      gpio: Respect valid_mask when requesting GPIOs
      gpio: Add a valid_mask getter
      gpio: gpio-rcar: Drop direct use of valid_mask
      gpio: Hide valid_mask from direct assignments

Ninad Palsule (1):
      dt-bindings: gpio: ast2400-gpio: Add hogs parsing

Quentin Schulz (2):
      dt-bindings: gpio: nxp,pcf8575: add reset GPIO
      gpio: pcf857x: add support for reset-gpios on (most) PCA967x

Rob Herring (Arm) (1):
      dt-bindings: gpio: mvebu: Add missing 'gpio-ranges' property and hog nodes

hlleng (1):
      gpio: virtio: support multiple virtio-gpio controller instances

 .../bindings/gpio/aspeed,ast2400-gpio.yaml         |   6 +
 .../devicetree/bindings/gpio/gpio-mvebu.yaml       |  10 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml       |   1 +
 .../devicetree/bindings/gpio/loongson,ls-gpio.yaml |   3 +
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml      |  37 +++
 drivers/gpio/Kconfig                               |   9 +-
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/TODO                                  |  89 ++---
 drivers/gpio/dev-sync-probe.c                      |  97 ++++++
 drivers/gpio/dev-sync-probe.h                      |  25 ++
 drivers/gpio/gpio-74x164.c                         |  96 +++---
 drivers/gpio/gpio-adnp.c                           | 140 ++++----
 drivers/gpio/gpio-adp5520.c                        |  12 +-
 drivers/gpio/gpio-adp5585.c                        |  10 +-
 drivers/gpio/gpio-aggregator.c                     |  38 ++-
 drivers/gpio/gpio-altera-a10sr.c                   |  14 +-
 drivers/gpio/gpio-altera.c                         |   6 +-
 drivers/gpio/gpio-amd-fch.c                        |   7 +-
 drivers/gpio/gpio-amd8111.c                        |   6 +-
 drivers/gpio/gpio-arizona.c                        |   9 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   |  82 ++---
 drivers/gpio/gpio-aspeed.c                         | 108 +++---
 drivers/gpio/gpio-bcm-kona.c                       |  69 ++--
 drivers/gpio/gpio-bd71815.c                        |  15 +-
 drivers/gpio/gpio-bd71828.c                        |  15 +-
 drivers/gpio/gpio-bd9571mwv.c                      |   8 +-
 drivers/gpio/gpio-brcmstb.c                        |   3 +-
 drivers/gpio/gpio-bt8xx.c                          |  48 +--
 drivers/gpio/gpio-cgbc.c                           |  24 +-
 drivers/gpio/gpio-creg-snps.c                      |  10 +-
 drivers/gpio/gpio-cros-ec.c                        |  13 +-
 drivers/gpio/gpio-crystalcove.c                    |  15 +-
 drivers/gpio/gpio-cs5535.c                         |   6 +-
 drivers/gpio/gpio-da9052.c                         |  34 +-
 drivers/gpio/gpio-da9055.c                         |  14 +-
 drivers/gpio/gpio-davinci.c                        |   6 +-
 drivers/gpio/gpio-grgpio.c                         |   3 +-
 drivers/gpio/gpio-latch.c                          |  78 ++---
 drivers/gpio/gpio-loongson-64bit.c                 |  55 ++-
 drivers/gpio/gpio-max3191x.c                       |  18 +-
 drivers/gpio/gpio-max77650.c                       |  14 +-
 drivers/gpio/gpio-mmio.c                           |  37 ++-
 drivers/gpio/gpio-mockup.c                         |  14 +-
 drivers/gpio/gpio-mvebu.c                          |  15 +-
 drivers/gpio/gpio-nomadik.c                        |   3 +-
 drivers/gpio/gpio-pca953x.c                        |  17 +-
 drivers/gpio/gpio-pcf857x.c                        |  29 +-
 drivers/gpio/gpio-rcar.c                           |  13 +-
 drivers/gpio/gpio-regmap.c                         |  73 ++--
 drivers/gpio/gpio-sim.c                            |  98 ++----
 drivers/gpio/gpio-stmpe.c                          |   6 +-
 drivers/gpio/gpio-vf610.c                          | 105 +-----
 drivers/gpio/gpio-virtio.c                         |  29 +-
 drivers/gpio/gpio-virtuser.c                       |  73 +---
 drivers/gpio/gpio-wcove.c                          |   3 +-
 drivers/gpio/gpio-wm831x.c                         |   3 +-
 drivers/gpio/gpio-xilinx.c                         | 102 +++---
 drivers/gpio/gpio-xra1403.c                        |   3 +-
 drivers/gpio/gpiolib-acpi.c                        |   2 +-
 drivers/gpio/gpiolib-of.c                          | 132 ++++++--
 drivers/gpio/gpiolib.c                             | 367 +++++++++++++++------
 drivers/gpio/gpiolib.h                             |  39 ++-
 drivers/leds/leds-aw200xx.c                        |   2 +-
 drivers/mmc/core/pwrseq_simple.c                   |   3 +-
 drivers/mux/gpio.c                                 |   4 +-
 drivers/phy/motorola/phy-mapphone-mdm6600.c        |   4 +-
 include/drm/drm_util.h                             |  16 +-
 include/linux/gpio.h                               |   4 +-
 include/linux/gpio/consumer.h                      |  80 +++--
 include/linux/gpio/driver.h                        |  92 ++++--
 include/linux/gpio/regmap.h                        |   4 +-
 include/linux/util_macros.h                        |  15 +
 72 files changed, 1465 insertions(+), 1178 deletions(-)
 create mode 100644 drivers/gpio/dev-sync-probe.c
 create mode 100644 drivers/gpio/dev-sync-probe.h

