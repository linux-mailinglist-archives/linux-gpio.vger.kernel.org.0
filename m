Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A721F101D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 00:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgFGWJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jun 2020 18:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgFGWJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Jun 2020 18:09:04 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BABF0C08C5C4
        for <linux-gpio@vger.kernel.org>; Sun,  7 Jun 2020 15:09:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i27so7134195ljb.12
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2020 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=2tJjJfXlqR8Gzew/kfZEDoK5ReU6gPAIMpj+Y9q3pzc=;
        b=mThXxjdgXBjBsF4XYEhg2FQrCdAvypKQG9FkFbPrcDZGnNax2GEykOH+hQod32L1cT
         bVjcShO2qVG4HWYKCWsHQmgK7uF0YcfuuSdJ19SXZQ60PpT0cVzSj3nomkpexzVK9D/3
         33P+da7G2DZvXfYdEGeRYavFjU7JZ7yhKMEjpnZAnU8VUDsJ/Grkd40LmBkpvQpuoFkt
         E/xj8p6BWP4bMO5UZeAyRE3u49NBEaav2em9SX/TefsrqFmZ7e4fYkSLHTVVT9eJ17Ug
         nMdzc78yLql61qJdsGoO2kPv3yyg2rFYO+rol2ZtpV1u6ZD0tPj4/tQ0zlzu7zTHvvFM
         ndJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=2tJjJfXlqR8Gzew/kfZEDoK5ReU6gPAIMpj+Y9q3pzc=;
        b=d90zbJSpVz2mcFRRIrp5GdjaSiCTzrrOKCalU+TVqN5RuuclnO0e7DxbOvEjaw48iG
         FHbp13ae2toRbNrYMrLSpSF45GcJmwWg5fdvzhX85GFxKsMgurvL3PHUweBrLXCcydMO
         CY7aswhYUxD66+z4NeqUSHW+6axQwtbojTIjD47KrGcdCbKVVBKQvEEP0BHj3Xk+MuLc
         MCR1fad4nzFiYodDG0nlHQN/7tW0Y4N8bM8pUBGTiXMl8yS96WQlLttDT1iDplI/x59M
         qI2lNYj/cgMtJuQ/bZgQlkNvH4xg0RviqLd5L/ZG0fRcdI5Wn9LpwaRuvVBXr3T/MJ5p
         YZTA==
X-Gm-Message-State: AOAM530I5kRzjsKSMSnUmcxK1RkvcoW7N0OlFgKPEg0Twa5NXGy6oasY
        gK+IOjAvAgLzl8A5JV1nIkxuMv+5ONb19TmTyGkeqg==
X-Google-Smtp-Source: ABdhPJygc7ktpbyPc/ZNr8YJxBg73YXmMK3pDIwIwYSM3VuY6J/yUa3BMpcKcN9mz+Xn6Y1w2YQi7WaWAR9dBgblji0=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr9002068ljo.338.1591567740930;
 Sun, 07 Jun 2020 15:09:00 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jun 2020 00:08:50 +0200
Message-ID: <CACRpkdYfwd-4gPbTkQZWybkjLCHOHPi6mVg8fjF--54qj3zcEA@mail.gmail.com>
Subject: [GIT PULL] Pin control bulk changes for the v5.8 cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

this is the bulk of pin control changes for the v5.8 kernel
cycle.

It's just really boring this time. Zero core changes. Just linear
development, cleanups and misc noncritical fixes. Some new
drivers for very new Qualcomm and Intel chips.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136=
:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.8-1

