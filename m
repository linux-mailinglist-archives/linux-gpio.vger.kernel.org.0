Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF0A61B3B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 09:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbfGHH1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 03:27:09 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41651 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729435AbfGHH1J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 03:27:09 -0400
Received: by mail-lj1-f195.google.com with SMTP id d24so5702402ljg.8
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=2Jt3W0Ak0qvV8TNE9mUtB0yMLZvc2AOZyG1KKtQwCQM=;
        b=TWWENJR3nOGnOANnX6lHQL/LNlYfzaei4/3I9ATsSsqHw/5YOkADTcljZCEpsNVJBp
         A9gCjFKtHawxwJfdGKtocAykAX+E4+pCnb4DEV/k890/ME8W4sa1x5aGWbWLhvxC9Dox
         e4gFxVNJBlI2yx2jeXkNeBW2dxqpfxQT7jGnFNuKeu5E488CZqut8CeRt43RkXxtX6wn
         2cF9YCrfS50C7WaYYbUvyfe8Ylm5aFFEkzb9xz3fTupbC/4ofjHNWlKMgP6h2ODz9O0i
         f5bJnZYAPd4SGrE2Q+0bmvoa6u5RYuX3PVsj+mII7DpFIl/ezUDG1l2/uK0oIdvJj+LT
         pLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=2Jt3W0Ak0qvV8TNE9mUtB0yMLZvc2AOZyG1KKtQwCQM=;
        b=rHZkP2qrEGNmfwK45TWiz4KMqcOcNxOqpXQS6OTg8rHMas9O9rjb85r3+XXUsqzJ0m
         i/vQuxzUTEtM6I4+zQ3RPE3j9Vxs8mXRoAmH51EQheBq1pKCzcMhPac1jieUxCDLtwyR
         tEohczyArgiDH9d8zX9CEI6Rpqt6yYoByfIOdZ8gpkAQsOAPPUpKdz8ATJ4Es14DhmbW
         Q0XwBNIbHGtM0JS0endwOA7pn+iKjAlus2D6zaE5m+ODrOEfaApq2SeAxfdRhCWuYw1f
         vewGkAAG2IlNvLbxdUpDbZDN2TOBZMr5YxPLkghnLgyqep5Ty/Cis09OxpFj1g84AOSl
         V90w==
X-Gm-Message-State: APjAAAXGpF5g0BdtEilet4ahX9zQQgeN1ftqf2sSumMBA+2OzblAQwAd
        Jvu1YQHibbd+VpCea1fSoEhQSl7+pXXJbyr5r4BRQw==
X-Google-Smtp-Source: APXvYqx0duDhyifIYuIpOPQY+oghf3Z42NgG94LGUlfJ3WiQPLM7J0G98jq6s2nh25dCJj0hNokUsvZn13GzEXljNWE=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr6040333ljc.28.1562570826577;
 Mon, 08 Jul 2019 00:27:06 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jul 2019 09:26:55 +0200
Message-ID: <CACRpkdYAJNVj98VjpmhY+suKfjH+WA4KWOvoHNAQvD60hzStbQ@mail.gmail.com>
Subject: [GIT PULL] bulk GPIO changes for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

this is the big slew of GPIO changes for the v5.3 kernel cycle.
This is mostly incremental work this time.

Three important things:

- The FMC subsystem is deleted through my tree. This happens
  through GPIO as its demise was discussed in relation to a patch
  decoupling its GPIO implementation from the standard way of
  handling GPIO. As it turns out, that is not the only subsystem it
  reimplements and the authors think it is better do scratch it and
  start over using the proper kernel subsystems than try to polish
  the rust shiny. See the commit (ACKed by the maintainers) for
  details.

- Arnd made a small devres patch that was ACKed by Greg and
  goes into the device core.

- SPDX header change colissions may happen, because at times
  I've seen that quite a lot changed during the -rc:s in regards to
  SPDX. (It is good stuff, tglx has me convinced, and it is worth
  the occasional pain.)

Apart from this is is nothing controversial or problematic. I have
started to add Link: tags to lore using Kees script, it seems to
work for any message passing through the lore lists and this
seems pretty helpful (triggered by a discussion on the maintainer
summit list).

Please pull it in!

Yours,
Linus Walleij

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.3-1

for you to fetch changes up to 9b3b623804a67d2274ee372c1587926ab0275833:

  Revert "gpio: tegra: Clean-up debugfs initialisation" (2019-07-06
20:16:17 +0200)

----------------------------------------------------------------
Bulk GPIO changes for the v5.3 kernel cycle:

