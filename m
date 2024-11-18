Return-Path: <linux-gpio+bounces-13082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD39D1108
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 13:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E991F229C0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 12:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E351991B6;
	Mon, 18 Nov 2024 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bn7ycOIc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111B192D97
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731934527; cv=none; b=bMTXa+5V6nnuPCeaDXdFrHiHRseFhy6ZiLhCqpedxFSNn1MIGlGnOfyTF1izec0Q5MZBOX0RZJSW+zlXNOsWa+S7nreyWiUhxHeDAcX9TUgbcaqdCEsAtenDwkA+SsIDKFDHQkexweJ+XKtj9+kv4xx/35zXvA/jinYenMlv/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731934527; c=relaxed/simple;
	bh=rVBsrXcOdUN8m26bJZJbAlLD2IOhgdVgr14wO0WaJBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IkByt6Duc3b2mCc5efZ8sL+UvlQBTKLjzVRFnw5ftmgFKD2Qh5u3krRF+HDd32AgYv/mvFgIsBWGzyO1Pew09G1z8swhm2Po6TSf2FzFtaNATwWSgthdZpe0AJgkajYh1lxzFCIXbmGpOL5eBU6K1qIoWLJnj+3feAudF3lY+vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bn7ycOIc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38242abf421so882102f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 04:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731934523; x=1732539323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fg1rJv9OkIfRgkL2PvM3ymVvMMLTERHKCSpQa1kYhbQ=;
        b=bn7ycOIcI3l8gqVxtk1s1DWkH7l79aq4Z4s4GI8slCooWjFUoymkfxVD/xJZWYvflN
         USacJ9K7NaT2WUv6jO3PZHdWX9js8Vn2dlQOZGEvERWxWQHgaKkpeIamHKtlpZhF+KhM
         WWQFL59KI0dxHbii7N2RSs4BTqL1x8i5/MVxSX4GbZFg51Hsl7t7qzwYxmn1CHnOMynZ
         R4Nz47wmYD7FXJ6tjeN6tt7XCfDXDakxiPrOvTRppvYQPSi1a4cUh9DLDMap7wCXkU3S
         UaKRTbSHPCwu2re1BN2UUJNzbv8Vtb1o6rKTubYPvTcSe/MIbUl16u3OYldbA8Aho4ga
         5TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731934523; x=1732539323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fg1rJv9OkIfRgkL2PvM3ymVvMMLTERHKCSpQa1kYhbQ=;
        b=BuQl31+nwtjZH8J6h3ayU2y9i6qS6iSOQnY0e/L6DAD/9jRojfVjdQi87TrQCWwGjV
         YOhNyw+kFy/CoKuE2eNFcfOaqbKONpsxf7nq5cCQVI5jWYeuumnJKzHeEuMGR3fTPqpV
         zkdJgz/QOAjlcGkY9Ii5cVbZo8n3kVaoT+cEd+taZy198RES0WmN54g/pO69PbLLA/e4
         dGIsCe/1h7AlyoHfIg3Pql3y0p4F/pyX/uR/+iqc51AbRe4zEd4jz0YRjaHOtyZPOoiH
         lULbHQ4LmyhJm/gVasZQ3FQjcjodt1u+BKQGJtH3qF1406CfBLIuaM1YVW6bMdbVF7F/
         C3dg==
X-Forwarded-Encrypted: i=1; AJvYcCWIWya16Psb+MAzRnVCkAXtVUGKrkNG7ti7pd/oSY3gSzOHIm57h/pel8Wyo6kcTLd6UMl05WGGAWPF@vger.kernel.org
X-Gm-Message-State: AOJu0YwudpnkNJTX8u0dabqKsL6OIyiWrJ3MFkuYMVvS9eL5iC6PNUUu
	DO4+FaA8Ft/JPAhwEH/4m+xOiZo/tvo9gtXBKNMNXCw8WZon2L4BtCIg1TKl7jY=
X-Google-Smtp-Source: AGHT+IGLddhdcjHgoc2FXldna9zElU6K+HbysJRBCI4EznzKye8X/VteFhQ+afl7061fcEAcd/1Hzg==
X-Received: by 2002:a5d:6dac:0:b0:382:4b7c:349a with SMTP id ffacd0b85a97d-3824b7c3863mr176046f8f.4.1731934523105;
        Mon, 18 Nov 2024 04:55:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b8ce:8ea9:933b:1ec6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382321b7fc2sm8220536f8f.75.2024.11.18.04.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 04:55:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.13-rc1
