Return-Path: <linux-gpio+bounces-26656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15809BA8B43
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 11:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7E0C4E1D05
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 09:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCBF2D3237;
	Mon, 29 Sep 2025 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MlFP6MYX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A035280327
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138876; cv=none; b=mOQf2rO24yKdJ6JxjXvFT3eofvT+su92s618+ln7ZOQWyFtbdYCjBUDBz1Qs/lzA8UiQg8pfw0+NnSMoVcZd1OsSoEgtqya5sp1LInvUi9KhRUD2JmERPeEPXJqho6uaR1w0jKEZtflPZUdoy30ZiAWu2s91xNricxTtXfKcdno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138876; c=relaxed/simple;
	bh=yDuoH/nSjAl2Y/b4ycdLlfxccoYPyLx7s/KgzL7pWR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Urz722GpkzTfHnLOFCJ9nXCkXt5yz5bnkKrOJY5Nq7fm7nmMTEgusgk/p5uEc37kcU4j0GdMhKt0iGOAP1vWhOoPdBIhDhNuw7xeCibympX4UDEPA7LrMTpLpILv2J15adATbSxcne7Q2KCPOKseHvBWAfXqmenh74/4xBvJGOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MlFP6MYX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e504975dbso7472885e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759138872; x=1759743672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIHInAWPnhnDrW6Zcc5yNLvXKSoyZUHPa3K83oEqGuo=;
        b=MlFP6MYXpdkixHfEKjqq46Fq2FBkvWdm8LfnRFf1AXIQ0MqQ9+tMsU8AZ2prN4VUyx
         onfmamI9N0MSHNKH7iblgUFmx+OWNJKmkokxxGCqXU+6gKA0TU1UOzizPA/DfDp5ndqw
         nOg6CsKK/+ok1Q567lbgnleRhF/Ve3NVHtF3qmszmdd3tcdG4BR5hzmob4b9X3BiaD9H
         OxknwKwLkQXPPkLjv3pbldcn4zeZT2+CO7eklbmUCDO14BRgGx7gt4QnhxKVHUZYu4tg
         xPrjZyibaz9BF1wD2HnHwRFDxb22yzeC91GNdqhQzo4Ne2GddwLXIotGOV5kuJBrpmba
         kqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138872; x=1759743672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIHInAWPnhnDrW6Zcc5yNLvXKSoyZUHPa3K83oEqGuo=;
        b=UboGBUUfxI/iqbXWQLuCks/pLmEDwI1AAbMxO4Ve7aO5JE/7bYh6WRtVQf1Oi4MYkb
         HL7DlPGhWHgHUpFkwvdojxHB+1LjcHcaExj/FtpntjF7EXtkCOvbFjZ71AONi29bv+vh
         ZVnCcTEf+HhXN0x/Z3CAWEviNP1isKwmEXlKM3No+1f5nfhJC6i/zfMoZLbIFf6E5+nJ
         pTt8aE+Yty8bupFp09WRLTyo48DadC0ratgoOharietbmmssDW6LhnQ+9wHGeaQ90WQK
         ZrLWcHhekKrcQEMSymDg5I4zSE3J5VjuDJ4F6wjj7yn0H42lkWQfnSxYUpi4aMukTtiY
         1pVA==
X-Forwarded-Encrypted: i=1; AJvYcCVKdzGZqCTZ4HETO5t7PdtXJlXDkuHBOMLCU8nWSvbqJxI+D4Mmz3Wd+ptpOSWIfls/XE1vMam/pAVi@vger.kernel.org
X-Gm-Message-State: AOJu0YwatNwXBZefpLGu70K/WfPNO36jxkEqhrrKm9m9I3CRQYHvmMuX
	2Q03GFSV3kTgjxwYuTyMhpZmBP29A8wwmqHPNEYDe6Zct1QiCs03EuuTfKjtAiAKJ1Y=
