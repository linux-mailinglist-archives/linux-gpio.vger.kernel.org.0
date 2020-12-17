Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B272DDB22
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 23:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732042AbgLQWAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 17:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731901AbgLQWAs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 17:00:48 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CF6C061794
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2020 14:00:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id a12so276414lfl.6
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2020 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=U3SWvCDnDXzEBxEnPV0nGAQHHiwdrrqDe2A4mY+EAxc=;
        b=LdIHRUCrnGamHkugZ+s0tvCyqjDMrbkwQl1VOxRHcca2LZrkW7/FyfJpu/aVcPbEIE
         O/bS77gvaIK598rmLRG/Un4psflCtx/gKvegDFdcv+ita4K3Okk6uQli/JNZFC3iKQFW
         jKKflcXV646uPo1jzdnMBFavEn4e83iH+g/RjI9nlYLUp5PDzIFgY8Zr7g/xqJ0F/kk+
         DSa8oDBLmsebh/DCzYqsq98FTsJ6MkGyg54MaDqjsUE7kOD+4Tns6/B6wT/9FZ0vpzrc
         ymSnCMSN6pa0fdcmKgW9viz+shfBuIc3E0AVTvT4iNNGCLj2GewhzpuuoEHsO5JXqcWL
         TZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=U3SWvCDnDXzEBxEnPV0nGAQHHiwdrrqDe2A4mY+EAxc=;
        b=aY/MCb1hJBbd2l0jqoulTAz9RROVLO09CPSwulRDLzvZOepS4QzhQfqinnlJbzlfjd
         fBRWDhonYveiJsDhm+z37FxnJLc3DabxIfS+YS2OlLvviJB0yCLMLdumoUH9t6u2I/ui
         YS+LAToGwY5DP3PjbHnBwWZJucaKOP/wWJssazYFd8uw11V6DQfPfBjVD30iURxgIdd6
         scASjbGkiW0J6yLBhoW6sAxPv5ZLrfDg0EcQtxQejIgBi6XOYiKDwAXAdNwNUe/GWAb/
         z5ZDLf/mOMft/q99bE/K0APtnJR4zsboPprKaBR/hn18aMOHpOHnhfn041h0FWR/7T5p
         OKBw==
X-Gm-Message-State: AOAM532EsFOk2qza2SJcQSNmkKao0nN7kK/Fo8OGwhI4X6TWGDXjRYFb
        s9xJhsfi3OJkZd098UZF8595d86HNiQ0JJjKPdDpug==
X-Google-Smtp-Source: ABdhPJzG6itw45c9VFhwfSYrgFOns4Rxzpsg2Hq6O/rUbCheYckkhEEZ7IYeCVg/z6jUPyf/Phk7ToeGzfnM5YTFaQA=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr298457lfd.291.1608242406019;
 Thu, 17 Dec 2020 14:00:06 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Dec 2020 22:59:54 +0100
Message-ID: <CACRpkdakznwYRtF+kjpubhk7AnY2wvsYGDmgEjo56gC4oZmy2A@mail.gmail.com>
Subject: [GIT PULL] GPIO bulk changes for the v5.11 cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of GPIO changes for the v5.11 kernel cycle.

The contents are explained in the signed tag as usual.

I had some more core patches boiling, but given your clear desire in
the release mail for v5.10 I quickly decided to pull that out and have
it wait for the next kernel cycle.

For the next kernel cycle the GPIO co-maintainer Bartosz Golaszewski
will be sending pull requests with fixes and also the bulk material for
v5.12. He has a kernel.org account so this should not be any infrastructural
problem.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.11-1

for you to fetch changes up to 7ac554888233468a9fd7c4f28721396952dd9959:

  MAINTAINERS: Remove reference to non-existing file (2020-12-16 21:57:46 +0100)

----------------------------------------------------------------
This is the bulk of the GPIO changes for the v5.11 kernel cycle:

Core changes:

- Retired the old set-up function for GPIO IRQ chips. All chips
  now use the template struct gpio_irq_chip and pass that to the core
  to be set up alongside the gpio_chip. We can finally get rid of
  the old cruft.

- Some refactoring and clean up of the core code.

- Support edge event timestamps to be stamped using REALTIME
  (wall clock) timestamps. We have found solid use cases for
  this, so we support it.

New drivers:

- MStar MSC313 GPIO driver.

- HiSilicon GPIO driver.

Driver improvements:

- The PCA953x driver now also supports the NXP PCAL9554B/C chips.

- The mockup driver can now be probed from the device tree which
  is pretty useful for virtual prototyping of devices.

- The Rcar driver now supports .get_multiple()

- The MXC driver dropped some legacy and became a pure device
  tree client.

- The Exar driver was moved over to the IDA interface for
  enumerating, and also switched over to using regmap for
  register access.

----------------------------------------------------------------
Alexandre Courbot (1):
      Documentation: gpio: fix typo and unclear legacy API section