Date: Mon, 18 Nov 2024 13:55:12 +0100
Message-ID: <20241118125515.49743-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
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

Here's the majority of changes for this merge window from the GPIO subsystem.

We have three new drivers, support for some new models in existing ones and
lots of various tweaks and improvements across the board (switching to using
recommended APIs, code shrink and simplification, etc.).

We also have a new feature in the character device uAPI where we now notify
the user-space about changes triggered by in-kernel users as well, not only
when they were done by other user-space agents.

Details are in the signed tag as usual.

The merge commits you'll see here were done to pull Intel changes from Andy,
MFD dependencies from Lee and to pull back upstream fixes to avoid conflicts.

The non-gpio commits in this PR are either pulled from the MFD tree or were
acked by relevant maintainers and concern the removal of a deprecated GPIO
symbol from various drivers across the kernel tree.

I will be picking up some more fixes over the course of this week so there'll
be another small PR in the second week.

Please pull.

Best Regards,
Bartosz Golaszewski

The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.13-rc1

for you to fetch changes up to bef29ca3a6458582ac13320d47bf2646e5734dc8:

  gpio: tegra186: Allow to enable driver on Tegra234 (2024-11-18 11:45:06 +0100)

----------------------------------------------------------------
gpio updates for v6.13-rc1

GPIOLIB core:
- use the new mem_is_zero() instead of memchr_inv(s, 0, n)
- don't store debounce period twice needlessly
- clean-up debugfs handling
- remove leftover comments referring to no longer used spinlocks
- unduplicate some operations like SRCU locks and initializing GPIO descriptors
- constify the sysfs class struct
- use lock guards in GPIO sysfs code
- update GPIO uAPI internal flags all at once atomically for consistency with
  other places
- modify the behavior of the sysfs interface by no longer exporting lines that
  are named inside the driver code or board files with the sysfs links bearing
  the line names as this has for many years been largely unused due to the
  prevalence of DT, ACPI and firmware nodes over board files and made the API
  inconsistent
- for GPIO interrupt providers: free irqs that are still requested by users
  when removing the chip

GPIO uAPI:
- notify user-space about changes to GPIO lines' state (requested, released,
  reconfigured) triggered from the kernel as well (until now we'd only do
  this for changes triggered from user-space)
- to that end: modify the internal workings of the notification mechanism by
  switching to an atomic notifier which allows us to send events from atomic
  context
- also to that end store the debounce period in the GPIO descriptor struct
  and not in the character device context struct
- while at it, also cover the corner-case of users introducing changes over
  sysfs while others watch them via the character device
- don't report GPIO lines requested as interrupts as "used" to user-space as it
  can still request them as GPIOs

New drivers:
- add a driver for the GPIO functionality of the MFD Congatec Board Controller
- add a driver for the PolarFire GPIO controller
- add a driver supporting the GPIOs on FTDI FT2232H

Driver improvements:
- use generic device property accessors instead of OF-specific ones across
  many GPIO drivers (mpc8xxx, vf610, eic-sprd, davinci, ts4900, xilinx, mvebu)
- use devres helpers to simplify error paths and either shrink or entirely
  remove the driver's remove() callback (grgpio, amdpt, menz127, max730x,
  ftgpio010, 74x164, ljca)
- use helper variables to store the address of pdev->dev and avoid some
  line-breaks
- use device_for_each_child_node_scoped() to avoid having to put the fwnode
  on breaks or errors (gpio-sim, gpio-dwapb, gpiolib-acpi)
- use a scoped bitmap to simplify the code and drop goto labels in
  gpio-aggregator
- drop unneeded Kconfig dependencies on OF_GPIO (grgpio, mveby, xilinx)
- add support for new models to gpio-aspeed, gpio-rockchip and gpio-dwapb
- clean-up ACPI handling and some other bits in gpio-xgene-sb
- replace deprecated PCI functions in pcie-idio-24 and pci-idio-16
- allow to build davinci and mvebu drivers with COMPILE_TEST=y
- remove dead code in gpio-mb86s7x
- switch back to using platform_driver::remove() (after the conversion to
  remove_new()) across the GPIO drivers