X-Gm-Gg: ASbGncsvzgQviGzxrHqX3U/NiRWjA7sh7+dpiWRI1OdgGKhDC5Q5x+Jg67PlW3FAuxT
	i4EGdBqXBaStUby/U4oCD84e6geQGjAw9wJ+preHYjpVnSGIlRu8MQcaWgAy8DNO5+sNOuwbfq4
	mY7Z63FSnTmSZtwywvSvXGylkkqJd0peEwn3VgizZMu7sl2Eg4JYB6gc5RIzBjThup1qcYlA0WV
	oSHzzX9STZu/3zNvWLQ4SwSLa41S/5ZZ8B9JYwScTRzI3/c5d+k3V/2zzze88NmD7YcqK2oJ3zV
	TXCSN40qwCKue4ALI7iQ1k87JlMOh2928P6ZBvuCkOdXgo5QOVAVgXp2fuj8aL05boPrs8g2ZxB
	8yEgbNEMvRZ7WomEaev/95XbPN4zQUJKP9cs=
X-Google-Smtp-Source: AGHT+IGev/AusH8meG9M791d2ZScvPWtdc89HVDeMYXEuFog2xaFNQFkhyXTfAVJhkMMvwMogWYy0g==
X-Received: by 2002:a05:600c:34ce:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46e32a2c1d6mr152801395e9.36.1759138871564;
        Mon, 29 Sep 2025 02:41:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7b64:c4b7:3965:ef7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f65290sm5402225e9.13.2025.09.29.02.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:41:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.18-rc1
Date: Mon, 29 Sep 2025 11:41:07 +0200
Message-ID: <20250929094107.34633-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here's the PR containing the GPIO updates for this merge window. There are
two new drivers and support for more models in existing ones. 

The generic GPIO API has been reworked and all users converted which
allowed us to move the fields specific to the generic GPIO implementation
out of the high-level struct gpio_chip into its own structure that wraps
the gpio_chip.

Other than that, there's nothing too exciting. Mostly minor tweaks and
fixes all over the place, some refactoring and some small new features
in helper modules. Details are in the signed tag.

The merges you see here are either me pulling in MFD changes with GPIO
drivers that depend on MFD changes or my own immutable branches provided
for other trees.

Thanks,
Bartosz

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.18-rc1

for you to fetch changes up to bc061143637532c08d9fc657eec93fdc2588068e:

  gpio: mpfs: fix setting gpio direction to output (2025-09-26 11:56:26 +0200)

----------------------------------------------------------------
gpio updates for v6.18-rc1

GPIO core:
- add support for sparse pin ranges to the glue between GPIO and pinctrl
- use a common prefix across all GPIO descriptor flags for improved
  namespacing

New drivers:
- add new GPIO driver for the Nuvoton NCT6694
- add new GPIO driver for MAX7360

Driver improvements:
- add support for Tegra 256 to the gpio-tegra186 driver
- add support for Loongson-2K0300 to the gpio-loongson-64bit driver
- refactor the gpio-aggregator module to expose its GPIO forwarder API
  to other in-kernel users (to enable merging of a new pinctrl driver
  that uses it)
- convert all remaining drivers to using the modernized generic GPIO chip
  API and remove the old interface
- stop displaying global GPIO numbers in debugfs output of controller
  drivers
- extend the gpio-regmap helper with a new config option and improve its
  support for GPIO interrupts
- remove redundant fast_io parameter from regmap configs in GPIO drivers
  that already use MMIO regmaps which imply it
- add support for a new model in gpio-mmio: ixp4xx expansion bus
- order includes alphabetically in a few drivers for better readability
- use generic device properties where applicable
- use devm_mutex_init() where applicable
- extend build coverage of drivers by enabling more to be compiled with
  COMPILE_TEST enabled
- allow building gpio-stmpe as a module
- use dev_err_probe() where it makes sense in drivers

Late driver fixes:
- fix setting GPIO direction to output in gpio-mpfs

Documentation:
- document the usage of software nodes with GPIO chips

Device-tree bindings:
- Add DT bindings documents for new hardware: Tegra256, MAX7360
- Document a new model in Loongson bindings: LS2K0300
- Document a new model using the generic GPIO binding: IXP4xx
- Convert the DT binding for fsl,mxs-pinctrl to YAML
- fix the schema ID in the "trivial" GPIO schema
- describe GPIO hogs in the generic GPIO binding