Alexandru Ardelean (1):
      gpio: xra1403: remove unneeded spi_set_drvdata()

Andy Shevchenko (26):
      gpiolib: Extract gpiod_not_found() helper
      gpiolib: of: Use named item for enum gpiod_flags variable
      gpiolib: Unify expectations about ->request() returned value
      gpiolib: split error path in gpiod_request_commit()
      gpiolib: Use proper type for bias enumerator in gpio_set_bias()
      gpiolib: Switch to use compat_need_64bit_alignment_fixup() helper
      Merge tag 'intel-pinctrl-v5.10-2' into HEAD
      gpiolib: Replace unsigned by unsigned int
      gpiolib: add missed break statement
      gpiolib: use proper API to pack pin configuration parameters
      gpiolib: Extract gpio_set_config_with_argument() for future use
      gpiolib: move bias related code from gpio_set_config() to gpio_set_bias()
      gpiolib: Extract gpio_set_config_with_argument_optional() helper
      gpiolib: Introduce gpio_set_debounce_timeout() for internal use
      gpiolib: acpi: Respect bias settings for GpioInt() resource
      gpiolib: acpi: Use named item for enum gpiod_flags variable
      gpiolib: acpi: Take into account debounce settings
      gpiolib: acpi: Move non-critical code outside of critical section
      gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
      gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
      gpiolib: acpi: Extract acpi_request_own_gpiod() helper
      gpiolib: acpi: Convert pin_index to be u16
      gpiolib: acpi: Use BIT() macro to increase readability
      gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
      gpio: hisi: Do not require ACPI for COMPILE_TEST
      MAINTAINERS: Remove reference to non-existing file

Bartosz Golaszewski (8):
      gpiolib: devres: shrink devm_gpiochip_add_data_with_key()
      gpio: exar: add a newline after the copyright notice
      gpio: exar: include idr.h
      gpio: exar: switch to a simpler IDA interface
      gpio: exar: use a helper variable for &pdev->dev
      gpio: exar: unduplicate address and offset computation
      gpio: exar: switch to using regmap
      gpio: exar: use devm action for freeing the IDA and drop remove()

Baruch Siach (2):
      gpio: mvebu: update Armada XP per-CPU comment
      gpio: mvebu: switch pwm duration registers to regmap

Damien Le Moal (1):
      gpio: dwapb: Remove unnecessary error message

Daniel Palmer (3):
      dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
      dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
      gpio: msc313: MStar MSC313 GPIO driver

Deepak R Varma (1):
      gpio: 104-idi-48: improve code indentation

Dmitry Osipenko (2):
      gpio: tegra: Add lockdep class
      gpio: tegra: Use raw_spinlock

Enrico Weigelt (1):
      gpio: just plain warning when nonexisting gpio requested

Enrico Weigelt, metux IT consult (4):
      drivers: gpio: bt8xx: prefer dev_err()/dev_warn() over of raw printk
      drivers: gpio: amd8111: prefer dev_err()/dev_info() over raw printk
      drivers: gpio: amd8111: use SPDX-License-Identifier
      gpio: put virtual gpio device into their own submenu

Fabio Estevam (2):
      gpio: mxc: Convert the driver to DT-only
      gpio: mxs: Remove unused .id_table support

Geert Uytterhoeven (4):
      gpio: rcar: Cache gpiochip_get_data() return value
      gpio: rcar: Align register offsets
      gpio: rcar: Rework hardware features handling
      gpio: rcar: Implement gpio_chip.get_multiple()

Greentime Hu (1):
      gpio: sifive: To get gpio irq offset from device tree data

Grygorii Strashko (2):
      gpio: omap: handle deferred probe with dev_err_probe() for
gpiochip_add_data()
      gpiolib: do not print err message for EPROBE_DEFER

Gustavo A. R. Silva (2):
      gpiolib: acpi: Fix fall-through warnings for Clang
      gpio: ath79: Fix fall-through warning for Clang

Kent Gibson (5):
      gpiolib: cdev: document that line eflags are shared
      gpiolib: cdev: add GPIO_V2_LINE_FLAG_EDGE_BOTH and use it in
edge_irq_thread()
      gpiolib: cdev: allow edge event timestamps to be configured as REALTIME
      tools: gpio: add support for reporting realtime event clock to lsgpio
      tools: gpio: add option to report wall-clock time to gpio-event-mon

Linus Walleij (10):
      gpio: Retire the explicit gpio irqchip code
      gpio: stmpe: Fix forgotten refactoring
      Merge branch 'devel' into for-next
      Merge tag 'v5.10-rc4' into devel
      Merge tag 'intel-gpio-v5.11-1' of
gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel
into devel
      gpio: sysfs: Enforce character device
      gpio: sifive: Set affinity callback to parent
      gpio: tegra186: Set affinity callback to parent
      gpio: Add TODO item for debugfs interface
      Merge tag 'gpio-updates-for-v5.11' of