Core:

- When a gpio_chip request GPIOs from itself, it can now fully
  control the line characteristics, both machine and consumer
  flags. This makes a lot of sense, but took some time before I
  figured out that this is how it has to work.

- Several smallish documentation fixes.

New drivers:

- The PCA953x driver now supports the TI TCA9539.

- The DaVinci driver now supports the K3 AM654 SoCs.

Driver improvements:

- Major overhaul and hardening of the OMAP driver by Russell
  King.

- Starting to move some drivers to the new API passing irq_chip
  along with the gpio_chip when adding the gpio_chip instead
  of adding it separately.

Unrelated:

- Delete the FMC subsystem.

----------------------------------------------------------------
Andrey Smirnov (1):
      gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()

Arnd Bergmann (1):
      devres: allow const resource arguments

Bartosz Golaszewski (3):
      gpio: em: use the managed version of gpiochip_add_data()
      gpio: max732x: use i2c_new_dummy_device()
      gpio: max732x: use devm_gpiochip_add_data()

Charles Keepax (1):
      gpio: madera: Fixup SPDX headers

Enrico Weigelt (6):
      gpio: amd: Drop unused pdev pointer in privata data
      gpio: Add comments on #if/#else/#endif
      siox: Add helper macro to simplify driver registration
      gpio: siox: Use module_siox_driver()
      drivers: gpio: amd-fch: make resource struct const
      gpio: pl061: drop duplicate printing of device name

Enrico Weigelt, metux IT consult (7):
      gpio: rcar: Pedantic formatting
      gpio: amdpt: Drop unneeded deref of &pdev->dev
      gpio: ep93xx: Use devm_platform_ioremap_resource()
      gpio: grgpio: Use devm_platform_ioremap_resource()
      gpio: janz-ttl: Drop unneccessary temp variable dev
      gpio: vr41xx: Use devm_platform_ioremap_resource()
      gpio: eic-sprd: Use devm_platform_ioremap_resource()

Geert Uytterhoeven (7):
      gpio: em: Remove error messages on out-of-memory conditions
      gpio: em: Return early on error in em_gio_probe()
      gpio: Sort GPIO drivers in Makefile
      Documentation: gpio: Fix reference to gpiod_get_array()
      gpiolib: Document new gpio_chip.init_valid_mask field
      gpiolib: Fix references to gpiod_[gs]et_*value_cansleep() variants
      gpiolib: Clarify use of non-sleeping functions

Greg Kroah-Hartman (3):
      gpio: mockup: no need to check return value of debugfs_create functions
      gpio: No need to cast away return value of debugfs_create_file()
      gpio: tegra: No need to cast away return value of debugfs_create_file()

Jon Hunter (1):
      gpio: tegra: Clean-up debugfs initialisation

Keerthy (4):
      gpio: davinci: Fix the compiler warning with ARM64 config enabled
      gpio: Davinci: Add K3 dependencies
      gpio: davinci: Add new compatible for K3 AM654 SoCs
      dt-bindings: gpio: davinci: Add k3 am654 compatible

Kelsey Skunberg (1):
      tools: gpio: Add include/linux/gpio.h to .gitignore

Linus Walleij (21):
      gpio: Update Kconfig text for GPIO_SYSFS
      gpio: Fix minor grammar errors in documentation
      gpio: ixp4xx: Use irq_domain_translate_twocell()
      gpio: of: Handle the Freescale SPI CS
      gpio: pass lookup and descriptor flags to request_own
      fmc: Decouple from Linux GPIO subsystem
      Merge branch 'ib-snps-reset-gpio' into devel
      fmc: Delete the FMC subsystem
      gpio: ftgpio: Pass irqchip when adding gpiochip
      gpio: Add GPIOLIB_IRQCHIP cleanup to TODO
      gpio: Drop the parent_irq from gpio_irq_chip
      gpio: pl061: Pass irqchip when adding gpiochip
      gpio: siox: Do not call gpiochip_remove() on errorpath
      gpio: siox: Switch to IRQ_TYPE_NONE
      Merge tag 'gpio-v5.3-updates-for-linus' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: ath79: Pass irqchip when adding gpiochip
      gpio: siox: Pass irqchip when adding gpiochip
      gpio: siox: Add struct device *dev helper variable
      gpio: siox: Use devm_ managed gpiochip
      gpio: altera: Pass irqchip when adding gpiochip
      Revert "gpio: tegra: Clean-up debugfs initialisation"

