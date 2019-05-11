Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C851A736
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2019 10:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbfEKIpU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 May 2019 04:45:20 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33012 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726941AbfEKIpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 May 2019 04:45:19 -0400
Received: by mail-lf1-f66.google.com with SMTP id x132so5769011lfd.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 May 2019 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=7miCwUTaPzpCoLaJea3kZEZZgRHl7mSXf9NxVsCSnNU=;
        b=UtMNtNMDMqHqnkxd6aZtKZ+J8EbM4s7N2XncMyt6oyNApiUGhCTFtzqgcdnn/8KaZE
         6D4ysagMoR02w48haXBxHMzhYpYxtGt8uWdAr9nn9JikoOedpru45mkeWE3PI0yoCTKL
         8fJgnO9Q+zEM4bQgqdkq1pZvTPv5tDmJh2Vpz6FmEEmJUHUrAUx9QlheALn7rja3MEfa
         06FAqIi1RQ5uWDWjJEh7lKE7SwdJFu5HytUi13HQSObu+1GSsN6vquhhf55CNlI87kpR
         svS1wnIIU1ABKjPjexWwou7wbwqGeYL7PJf5TwX/oFFEvQaQJNxuQaoU6fu6BLSvi+6/
         22hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=7miCwUTaPzpCoLaJea3kZEZZgRHl7mSXf9NxVsCSnNU=;
        b=OGvhp8RqQ/HftepDumB7D1ac+upxgZKHAuFxaycH/hpXRv2Dt3HqENaoTFkZ051LX4
         /Wx9zwNJjx3928BZLoREz+QZJolDfDUDgDcV8oo0T6SUnlhRwOwsPtDtRTpMA/KrWS5L
         16AE1LOF9Mu/a6z9nN0gz3Y1sIiW0TufgcHh1QNFdgtW5MyCNokLgnGhaoBGmkuu907U
         CAGQ3lyMkEV2hoOIY9AnMdhi63hzAQnPsA9G5qql8BJn64WIAP91eunFea75Er7W1Gac
         Xa3DwkCETfgowumQIT5nrxX5d3Z3wp7uqmSBxMBFyoF7vKuXcv9kchZSipwuyyK6HksC
         fMuQ==
X-Gm-Message-State: APjAAAVqWXoEgyWfTtilWcR1eMN9efOZJJjJRwNEF1lYeuEUDsO7mtJk
        WP6jEAKP171GHU/OLHUHm8JekVygREs3/seuxVEgzQ==
X-Google-Smtp-Source: APXvYqz2xYym3AWToebYZOUd+QV/vWxtJVsivCRmE6Q9u16ih1rZaKnDz72ETc6nSs4LynUNvkaM6gnWYtZA6UT1hIA=
X-Received: by 2002:ac2:4a86:: with SMTP id l6mr7971680lfp.51.1557564316907;
 Sat, 11 May 2019 01:45:16 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 May 2019 10:45:05 +0200
Message-ID: <CACRpkdZg0=f1KvwDhYGo=iv0ntQWzjTqYno1BgLE4zYxq-RAUQ@mail.gmail.com>
Subject: [GIT PULL] GPIO bulk changes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the big pull request for GPIO for v5.2. A bit later than usual
because I was ironing out my own mistakes. I'm holding some
stuff back for the next kernel as a result, and this should be a
healthy and well tested batch.

I merged in v5.1-rc3 at one point to get rid of some nasty merge
conflicts with one of the bigger fixes that went in in the early rcs.

Other than that it is business as usual and a not very busy kernel
cycle this time.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6=
:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.2-1

for you to fetch changes up to 0fbee1df2078fa1f61e2da14f51ceb357c79ae69:

  gpio: Update documentation (2019-05-07 16:32:12 +0200)

----------------------------------------------------------------
This is the bulk of the GPIO changes for the v5.2 kernel cycle:

Core changes:
- The gpiolib MMIO driver has been enhanced to handle two direction
  registers, i.e. one register to set lines as input and one register
  to set lines as output. It turns out some silicon engineer thinks
  the ability to configure a line as input and output at the same
  time makes sense, this can be debated but includes a lot of analog
  electronics reasoning, and the registers are there and need to
  be handled consistently. Unsurprisingly, we enforce the lines to
  be either inputs or outputs in such schemes.