----------------------------------------------------------------
Akhilesh Patil (1):
      gpio: Kconfig: Update help for GPIO_PCA953X

Alexander Stein (2):
      gpio: stmpe: Allow to compile as a module
      mfd: stmpe: Allow building as module

Bartosz Golaszewski (80):
      Merge tag 'gpio-aggregator-refactoring-for-v6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into gpio/for-next
      pinctrl: stm32: use new generic GPIO chip API
      pinctrl: equilibrium: use new generic GPIO chip API
      pinctrl: npcm8xx: use new generic GPIO chip API
      pinctrl: npcm7xx: use new generic GPIO chip API
      pinctrl: wpcm450: use new generic GPIO chip API
      Merge branch 'ib-gpio_generic_chip_init' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into gpio/for-next
      gpio: generic: provide to_gpio_generic_chip()
      gpio: generic: provide helpers for reading and writing registers
      gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
      gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
      gpio: ts4800: use generic device properties
      gpio: ts4800: use dev_err_probe()
      gpio: ts4800: use new generic GPIO chip API
      gpio: loongson-64bit: use new generic GPIO chip API
      gpio: dwapb: use new generic GPIO chip API
      gpio: amdpt: use new generic GPIO chip API
      gpio: rda: use new generic GPIO chip API
      gpio: grgpio: use new generic GPIO chip API
      gpio: mpc8xxx: use new generic GPIO chip API
      gpio: ge: use new generic GPIO chip API
      gpio: sim: don't use GPIO base in debugfs output
      gpio: xgene-sb: use new generic GPIO chip API
      gpio: mxs: order includes alphabetically
      gpio: mxs: use new generic GPIO chip API
      gpio: mlxbf2: use dev_err_probe() where applicable
      gpio: mlxbf2: use new generic GPIO chip API
      gpio: xgs-iproc: use new generic GPIO chip API
      gpio: ftgpio010: order includes alphabetically
      gpio: ftgpio010: use new generic GPIO chip API
      gpio: realtek-otto: use new generic GPIO chip API
      gpio: hisi: use new generic GPIO chip API
      gpio: vf610: use new generic GPIO chip API
      gpio: visconti: use new generic GPIO chip API
      gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks
      mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()
      mfd: vexpress-sysreg: Use new generic GPIO chip API
      Merge tag 'ib-mfd-gpio-v6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      Merge tag 'gpio/mfd-stmpe-for-v6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into gpio/for-next
      gpio: nomadik: wrap a local variable in a necessary ifdef
      Merge tag 'v6.17-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: ixp4xx: allow building the module with COMPILE_TEST enabled
      gpio: ixp4xx: use new generic GPIO chip API
      gpio: idt3243x: use new generic GPIO chip API
      gpio: blzp1600: use new generic GPIO chip API
      gpio: tb10x: order includes alphabetically
      gpio: tb10x: allow building the module with COMPILE_TEST=y
      gpio: tb10x: use new generic GPIO chip API
      gpio: mlxbf: use new generic GPIO chip API
      gpio: ep93xx: allow building the module with COMPILE_TEST enabled
      gpio: ep93xx: order includes alphabetically
      gpio: ep93xx: use new generic GPIO chip API
      gpio: mlxbf3: use new generic GPIO chip API
      gpio: use more common syntax for compound literals
      gpiolib: add a common prefix to GPIO descriptor flags
      gpio: loongson1: allow building the module with COMPILE_TEST enabled
      gpio: loongson1: use new generic GPIO chip API
      gpio: hlwd: use new generic GPIO chip API
      gpio: ath79: use new generic GPIO chip API
      gpio: ath79: use the generic GPIO chip lock for IRQ handling
      gpio: xgene-sb: use generic GPIO chip register read and write APIs
      gpio: brcmstb: use new generic GPIO chip API
      gpio: mt7621: use new generic GPIO chip API
      gpio: mt7621: use the generic GPIO chip lock for IRQ handling
      gpio: menz127: use new generic GPIO chip API
      gpio: sifive: use new generic GPIO chip API
      gpio: spacemit-k1: use new generic GPIO chip API
      gpio: sodaville: use new generic GPIO chip API
      gpio: mmio: use new generic GPIO chip API
      gpio: move gpio-mmio-specific fields out of struct gpio_chip
      gpio: nomadik: fix the debugfs helper stub
      Merge tag 'ib-mfd-gpio-hwmon-i2c-can-rtc-watchdog-v6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      Merge tag 'ib-mfd-gpio-input-pinctrl-pwm-v6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      gpio: generic: rename BGPIOF_ flags to GPIO_GENERIC_
      gpio: generic: move GPIO_GENERIC_ flags to the correct header

