Return-Path: <linux-gpio+bounces-20562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF0AC3D6C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 May 2025 11:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C7B17177A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 May 2025 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2171EFFB2;
	Mon, 26 May 2025 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wOr6LT9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7822566
	for <linux-gpio@vger.kernel.org>; Mon, 26 May 2025 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253359; cv=none; b=TOfYe4I4numluYCM2vgJxxZXDJMEa7SaWnpoWMy1WnJ/xVKmgYdDQSn1sPZMy+D7mdlq2M9MAOoWrqW5S2TekDLrq9zuikgptT+F3OEpCMSR1uoAqSWI1kQ07ssuFtHWBVZ3Rn5H2XaneeCdQccX9DrcrvkUblstXP2GERn+qog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253359; c=relaxed/simple;
	bh=g1Smzj2cI6eJSFcxJzUxWqhAX4meF8dpQ8e0hxrOq2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bmi1toBkNky6bBoiTH5q/TVLf7hADiB4j0shejL0Qz6JpX1Tf5S/9mJYH8jfD6wXqaeKgAJuh1rBTjRZF1IAO0gs0SUD4k68coKJVWVdMy0Z6ePDCcneI7fdogKBpitrJOSLVXsyUBPZevUXH4YZAy0NrBV8x4YLvnOWI3rUBVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wOr6LT9u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so30344525e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 May 2025 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748253355; x=1748858155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BBnM4SFPT90uhkjia+TXc5+tlZApsW6YCMJ56WF/2M=;
        b=wOr6LT9uYw0gKN3rMI99xP9Rd4vmRXbiTjdXge1U5olxIeD7pInNNPl9TTAD2kXHE4
         k/HIpWME4s8ibLC6pX7vwL5x9TVD7g5xhgCMRrkJq7vhBSjMgqI2fG4dBaJvgU6bpnio
         DUofOYUtCR6hCfAMUmIZi44X7wpe/+fDyDRk4zMkz+tRgP7em584NsDRpJhyg9NF78zp
         wTOcYvw5A1BwDvXZf83HLem/EZLAAC+nSPigo+FJ3yuc8l+vsIAfQY462ZRNO19i1hQe
         +1YnDqLh0Y2oHe5iToQ7/ddDhqYWhv2n4r0EhD+S98slEzRzFU5Xuemt03UKeRA0Cqin
         egJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253355; x=1748858155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BBnM4SFPT90uhkjia+TXc5+tlZApsW6YCMJ56WF/2M=;
        b=aWR3sSSkCJeCOvZ2gNxdZ90o5Y180q9PbfQO6iwiXXnh0tH0YGaKOeFptkJ4EtNjdN
         bUti1ojtuVokkpG0ACUbrtIGZvch/7fws2vm/8uqjYgqsOftsdkRVze6C4Pt7aGd4age
         rebjQHOswiJGlA9pPGW+E/96ZFUStljjltBFsVR0F6WVSUWsik+M20AGvcs8oKnLtCwz
         6ZIcLurrjti2sfhIMJoIvdOMZ4/Y68kwhbEk5qR4bYmMusU0kcOyOlMJo85+aqCELwae
         m8/V2bMOOnrmRuHu07EwJ+w3qmfyfEDg4FNSPE7ShdN8gNmvwM8t/Em4WPFicetfiqBx
         CQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXKRwFZUqlXBNKvQFjJfVWbeUjidEuGFNuJUYb1+Lt8Onzg93PskGFOfAveCDx9HQmE0DzYUYiMuuoE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5UEaYdq+CwaCOEghC3P7yQ7hSCtQQ9XDnvAtcZxSuGubPzamN
	Q9mJsPbfKKx4uHmvijgjnbHWGfMihrtZbr9FrjHqBV7ziROTCIZ2mCrvvyT8HDIsTUk=