- Send in the proper argument value to .set_config() dispatched to
  the pin control subsystem. Nobody used it before, now someone
  does, so fix it to work as expected.
- The ACPI gpiolib portions can now handle pin bias setting (pull up
  or pull down). This has been in the ACPI spec for years and we
  finally have it properly integrated with Linux GPIOs. It was based
  on an observation from Andy Schevchenko that Thomas Petazzoni's
  changes to the core for biasing the PCA950x GPIO expander actually
  happen to fit hand-in-glove with what the ACPI core needed.
  Such nice synergies happen sometimes.

New drivers:
- A new driver for the Mellanox BlueField GPIO controller. This is
  using 64bit MMIO registers and can configure lines as inputs
  and outputs at the same time and after improving the MMIO library
  we handle it just fine. Interesting.
- A new IXP4xx proper gpiochip driver with hierarchical interrupts
  should be coming in from the ARM SoC tree as well.

Driver enhancements:
- The PCA053x driver handles the CAT9554 GPIO expander.
- The PCA053x driver handles the NXP PCAL6416 GPIO expander.
- Wake-up support on PCA053x GPIO lines.
- OMAP now does a nice asynchronous IRQ handling on wake-ups by
  letting everything wake up on edges, and this makes runtime PM
  work as expected too.

Misc:
- Several cleanups such as devres fixes.
- Get rid of some languager comstructs that cause problems when
  compiling with LLVMs clang.
- Documentation review and update.

----------------------------------------------------------------
Alexandre Belloni (3):
      gpio: pca953x: add pcal6416 to the of_device_id table
      dt-bindings: gpio: pca953x: document the nxp,pca6416
      gpio: pca953x: add support for pca6416

Andrey Smirnov (7):
      gpio: vf610: Do not share irq_chip
      gpio: vf610: Simplify vf610_gpio_set()
      gpio: vf610: Simplify vf610_gpio_get()
      gpio: vf610: Use devres to disable clk_port
      gpio: vf610: Use devres to disable clk_gpio
      gpio: vf610: Use devres to remove gpiochip
      gpio: vf610: Don't use explicit &pdev->dev in vf610_gpio_probe()

Andy Shevchenko (12):
      gpio: 74x164: Make use of device properties
      gpio: 74x164: Remove linux/init.h and sort headers
      gpio: 74x164: Convert to use SPDX identifier
      gpiolib: acpi: Fix references in kernel doc and amend
      gpiolib: Don't WARN on gpiod_put() for optional GPIO
      gpiolib: Indent entry values of enum gpio_lookup_flags
      gpiolib: Make use of enum gpio_lookup_flags consistent
      gpiolib: Introduce GPIO_LOOKUP_FLAGS_DEFAULT
      gpiolib: acpi: Change type of dflags
      gpiolib: acpi: Set pin value, based on bias, more accurately
      gpiolib: acpi: Add acpi_gpio_update_gpiod_lookup_flags() helper
      gpiolib: acpi: Respect pin bias setting

Anson Huang (1):
      gpio: mxc: use devm_platform_ioremap_resource() to simplify code

Arnd Bergmann (1):
      gpio: omap: avoid clang warning

Bartosz Golaszewski (2):
      gpio: mockup: drop unneeded dependencies from Kconfig
      gpio: mockup: move the driver out of the IOMEM drivers section

