Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDE923C1C8
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 00:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgHDWDn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 18:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbgHDWDl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 18:03:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A6EC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 15:03:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 185so35129027ljj.7
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2020 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=T4K09t84l1nl1Ms1e5xtw8jx7SKT5a9K3CHKvr2VhgA=;
        b=DTbqMBe0LfXKG6P9EemciPJlAW4ie1r3G0WmHuNvkbO55s4d/oTBydO7SjfYSrfcWe
         qN7D/XjriCVQWIbaQe+nRlZm6MEzOp3LOs81oBPkuOwrb2vjBJ5OCfvvdjE+2x5GgT+m
         IvGrq5JhUNFu3VjId67mC1dhIt37piJqpW3VfiLiADLeFDIwWFcWJBX1/d6BuOtvMaPg
         bXM44xFkiYi5KsHfegBApnsLcDEw8LZTO1sPneYjAvfBGbRSBCGcD3OTXaUr2asGq2IM
         FJ+TgWH3VCvh9a/81JAPZQlTrZByiak/9UyFzDlVRNprVr0Xo895Z368afn5i9p4cOYn
         w09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=T4K09t84l1nl1Ms1e5xtw8jx7SKT5a9K3CHKvr2VhgA=;
        b=TY5t9ZQAxG5JhINR8Gq+T44afCty47dPaj3PE3O4ou6Rhs4pkMB+MnnffF+PSYC8Bf
         bcd0dgm6eIBjJjTO8W0bQYTJ4GxD01wqEDg0voFxYZ+oO0+g9xNjU3KagmYL97GcfHdK
         PZrgquFtil6AH3+6gJdNh6NM+hbpWPZRrL8n6+JH7AYatCRlgAOnbQyUf1/QFiqzbXWZ
         kG1w41f3RhxtB5kCl/F1Apj6vdxFCMe0mkVl6rD7ZzEWWOihPa2gJQQrL876D3drVOxt
         6S310ZQVhUxJ/NyOY81jYXRaO0Ncy0CcDCx9GsSF2VGXQbgDizykYcl2hCGzNhZNxjIt
         q9lQ==
X-Gm-Message-State: AOAM530QIfs9A9Yr8+Pu0Og+fVS2FNFZj2DhwBaSWbqseWMtJWYxAJJz
        NJJoHdlp05Kvx/vN0OeDu+1ipR8tpvmmBEJQgIEjGg==
X-Google-Smtp-Source: ABdhPJyqcO1HqXvuHj2OI8bFLZu5HnKk2nZ6nYeFGI8a1XaOyUjEXSemPvu5BsET+xoE8POCSOwKSVIQD9uTStoW1/k=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr10024403ljc.338.1596578619111;
 Tue, 04 Aug 2020 15:03:39 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 5 Aug 2020 00:03:28 +0200
Message-ID: <CACRpkdamytgQTZ60g2R0UpRk5iy=uajtDp5VhsjKaM5H_CpUFA@mail.gmail.com>
Subject: [GIT PULL] GPIO changes for the v5.9 merge window
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the big slew of GPIO changes for the v5.9 merge window.

There is nothing too exciting in it, but a new macro that fixes a
build failure on a minor ARM32 platform that appeared yesterday
is part of it so we better merge it.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.9-1