Chen Ni (1):
      gpio: loongson-64bit: Remove unneeded semicolon

Christophe JAILLET (1):
      gpio: pisosr: Use devm_mutex_init()

Colin Ian King (1):
      gpio: loongson-64bit: Fix a less than zero check on an unsigned int struct field

Conor Dooley (1):
      gpio: mpfs: fix setting gpio direction to output

Dan Carpenter (1):
      gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()

Dmitry Torokhov (1):
      Documentation: gpio: add documentation about using software nodes

Frank Li (1):
      dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml

Geert Uytterhoeven (1):
      gpio: TODO: remove the task for converting to the new line setters

Ioana Ciornei (1):
      dt-bindings: gpio: fix trivial-gpio's schema id

Kamel Bouhara (2):
      mfd: Add max7360 support
      pwm: max7360: Add MAX7360 PWM support

Krzysztof Kozlowski (1):
      dt-bindings: gpio: Minor whitespace cleanup in example

Li Jun (1):
      gpio: aggregator: fix macros coding style error

Linus Walleij (3):
      dt-bindings: gpio-mmio: Support hogs
      dt-bindings: gpio-mmio: Add MMIO for IXP4xx expansion bus
      gpio: mmio: Add compatible for the ixp4xx eb MMIO

Mathieu Dubois-Briand (8):
      dt-bindings: mfd: gpio: Add MAX7360
      pinctrl: Add MAX7360 pinctrl driver
      gpio: regmap: Allow to allocate regmap-irq device
      gpio: regmap: Allow to provide init_valid_mask callback
      gpio: max7360: Add MAX7360 gpio support
      input: keyboard: Add support for MAX7360 keypad
      input: misc: Add support for MAX7360 rotary
      MAINTAINERS: Add entry on MAX7360 driver

Ming Yu (7):
      mfd: Add core driver for Nuvoton NCT6694
      gpio: Add Nuvoton NCT6694 GPIO support
      i2c: Add Nuvoton NCT6694 I2C support
      can: Add Nuvoton NCT6694 CANFD support
      watchdog: Add Nuvoton NCT6694 WDT support
      hwmon: Add Nuvoton NCT6694 HWMON support
      rtc: Add Nuvoton NCT6694 RTC support

Prathamesh Shete (2):
      dt-bindings: gpio: Add Tegra256 support
      gpio: tegra186: Add support for Tegra256

Thomas Richard (9):
      gpiolib: add support to register sparse pin range
      gpio: aggregator: move GPIO forwarder allocation in a dedicated function
      gpio: aggregator: refactor the code to add GPIO desc in the forwarder
      gpio: aggregator: refactor the forwarder registration part
      gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
      gpio: aggregator: export symbols of the GPIO forwarder library
      gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
      gpio: aggregator: add possibility to attach data to the forwarder
      lib/string_choices: Add str_input_output() helper

Waqar Hameed (1):
      gpio: twl4030: Remove error print for devm_add_action_or_reset()

Wolfram Sang (1):
      gpio: remove unneeded 'fast_io' parameter in regmap_config

