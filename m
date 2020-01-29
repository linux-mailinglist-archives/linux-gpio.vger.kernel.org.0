Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9617B14C73B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 09:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgA2IIT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 03:08:19 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38998 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgA2IIP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 03:08:15 -0500
Received: by mail-lf1-f68.google.com with SMTP id t23so11205072lfk.6
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XkRdMVwKv/9KvUzFxwYg0W2hfH/t4UqORS36m4RBOac=;
        b=dVRV084tz91H08y/W1Rz55YPretevnrzU6jwSmA9j90Ssgjd4CkAgldxJ6Py1fjutk
         Xw3HxmIbEUYx5qg8WgWm9bFXWvnx42unvmMFgr9y549uuZvcoUSrkwbclnXtxxlOM3x3
         HpByR+smBdAeeItsd9z1zU5gThYR/iprm4QdmkCMOeT5/Hwmto4D+Sk2TwOtc8XVkoKM
         ghXVCW62zQh6IVJHciCsT1e/oYHPRZSz3bOeuly527ZKQFaR/Z2SwO1YBeY+GuuVF34n
         zSlzd8NnMapPlwSYfiC/ABlDdWHKYJ80mB7LA0rg+Q98NM83s+Y8HS6u1XCU8Bz0qRwX
         1Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=XkRdMVwKv/9KvUzFxwYg0W2hfH/t4UqORS36m4RBOac=;
        b=n7QByoW44IsRdESY2Vnih0MeElUste7ZBsOM6CvWPNxWxEadjFSzM5SdtD2FZb/N+s
         XgHWJX2WVNh3gkkWcymg3PrltVw2wuQVIXPNQMp5uw8GJpIQQsH8Q3bLZ+OWqn/8FzOe
         jVWs78MBSL5tX1i5213D4CMUCrLHMwGxtVImfl1ZWJai7MqZJTFIIB787XigApp3j3xD
         sInn82pMV6+2Tgnidp3M1rr+P35uyrxukbQBxwsZx0urlj5aESiuUfeKlmETRLDu7R/I
         OLRsRpKDd74+VVOFZz7F7WPUiFj+uV5qRbfnto8m0Y1xqBNIkInBkmBSuOE+f74h+XCc
         ZaAw==
X-Gm-Message-State: APjAAAWDJxTV/YabhW18BapbnkGLV6gNof6I+5v3gNBE103/jJ0Rx1PP
        HNOR8tUlEMlpRQXw79OMmqwws+juJU94ZFqwPFtvtg==
X-Google-Smtp-Source: APXvYqzIR86t4QWIzXBIDieiwUq/COanEmng+XNaKE9Ear4DeQ+gsxM6/wz45xd6QZueJT54KTxAjPCevfSlK0/QLKI=
X-Received: by 2002:a19:dc14:: with SMTP id t20mr4855539lfg.47.1580285291932;
 Wed, 29 Jan 2020 00:08:11 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Jan 2020 09:08:01 +0100
Message-ID: <CACRpkdYYKS0jMOUu77cudjzOFnHPm3K3aOnmGgUkdVFHz=RSmQ@mail.gmail.com>
Subject: [GIT PULL] GPIO changes for v5.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of the GPIO changes for v5.6.
This is a pretty calm cycle so far, nothing special going
on really. Some more changes will come in from the
irqchip and pin control trees.

I also delete an orphan include file for FMC that was
dangling since I deleted that subsystem through the
GPIO tree it comes here again.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.6-1

for you to fetch changes up to 0282c72d30d32913d641dc81f3f38607ace98802:

  Merge tag 'gpio-updates-for-v5.6-part2' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel
(2020-01-26 01:01:55 +0100)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v5.6 kernel cycle

Core changes:

- Document the usecases for the kernelspace vs userspace
  handling of GPIOs.

- Handle MSI (message signalled interrupts) properly in the
  core hierarchical irqdomain code.

- Fix a rare race condition while initializing the descriptor
  array.

New drivers:

- Xylon LogiCVC GPIO driver.

- WDC934x GPIO controller driver.

Driver improvements:

- Implemented suspend/resume in the Tegra driver.

- MPC8xx edge detection fixup.

- Properly convert ThunderX to use hierarchical irqdomain
  with GPIOLIB_IRQCHIP on top of the revert of the previous
  buggy switchover. This time it works (hopefully).

Misc:

- Drop a FMC remnant file <linux/ipmi-fru.h>

- A slew of fixes.

----------------------------------------------------------------
Andy Shevchenko (2):
      gpio: pca953x: Remove redundant forward declaration
      gpiolib: Make use of assign_bit() API

Bartosz Golaszewski (8):
      gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
      gpiolib: have a single place of calling set_config()
      gpiolib: convert the type of hwnum to unsigned int in gpiochip_get_desc()
      gpiolib: use gpiochip_get_desc() in linehandle_create()
      gpiolib: use gpiochip_get_desc() in lineevent_create()
      gpiolib: use gpiochip_get_desc() in gpio_ioctl()
      gpio: mockup: update the license tag
      gpio: mockup: sort headers alphabetically

Dan Callaghan (1):
      gpiolib: hold gpio devices lock until ->descs array is initialised

Dmitry Osipenko (3):
      gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
      gpio: tegra: Properly handle irq_set_irq_wake() error
      gpio: tegra: Use NOIRQ phase for suspend/resume

Enrico Weigelt, metux IT consult (2):
      gpio: remove unneeded MODULE_VERSION() usage
      gpio: gpiolib: fix confusing indention