for you to fetch changes up to 22cc422070d9a9a399f8a70b89f1b852945444cb:

  gpio: wcove: Request IRQ after all initialisation done (2020-08-04
01:25:02 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v5.9 kernel cycle:

Core changes:

- Introduce the for_each_requested_gpio() macro to help in
  dependent code all over the place. Also patch a few locations
  to use it while we are at it.

- Split out the sysfs code into its own file.

- Split out the character device code into its own file, then
  make a set of refactorings and improvements to this code.
  We are setting the stage to revamp the userspace API a bit
  in the next cycle.

- Fix a whole slew of kerneldoc that was wrong or missing.

New drivers:

- The PCA953x driver now supports the PCAL9535.

Driver improvements:

- A host of incremental modernizations and improvements to the
  PCA953x driver.

- Incremental improvements to the Xilinx Zynq driver.

- Some improvements to the GPIO aggregator driver.

- I ran all over the place switching all threaded and other
  drivers requesting their own IRQ while using the core
  GPIO IRQ helpers to pass the GPIO irq chip as a template
  instead of calling the explicit set-up functions. Next merge
  window we may retire the old code altogether.

----------------------------------------------------------------
Abanoub Sameh (6):
      gpio: pch: changed every 'unsigned' to 'unsigned int'
      gpio: pch: Add a blank line between declaration and code
      gpio: crystalcove: changed every 'unsigned' to 'unsigned int'
      gpio: ich: changed every 'unsigned' to 'unsigned int'
      gpio: sch: changed every 'unsigned' to 'unsigned int'
      gpio: sch: Add a blank line between declaration and code

Ahmad Fatoum (1):
      gpio: don't use same lockdep class for all devm_gpiochip_add_data users

Andy Shevchenko (16):
      gpio: pca953x: Synchronize interrupt handler properly
      gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
      gpio: pca953x: Fix direction setting when configure an IRQ
      gpio: pca953x: disable regmap locking for automatic address incrementing
      gpiolib: Introduce for_each_requested_gpio_in_range() macro
      ARM/orion/gpio: Make use of for_each_requested_gpio()
      gpio: mvebu: Make use of for_each_requested_gpio()
      gpio: xra1403: Make use of for_each_requested_gpio()
      pinctrl: at91: Make use of for_each_requested_gpio()
      gpio: pca953x: Fix GPIO resource leak on Intel Galileo Gen 2
      gpiolib: Deduplicate find_first_zero_bit() call
      gpio: pch: Move IRQ status message to verbose debug level
      gpio: mmio: replace open-coded for_each_set_bit()
      gpio: pca953x: Request IRQ after all initialisation done
      gpio: crystalcove: Free IRQ on error path
      gpio: wcove: Request IRQ after all initialisation done

Colton Lewis (1):
      gpio: Correct kernel-doc inconsistency

Dmitry Osipenko (6):
      gpio: max77620: Replace 8 with MAX77620_GPIO_NR
      gpio: max77620: Fix missing release of interrupt
      gpio: max77620: Don't set of_node
      gpio: max77620: Don't shadow error code of platform_get_irq()
      gpio: max77620: Use irqchip template
      gpio: max77620: Initialize hardware state of interrupts

Drew Fustini (2):
      gpio: omap: handle pin config bias flags
      gpio: omap: improve coding style for pin config flags

Gaurav Singh (2):
      gpio: max732x: remove redundant check
      gpio: max732x: remove redundant check from probe()

Geert Uytterhoeven (3):
      gpio: Drop superfluous dependencies on GPIOLIB
      gpio: aggregator: Drop pre-initialization in get_arg()
      gpio: aggregator: Use bitmap_parselist() for parsing GPIO offsets

Glenn Langedock (1):
      gpio: zynq: protect direction in/out with a spinlock

Jan Kiszka (2):
      dt-bindings: gpio: pca953x: add nxp,pcal9535
      gpio: pca953x: Add support for the PCAL9535

Kent Gibson (18):
      gpiolib: split character device into gpiolib-cdev
      gpiolib: move gpiolib-sysfs function declarations into their own header
      gpiolib: cdev: sort includes
      gpiolib: cdev: minor indentation fixes
      gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
      gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be
consistent with other use
      gpiolib: cdev: rename numdescs to num_descs
      gpiolib: cdev: remove pointless decrement of i
      gpiolib: cdev: use blocking notifier call chain instead of atomic
      gpiolib: cdev: rename priv to cdev
      gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
      gpiolib: cdev: remove recalculation of offset
      gpiolib: cdev: refactor linehandle cleanup into linehandle_free
      gpiolib: cdev: refactor lineevent cleanup into lineevent_free
      gpio: uapi: fix misplaced comment line
      tools: gpio: fix spurious close warning in lsgpio
      tools: gpio: fix spurious close warning in gpio-utils
      tools: gpio: fix spurious close warning in gpio-event-mon

Kieran Bingham (1):
      drivers: gpio: Fix trivial spelling

Lee Jones (10):
      gpio: gpio-ml-ioh: Fix missing ':' in 'struct ioh_gpio_reg_data
      gpio: gpiolib-of: Provide documentation for of_gpio_spi_cs_get_count()
      gpio: gpio-altera: Add missing kerneldoc entry and demote comment
      gpio: gpio-pmic-eic-sprd: Fix incorrectly named property 'map'
      gpio: gpio-sama5d2-piobu: Demote all kerneldoc headers to basic
comment blocks
      gpio: gpio-syscon: Fix formatting issues which confuse kerneldoc
      gpio: gpio-it87: Fix formatting issues which confuse kerneldoc
      gpio: gpio-mlxbf: Tell the compiler that ACPI functions may not be used
      gpio: gpio-mlxbf2: Tell the compiler that ACPI functions may not be use
      gpio: gpio-mlxbf2.c: Provide __releases() annotation to stop
confusing Sparse

Linus Walleij (27):
      Merge branch 'ib-for-each-requested' into devel
      Merge tag 'gpio-fixes-for-v5.8-rc3' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-updates-for-v5.9-part1' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: Add gpio-charger to the documentation
      Merge branch 'lee-fixes' into devel
      Merge branch 'devel' into for-next
      Merge tag 'gpio-updates-for-v5.9-part2' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: max77620: Use helper variable and clarify
      gpio: tc35892: Use irqchip template
      gpio: stmpe: Use irqchip template
      gpio: adnp: Use irqchip template
      gpio: adp5588: Use irqchip template
      gpio: pcf857x: Use irqchip template
      gpio: pca953x: Use irqchip template
      gpio: crystalcove: Use irqchip template
      gpio: wcove: Use irqchip template
      Merge tag 'intel-gpio-v5.9-1' of
git://git.kernel.org/.../andy/linux-gpio-intel into devel
      gpio: dln2: Use irqchip template
      gpio: ws16c48: Use irqchip template
      gpio: 104-dio-48e: Use irqchip template
      gpio: 104-idi-48: Use irqchip template
      gpio: 104-idio-16: Use irqchip template
      gpio: pcie-idio-24: Use irqchip template
      gpio: pci-idio-16: Use irqchip template
      gpio: rcar: Use irqchip template
      gpio: stmpe: Move chip registration
      gpio: max732x: Use irqchip template

Mauro Carvalho Chehab (1):
      gpio: driver.h: fix kernel-doc markup

Michael Walle (1):
      gpio: regmap: fix type clash

Navid Emamdoost (2):
      gpio: arizona: handle pm_runtime_get_sync failure case
      gpio: arizona: put pm_runtime in case of failure

Shubhrajyoti Datta (6):
      dt-bindings: gpio: Add binding for Versal gpio
      dt-bindings: gpio: Add pmc gpio node to gpio-zynq
      gpio: zynq: Add Versal support
      gpio: zynq: Disable the irq if it is not a wakeup source
      gpio: zynq: Add pmc gpio support
      gpio: zynq: Remove error prints in EPROBE_DEFER

Song Hui (1):
      gpio: mpc8xxx: change the gpio interrupt flags.

Sungbo Eo (2):
      gpio: pca9570: add GPO driver for PCA9570
      gpio: pca9570: Add DT bindings for NXP PCA9570

Tony Lindgren (1):
      gpio: omap: Add missing PM ops for suspend

Wang Qing (1):
      gpiolib: sysfs: use kobj_to_dev

 .../devicetree/bindings/gpio/gpio-pca953x.txt      |    1 +
 .../devicetree/bindings/gpio/gpio-pca9570.yaml     |   47 +
 .../devicetree/bindings/gpio/gpio-zynq.txt         |    4 +-
 Documentation/driver-api/gpio/drivers-on-gpio.rst  |    7 +
 arch/arm/plat-orion/gpio.c                         |    8 +-
 drivers/gpio/Kconfig                               |   12 +-
 drivers/gpio/Makefile                              |    2 +
 drivers/gpio/TODO                                  |    2 +-
 drivers/gpio/gpio-104-dio-48e.c                    |   35 +-
 drivers/gpio/gpio-104-idi-48.c                     |   33 +-
 drivers/gpio/gpio-104-idio-16.c                    |   33 +-
 drivers/gpio/gpio-adnp.c                           |   95 +-
 drivers/gpio/gpio-adp5588.c                        |   39 +-
 drivers/gpio/gpio-aggregator.c                     |   63 +-
 drivers/gpio/gpio-altera.c                         |    3 +-
 drivers/gpio/gpio-arizona.c                        |    7 +-
 drivers/gpio/gpio-crystalcove.c                    |   50 +-
 drivers/gpio/gpio-dln2.c                           |   17 +-
 drivers/gpio/gpio-ich.c                            |   26 +-
 drivers/gpio/gpio-it87.c                           |   14 +-
 drivers/gpio/gpio-max732x.c                        |   32 +-
 drivers/gpio/gpio-max77620.c                       |   71 +-
 drivers/gpio/gpio-ml-ioh.c                         |    2 +-
 drivers/gpio/gpio-mlxbf.c                          |    2 +-
 drivers/gpio/gpio-mlxbf2.c                         |    4 +-
 drivers/gpio/gpio-mmio.c                           |   20 +-
 drivers/gpio/gpio-mpc8xxx.c                        |    2 +-
 drivers/gpio/gpio-mvebu.c                          |    8 +-
 drivers/gpio/gpio-omap.c                           |   45 +-
 drivers/gpio/gpio-pca953x.c                        |  142 ++-
 drivers/gpio/gpio-pca9570.c                        |  146 +++
 drivers/gpio/gpio-pcf857x.c                        |   47 +-
 drivers/gpio/gpio-pch.c                            |   14 +-
 drivers/gpio/gpio-pci-idio-16.c                    |   33 +-
 drivers/gpio/gpio-pcie-idio-24.c                   |   17 +-
 drivers/gpio/gpio-pmic-eic-sprd.c                  |    2 +-
 drivers/gpio/gpio-rcar.c                           |   17 +-
 drivers/gpio/gpio-sama5d2-piobu.c                  |   16 +-
 drivers/gpio/gpio-sch.c                            |   23 +-
 drivers/gpio/gpio-stmpe.c                          |   36 +-
 drivers/gpio/gpio-syscon.c                         |   12 +-
 drivers/gpio/gpio-tc3589x.c                        |   26 +-
 drivers/gpio/gpio-wcove.c                          |   34 +-
 drivers/gpio/gpio-ws16c48.c                        |   39 +-
 drivers/gpio/gpio-xra1403.c                        |    8 +-
 drivers/gpio/gpio-zynq.c                           |   66 +-
 drivers/gpio/gpiolib-cdev.c                        | 1121 +++++++++++++++++++
 drivers/gpio/gpiolib-cdev.h                        |   11 +
 drivers/gpio/gpiolib-devres.c                      |   13 +-
 drivers/gpio/gpiolib-of.c                          |    3 +
 drivers/gpio/gpiolib-sysfs.c                       |    3 +-
 drivers/gpio/gpiolib-sysfs.h                       |   24 +
 drivers/gpio/gpiolib.c                             | 1144 +-------------------
 drivers/gpio/gpiolib.h                             |   20 +-
 drivers/pinctrl/pinctrl-at91.c                     |    7 +-
 include/linux/gpio/driver.h                        |   37 +-
 include/linux/gpio/regmap.h                        |    2 +-
 include/uapi/linux/gpio.h                          |    2 +-
 tools/gpio/gpio-event-mon.c                        |    3 +-
 tools/gpio/gpio-utils.c                            |    4 +-
 tools/gpio/lsgpio.c                                |    3 +-
 61 files changed, 2150 insertions(+), 1609 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
 create mode 100644 drivers/gpio/gpio-pca9570.c
 create mode 100644 drivers/gpio/gpiolib-cdev.c
 create mode 100644 drivers/gpio/gpiolib-cdev.h
 create mode 100644 drivers/gpio/gpiolib-sysfs.h