- remove remaining uses of GPIOF_ACTIVE_LOW across the tree and drop this
  deprecated symbol
- convert the gpio-altera driver to no longer pull in the deprecated
  legacy-of-mm-gpiochip.h header
- use of_property_present() instead of of_property_read_bool() in gpiolib-of
  and gpio-rockchip
- allow to build the tegra186 driver on Tegra234 platforms in Kconfig

Late fixes:
- add a missing return value check after devm_kasprintf() to gpio-grgpio

DT bindings:
- document the ngpios property of gpio-mmio
- add support for a new aspeed model
- fix the example for st,nomadik-gpio

Other:
- kernel doc and comments tweaks
- fix typos in TODO
- reorder headers alphabetically in some drivers
- fix incorrect format specifiers in gpio tools

----------------------------------------------------------------
Andy Shevchenko (13):
      gpio: xgene-sb: Remove unneeded definitions for properties
      gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
      gpio: xgene-sb: Tidy up ACPI and OF ID tables
      gpio: xgene-sb: don't use "proxy" headers
      gpio: mpsse: Check for error code from devm_mutex_init() call
      gpio: altera: Drop legacy-of-mm-gpiochip.h header
      Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
      Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
      leds: gpio: Avoid using GPIOF_ACTIVE_LOW
      pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
      USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
      gpio: Get rid of GPIOF_ACTIVE_LOW
      gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)

Arnd Bergmann (1):
      gpiolib: avoid format string weakness in workqueue interface

Bartosz Golaszewski (52):
      gpio: free irqs that are still requested when the chip is being removed
      gpio: sysfs: make the sysfs export behavior consistent
      gpio: aggregator: simplify aggr_parse() with scoped bitmap
      gpio: mvebu: allow building the module with COMPILE_TEST=y
      gpio: mvebu: use generic device properties
      gpio: xilinx: drop dependency on GPIO_OF
      gpio: xilinx: use helper variable to store the address of pdev->dev
      gpio: xilinx: use generic device properties
      gpiolib: use v2 defines for line state change events
      gpiolib: unify two loops initializing GPIO descriptors
      gpio: cdev: update flags at once when reconfiguring from user-space
      Merge tag 'ib-mfd-gpio-i2c-watchdog-v6.13' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      Merge tag 'v6.12-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: mvebu: drop dependency on OF_GPIO
      gpio: ts4900: use generic device properties
      gpio: davinci: allow building the module with COMPILE_TEST=y
      gpio: davinci: use generic device properties
      gpio: eic-sprd: use generic device_get_match_data()
      gpio: vf610: use generic device_get_match_data()
      gpio: mpc8xxx: use a helper variable to store the address of pdev->dev
      gpio: mpc8xxx: use generic device_is_compatible()
      gpio: ljca: use devm_mutex_init() to simplify the error path and remove()
      gpio: sysfs: constify gpio class
      gpio: fold the Kconfig prompt into the option type for GPIO CDEV
      gpio: amdpt: remove remove()
      gpio: menz127: simplify error path and remove remove()
      gpio: 74x164: shrink code
      gpio: ftgpio010: shrink code
      gpio: max730x: use devres to shrink and simplify code
      gpiolib: notify user-space when a driver requests its own desc
      gpiolib: unduplicate chip guard in set_config path
      gpio: cdev: go back to storing debounce period in the GPIO descriptor
      gpio: cdev: prepare gpio_desc_to_lineinfo() for being called from atomic
      gpiolib: add a per-gpio_device line state notification workqueue
      gpio: cdev: put emitting the line state events on a workqueue
      gpiolib: switch the line state notifier to atomic
      gpiolib: notify user-space about in-kernel line state changes
      gpio: grgpio: drop Kconfig dependency on OF_GPIO
      gpio: grgpio: order headers alphabetically
      gpio: grgpio: use a helper variable to store the address of ofdev->dev
      gpio: grgpio: remove remove()
      gpiolib: fix a NULL-pointer dereference when setting direction
      gpiolib: remove leftover spinlock bits
      gpio: sysfs: demote warning messages on invalid user input to debug
      Merge tag 'v6.12-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: sysfs: use cleanup guards for gpiod_data::mutex
      gpio: sysfs: use cleanup guards for the sysfs_lock mutex
      gpio: sysfs: emit chardev line-state events on GPIO export
      gpio: sysfs: emit chardev line-state events on active-low changes
      gpio: sysfs: emit chardev line-state events on edge store
      gpio: cdev: don't report GPIOs requested as interrupts as used
      Merge tag 'intel-gpio-v6.13-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