for you to fetch changes up to 94873f6b46f8c103759c28adc121a58022972d01:

  pinctrl: sprd: Fix the incorrect pull-up definition (2020-06-04
00:15:20 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.8
kernel cycle.

New drivers:

- Intel Jasper Lake support.

- NXP Freescale i.MX8DXL support.

- Qualcomm SM8250 support.

- Renesas R8A7742 SH-PFC support.

Driver improvements:

- Severe cleanup and modernization of the MCP23s08 driver.

- Mediatek driver modularized.

- Setting config supported in the Meson driver.

- Wakeup support for the Broadcom BCM7211.

----------------------------------------------------------------
Amelie Delaunay (1):
      pinctrl: stmfx: stmfx_pinconf_set doesn't require to get direction an=
ymore

Andy Shevchenko (23):
      pinctrl: sunrisepoint: Fix PAD lock register offset for SPT-H
      pinctrl: baytrail: Enable pin configuration setting for GPIO chip
      pinctrl: cherryview: Re-use data structures from pinctrl-intel.h (par=
t 2)
      pinctrl: cherryview: Use GENMASK() consistently
      pinctrl: intel: Introduce common flags for GPIO mapping scheme
      pinctrl: cannonlake: Use generic flag for special GPIO base treatment
      pinctrl: icelake: Use generic flag for special GPIO base treatment
      pinctrl: tigerlake: Use generic flag for special GPIO base treatment
      pinctrl: intel: Introduce new flag to force GPIO base to be 0
      pinctrl: intel: Add Intel Jasper Lake pin controller support
      pinctrl: baytrail: Use platform_get_irq_optional() explicitly
      pinctrl: mcp23s08: Get rid of legacy platform data
      pinctrl: mcp23s08: Deduplicate IRQ chip filling
      pinctrl: mcp23s08: Consolidate SPI and I=C2=B2C code
      pinctrl: mcp23s08: Drop unused parameter in mcp23s08_probe_one()
      pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_init()
      pinctrl: mcp23s08: Propagate error code from device_property_read_u32=
()
      pinctrl: mcp23s08: Make use of device properties
      pinctrl: mcp23s08: Use for_each_set_bit() and hweight_long()
      pinctrl: mcp23s08: Split to three parts: core, I=C2=B2C, SPI
      pinctrl: lynxpoint: Use platform_get_irq_optional() explicitly
      pinctrl: intel: Update description in struct intel_community
      pinctrl: intel: Move npins closer to pin_base in struct intel_communi=
ty

Anson Huang (2):
      dt-bindings: arm: fsl-scu: Add imx8dxl pinctrl support
      pinctrl: imx: Add imx8dxl driver

Arnd Bergmann (1):
      pinctrl: mediatek: add pinctrl-mtk-common-v2 module license

Baolin Wang (1):
      pinctrl: sprd: Fix the incorrect pull-up definition

Benjamin Gaignard (1):
      dt-bindings: pinctrl: stm32: Add missing interrupts property

Bjorn Andersson (1):
      dt-bindings: pinctrl: qcom: Add sm8250 pinctrl bindings

Christophe JAILLET (4):
      pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe=
()'
      pinctrl: freescale: imx: Fix an error handling path in
'imx_pinctrl_probe()'
      pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a
resource leak in case of error in 'imx_pinctrl_probe()'
      pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is
unused and broken

Corentin Labbe (1):
      pinctrl: sunxi: handle probe defferal

Dafna Hirschfeld (2):
      pinctrl: rockchip: return ENOMEM instead of EINVAL if allocation fail=
s
      pinctrl: rockchip: fix memleak in rockchip_dt_node_to_map

Dejin Zheng (1):
      pinctrl: fix several typos

Ding Xiang (1):
      pinctrl: nomadik:remove unneeded variable

Florian Fainelli (4):
      dt-bindings: pinctrl: Document 7211 compatible for brcm, bcm2835-gpio=
.txt
      dt-bindings: pinctrl: Document optional BCM7211 wake-up interrupts
      pinctrl: bcm2835: Match BCM7211 compatible string
      pinctrl: bcm2835: Add support for wake-up interrupts

Geert Uytterhoeven (5):
      MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers
      pinctrl: rza1: Fix flag name in comment
      pinctrl: equilibrium: Add architecture dependency
      pinctrl: amd: Add ACPI dependency
      MAINTAINERS: Renesas Pin Controllers are supported

Grace Kao (1):
      pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handl=
er

Jason Yan (3):
      pinctrl: mcp23s08: add module license
      pinctrl: rza1: Fix wrong array assignment of rza1l_swio_entries
      pinctrl: bm1880: add pwm37 to bm1880_pctrl_groups

Johan Jonker (1):
      dt-bindings: pinctrl: rockchip: update example

Jonathan Bakker (2):
      pinctrl: samsung: Correct setting of eint wakeup mask on s5pv210
      pinctrl: samsung: Save/restore eint_mask over suspend for EINT_TYPE G=
PIOs

Lad Prabhakar (2):
      dt-bindings: pinctrl: sh-pfc: Document r8a7742 PFC support
      pinctrl: sh-pfc: r8a7790: Add r8a7742 PFC support

Lars Povlsen (4):
      pinctrl: ocelot: Always register GPIO driver
      pinctrl: ocelot: Remove instance number from pin functions
      pinctrl: ocelot: Fix GPIO interrupt decoding on Jaguar2
      dt-bindings: pinctrl: ocelot: Add Sparx5 SoC support

Light Hsieh (2):
      pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for
buidling loadable module
      pinctrl: mediatek: make MediaTek MT6765 pinctrl ready for
buiding loadable module

Linus Walleij (6):
      pinctrl: ab8505: Define group for GPIO pin 50
      pinctrl: db8500: Fix some old bugs
      Merge tag 'sh-pfc-for-v5.8-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'intel-pinctrl-v5.8-1' of
git://git.kernel.org/.../pinctrl/intel into devel
      Merge tag 'samsung-pinctrl-5.8' of
https://git.kernel.org/.../pinctrl/samsung into devel
      Merge tag 'sh-pfc-for-v5.8-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel

Martin Blumenstingl (2):
      pinctrl: meson: implement the gpio_chip get_direction callback
      pinctrl: meson: wire up the gpio_chip's set_config callback

Paul Cercueil (1):
      pinctrl: ingenic: Add irq_{request,release}_resources callbacks

Rikard Falkeborn (1):
      pinctrl: rk805: Constify rk805_gpio_cfgs

Tiezhu Yang (2):
      pinctrl: Fix return value about devm_platform_ioremap_resource()
      pinctrl: at91-pio4: Add COMPILE_TEST support

Venkata Narendra Kumar Gutta (1):
      pinctrl: qcom: Add sm8250 pinctrl driver.

YueHaibing (1):
      pinctrl: qcom: Remove duplicated include from pinctrl-msm.c

yu kuai (1):
      pinctrl: sirf: add missing put_device() call in sirfsoc_gpio_probe()

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |    6 +-
 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         |    5 +-
 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt       |    4 +-
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml      |  147 +++
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    4 +-
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |    3 +
 MAINTAINERS                                        |    3 +-
 drivers/pinctrl/Kconfig                            |   17 +-
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |   80 +-
 drivers/pinctrl/freescale/Kconfig                  |    7 +
 drivers/pinctrl/freescale/Makefile                 |    1 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |   26 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |  193 +++
 drivers/pinctrl/intel/Kconfig                      |    8 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   10 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |   58 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  282 ++--
 drivers/pinctrl/intel/pinctrl-icelake.c            |   30 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   22 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |   27 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |  344 +++++
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   10 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |   15 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |   32 +-
 drivers/pinctrl/mediatek/Kconfig                   |   13 +-
 drivers/pinctrl/mediatek/Makefile                  |    5 +-
 drivers/pinctrl/mediatek/mtk-eint.c                |    9 +
 drivers/pinctrl/mediatek/pinctrl-mt6765.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   28 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    6 +
 drivers/pinctrl/meson/pinctrl-meson.c              |   14 +
 drivers/pinctrl/nomadik/pinctrl-ab8505.c           |    1 +
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c   |    6 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    4 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    2 +-
 drivers/pinctrl/pinctrl-bm1880.c                   |    1 +
 drivers/pinctrl/pinctrl-ingenic.c                  |   21 +
 drivers/pinctrl/pinctrl-lantiq.c                   |    2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |  514 +-------
 drivers/pinctrl/pinctrl-mcp23s08.h                 |   52 +
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c             |  124 ++
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |  262 ++++
 drivers/pinctrl/pinctrl-ocelot.c                   |  127 +-
 drivers/pinctrl/pinctrl-rk805.c                    |    4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   11 +-
 drivers/pinctrl/pinctrl-rza1.c                     |    4 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    6 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |    2 +-
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c               |    9 -
 drivers/pinctrl/qcom/Kconfig                       |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c              | 1361 ++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   82 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    4 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  744 ++++++-----
 drivers/pinctrl/sh-pfc/pfc-sh7269.c                |    5 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   20 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |    7 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |    2 +-
 drivers/pinctrl/zte/pinctrl-zx.c                   |    2 +-
 include/dt-bindings/pinctrl/pads-imx8dxl.h         |  639 +++++++++
 include/linux/spi/mcp23s08.h                       |   18 -
 72 files changed, 4160 insertions(+), 1321 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8dxl.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-jasperlake.c
 create mode 100644 drivers/pinctrl/pinctrl-mcp23s08.h
 create mode 100644 drivers/pinctrl/pinctrl-mcp23s08_i2c.c
 create mode 100644 drivers/pinctrl/pinctrl-mcp23s08_spi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250.c
 create mode 100644 include/dt-bindings/pinctrl/pads-imx8dxl.h
 delete mode 100644 include/linux/spi/mcp23s08.h