X-Gm-Gg: ASbGncutpXXBGcmqTWFp0K3ltHM+6RUqbW9wXEKSLI8HUjt8uMNLgQbrqJCC31bsYFn
	ni+92dEq8bzyjuoqDiScKihNTM6P69guR3tCn6XDvfJz79tzLrSWH6jeoj2BBKWOJD8my4mj0RQ
	pdCDamjiBs4K5vt4MDCWiXKwzvMrKyRJC1H2vsGEx1lkDdsxB81tI2wX4uGUDtWISNN71sjGZaY
	owuY1tmnKGhAlmJQANhCRfBEWqFd3xImF4Hi+HMu8fqNdOGFgk/LUMzzccis6lU3tnbRGAos+iv
	hk+LHpuzPYlDWFXKeS8oah8rDwJjjvt172L4zG7QmiFLS1LfPXk=
X-Google-Smtp-Source: AGHT+IFRGB6lmrRnAadBT36Pu03+oYL+UAfPMujMfvE5kRE9c9ykSogcueoKMstSz2lFvetdUCD9OQ==
X-Received: by 2002:a05:600c:a07:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-44c916071admr70495535e9.6.1748253354860;
        Mon, 26 May 2025 02:55:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b4a1:24ab:1579:3692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7ca2dd9sm227326375e9.37.2025.05.26.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:55:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.16-rc1
Date: Mon, 26 May 2025 11:55:38 +0200
Message-ID: <20250526095541.34708-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
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

Here's the PR containing updates for the GPIO subsystem for this cycle.
We have three new drivers, some refactoring in the GPIO core, lots of
various changes across many drivers, new configfs interface for the
virtual gpio-aggregator module and DT-bindings updates.

The treewide conversion of GPIO drivers to using the new value setter
callbacks is ongoing with another round of GPIO drivers updated. You will
also see these commits coming in from other subsystems as with the
relevant changes merged into mainline last cycle, I've started converting
GPIO providers located elsewhere than drivers/gpio/.

Details are in the signed tag. Please consider pulling

Thanks,
Bartosz Golaszewski

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.16-rc1

for you to fetch changes up to 8b8ef309093ff196967a21ee51a9cdb404a13bf6:

  gpio: timberdale: select GPIOLIB_IRQCHIP (2025-05-22 10:00:08 +0200)

----------------------------------------------------------------
gpio updates for v6.16-rc1

GPIO core:
- use more lock guards where applicable
- refactor GPIO ACPI code and shrink it in the process by 8%
- move GPIO ACPI quirks into a separate file
- remove unneeded #ifdef
- convert GPIO devres helpers to using devm_add_action() where applicable
  which shrinks and simplifies the code
- refactor GPIO descriptor validation in GPIO consumer interfaces
- don't allow setting values on input lines in the GPIO core which will
  take off the burden from GPIO drivers of checking this down the line
- provide gpiod_is_equal() as a way of safely comparing two GPIO
  descriptors (the only current user is in regulator core)

New drivers:
- add the GPIO module for the max77759 multifunction device
- add the GPIO driver for the VeriSilicon BLZP1600 GPIO controller
- add the GPIO driver for the Spacemit K1 SoC

Driver improvements:
- convert more drivers to using the new GPIO line value setter callbacks
- convert more drivers to making the irq_chip immutable as is recommended
  by the interrupt subsystem
- extend build testing coverage by enabling more modules to be built with
  COMPILE_TEST=y
- extend the gpio-aggregator module with a configfs interface that makes
  the setup easier for user-space than the existing driver-level sysfs
  attributes and also adds more advanced configuration features (such as
  referring to aggregated lines by their original names or modifying
  their names as exposed by the aggregated chip)
- add a missing mutex_destroy() in gpio-imx-scu
- add an OF polarity quirk for s5m8767
- allow building gpio-vf610 as a loadable module
- make gpio-mxc not hardcode its GPIO base number with GPIO SYSFS
  interface disabled (another small step towards getting rid of the global
  GPIO numberspace)
- add support for level-triggered interrupts to gpio-pca953x
- don't double-check the ngpios property in gpio-ds4520 as GPIO core
  already does it
- don't double-check the number of GPIOs in gpio-imx-scu as GPIO core
  already does it