Billy Tsai (5):
      gpio: aspeed: Change the macro to support deferred probe
      gpio: aspeed: Remove the name for bank array
      gpio: aspeed: Create llops to handle hardware access
      dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
      gpio: aspeed: Support G7 Aspeed gpio controller

Charles Han (1):
      gpio: grgpio: Add NULL check in grgpio_probe

Conor Dooley (2):
      MAINTAINERS: add gpio driver to PolarFire entry
      gpio: mpfs: add CoreGPIO support

Dan Carpenter (1):
      gpio: mb86s7x: remove some dead code in mb86s70_gpio_to_irq()

Javier Carrasco (3):
      gpio: acpi: switch to device_for_each_child_node_scoped()
      gpio: dwapb: switch to device_for_each_child_node_scoped()
      gpio: sim: switch to device_for_each_child_node_scoped()

Johan Hovold (1):
      gpiolib: clean up debugfs separator handling

Kent Gibson (2):
      gpiolib: cdev: Fix reference to linereq_set_config_unlocked()
      gpiolib: cdev: remove redundant store of debounce_period_us

Lars-Peter Clausen (1):
      gpio: tegra186: Allow to enable driver on Tegra234

Lewis Hanly (1):
      gpio: mpfs: add polarfire soc gpio support

Linus Walleij (1):
      dt-bindings: gpio-mmio: Add ngpios property

Luo Yifan (1):
      tools: gpio: Fix several incorrect format specifiers

Mary Strodl (1):
      gpio: add support for FTDI's MPSSE as GPIO

Rob Herring (Arm) (2):
      dt-bindings: gpio: st,nomadik-gpio: Add missing "#interrupt-cells" to example
      gpio: Use of_property_present() for non-boolean properties

Shivam Chaudhary (1):
      Fix typos in GPIO TODO document

Srikar Dronamraju (1):
      gpio: sloppy-logic-analyzer remove reference to rcu_momentary_dyntick_idle()

Thomas Richard (5):
      mfd: Add Congatec Board Controller driver
      gpio: Congatec Board Controller gpio driver
      i2c: Congatec Board Controller i2c bus driver
      watchdog: Congatec Board Controller watchdog timer driver
      MAINTAINERS: Add entry for Congatec Board Controller

Uwe Kleine-König (1):
      gpio: Switch back to struct platform_driver::remove()

William Breathitt Gray (2):
      gpio: pci-idio-16: Replace deprecated PCI functions
      gpio: pcie-idio-24: Replace deprecated PCI functions

Ye Zhang (3):
      gpio: rockchip: explan the format of the GPIO version ID
      gpio: rockchip: change the GPIO version judgment logic
      gpio: rockchip: support new version GPIO