Geert Uytterhoeven (2):
      gpiolib: Add GPIOCHIP_NAME definition
      dt-bindings: gpio: rcar: Document r8a77961 support

Jia-Ju Bai (2):
      gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in
grgpio_remove()
      gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in
grgpio_irq_map/unmap()

Kevin Hao (6):
      Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP"
      gpiolib: Add support for the irqdomain which doesn't use irq_fwspec as arg
      gpiolib: Add the support for the msi parent domain
      gpio: thunderx: Switch to GPIOLIB_IRQCHIP
      gpio: Fix the no return statement warning
      gpiolib: Lower verbosity when allocating hierarchy irq

Linus Walleij (6):
      Merge tag 'gpio-updates-for-v5.6-part1' of
git://git.kernel.org/.../brgl/linux into devel
      gpio: Update TODO
      gpio: Add use guidance documentation
      Merge tag 'v5.5-rc6' into devel
      Merge branch 'fixup-thunderx-hierarchy' into devel
      Merge tag 'gpio-updates-for-v5.6-part2' of
git://git.kernel.org/.../brgl/linux into devel

Lukas Bulwahn (1):
      fmc: remove left-over ipmi-fru.h after fmc deletion

Matti Vaittinen (1):
      docs: driver-model: Add missing managed GPIO array get functions

Maxim Kiselev (1):
      gpio: mvebu: clear irq in edge cause register before unmask edge irq

Ooi, Joyce (2):
      gpio: altera: change to platform_get_irq_optional to avoid
false-positive error
      MAINTAINERS: Replace Tien Hock Loh as Altera PIO maintainer

Paul Kocialkowski (4):
      dt-bindings: Add Xylon vendor prefix
      dt-bindings: mfd: Document the Xylon LogiCVC multi-function device
      dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
      gpio: Add support for the Xylon LogiCVC GPIOs

Peng Fan (2):
      gpio: mvebu: use platform_irq_count
      gpio: bcm-kona: use platform_irq_count

Sachin agarwal (2):
      gpio: vx855: fixed a typo
      gpio: aspeed-sgpio: fixed typos

Shaokun Zhang (1):
      gpio: Remove the unused flags

Song Hui (1):
      gpio: mpc8xxx: ls1088a/ls1028a edge detection mode bug fixs.

Srinivas Kandagatla (2):
      dt-bindings: gpio: wcd934x: Add bindings for gpio
      gpio: wcd934x: Add support to wcd934x gpio controller

Stephen Boyd (1):
      gpiolib: Set lockdep class for hierarchical irq domains

Vignesh Raghavendra (1):
      gpio: pca953x: Don't hardcode irq trigger type

YueHaibing (2):
      gpiolib: remove set but not used variable 'config'
      gpiolib: Remove duplicated function gpio_do_set_config()

 .../bindings/gpio/qcom,wcd934x-gpio.yaml           |  47 ++++++
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   3 +-
 .../bindings/gpio/xylon,logicvc-gpio.yaml          |  69 ++++++++
 .../devicetree/bindings/mfd/xylon,logicvc.yaml     |  50 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/driver-api/driver-model/devres.rst   |   2 +
 Documentation/driver-api/gpio/drivers-on-gpio.rst  |   8 +-
 Documentation/driver-api/gpio/index.rst            |   1 +
 Documentation/driver-api/gpio/using-gpio.rst       |  50 ++++++
 MAINTAINERS                                        |   2 +-
 drivers/gpio/Kconfig                               |  13 ++
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/TODO                                  |  46 +++++-
 drivers/gpio/gpio-altera.c                         |   2 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   |   2 +-
 drivers/gpio/gpio-aspeed.c                         |   2 +-
 drivers/gpio/gpio-bcm-kona.c                       |  12 +-
 drivers/gpio/gpio-creg-snps.c                      |   4 +-
 drivers/gpio/gpio-grgpio.c                         |  15 +-
 drivers/gpio/gpio-logicvc.c                        | 170 +++++++++++++++++++
 drivers/gpio/gpio-mockup.c                         |  16 +-
 drivers/gpio/gpio-mpc8xxx.c                        |   1 +
 drivers/gpio/gpio-mvebu.c                          |   8 +-
 drivers/gpio/gpio-pca953x.c                        |   5 +-
 drivers/gpio/gpio-sama5d2-piobu.c                  |   1 -
 drivers/gpio/gpio-tb10x.c                          |   1 -
 drivers/gpio/gpio-tegra.c                          |  21 ++-
 drivers/gpio/gpio-tegra186.c                       |  13 +-
 drivers/gpio/gpio-thunderx.c                       |  36 +++-
 drivers/gpio/gpio-vx855.c                          |   2 +-
 drivers/gpio/gpio-wcd934x.c                        | 121 ++++++++++++++
 drivers/gpio/gpiolib-sysfs.c                       |   7 +-
 drivers/gpio/gpiolib.c                             | 182 ++++++++++-----------
 drivers/gpio/gpiolib.h                             |   5 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |   2 +-
 include/linux/gpio/driver.h                        |  26 ++-
 include/linux/ipmi-fru.h                           | 134 ---------------
 38 files changed, 768 insertions(+), 317 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
 create mode 100644
Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
 create mode 100644 Documentation/driver-api/gpio/using-gpio.rst
 create mode 100644 drivers/gpio/gpio-logicvc.c
 create mode 100644 drivers/gpio/gpio-wcd934x.c
 delete mode 100644 include/linux/ipmi-fru.h