- remove unused callbacks from gpio-max3191x

DT bindings:
- add device-tree bindings for max77759, spacemit,k1 and blzp1600 (new
  drivers added this cycle)
- document more properties for gpio-vf610 and gpio-tegra186
- document a new pca95xx variant
- fix style of examples in several GPIO DT-binding documents

Misc:
- TODO list updates

----------------------------------------------------------------
Aaron Kling (1):
      dt-bindings: gpio: tegra186: Add gpio-ranges

Ahmad Fatoum (2):
      gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
      gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base

André Draszik (6):
      dt-bindings: gpio: Add max77759 binding
      dt-bindings: nvmem: Add max77759 binding
      dt-bindings: mfd: Add max77759 binding
      mfd: max77759: Add Maxim MAX77759 core driver
      gpio: max77759: Add Maxim MAX77759 gpio driver
      nvmem: max77759: Add Maxim MAX77759 NVMEM driver

Andy Shevchenko (27):
      gpiolib: acpi: Improve struct acpi_gpio_info memory footprint
      gpiolib: acpi: Remove index parameter from acpi_gpio_property_lookup()
      gpiolib: acpi: Reduce memory footprint for struct acpi_gpio_params
      gpiolib: acpi: Rename par to params for better readability
      gpiolib: acpi: Reuse struct acpi_gpio_params in struct acpi_gpio_lookup
      gpiolib: acpi: Deduplicate some code in __acpi_find_gpio()
      Merge patch series "gpiolib: acpi: Refactor to shrink the code by ~8%"
      gpiolib: Make taking gpio_lookup_lock consistent
      gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
      gpiolib: Print actual error when descriptor contains an error pointer
      gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
      gpiolib: Move validate_desc() and Co upper in the code
      gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
      gpiolib: Reuse return variable in gpiod_to_irq()
      gpiolib: Remove redundant assignment of return variable
      devres: Move devm_*_action*() APIs to devres.h
      devres: Add devm_is_action_added() helper
      gpiolib: devres: Finish the conversion to use devm_add_action()
      gpiolib: acpi: Use temporary variable for struct acpi_gpio_info
      gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
      gpiolib: acpi: Make sure we fill struct acpi_gpio_info
      gpiolib: acpi: Handle deferred list via new API
      Merge patch series "gpiolib: acpi: Fix missing info filling"
      gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
      gpiolib: acpi: Move quirks to a separate file
      Merge patch series "gpiolib: acpi: Split quirks to its own file"
      gpiolib-acpi: Update file references in the Documentation and MAINTAINERS

Arnd Bergmann (1):
      gpio: blzp1600: remove incorrect pf_match_ptr()