Enrico Weigelt, metux IT consult (36):
      drivers: gpio: Kconfig: pedantic formatting cleanups
      drivers: gpio: 74xx-mmio: use devm_platform_ioremap_resource()
      drivers: gpio: amdpt: use devm_platform_ioremap_resource()
      drivers: gpio: aspeed: use devm_platform_ioremap_resource()
      drivers: gpio: bcm-kona: use devm_platform_ioremap_resource()
      drivers: gpio: cadence: use devm_platform_ioremap_resource()
      drivers: gpio: clps711x: use devm_platform_ioremap_resource()
      drivers: gpio: dwap: use devm_platform_ioremap_resource()
      drivers: gpio: sprd: use devm_platform_ioremap_resource()
      drivers: gpio: ftgpio010: use devm_platform_ioremap_resource()
      drivers: gpio: hlwd: use devm_platform_ioremap_resource()
      drivers: gpio: iop: use devm_platform_ioremap_resource()
      drivers: gpio: janz-ttl: use devm_platform_ioremap_resource()
      drivers: gpio: loongon1: use devm_platform_ioremap_resource()
      drivers: gpio: lpc18xx: use devm_platform_ioremap_resource()
      drivers: gpio: mb86s7x: use devm_platform_ioremap_resource()
      drivers: gpio: mt7621: use devm_platform_ioremap_resource()
      drivers: gpio: mvebu: use devm_platform_ioremap_resource()
      drivers: gpio: mxc: use devm_platform_ioremap_resource()
      drivers: gpio: octeon: use devm_platform_ioremap_resource()
      drivers: gpio: pxa: use devm_platform_ioremap_resource()
      drivers: gpio: rcar: use devm_platform_ioremap_resource()
      drivers: gpio: spear-spics: use devm_platform_ioremap_resource()
      drivers: gpio: sta2x11: use devm_platform_ioremap_resource()
      drivers: gpio: stp-xway: use devm_platform_ioremap_resource()
      drivers: gpio: tb10x: use devm_platform_ioremap_resource()
      drivers: gpio: tegra: use devm_platform_ioremap_resource()
      drivers: gpio: timberdale: use devm_platform_ioremap_resource()
      drivers: gpio: ts4800: use devm_platform_ioremap_resource()
      drivers: gpio: uniphier: use devm_platform_ioremap_resource()
      drivers: gpio: vf610: use devm_platform_ioremap_resource()
      drivers: gpio: xgene-sb: use devm_platform_ioremap_resource()
      drivers: gpio: zx: use devm_platform_ioremap_resource()
      drivers: gpio: xlp: devm_platform_ioremap_resource()
      gpio: zynq: use devm_platform_ioremap_resource()
      gpio: omap: use devm_platform_ioremap_resource()

Geert Uytterhoeven (5):
      dt-bindings: gpio: pca953x: Document onnn,cat9554
      gpio: pca953x: Add support for CAT9554
      gpio: Remove obsolete comment about gpiochip_free_hogs() usage
      gpio: of: Optimize quirk checks
      gpio: pca953x: Configure wake-up path when wake-up is enabled

Jan Kiszka (1):
      gpio: sch: Remove write-only core_base

Jan Kotas (1):
      gpio: mmio: Fix bgpio_get_set & bgpio_get_set_multiple

Jan Kundr=C3=A1t (1):
      pinctrl: mcp23s08: debugfs: remove custom printer

Linus Walleij (5):
      gpio: mmio: Support two direction registers
      gpio: mmio: Drop bgpio_dir_inverted
      Merge tag 'v5.1-rc3' into devel
      Merge tag 'gpio-v5.2-updates-for-linus-part1' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: Update documentation

Mauro Carvalho Chehab (1):
      docs: gpio: convert docs to ReST and rename to *.rst

Maxime Ripard (1):
      gpio: Set proper argument value to set_config

Russell King (2):
      gpio: gpio-omap: configure edge detection for level IRQs for idle wak=
eup
      gpio: gpio-omap: Remove conditional pm_runtime handling for GPIO
interrupts

Shravan Kumar Ramani (2):
      gpio: add driver for Mellanox BlueField GPIO controller
      gpio: mlxbf: Add dependency on 64BIT to Kconfig entry

Tony Lindgren (3):
      gpio: gpio-omap: limit errata 1.101 handling to wkup domain gpios onl=
y
      gpio: gpio-omap: always scan for triggered non-wakeup capable interru=
pts
      gpio: gpio-omap: add check for off wake capable gpios

Uwe Kleine-K=C3=B6nig (1):
      tracing: stop making gpio tracing configurable