Yoshihiro Furudera (1):
      gpio: dwapb: Add ACPI HID for DWAPB GPIO controller on Fujitsu MONAKA

 .../bindings/gpio/aspeed,ast2400-gpio.yaml         |  19 +-
 .../devicetree/bindings/gpio/gpio-mmio.yaml        |  13 +-
 .../devicetree/bindings/gpio/st,nomadik-gpio.yaml  |   1 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  41 +-
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/TODO                                  |   4 +-
 drivers/gpio/gpio-74x164.c                         |  21 +-
 drivers/gpio/gpio-aggregator.c                     |  16 +-
 drivers/gpio/gpio-altera.c                         | 178 +++---
 drivers/gpio/gpio-amdpt.c                          |  10 +-
 drivers/gpio/gpio-aspeed.c                         | 618 +++++++++++++--------
 drivers/gpio/gpio-brcmstb.c                        |   2 +-
 drivers/gpio/gpio-cadence.c                        |   2 +-
 drivers/gpio/gpio-cgbc.c                           | 196 +++++++
 drivers/gpio/gpio-davinci.c                        |  10 +-
 drivers/gpio/gpio-dln2.c                           |   2 +-
 drivers/gpio/gpio-dwapb.c                          |   5 +-
 drivers/gpio/gpio-eic-sprd.c                       |   4 +-
 drivers/gpio/gpio-ftgpio010.c                      |  45 +-
 drivers/gpio/gpio-grgpio.c                         |  75 +--
 drivers/gpio/gpio-ljca.c                           |  17 +-
 drivers/gpio/gpio-lpc18xx.c                        |   2 +-
 drivers/gpio/gpio-max730x.c                        |  17 +-
 drivers/gpio/gpio-mb86s7x.c                        |   4 +-
 drivers/gpio/gpio-menz127.c                        |  58 +-
 drivers/gpio/gpio-mm-lantiq.c                      |   2 +-
 drivers/gpio/gpio-mpc5200.c                        |   4 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  56 +-
 drivers/gpio/gpio-mpfs.c                           | 188 +++++++
 drivers/gpio/gpio-mpsse.c                          | 527 ++++++++++++++++++
 drivers/gpio/gpio-mvebu.c                          |   8 +-
 drivers/gpio/gpio-omap.c                           |   2 +-
 drivers/gpio/gpio-pci-idio-16.c                    |  17 +-
 drivers/gpio/gpio-pcie-idio-24.c                   |  19 +-
 drivers/gpio/gpio-rcar.c                           |   2 +-
 drivers/gpio/gpio-rockchip.c                       |  28 +-
 drivers/gpio/gpio-sim.c                            |   7 +-
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |   2 +-
 drivers/gpio/gpio-tb10x.c                          |   2 +-
 drivers/gpio/gpio-ts4900.c                         |   6 +-
 drivers/gpio/gpio-ts5500.c                         |   2 +-
 drivers/gpio/gpio-uniphier.c                       |   2 +-
 drivers/gpio/gpio-vf610.c                          |   7 +-
 drivers/gpio/gpio-xgene-sb.c                       |  39 +-
 drivers/gpio/gpio-xgs-iproc.c                      |   2 +-
 drivers/gpio/gpio-xilinx.c                         |  51 +-
 drivers/gpio/gpio-zynq.c                           |   2 +-
 drivers/gpio/gpiolib-acpi.c                        |   4 +-
 drivers/gpio/gpiolib-cdev.c                        | 384 ++++++-------
 drivers/gpio/gpiolib-legacy.c                      |   3 -
 drivers/gpio/gpiolib-of.c                          |   2 +-
 drivers/gpio/gpiolib-sysfs.c                       | 182 +++---
 drivers/gpio/gpiolib.c                             | 202 +++++--
 drivers/gpio/gpiolib.h                             |  14 +-
 drivers/i2c/busses/Kconfig                         |  10 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-cgbc.c                      | 406 ++++++++++++++
 drivers/input/keyboard/gpio_keys.c                 |  10 +-
 drivers/input/keyboard/gpio_keys_polled.c          |  12 +-
 drivers/leds/leds-gpio.c                           |   9 +-
 drivers/mfd/Kconfig                                |  12 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/cgbc-core.c                            | 411 ++++++++++++++
 drivers/pcmcia/soc_common.c                        |  12 +-
 drivers/usb/gadget/udc/pxa27x_udc.c                |   7 +-
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/cgbc_wdt.c                        | 211 +++++++
 include/linux/gpio.h                               |   3 -
 include/linux/mfd/cgbc.h                           |  44 ++
 tools/gpio/gpio-event-mon.c                        |   8 +-
 tools/gpio/gpio-sloppy-logic-analyzer.sh           |   2 +-
 73 files changed, 3245 insertions(+), 1064 deletions(-)
 create mode 100644 drivers/gpio/gpio-cgbc.c
 create mode 100644 drivers/gpio/gpio-mpfs.c
 create mode 100644 drivers/gpio/gpio-mpsse.c
 create mode 100644 drivers/i2c/busses/i2c-cgbc.c
 create mode 100644 drivers/mfd/cgbc-core.c
 create mode 100644 drivers/watchdog/cgbc_wdt.c
 create mode 100644 include/linux/mfd/cgbc.h

