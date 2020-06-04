Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9E61EED82
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 23:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgFDVvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 17:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgFDVvn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 17:51:43 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E96C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2020 14:51:43 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a25so9233791ljp.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2020 14:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=qMCzLUzDcVuGIj9gFT0hcdo9qNIj7PjrfTm3Vlb6UMY=;
        b=FgBnJm9uS+BGwUupUVQzyE8qlTL0a/HqrdSBwEI46Z1VufXwwxodzBDAZLUHZfoLI8
         O2ENVs6a1nVihwFWr5dPiMHpdm6xcU06vfwmpP996MdphitezjdmkWX11/0PQPUJj3s+
         etAbjipCP1A/ETV4c6YNuaU1+Yjps+fKoBHidLWNbghNJQ62WNFcAUicTfiuehXFf5Xc
         eCMzSq7rUoRBmHuguSNBKiZUiI+S2axIs8F+fJMjj5gkmdtZMJZooCG3CpRHXnhYrX/2
         qBoqPUlkvC40hAafuAuTyIzFpHzYrmiSKKrK0kiuYY0E+WJ2/q8eBZpV0ERJ0YqwTryM
         GwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=qMCzLUzDcVuGIj9gFT0hcdo9qNIj7PjrfTm3Vlb6UMY=;
        b=VEBI72Ovd07ml+siyKOh73pHSuKLo0mJTMHLDoCNUexDTE4AnnKolwLwY+qZMb1B3y
         XFdun58hxdZ/sIib4n1+egJ6gCti6Vw8sFEWdiLtFyyvsFHRqCzrDnI3Lo7tszG/mPed
         afY0KTswm0CA0GGpJV9yya04FBQij1Q07VK4zTD3/1HkSzvmbGEwzQFp+wfXq1wY06TZ
         M0VbzG9Dvdp6GBEOGajXyRrn1TPBeW2ZWYlJ3CVxjvzCIhWWamg00dyVaNmZOAQymILh
         I9QdLa38rU0iqg9SL4L3NPutT+aPpK2aSV4djMw9/M5/lJqN+colCllDkvljcHZC1Ocf
         TFfQ==
X-Gm-Message-State: AOAM5329i95ToY8QSPJBvwqToUIAie6o5stUtWpal4YCqnPec3zwwyJV
        B8tlseYx0SDLYMd87DUbVeYlfhD0K2eN1Pq1ZVBcCyzlhVw=
X-Google-Smtp-Source: ABdhPJy2lA5ZDywhiXOahlFaA/MacgOrpdkhDbUDI0QB514qyTWr6g+1PORt30ybzUiKfj8dKNaHG0K2LH/tTErUQq8=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr2919870ljo.338.1591307501431;
 Thu, 04 Jun 2020 14:51:41 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jun 2020 23:51:30 +0200
Message-ID: <CACRpkdY=R5_g+Vrjtj9tZ=5gxh5qPWqm-yqtFB5GbKC75Yskxg@mail.gmail.com>
Subject: [GIT PULL] Bulk GPIO changes for v5.8
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of GPIO changes for the v5.8 kernel cycle.

Nothing too exciting, details in the signed tag.

Some new functionality was added on top of massive
fixes so that is why I merged in v5.7-rc7 to make it
apply without creating a mess.

Please pull it in!

Med v=C3=A4nlig h=C3=A4lsning,
Linus Walleij

The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145=
:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.8-1