git://git.kernel.org/.../brgl/linux into devel

Luo Jiaxing (2):
      gpio: gpio-hisi: Add HiSilicon GPIO support
      MAINTAINERS: Add maintainer for HiSilicon GPIO driver

Marc Zyngier (1):
      gpiolib: cdev: Flag invalid GPIOs as used

Mike Looijmans (1):
      dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C

Nikita Shubin (1):
      gpiolib: irq hooks: fix recursion in gpiochip_irq_unmask

Sergio Paracuellos (1):
      dt-bindings: mt7621-gpio: convert bindings to YAML format

Srinivas Neeli (6):
      gpio: gpio-xilinx: Arrange headers in sorting order
      dt-bindings: gpio: gpio-xilinx: Add clk support to xilinx soft gpio IP
      gpio: gpio-xilinx: Add clock support
      gpio: gpio-xilinx: Add remove function
      gpio: gpio-xilinx: Check return value of of_property_read_u32
      MAINTAINERS: add fragment for xilinx GPIO drivers

Thierry Reding (1):
      dt-bindings: gpio: Use Tegra186-specific include guard

Vasile-Laurentiu Stanimir (1):
      gpiolib: acpi: Set initial value for output pin based on bias and polarity

Vincent Whitchurch (1):
      gpio: mockup: Allow probing from device tree

Zheng Yongjun (1):
      gpio: cs5535: Simplify the return expression of cs5535_gpio_probe()

 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |   1 +
 .../devicetree/bindings/gpio/gpio-xilinx.txt       |   2 +
 .../bindings/gpio/mediatek,mt7621-gpio.txt         |  35 --
 .../bindings/gpio/mediatek,mt7621-gpio.yaml        |  72 ++++
 .../bindings/gpio/mstar,msc313-gpio.yaml           |  59 +++
 Documentation/driver-api/gpio/consumer.rst         |  18 +-
 Documentation/driver-api/gpio/driver.rst           |  67 +--
 MAINTAINERS                                        |  20 +
 drivers/gpio/Kconfig                               |  30 +-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/TODO                                  |  85 ++--
 drivers/gpio/gpio-104-idi-48.c                     |   6 +-
 drivers/gpio/gpio-amd8111.c                        |  11 +-
 drivers/gpio/gpio-ath79.c                          |   1 +
 drivers/gpio/gpio-bt8xx.c                          |   8 +-
 drivers/gpio/gpio-cs5535.c                         |   8 +-
 drivers/gpio/gpio-dwapb.c                          |   7 +-
 drivers/gpio/gpio-exar.c                           | 155 ++++---
 drivers/gpio/gpio-hisi.c                           | 323 +++++++++++++++
 drivers/gpio/gpio-mockup.c                         |  11 +-
 drivers/gpio/gpio-msc313.c                         | 460 +++++++++++++++++++++
 drivers/gpio/gpio-mvebu.c                          |  71 ++--
 drivers/gpio/gpio-mxc.c                            | 102 +----
 drivers/gpio/gpio-mxs.c                            |  14 -
 drivers/gpio/gpio-omap.c                           |   7 +-
 drivers/gpio/gpio-rcar.c                           |  87 ++--
 drivers/gpio/gpio-sifive.c                         |  25 +-
 drivers/gpio/gpio-stmpe.c                          |  10 +-
 drivers/gpio/gpio-tegra.c                          |  22 +-
 drivers/gpio/gpio-tegra186.c                       |  11 +
 drivers/gpio/gpio-xilinx.c                         |  49 ++-
 drivers/gpio/gpio-xra1403.c                        |  10 +-
 drivers/gpio/gpiolib-acpi.c                        | 139 ++++---
 drivers/gpio/gpiolib-acpi.h                        |   2 +
 drivers/gpio/gpiolib-cdev.c                        |  79 ++--
 drivers/gpio/gpiolib-devres.c                      |  27 +-
 drivers/gpio/gpiolib-of.c                          |  14 +-
 drivers/gpio/gpiolib-sysfs.c                       |   2 +-
 drivers/gpio/gpiolib.c                             | 301 ++++----------
 drivers/gpio/gpiolib.h                             |   4 +
 include/dt-bindings/gpio/msc313-gpio.h             |  53 +++
 include/dt-bindings/gpio/tegra186-gpio.h           |   4 +-
 include/linux/gpio/consumer.h                      |   4 +-
 include/linux/gpio/driver.h                        |  71 ----
 include/uapi/linux/gpio.h                          |  12 +-
 tools/gpio/gpio-event-mon.c                        |   6 +-
 tools/gpio/lsgpio.c                                |   4 +
 47 files changed, 1685 insertions(+), 826 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml
 create mode 100644
Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 create mode 100644 drivers/gpio/gpio-hisi.c
 create mode 100644 drivers/gpio/gpio-msc313.c
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h
