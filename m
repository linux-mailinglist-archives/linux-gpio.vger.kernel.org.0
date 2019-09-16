Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5B4B33D2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 05:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbfIPD7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Sep 2019 23:59:00 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37155 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbfIPD7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Sep 2019 23:59:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id w67so26259572lff.4
        for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2019 20:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=m1Hhg7ODzcfgB+0HRjEGFZ4qLXUGKx1WsfevdMsgXfQ=;
        b=ie192P++JSJGgRu63x8IOuJhIgehbcXnKEflP6krmR6luFcrbJjIngV9b3x4jfiAWe
         8RFZxlyNmIo0LjfkP+PeatApQuJuRH9hK0aonDee87nCSD6ey1Mu/VmQUNsRvWRV5MDR
         QaTBVfBLV2UeKXx6O8yDhxQsgORPgZ+ChtwZXFAmCSklEFht8utqkoh5EDFKKBRutOtw
         Di0U4ORxnhvsYDg6E7S41DUjoZG0dA7gI9qfWZQJDt6wE750FLKhUJ2J0OigS2jLLXGu
         Vn5qhrPTsuCASoUQzt/gObtRAMXwQOdbNiH6GKuIuOUxKma+FEFD7xfJzvk7v8MPHo18
         k8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=m1Hhg7ODzcfgB+0HRjEGFZ4qLXUGKx1WsfevdMsgXfQ=;
        b=Y4YKWuuykcpQ4/rdAFKpHcSGOQc09cBmj8mnEcFlnzVMR1RrtcXcuALH6owOeKwC+T
         bT6C09J3tJOuk8VJnpDvi7W+CjHgJOyy/yYGo7bp4DODNprG17zmg5FEc3gt68VUwjEV
         yZ5TwKtC+UEwz9ittOgKyuJAcHzZIFzWX1a7jATHljEbMUA//AZVuno1pOLVFjjt/t6+
         epUxpD/8PFisHXaEpc4gGIn9exX7WhcG9OfjmauwxOkIK9ZV3yodKiLNdX7BnF+1/IiN
         ykvLJi8NE90mAU8vo44BUpZj+mqyJ845QvOmhEzAcQHvLZ7+TDWpDabRIsVaXAnd9kFv
         rLRg==
X-Gm-Message-State: APjAAAVyIFpFj5B++Wd367HmlK6hzQMFlTPRqnGobrxRbqOuH2LHm6Am
        tN4ZEapcG6ZEOagi+UjmOrPg0kmJ4zym+NFFkgBkBWt2UdAScA==
X-Google-Smtp-Source: APXvYqy3Kfnb2KshTyOFqsNrpNv2kdfDeG32bsbjf2HNOykwnsWu1+D+UrJJpf7zXjyivwnhcItlhp8RO9LVa289hKY=
X-Received: by 2002:a19:117:: with SMTP id 23mr37730052lfb.115.1568606337155;
 Sun, 15 Sep 2019 20:58:57 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Sep 2019 05:58:45 +0200
Message-ID: <CACRpkdZX_uUGaHD9+abAG1w-OVyp0ihvEosjvcBe8gbvf4FCcw@mail.gmail.com>
Subject: [GIT PULL] GPIO bulk changes for the v5.4 kernel
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

the following is the bulk of GPIO changes for v5.4. The
main information chunk about the updates is in the signed
tag as always. This cycle has been pretty lively.

You will notice that I merged in v5.3-rc7 at a late point.
This was because the conflicts were really hairy between
the -rc:s and the bulk of development: the kind where
there is a variable rename in one branch and independent
reshuffling of code in the other. This took me some
substantial time to sort out, despite both changes being
my own. I don't know if I'm especially bad at resolving
conflicts but after failing to construct a branch for -next
several times I just sat down and resolved the conflicts
toward -rc7 once and for all. I still had to fix it up with
a patch on top.