for you to fetch changes up to 74910e15ab25f95f162bc4d4a634d029186543ce:

  gpio: pca953x: Drop unneeded ACPI_PTR() (2020-06-03 14:04:28 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v5.8 kernel cycle.

Core changes:

- A new GPIO aggregator driver has been merged: this can
  join a few select GPIO lines into a new aggregated GPIO
  chip. This can be used for security: a process can be
  granted access to only these lines, for example for
  industrial control. Another way to use this is to
  reexpose certain select lines to a virtual machine or
  container.

- Warn if the gpio-line-names is too long in he DT parser
  core.

- GPIO lines can now be looked up by line name in addition
  to being looked up by offset.

New drivers:

- A new generic regmap GPIO driver has been merged. Too
  many regmap drivers are starting to look like each other
  so we need to create some common ground and try to move
  drivers over to using that.

- The F7188X driver now supports F81865.

Driver improvements:

- Large improvements to the PCA953x expander, get multiple lines
  and several cleanups.

- Large improvements to the DesignWare DWAPB driver, and Sergey
  Semin has volunteered to maintain it.

- PL061 can now be built as a module, this is part of a bigger
  effort to make the ARM platforms more modular.

----------------------------------------------------------------
Adam Ford (1):
      gpiolib: of: improve gpiolib-of support of pull up/down on expanders

Andy Shevchenko (35):
      gpio: Extend TODO to cover code duplication avoidance
      gpio: pch: Use BIT() and GENMASK() where it's appropriate
      gpio: pch: Get rid of unneeded variable in IRQ handler
      gpio: pch: Refactor pch_irq_type() to avoid unnecessary locking
      gpio: pch: Use in pch_irq_type() macros provided by IRQ core
      gpio: merrifield: Switch over to MSI interrupts
      gpio: merrifield: Better show how GPIO and IRQ bases are derived
from hardware
      gpio: dwapb: Append MODULE_ALIAS for platform driver
      gpio: dwapb: Refactor IRQ handler to use bit operations
      gpio: dwapb: Use chained IRQ prologue and epilogue
      gpio: dwapb: set default handler to be handle_bad_irq()
      gpio: dwapb: Deduplicate IRQ resource management
      gpio: dwapb: Convert to use irqd_to_hwirq()
      gpio: dwapb: Use device_get_match_data() to simplify code
      gpio: dwapb: Convert to use IRQ core provided macros
      gpio: dwapb: Switch to more usual pattern of RMW in
dwapb_gpio_set_debounce()
      gpio: dwapb: Drop bogus BUG_ON()s
      gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
      gpio: dwapb: Split out dwapb_get_irq() helper
      gpio: dwapb: Get rid of unnecessary conjunction over 32-bit value
      gpio: dwapb: Amend indentation in some cases
      gpio: pca953x: Rewrite ->get_multiple() function
      gpio: mb86s7x: Use devm_clk_get_optional() to get the input clock
      gpio: mb86s7x: Remove superfluous test for ACPI companion
      gpio: xgene-sb: Drop redundant OF_GPIO dependency
      gpio: xgene-sb: Allow driver to be built with COMPILE_TEST
      gpio: xgene-sb: Drop extra check to call
acpi_gpiochip_request_interrupts()
      gpio: dwapb: Call acpi_gpiochip_free_interrupts() on GPIO chip
de-registration
      gpio: dwapb: avoid error message for optional IRQ
      gpio: dwapb: Don't use IRQ 0 as valid Linux interrupt
      gpio: dwapb: Remove unneeded has_irq member in struct dwapb_port_prop=
erty
      MAINTAINERS: Fix file name for DesignWare GPIO DT schema
      gpio: pca935x: Allow IRQ support for driver built as a module
      gpiolib: Separate GPIO_GET_LINEINFO_WATCH_IOCTL conditional
      gpio: pca953x: Drop unneeded ACPI_PTR()

Bartosz Golaszewski (1):
      gpio: pca953x: disable regmap locking

Brian Masney (1):
      gpio: xgene-sb: set valid IRQ type in to_irq()

Dejin Zheng (2):
      gpio: ftgpio010: Fix small typo
      gpio: mm-lantiq: Fix small typo

Dinghao Liu (1):
      gpio: rcar: Fix runtime PM imbalance on error

Douglas Anderson (2):
      gpio: Document proper return value for gpio drivers
      gpio: Make "offset" and "unsigned int", not just "unsigned"

Geert Uytterhoeven (10):
      gpiolib: Improve kernel messages
      gpiolib: Rename "chip" variables to "gc" in core header file
      gpiolib: Document that GPIO line names are not globally unique
      i2c: i801: Use GPIO_LOOKUP() helper macro
      mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
      gpiolib: Add support for GPIO lookup by line name
      gpio: Add GPIO Aggregator
      docs: gpio: Add GPIO Aggregator documentation
      MAINTAINERS: Add GPIO Aggregator section
      dt-bindings: gpio: Add renesas,em-gio bindings

Hans de Goede (1):
      gpiolib: acpi: Add missing __init(const) markers to initcall-s

Kent Gibson (1):
      tools: gpio: add bias flags to lsgpio

Linus Walleij (5):
      Merge tag 'gpio-updates-for-v5.8-part1' of
git://git.kernel.org/.../brgl/linux into devel
      Merge tag 'intel-gpio-v5.8-1' of
git://git.kernel.org/.../andy/linux-gpio-intel into devel
      Merge branch 'ib-gpio-aggregator' into devel
      Merge tag 'gpio-updates-for-v5.8-part2' of
git://git.kernel.org/.../brgl/linux into devel
      Merge tag 'v5.7-rc7' into devel

Maulik Shah (1):
      gpio: gpiolib: Allow GPIO IRQs to lazy disable

Mian Yousaf Kaukab (1):
      gpio: tegra186: export MODULE_DEVICE_TABLE

Michael Walle (3):
      gpiolib: Introduce gpiochip_irqchip_add_domain()
      gpio: add a reusable generic gpio_chip using regmap
      MAINTAINERS: Add gpio regmap section

Paul Thomas (1):
      gpio: gpio-pca953x, Add get_multiple function

Petteri Jokinen (1):
      gpio-f7188x: Add GPIO support for F81865

Rob Herring (1):
      gpio: pl061: Support building as module

Rodrigo Alencar (1):
      gpio: max730x: bring gpiochip_add_data after port config

Serge Semin (6):
      dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
      dt-bindings: gpio: Add DW GPIO debounce clock property
      dt-bindings: gpio: Add Sergey Semin to DW APB GPIO driver maintainers
      gpio: dwapb: Use optional-clocks interface for APB ref-clock
      gpio: dwapb: Add debounce reference clock support
      MAINTAINERS: Add Segey Semin to maintainers of DW APB GPIO driver

Stephen Boyd (1):
      gpiolib: devprop: Warn if gpio-line-names is too long

Tiezhu Yang (1):
      gpio: pxa: Add COMPILE_TEST support

Uwe Kleine-K=C3=B6nig (2):
      gpio: pca953x: fix handling of automatic address incrementing
      gpio: pca953x: drop unused parameters of pca953x_recalc_addr()

Wei Yongjun (1):
      gpio: mlxbf2: fix return value check in mlxbf2_gpio_get_lock_res()

YueHaibing (1):
      gpio: mlxbf2: remove unused including <linux/version.h>

sachin agarwal (1):
      gpio: ich: fix a typo

 Documentation/admin-guide/gpio/gpio-aggregator.rst | 111 ++++
 Documentation/admin-guide/gpio/index.rst           |   1 +
 .../devicetree/bindings/gpio/renesas,em-gio.yaml   |  70 +++
 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 134 +++++
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |  65 ---
 Documentation/driver-api/gpio/board.rst            |  15 +-
 MAINTAINERS                                        |  16 +-
 drivers/gpio/Kconfig                               |  24 +-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/TODO                                  |   4 +
 drivers/gpio/gpio-aggregator.c                     | 568 +++++++++++++++++=
++++
 drivers/gpio/gpio-dwapb.c                          | 248 ++++-----
 drivers/gpio/gpio-f7188x.c                         |  33 +-
 drivers/gpio/gpio-ftgpio010.c                      |   2 +-
 drivers/gpio/gpio-ich.c                            |   2 +-
 drivers/gpio/gpio-max730x.c                        |  12 +-
 drivers/gpio/gpio-mb86s7x.c                        |  28 +-
 drivers/gpio/gpio-merrifield.c                     |  10 +-
 drivers/gpio/gpio-mlxbf2.c                         |   5 +-
 drivers/gpio/gpio-mm-lantiq.c                      |   2 +-
 drivers/gpio/gpio-pca953x.c                        |  96 ++--
 drivers/gpio/gpio-pch.c                            |  73 +--
 drivers/gpio/gpio-pl061.c                          |   9 +-
 drivers/gpio/gpio-rcar.c                           |   4 +-
 drivers/gpio/gpio-regmap.c                         | 349 +++++++++++++
 drivers/gpio/gpio-tegra186.c                       |   1 +
 drivers/gpio/gpio-xgene-sb.c                       |  14 +-
 drivers/gpio/gpiolib-acpi.c                        |   6 +-
 drivers/gpio/gpiolib-devprop.c                     |   5 +-
 drivers/gpio/gpiolib-of.c                          |  10 +
 drivers/gpio/gpiolib.c                             | 165 ++++--
 drivers/gpio/gpiolib.h                             |  27 +-
 drivers/i2c/busses/i2c-i801.c                      |   6 +-
 drivers/mfd/intel_quark_i2c_gpio.c                 |   1 -
 drivers/mfd/sm501.c                                |  24 +-
 include/linux/gpio/driver.h                        |  48 +-
 include/linux/gpio/machine.h                       |  17 +-
 include/linux/gpio/regmap.h                        |  86 ++++
 include/linux/platform_data/gpio-dwapb.h           |   1 -
 tools/gpio/lsgpio.c                                |  12 +
 40 files changed, 1859 insertions(+), 447 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-aggregator.rst
 create mode 100644 Documentation/devicetree/bindings/gpio/renesas,em-gio.y=
aml
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.=
txt
 create mode 100644 drivers/gpio/gpio-aggregator.c
 create mode 100644 drivers/gpio/gpio-regmap.c
 create mode 100644 include/linux/gpio/regmap.h