Luca Ceresoli (1):
      Documentation: gpio: remove duplicated lines

Martin Blumenstingl (5):
      gpio: of: parse stmmac PHY reset line specific active-low property
      gpio: stp-xway: simplify error handling in xway_stp_probe()
      gpio: stp-xway: improve module clock error handling
      gpio: stp-xway: get rid of the #include <lantiq_soc.h> dependency
      gpio: stp-xway: allow compile-testing

Mauro Carvalho Chehab (1):
      docs: gpio: driver.rst: fix a bad tag

Peter Robinson (1):
      gpio: pca953x: Add support for the TI TCA9539

Phil Reid (1):
      gpio: altera: Allocate irq_chip dynamically

Rob Herring (1):
      dt-bindings: gpio: Convert Arm PL061 to json-schema

Robert Hancock (1):
      gpio: xilinx: convert from OF GPIO to standard devm APIs

Russell King (20):
      gpio: omap: ensure irq is enabled before wakeup
      gpio: omap: fix lack of irqstatus_raw0 for OMAP4
      gpio: omap: remove remainder of list management
      gpio: omap: clean up edge interrupt handling
      gpio: omap: remove irq_ack method
      gpio: omap: move omap_gpio_request() and omap_gpio_free()
      gpio: omap: simplify omap_gpio_get_direction()
      gpio: omap: simplify get() method
      gpio: omap: simplify get_multiple()
      gpio: omap: simplify set_multiple()
      gpio: omap: simplify bank->level_mask
      gpio: omap: simplify read-modify-write
      gpio: omap: simplify omap_toggle_gpio_edge_triggering()
      gpio: omap: simplify omap_set_gpio_irqenable()
      gpio: omap: remove dataout variation in context handling
      gpio: omap: clean up omap_gpio_restore_context()
      gpio: omap: constify register tables
      gpio: omap: clean up wakeup handling
      gpio: omap: irq_startup() must not return error codes
      gpio: omap: clean up register access in omap2_set_gpio_debounce()

Sebastian Andrzej Siewior (1):
      gpiolib: Use spinlock_t instead of struct spinlock