Bartosz Golaszewski (53):
      gpiolib: don't allow setting values on input lines
      Merge tag 'gpio-s5m8767-polarity-quirk-for-v6.16-rc1' into gpio/for-next
      Merge tag 'irqdomain-04-08-25' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into gpio/for-next
      gpio: provide gpiod_is_equal()
      Merge tag 'gpiod-is-equal-for-v6.16-rc1' of gitolite.kernel.org:pub/scm/linux/kernel/git/brgl/linux into gpio/for-next
      gpio: dln2: use new line value setter callbacks
      gpio: eic-sprd: use new line value setter callbacks
      gpio: em: use new line value setter callbacks
      gpio: exar: use new line value setter callbacks
      gpio: f7188: use new line value setter callbacks
      gpio: graniterapids: use new line value setter callbacks
      gpio: gw-pld: use new line value setter callbacks
      gpio: htc-egpio: enable building with COMPILE_TEST=y
      gpio: htc-egpio: use new line value setter callbacks
      gpio: ich: enable building with COMPILE_TEST=y
      gpio: ich: use new line value setter callbacks
      gpio: ds4520: don't check the 'ngpios' property in the driver
      gpio: blzp1600: drop dependency on OF headers
      gpio: zynq: enable building the modules with COMPILE_TEST=y
      gpio: msc313: enable building the module with COMPILE_TEST=y
      gpio: pl061: enable building the module with COMPILE_TEST=y
      gpio: rtd: enable building the module with COMPILE_TEST=y
      gpio: tn48m: enable building the module with COMPILE_TEST=y
      Merge tag 'gpiod-devm-is-action-added-for-v6.16-rc1' into gpio/for-next
      gpio: imx-scu: don't check the GPIO range
      gpio: imx-scu: use lock guards
      gpio: imx-scu: destroy the mutex in detach path
      gpio: imx-scu: use new line value setter callbacks
      gpio: it87: use new line value setter callbacks
      gpio: janz-ttl: use new line value setter callbacks
      gpio: kempld: use new line value setter callbacks
      gpio: ljca: use new line value setter callbacks
      gpio: logicvc: use new line value setter callbacks
      gpio: loongson-64bit: use new line value setter callbacks
      gpio: loongson: use new line value setter callbacks
      gpio: lp3943: use new line value setter callbacks
      Merge tag 'ib-mfd-gpio-nvmem-v6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      gpio: lp873x: use new GPIO line value setter callbacks
      gpio: lp87565: use new GPIO line value setter callbacks
      gpio: lpc18xx: use new GPIO line value setter callbacks
      gpio: lpc32xx: use new GPIO line value setter callbacks
      gpio: madera: use new GPIO line value setter callbacks
      gpio: max3191x: remove unused callbacks
      gpio: max730x: use new GPIO line value setter callbacks
      gpio: max732x: use new GPIO line value setter callbacks
      gpio: max77620: use new GPIO line value setter callbacks
      gpio: mb86s7x: use new GPIO line value setter callbacks
      gpio: mc33880: use new GPIO line value setter callbacks
      gpio: ml-ioh: use new GPIO line value setter callbacks
      gpio: pxa: select GPIOLIB_IRQCHIP
      gpio: mpc8xxx: select GPIOLIB_IRQCHIP
      gpiolib: remove unneeded #ifdef
      Merge tag 'intel-gpio-v6.16-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

Dan Carpenter (5):
      gpio: aggregator: fix "_sysfs" prefix check in gpio_aggregator_make_group()
      gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
      gpio: aggregator: Return an error if there are no GPIOs in gpio_aggregator_parse()
      gpio: aggregator: Fix error code in gpio_aggregator_activate()
      gpio: aggregator: Fix leak in gpio_aggregator_parse()

Emanuele Ghidoli (1):
      dt-bindings: gpio: pca95xx: add Toradex ecgpiol16

Geert Uytterhoeven (1):
      gpio: GPIO_BLZP1600 should depend on ARCH_BLAIZE

Haibo Chen (1):
      dt-bindings: gpio: vf610: add ngpios and gpio-reserved-ranges

Jindong Yue (1):
      gpio: vf610: Allow building as a module

Koichiro Den (10):
      gpio: aggregator: reorder functions to prepare for configfs introduction
      gpio: aggregator: unify function naming
      gpio: aggregator: add gpio_aggregator_{alloc,free}()
      gpio: aggregator: introduce basic configfs interface
      gpio: aggregator: rename 'name' to 'key' in gpio_aggregator_parse()
      gpio: aggregator: expose aggregator created via legacy sysfs to configfs
      gpio: aggregator: cancel deferred probe for devices created via configfs
      Documentation: gpio: document configfs interface for gpio-aggregator
      selftests: gpio: add test cases for gpio-aggregator
      selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation

Krzysztof Kozlowski (1):
      dt-bindings: gpio: Correct indentation and style in DTS example

Nathan Chancellor (1):
      gpio: Restrict GPIO_ICH to compile testing with HAS_IOPORT

Nikolaos Pasaloukos (2):
      dt-bindings: Document Blaize BLZP1600 GPIO driver
      gpio: Enable Blaize BLZP1600 GPIO support