Changes hitting Unicore and FMC in MAINTAINERS are
eplained in the signed tag as well.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 089cf7f6ecb266b6a4164919a2e69bd2f938374a=
:

  Linux 5.3-rc7 (2019-09-02 09:57:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.4-1

for you to fetch changes up to 11c43bb022b373d2fdb84950ebf1911362f3f010:

  gpiolib: of: add a fallback for wlf,reset GPIO name (2019-09-12
10:29:17 +0100)

----------------------------------------------------------------
This is the bulk of changes in the GPIO subsystem for the
v5.4 kernel cycle.

Core changes:

- Support hierarchical GPIO irqchips. We now have three
  consumers that can use this: Intel IXP4xx, ThunderX and
  Qualcomm SPMI GPIO (in the pinctrl subsystem). The support
  code has been long in the making and hashed out so it should
  be easily adaptable for all hierarchical irqchip parents.
  The code only gets compiled in if hierarchical irqchip
  is used at the topmost irq controller at least, as the
  hierarchical irqchip requires strict hierarchy all the
  way up in the system.

- Determine the need for a "valid_mask" for GPIO lines on the
  gpio_chip and conversely for the "valid_mask" for the GPIO
  interrupt chip interrupt lines by looking for a
  .init_valid_mask() callback in the main chip or GPIO interrupt
  chip respectively. Allocate it with bitmap_alloc().

- Isolate the device tree/open firmware GPIO description code
  out in its own file properly.

- Isolate the ACPI GPIO description code out in its own file
  properly.

- Drop a whole lot of #ifdef:s in the main includes: it does
  not hurt to keep the include items around, and we get
  quicker and clearer compile failures if the appropriate
  kernel symbols are not selected for drivers.

New/deleted drivers:

- New driver for Aspeed SGPIO.

- The KS8695 driver is deleted as the platform gets deleted
  from arch/arm in this kernel cycle.

- The Cirrus Logic Madera driver now supports CS47L92 and
  CS47L15.

- The Freescale MPC8xxx now supports LS1028A and LS1088A.

Driver improvements:

- We pass the GPIO irqchip intialization by directly filling
  in the struct instead of using set-up functions (the new
  way) for Intel MID, Lynxpoint, Merrifield, XLP, HLWD, Aspeed,
  ZX, VF610, TQMX86, MT7621, Zynq and EP93xx.

Out-of-band changes:

- Fix a GPIO header inclusion in Unicore - no response from
  maintainer.

- Drop FMC subsystem from MAINTAINERS - was deleted in the
  GPIO tree last cycle so let's mop up the shards.

----------------------------------------------------------------
Andy Shevchenko (8):
      gpiolib: of: Reshuffle contents of consumer.h for new library layout
      gpiolib: acpi: Split ACPI stuff to gpiolib-acpi.h
      gpiolib-acpi: Move acpi_dev_add_driver_gpios() et al to consumer.h
      gpio: pca953x: Switch to use device_get_match_data()
      gpio: pca953x: Use GENMASK() consistently
      gpio: pca953x: Remove explicit comparison with 0
      gpio: pca953x: Drop %s for constant string literals
      MAINTAINERS: Remove stale record for gpio-intel-mid.c

Anson Huang (1):
      gpio: mxc: Use devm_clk_get_optional instead of devm_clk_get

Arnd Bergmann (2):
      gpio: remove ks8695 driver
      gpio: lpc32xx: allow building on non-lpc32xx targets

Bartosz Golaszewski (2):
      gpio: em: use a helper variable for &pdev->dev
      gpio: max77650: add MODULE_ALIAS()

Brian Masney (1):
      qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core

Charles Keepax (3):
      gpio: arizona: Use local copy of pdata
      gpio: madera: Use local copy of pdata
      gpio: madera: Add support for Cirrus Logic CS47L92

Christophe JAILLET (1):
      gpio: ftgpio: Fix an error handling path in 'ftgpio_gpio_probe()'

Chuhong Yuan (1):
      gpio: pch: Use dev_get_drvdata

Colin Ian King (2):
      gpio: bd70528: fix spelling misstake "debouce" -> "debounce"
      gpio: bd70528: remove redundant assignment to variable ret

Denis Efremov (1):
      MAINTAINERS: Remove FMC subsystem

Ding Xiang (1):
      gpio: ixp4xx: remove redundant dev_err message

Dmitry Torokhov (2):
      gpiolib: acpi: make acpi_can_fallback_to_crs() static
      gpiolib: of: add a fallback for wlf,reset GPIO name

Geert Uytterhoeven (5):
      gpio: of: Make of_get_named_gpiod_flags() private
      gpio: of: Make of_gpio_simple_xlate() private
      gpio: of: Switch to EXPORT_SYMBOL_GPL()
      gpio: devres: Switch to EXPORT_SYMBOL_GPL()
      gpio: htc-egpio: Remove unused exported htc_egpio_get_wakeup_irq()

Hennie Muller (1):
      gpio: viperboard: Replace 'unsigned' with 'unsigned int'

Hongwei Zhang (2):
      dt-bindings: gpio: aspeed: Add SGPIO support
      gpio: aspeed: Add SGPIO driver

Jeremy Cline (1):
      Documentation: gpio: fix function links in the HTML docs

Linus Walleij (30):
      unicore: Drop pointless include
      gpio: of: Break out OF-only code
      gpio: intel-mid: Pass irqchip when adding gpiochip
      gpio: lynxpoint: Pass irqchip when adding gpiochip
      gpio: merrifield: Pass irqchip when adding gpiochip
      gpio: Add support for hierarchical IRQ domains
      gpio: ixp4xx: Convert to hierarchical GPIOLIB_IRQCHIP
      gpio: thunderx: Switch to GPIOLIB_IRQCHIP
      gpio: cadence: Pass irqchip when adding gpiochip
      gpio: xlp: Pass irqchip when adding gpiochip
      gpio: hlwd: Pass irqchip when adding gpiochip
      gpio: aspeed: Pass irqchip when adding gpiochip
      gpio: Pass mask and size with the init_valid_mask()
      pinctrl: stmfx: Use the callback to populate valid_mask
      gpio: Use callback presence to determine need of valid_mask
      gpio: ftgpio: Move hardware initialization
      gpio: zx: Pass irqchip when adding gpiochip
      gpio: vf610: Pass irqchip when adding gpiochip
      gpio: tqmx86: Pass irqchip when adding gpiochip
      gpio: mt7621: Pass irqchip when adding gpiochip
      gpio: zynq: Pass irqchip when adding gpiochip
      Merge tag 'gpio-v5.4-updates-for-linus' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: ep93xx: Pass irqchip when adding gpiochip
      gpio: gpiolib: Normalize return code variable name
      gpio: of: Normalize return code variable name
      gpio: Fix up merge collision in include file
      Merge tag 'v5.3-rc7' into devel
      gpio: Fix further merge errors
      Merge tag 'intel-gpio-v5.4-1' of
git://git.kernel.org/.../andy/linux-gpio-intel into devel
      gpio: Initialize the irqchip valid_mask with a callback

Lokesh Vutla (1):
      dt-bindings: gpio: davinci: Add new compatible for J721E SoCs

Marc Zyngier (1):
      gpio/ixp4xx: Register the base PA instead of its VA in fwnode

Masahiro Yamada (2):
      gpio: remove less important #ifdef around declarations
      gpio: refactor gpiochip_allocate_mask() with bitmap_alloc()

Rashmica Gupta (5):
      gpio: aspeed: Update documentation with ast2600 controllers
      gpio/aspeed: Fix incorrect number of banks
      gpio: aspeed: Setup irqchip dynamically
      gpio: aspeed: Use ngpio property from device tree if available
      gpio: aspeed: Add in ast2600 details to Aspeed driver

Richard Fitzgerald (1):
      gpio: madera: Add support for Cirrus Logic CS47L15

Saiyam Doshi (1):
      gpio: remove explicit comparison with 0

Song Hui (4):
      gpio: mpc8xxx: Add ls1028a device specify function.
      gpio: mpc8xxx: Add new platforms GPIO DT node description
      gpio: mpc8xxx: add ls1088a platform gpio node DT binding description
      gpio: mpc8xxx: add ls1088a platform special function

Stephen Boyd (2):
      gpio: of: Fix hard-assigned valid_mask for OF case
      gpio: Remove dev_err() usage after platform_get_irq()

Stephen Rothwell (1):
      gpio: stubs in headers should be inline

Uwe Kleine-K=C3=B6nig (1):
      gpio: mockup: don't depend twice on GPIOLIB

YueHaibing (2):
      gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h
      gpio: creg-snps: use devm_platform_ioremap_resource() to simplify cod=
e

 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   7 +-
 .../devicetree/bindings/gpio/gpio-davinci.txt      |   1 +
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |  16 +-
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |  45 ++
 Documentation/driver-api/gpio/driver.rst           | 138 ++++-
 MAINTAINERS                                        |  15 -
 arch/arm/configs/lpc32xx_defconfig                 |   1 +
 arch/unicore32/kernel/irq.c                        |   1 -
 drivers/gpio/Kconfig                               |  11 +-
 drivers/gpio/Makefile                              |   3 +-
 drivers/gpio/gpio-arizona.c                        |   4 +-
 drivers/gpio/gpio-aspeed.c                         | 117 ++--
 drivers/gpio/gpio-bd70528.c                        |   4 +-
 drivers/gpio/gpio-brcmstb.c                        |   4 +-
 drivers/gpio/gpio-cadence.c                        |  36 +-
 drivers/gpio/gpio-creg-snps.c                      |   4 +-
 drivers/gpio/gpio-dwapb.c                          |   1 +
 drivers/gpio/gpio-eic-sprd.c                       |   4 +-
 drivers/gpio/gpio-em.c                             |  37 +-
 drivers/gpio/gpio-ep93xx.c                         | 140 +++--
 drivers/gpio/gpio-ftgpio010.c                      |  14 +-
 drivers/gpio/gpio-grgpio.c                         |   2 -
 drivers/gpio/gpio-hlwd.c                           |  58 +-
 drivers/gpio/gpio-htc-egpio.c                      |  14 -
 drivers/gpio/gpio-intel-mid.c                      |  35 +-
 drivers/gpio/gpio-ixp4xx.c                         | 279 ++-------
 drivers/gpio/gpio-ks8695.c                         | 284 ---------
 drivers/gpio/gpio-lpc32xx.c                        | 118 ++--
 drivers/gpio/gpio-lynxpoint.c                      |  35 +-
 drivers/gpio/gpio-madera.c                         |  12 +-
 drivers/gpio/gpio-max77620.c                       |   4 +-
 drivers/gpio/gpio-max77650.c                       |   1 +
 drivers/gpio/gpio-mb86s7x.c                        |   1 +
 drivers/gpio/gpio-merrifield.c                     |  28 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  32 +
 drivers/gpio/gpio-mt7621.c                         |  33 +-
 drivers/gpio/gpio-mxc.c                            |   9 +-
 drivers/gpio/gpio-pca953x.c                        |  70 +--
 drivers/gpio/gpio-pch.c                            |   6 +-
 drivers/gpio/gpio-pmic-eic-sprd.c                  |   4 +-
 drivers/gpio/gpio-sprd.c                           |   4 +-
 drivers/gpio/gpio-stmpe.c                          |  36 +-
 drivers/gpio/gpio-tb10x.c                          |   4 +-
 drivers/gpio/gpio-tegra.c                          |   4 +-
 drivers/gpio/gpio-thunderx.c                       | 163 ++---
 drivers/gpio/gpio-tqmx86.c                         |  50 +-
 drivers/gpio/gpio-vf610.c                          |  26 +-
 drivers/gpio/gpio-viperboard.c                     |  20 +-
 drivers/gpio/gpio-xgene-sb.c                       |   1 +
 drivers/gpio/gpio-xlp.c                            |  29 +-
 drivers/gpio/gpio-zx.c                             |  35 +-
 drivers/gpio/gpio-zynq.c                           |  41 +-
 drivers/gpio/gpiolib-acpi.c                        |  27 +-
 drivers/gpio/gpiolib-acpi.h                        |  96 +++
 drivers/gpio/gpiolib-devres.c                      |  28 +-
 drivers/gpio/gpiolib-of.c                          | 158 ++++-
 drivers/gpio/gpiolib-of.h                          |  38 ++
 drivers/gpio/gpiolib.c                             | 680 +++++++++++++----=
----
 drivers/gpio/gpiolib.h                             | 120 ----
 drivers/gpio/sgpio-aspeed.c                        | 533 ++++++++++++++++
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  16 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  42 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |  18 +-
 drivers/pinctrl/qcom/Kconfig                       |   1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  23 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  92 +--
 drivers/platform/x86/intel_int0002_vgpio.c         |  11 +-
 include/linux/acpi.h                               |  51 --
 include/linux/gpio.h                               |  13 -
 include/linux/gpio/consumer.h                      | 135 +++-
 include/linux/gpio/driver.h                        | 178 ++++--
 include/linux/of_gpio.h                            |  11 -
 include/linux/platform_data/gpio-htc-egpio.h       |   3 -
 sound/soc/intel/boards/bytcht_cx2072x.c            |   1 +
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |   1 +
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   1 +
 76 files changed, 2535 insertions(+), 1783 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 delete mode 100644 drivers/gpio/gpio-ks8695.c
 create mode 100644 drivers/gpio/gpiolib-acpi.h
 create mode 100644 drivers/gpio/gpiolib-of.h
 create mode 100644 drivers/gpio/sgpio-aspeed.c