Tony Lindgren (1):
      gpio: omap: Fix lost edge wake-up interrupts

 .../devicetree/bindings/gpio/gpio-davinci.txt      |  18 +
 .../devicetree/bindings/gpio/pl061-gpio.txt        |  10 -
 .../devicetree/bindings/gpio/pl061-gpio.yaml       |  69 +++
 Documentation/driver-api/gpio/consumer.rst         |   4 +-
 Documentation/driver-api/gpio/driver.rst           |  16 +-
 Documentation/fmc/API.txt                          |  47 --
 Documentation/fmc/FMC-and-SDB.txt                  |  88 ----
 Documentation/fmc/carrier.txt                      | 311 -------------
 Documentation/fmc/fmc-chardev.txt                  |  64 ---
 Documentation/fmc/fmc-fakedev.txt                  |  36 --
 Documentation/fmc/fmc-trivial.txt                  |  17 -
 Documentation/fmc/fmc-write-eeprom.txt             |  98 ----
 Documentation/fmc/identifiers.txt                  | 168 -------
 Documentation/fmc/mezzanine.txt                    | 123 -----
 Documentation/fmc/parameters.txt                   |  56 ---
 arch/arm/mach-omap1/ams-delta-fiq.c                |   4 +-
 arch/arm/mach-omap1/board-ams-delta.c              |   5 +-
 drivers/Kconfig                                    |   2 -
 drivers/Makefile                                   |   1 -
 drivers/fmc/Kconfig                                |  52 ---
 drivers/fmc/Makefile                               |  15 -
 drivers/fmc/fmc-chardev.c                          | 199 --------
 drivers/fmc/fmc-core.c                             | 388 ----------------
 drivers/fmc/fmc-debug.c                            | 172 -------
 drivers/fmc/fmc-dump.c                             |  58 ---
 drivers/fmc/fmc-fakedev.c                          | 355 --------------
 drivers/fmc/fmc-match.c                            | 113 -----
 drivers/fmc/fmc-private.h                          |   8 -
 drivers/fmc/fmc-sdb.c                              | 219 ---------
 drivers/fmc/fmc-trivial.c                          | 103 -----
 drivers/fmc/fmc-write-eeprom.c                     | 175 -------
 drivers/fmc/fru-parse.c                            |  80 ----
 drivers/gpio/Kconfig                               |  20 +-
 drivers/gpio/Makefile                              | 296 ++++++------
 drivers/gpio/TODO                                  |  40 ++
 drivers/gpio/gpio-altera.c                         |  65 ++-
 drivers/gpio/gpio-amd-fch.c                        |   4 +-
 drivers/gpio/gpio-amdpt.c                          |  10 +-
 drivers/gpio/gpio-ath79.c                          |  66 ++-
 drivers/gpio/gpio-davinci.c                        |   7 +-
 drivers/gpio/gpio-eic-sprd.c                       |   9 +-
 drivers/gpio/gpio-em.c                             |  34 +-
 drivers/gpio/gpio-ep93xx.c                         |   7 +-
 drivers/gpio/gpio-ftgpio010.c                      |  35 +-
 drivers/gpio/gpio-grgpio.c                         |   4 +-
 drivers/gpio/gpio-ixp4xx.c                         |  14 +-
 drivers/gpio/gpio-janz-ttl.c                       |   9 +-
 drivers/gpio/gpio-madera.c                         |   6 +-
 drivers/gpio/gpio-max732x.c                        |  45 +-
 drivers/gpio/gpio-mockup.c                         |  21 +-
 drivers/gpio/gpio-mvebu.c                          |  11 +-
 drivers/gpio/gpio-omap.c                           | 509 +++++++--------------
 drivers/gpio/gpio-pca953x.c                        |   1 +
 drivers/gpio/gpio-pl061.c                          |  30 +-
 drivers/gpio/gpio-rcar.c                           |   2 +-
 drivers/gpio/gpio-siox.c                           |  51 +--
 drivers/gpio/gpio-stp-xway.c                       |  33 +-
 drivers/gpio/gpio-tegra.c                          |   4 +-
 drivers/gpio/gpio-vf610.c                          |  14 +-
 drivers/gpio/gpio-vr41xx.c                         |  19 +-
 drivers/gpio/gpio-xilinx.c                         |  90 ++--
 drivers/gpio/gpiolib-acpi.c                        |   6 +-
 drivers/gpio/gpiolib-of.c                          |  43 ++
 drivers/gpio/gpiolib.c                             |  88 ++--
 drivers/gpio/gpiolib.h                             |   2 +-
 drivers/hid/hid-cp2112.c                           |   7 +-
 drivers/memory/omap-gpmc.c                         |   4 +-
 include/linux/device.h                             |   3 +-
 include/linux/fmc-sdb.h                            |  39 --
 include/linux/fmc.h                                | 269 -----------
 include/linux/gpio/driver.h                        |  29 +-
 include/linux/gpio/gpio-reg.h                      |   2 +-
 include/linux/gpio/machine.h                       |   4 +-
 include/linux/platform_data/gpio-omap.h            |   2 +-
 include/linux/siox.h                               |  10 +
 lib/devres.c                                       |   3 +-
 tools/gpio/.gitignore                              |   2 +-
 77 files changed, 835 insertions(+), 4208 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/pl061-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
 delete mode 100644 Documentation/fmc/API.txt
 delete mode 100644 Documentation/fmc/FMC-and-SDB.txt
 delete mode 100644 Documentation/fmc/carrier.txt
 delete mode 100644 Documentation/fmc/fmc-chardev.txt
 delete mode 100644 Documentation/fmc/fmc-fakedev.txt
 delete mode 100644 Documentation/fmc/fmc-trivial.txt
 delete mode 100644 Documentation/fmc/fmc-write-eeprom.txt
 delete mode 100644 Documentation/fmc/identifiers.txt
 delete mode 100644 Documentation/fmc/mezzanine.txt
 delete mode 100644 Documentation/fmc/parameters.txt
 delete mode 100644 drivers/fmc/Kconfig
 delete mode 100644 drivers/fmc/Makefile
 delete mode 100644 drivers/fmc/fmc-chardev.c
 delete mode 100644 drivers/fmc/fmc-core.c
 delete mode 100644 drivers/fmc/fmc-debug.c
 delete mode 100644 drivers/fmc/fmc-dump.c
 delete mode 100644 drivers/fmc/fmc-fakedev.c
 delete mode 100644 drivers/fmc/fmc-match.c
 delete mode 100644 drivers/fmc/fmc-private.h
 delete mode 100644 drivers/fmc/fmc-sdb.c
 delete mode 100644 drivers/fmc/fmc-trivial.c
 delete mode 100644 drivers/fmc/fmc-write-eeprom.c
 delete mode 100644 drivers/fmc/fru-parse.c
 delete mode 100644 include/linux/fmc-sdb.h
 delete mode 100644 include/linux/fmc.h