Peng Fan (15):
      gpiolib: of: Add polarity quirk for s5m8767
      gpio: bcm-kona: make irq_chip immutable
      gpio: grgpio: Make irq_chip immutable
      gpio: lpc18xx: Make irq_chip immutable
      gpio: mpc8xxx: Make irq_chip immutable
      gpio: davinci: Update irq chip data
      gpio: davinci: Make irq_chip immutable
      gpio: xgene-sb: Make irq_chip immutable
      gpio: timberdale: Make irq_chip immutable
      gpio: pxa: Make irq_chip immutable
      gpio: davinci: select GPIOLIB_IRQCHIP
      gpio: bcm-kona: select GPIOLIB_IRQCHIP
      gpio: grgpio: select GPIOLIB_IRQCHIP
      gpio: lpc18xx: select GPIOLIB_IRQCHIP
      gpio: timberdale: select GPIOLIB_IRQCHIP

Potin Lai (1):
      gpio: pca953x: Add support for level-triggered interrupts

Yixun Lan (4):
      irqdomain: Support three-cell scheme interrupts
      gpiolib: support parsing gpio three-cell interrupts scheme
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC

 Documentation/admin-guide/gpio/gpio-aggregator.rst |  107 ++
 .../bindings/gpio/atmel,at91rm9200-gpio.yaml       |   16 +-
 .../bindings/gpio/blaize,blzp1600-gpio.yaml        |   77 ++
 .../bindings/gpio/fairchild,74hc595.yaml           |   20 +-
 .../devicetree/bindings/gpio/gpio-mxs.yaml         |   70 +-
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |    4 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml       |    7 +
 .../bindings/gpio/maxim,max77759-gpio.yaml         |   44 +
 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |    3 +
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml      |   24 +-
 .../bindings/gpio/realtek,otto-gpio.yaml           |    8 +-
 .../devicetree/bindings/gpio/renesas,em-gio.yaml   |   20 +-
 .../bindings/gpio/renesas,rcar-gpio.yaml           |   24 +-
 .../devicetree/bindings/gpio/sifive,gpio.yaml      |    6 +-
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   96 ++
 .../bindings/gpio/toshiba,gpio-visconti.yaml       |   24 +-
 .../devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml |   48 +-
 .../devicetree/bindings/mfd/maxim,max77759.yaml    |   99 ++
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       |   32 +
 Documentation/driver-api/gpio/index.rst            |    2 +-
 .../translations/zh_CN/driver-api/gpio/index.rst   |    2 +-
 MAINTAINERS                                        |   22 +-
 drivers/base/devres.c                              |   11 +
 drivers/gpio/Kconfig                               |   64 +-
 drivers/gpio/Makefile                              |    4 +
 drivers/gpio/TODO                                  |    7 +
 drivers/gpio/gpio-aggregator.c                     | 1120 +++++++++++++++++---
 drivers/gpio/gpio-bcm-kona.c                       |    1 +
 drivers/gpio/gpio-blzp1600.c                       |  281 +++++
 drivers/gpio/gpio-davinci.c                        |   29 +-
 drivers/gpio/gpio-dln2.c                           |    7 +-
 drivers/gpio/gpio-ds4520.c                         |    6 -
 drivers/gpio/gpio-eic-sprd.c                       |    5 +-
 drivers/gpio/gpio-em.c                             |    6 +-
 drivers/gpio/gpio-exar.c                           |   16 +-
 drivers/gpio/gpio-f7188x.c                         |   13 +-
 drivers/gpio/gpio-graniterapids.c                  |    6 +-
 drivers/gpio/gpio-grgpio.c                         |    7 +-
 drivers/gpio/gpio-gw-pld.c                         |    6 +-
 drivers/gpio/gpio-htc-egpio.c                      |   16 +-
 drivers/gpio/gpio-ich.c                            |   12 +-
 drivers/gpio/gpio-imx-scu.c                        |   47 +-
 drivers/gpio/gpio-it87.c                           |   11 +-
 drivers/gpio/gpio-janz-ttl.c                       |    6 +-
 drivers/gpio/gpio-kempld.c                         |    7 +-
 drivers/gpio/gpio-ljca.c                           |   13 +-
 drivers/gpio/gpio-logicvc.c                        |   11 +-
 drivers/gpio/gpio-loongson-64bit.c                 |    6 +-
 drivers/gpio/gpio-loongson.c                       |    8 +-
 drivers/gpio/gpio-lp3943.c                         |   13 +-
 drivers/gpio/gpio-lp873x.c                         |   12 +-
 drivers/gpio/gpio-lp87565.c                        |   15 +-
 drivers/gpio/gpio-lpc18xx.c                        |   21 +-
 drivers/gpio/gpio-lpc32xx.c                        |   28 +-
 drivers/gpio/gpio-madera.c                         |   18 +-
 drivers/gpio/gpio-max3191x.c                       |   16 -
 drivers/gpio/gpio-max730x.c                        |    9 +-
 drivers/gpio/gpio-max732x.c                        |   15 +-
 drivers/gpio/gpio-max77620.c                       |   13 +-
 drivers/gpio/gpio-max77759.c                       |  530 +++++++++
 drivers/gpio/gpio-mb86s7x.c                        |    6 +-
 drivers/gpio/gpio-mc33880.c                        |    9 +-
 drivers/gpio/gpio-ml-ioh.c                         |    6 +-
 drivers/gpio/gpio-mpc8xxx.c                        |    8 +
 drivers/gpio/gpio-mxc.c                            |    9 +-
 drivers/gpio/gpio-pca953x.c                        |   32 +-
 drivers/gpio/gpio-pxa.c                            |    8 +-
 drivers/gpio/gpio-spacemit-k1.c                    |  293 +++++
 drivers/gpio/gpio-timberdale.c                     |   10 +-
 drivers/gpio/gpio-vf610.c                          |    4 +-
 drivers/gpio/gpio-xgene-sb.c                       |   26 +-
 .../gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c}   |  522 ++-------
 drivers/gpio/gpiolib-acpi-quirks.c                 |  363 +++++++
 drivers/gpio/gpiolib-acpi.h                        |   15 +
 drivers/gpio/gpiolib-cdev.c                        |    3 -
 drivers/gpio/gpiolib-devres.c                      |   90 +-
 drivers/gpio/gpiolib-of.c                          |   17 +
 drivers/gpio/gpiolib-of.h                          |    6 +
 drivers/gpio/gpiolib-sysfs.c                       |   12 +-
 drivers/gpio/gpiolib.c                             |  173 +--
 drivers/mfd/Kconfig                                |   20 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/max77759.c                             |  690 ++++++++++++
 drivers/nvmem/Kconfig                              |   12 +
 drivers/nvmem/Makefile                             |    2 +
 drivers/nvmem/max77759-nvmem.c                     |  145 +++
 drivers/platform/x86/intel/int0002_vgpio.c         |    2 +-
 include/linux/device.h                             |   38 -
 include/linux/device/devres.h                      |   41 +
 include/linux/gpio/consumer.h                      |   11 +-
 include/linux/irqdomain.h                          |   18 +-
 include/linux/mfd/max77759.h                       |  165 +++
 kernel/irq/irqdomain.c                             |   56 +
 tools/testing/selftests/gpio/Makefile              |    2 +-
 tools/testing/selftests/gpio/config                |    1 +
 tools/testing/selftests/gpio/gpio-aggregator.sh    |  727 +++++++++++++
 96 files changed, 5574 insertions(+), 1140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
 create mode 100644 drivers/gpio/gpio-blzp1600.c
 create mode 100644 drivers/gpio/gpio-max77759.c
 create mode 100644 drivers/gpio/gpio-spacemit-k1.c
 rename drivers/gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c} (72%)
 create mode 100644 drivers/gpio/gpiolib-acpi-quirks.c
 create mode 100644 drivers/mfd/max77759.c
 create mode 100644 drivers/nvmem/max77759-nvmem.c
 create mode 100644 include/linux/mfd/max77759.h
 create mode 100755 tools/testing/selftests/gpio/gpio-aggregator.sh