YueHaibing (2):
      gpio: mlxbf: remove unused including <linux/version.h>
      gpio: pxa: Make two symbols static

 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   2 +
 Documentation/driver-api/gpio/driver.rst           | 361 +++++++-----
 Documentation/gpio/index.rst                       |  17 +
 Documentation/gpio/{sysfs.txt =3D> sysfs.rst}        |  39 +-
 arch/arm/configs/aspeed_g4_defconfig               |   1 -
 arch/arm/configs/aspeed_g5_defconfig               |   1 -
 drivers/gpio/Kconfig                               |  83 +--
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-74x164.c                         |  22 +-
 drivers/gpio/gpio-74xx-mmio.c                      |   4 +-
 drivers/gpio/gpio-amdpt.c                          |   8 +-
 drivers/gpio/gpio-aspeed.c                         |   4 +-
 drivers/gpio/gpio-bcm-kona.c                       |   4 +-
 drivers/gpio/gpio-cadence.c                        |   4 +-
 drivers/gpio/gpio-clps711x.c                       |   7 +-
 drivers/gpio/gpio-dwapb.c                          |   4 +-
 drivers/gpio/gpio-ftgpio010.c                      |   4 +-
 drivers/gpio/gpio-hlwd.c                           |   4 +-
 drivers/gpio/gpio-iop.c                            |   4 +-
 drivers/gpio/gpio-janz-ttl.c                       |   4 +-
 drivers/gpio/gpio-loongson1.c                      |   4 +-
 drivers/gpio/gpio-lpc18xx.c                        |   5 +-
 drivers/gpio/gpio-mb86s7x.c                        |   4 +-
 drivers/gpio/gpio-mlxbf.c                          | 152 +++++
 drivers/gpio/gpio-mmio.c                           |  99 ++--
 drivers/gpio/gpio-mt7621.c                         |   3 +-
 drivers/gpio/gpio-mvebu.c                          |   7 +-
 drivers/gpio/gpio-mxc.c                            |   4 +-
 drivers/gpio/gpio-octeon.c                         |   4 +-
 drivers/gpio/gpio-omap.c                           | 644 +++++++++--------=
----
 drivers/gpio/gpio-pca953x.c                        |  25 +-
 drivers/gpio/gpio-pxa.c                            |  12 +-
 drivers/gpio/gpio-rcar.c                           |   5 +-
 drivers/gpio/gpio-sch.c                            |   5 -
 drivers/gpio/gpio-spear-spics.c                    |   4 +-
 drivers/gpio/gpio-sprd.c                           |   4 +-
 drivers/gpio/gpio-sta2x11.c                        |   5 +-
 drivers/gpio/gpio-stp-xway.c                       |   4 +-
 drivers/gpio/gpio-tb10x.c                          |   4 +-
 drivers/gpio/gpio-tegra.c                          |   4 +-
 drivers/gpio/gpio-timberdale.c                     |   4 +-
 drivers/gpio/gpio-ts4800.c                         |   4 +-
 drivers/gpio/gpio-uniphier.c                       |   4 +-
 drivers/gpio/gpio-vf610.c                          |  92 ++-
 drivers/gpio/gpio-xgene-sb.c                       |   4 +-
 drivers/gpio/gpio-xlp.c                            |   7 +-
 drivers/gpio/gpio-zx.c                             |   4 +-
 drivers/gpio/gpio-zynq.c                           |   4 +-
 drivers/gpio/gpiolib-acpi.c                        | 115 ++--
 drivers/gpio/gpiolib-of.c                          |  24 +-
 drivers/gpio/gpiolib.c                             |  43 +-
 drivers/gpio/gpiolib.h                             |  19 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 | 110 ----
 include/linux/gpio/driver.h                        |  15 +-
 include/linux/gpio/machine.h                       |  26 +-
 include/linux/platform_data/gpio-omap.h            |   2 -
 include/trace/events/gpio.h                        |   4 -
 kernel/trace/Kconfig                               |   7 -
 58 files changed, 1052 insertions(+), 1012 deletions(-)
 create mode 100644 Documentation/gpio/index.rst
 rename Documentation/gpio/{sysfs.txt =3D> sysfs.rst} (86%)
 create mode 100644 drivers/gpio/gpio-mlxbf.c