Yao Zi (2):
      dt-bindings: gpio: loongson: Document GPIO controller of LS2K0300 SoC
      gpio: loongson-64bit: Add support for Loongson-2K0300 SoC

 .../devicetree/bindings/gpio/gpio-mmio.yaml        |  36 +-
 .../devicetree/bindings/gpio/gpio-mxs.yaml         |  80 +-
 .../devicetree/bindings/gpio/loongson,ls-gpio.yaml |  28 +-
 .../devicetree/bindings/gpio/maxim,max31910.yaml   |   6 +-
 .../bindings/gpio/maxim,max7360-gpio.yaml          |  83 ++
 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |   2 +
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   2 +-
 .../devicetree/bindings/gpio/trivial-gpio.yaml     |   2 +-
 .../devicetree/bindings/mfd/maxim,max7360.yaml     | 191 +++++
 .../bindings/pinctrl/fsl,mxs-pinctrl.txt           | 127 ---
 Documentation/driver-api/gpio/board.rst            |  65 ++
 Documentation/driver-api/gpio/index.rst            |   1 +
 Documentation/driver-api/gpio/legacy-boards.rst    | 298 +++++++
 MAINTAINERS                                        |  25 +
 drivers/gpio/Kconfig                               |  49 +-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/TODO                                  |  17 -
 drivers/gpio/gpio-aggregator.c                     | 410 +++++++--
 drivers/gpio/gpio-amdpt.c                          |  44 +-
 drivers/gpio/gpio-ath79.c                          |  88 +-
 drivers/gpio/gpio-blzp1600.c                       |  39 +-
 drivers/gpio/gpio-brcmstb.c                        | 114 +--
 drivers/gpio/gpio-cadence.c                        |   2 +-
 drivers/gpio/gpio-dwapb.c                          | 160 ++--
 drivers/gpio/gpio-ep93xx.c                         |  33 +-
 drivers/gpio/gpio-ftgpio010.c                      |  48 +-
 drivers/gpio/gpio-ge.c                             |  25 +-
 drivers/gpio/gpio-grgpio.c                         |  87 +-
 drivers/gpio/gpio-hisi.c                           |  48 +-
 drivers/gpio/gpio-hlwd.c                           | 105 +--
 drivers/gpio/gpio-idt3243x.c                       |  45 +-
 drivers/gpio/gpio-ixp4xx.c                         |  72 +-
 drivers/gpio/gpio-loongson-64bit.c                 | 228 ++++-
 drivers/gpio/gpio-loongson1.c                      |  40 +-
 drivers/gpio/gpio-max7360.c                        | 257 ++++++
 drivers/gpio/gpio-menz127.c                        |  31 +-
 drivers/gpio/gpio-mlxbf.c                          |  25 +-
 drivers/gpio/gpio-mlxbf2.c                         |  81 +-
 drivers/gpio/gpio-mlxbf3.c                         | 101 +--
 drivers/gpio/gpio-mmio.c                           | 363 ++++----
 drivers/gpio/gpio-mpc8xxx.c                        | 105 ++-
 drivers/gpio/gpio-mpfs.c                           |   2 +-
 drivers/gpio/gpio-mt7621.c                         |  80 +-
 drivers/gpio/gpio-mvebu.c                          |   3 +-
 drivers/gpio/gpio-mxc.c                            |   2 +-
 drivers/gpio/gpio-mxs.c                            |  31 +-
 drivers/gpio/gpio-nct6694.c                        | 499 +++++++++++
 drivers/gpio/gpio-nomadik.c                        |  27 +-
 drivers/gpio/gpio-pisosr.c                         |   8 +-
 drivers/gpio/gpio-rda.c                            |  35 +-
 drivers/gpio/gpio-realtek-otto.c                   |  41 +-
 drivers/gpio/gpio-regmap.c                         |  30 +-
 drivers/gpio/gpio-sifive.c                         |  74 +-
 drivers/gpio/gpio-sim.c                            |   3 +-
 drivers/gpio/gpio-sodaville.c                      |  20 +-
 drivers/gpio/gpio-spacemit-k1.c                    |  29 +-
 drivers/gpio/gpio-stmpe.c                          |  34 +-
 drivers/gpio/gpio-tb10x.c                          |  74 +-
 drivers/gpio/gpio-tegra186.c                       |  28 +
 drivers/gpio/gpio-ts4800.c                         |  39 +-
 drivers/gpio/gpio-twl4030.c                        |   4 +-
 drivers/gpio/gpio-vf610.c                          |  31 +-
 drivers/gpio/gpio-visconti.c                       |  25 +-
 drivers/gpio/gpio-wm831x.c                         |   5 +-
 drivers/gpio/gpio-wm8994.c                         |   6 +-
 drivers/gpio/gpio-xgene-sb.c                       |  58 +-
 drivers/gpio/gpio-xgs-iproc.c                      |  34 +-
 drivers/gpio/gpio-xra1403.c                        |   3 +-
 drivers/gpio/gpiolib-cdev.c                        |  90 +-
 drivers/gpio/gpiolib-of.c                          |   2 +-
 drivers/gpio/gpiolib-sysfs.c                       |  46 +-
 drivers/gpio/gpiolib.c                             | 195 +++--
 drivers/gpio/gpiolib.h                             |  36 +-
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/nct6694-hwmon.c                      | 949 +++++++++++++++++++++
 drivers/i2c/busses/Kconfig                         |  10 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-nct6694.c                   | 196 +++++
 drivers/input/keyboard/Kconfig                     |  12 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/max7360-keypad.c            | 308 +++++++
 drivers/input/misc/Kconfig                         |  10 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/max7360-rotary.c                | 192 +++++
 drivers/mfd/Kconfig                                |  39 +-
 drivers/mfd/Makefile                               |   3 +
 drivers/mfd/max7360.c                              | 171 ++++
 drivers/mfd/nct6694.c                              | 388 +++++++++
 drivers/mfd/stmpe.c                                |   6 +
 drivers/mfd/vexpress-sysreg.c                      |  25 +-
 drivers/net/can/usb/Kconfig                        |  11 +
 drivers/net/can/usb/Makefile                       |   1 +
 drivers/net/can/usb/nct6694_canfd.c                | 832 ++++++++++++++++++
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 181 ++--
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          | 154 ++--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |  46 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |  26 +-
 drivers/pinctrl/pinctrl-equilibrium.h              |   2 +-
 drivers/pinctrl/pinctrl-max7360.c                  | 215 +++++
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  32 +-
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-max7360.c                          | 209 +++++
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-nct6694.c                          | 297 +++++++
 drivers/watchdog/Kconfig                           |  11 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/nct6694_wdt.c                     | 307 +++++++
 include/dt-bindings/gpio/tegra256-gpio.h           |  28 +
 include/linux/gpio/driver.h                        | 105 ++-
 include/linux/gpio/forwarder.h                     |  41 +
 include/linux/gpio/generic.h                       | 102 ++-
 include/linux/gpio/gpio-nomadik.h                  |   6 +-
 include/linux/gpio/regmap.h                        |  18 +
 include/linux/mfd/max7360.h                        | 109 +++
 include/linux/mfd/nct6694.h                        | 102 +++
 include/linux/string_choices.h                     |   6 +
 122 files changed, 8577 insertions(+), 1783 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/maxim,max7360-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max7360.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
 create mode 100644 Documentation/driver-api/gpio/legacy-boards.rst
 create mode 100644 drivers/gpio/gpio-max7360.c
 create mode 100644 drivers/gpio/gpio-nct6694.c
 create mode 100644 drivers/hwmon/nct6694-hwmon.c
 create mode 100644 drivers/i2c/busses/i2c-nct6694.c
 create mode 100644 drivers/input/keyboard/max7360-keypad.c
 create mode 100644 drivers/input/misc/max7360-rotary.c
 create mode 100644 drivers/mfd/max7360.c
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 drivers/net/can/usb/nct6694_canfd.c
 create mode 100644 drivers/pinctrl/pinctrl-max7360.c
 create mode 100644 drivers/pwm/pwm-max7360.c
 create mode 100644 drivers/rtc/rtc-nct6694.c
 create mode 100644 drivers/watchdog/nct6694_wdt.c
 create mode 100644 include/dt-bindings/gpio/tegra256-gpio.h
 create mode 100644 include/linux/gpio/forwarder.h
 create mode 100644 include/linux/mfd/max7360.h
 create mode 100644 include/linux/mfd/nct6694.h

