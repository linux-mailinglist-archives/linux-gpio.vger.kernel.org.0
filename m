Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2306836F92C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 13:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhD3LYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 07:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhD3LYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 07:24:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE28CC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 04:23:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h36so55406606lfv.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=5Qw3n2HaWZoM6gUQc9abuF+UVkWGFq8qz/kLtQGmw5A=;
        b=hMzPBufGGEtM+Pm8fahujzMnpymPlkbgoXFmZInvtem1JmFkMXXdenm73lf6xS0d4a
         ysZIVChRjMuizmaBTDika27WFEwIGfsPY74zZhO2u586IiFxiFg9lNHh7vhoBGLKFouz
         nm/U2SPNNMvGwY7KxF2jWZvwZs6K+sbXs7iE9sGBjOHDqbniIE3HWq1rk0RB3UqicbKb
         GGLopdkUehrR4r9Tuu7Hf03v0PB9r5/hSY19wydAY1t5ms01p9x/8w2N+dIMJMbjphyY
         DezjO2tCKFXz/C9xpCLyFFouwnrvXp1yLF6WMT+TNtiqDH9vPHhNwl5q4pV4sEU9wg+j
         KVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=5Qw3n2HaWZoM6gUQc9abuF+UVkWGFq8qz/kLtQGmw5A=;
        b=WjZV8+fbVtI8+dvfqBAEE2qVM+AECA3QSB0iLDXZYSoqgr6jEw+Yfl34vJD/d6v18V
         0lXwFqlnaA7y8GyiZ6EyzSp+xqnDRxVwXR83pOQOHhdbTaEDVEfHRKuCQNoLNvqC2KRZ
         ORZCT/PeA9EgBM5TcCz1kaGVNl0Tj3piZjSpV3twt3pyMdCHU2P4KjdXHlAcg7L8AYl+
         jVYhp9/BZ6+rcTJFcssHT+e2gLwRuX9+LQ3h8XTGffF5j51b68B3iT7R1i5W3M2r7Uum
         ws6MDoCTFcLZWXYcOP/xfusgx0rAjai1AYQx1l3ReXTCMfhOqa1L+1HI5/U6DnlJPP/l
         Xing==
X-Gm-Message-State: AOAM532x3ULTApFry8MZ79l7rN5RHH2Uzq+X5zwxiXTrYQ/trQECkJtu
        1E2l98In4jdo4UzDtg16AAll8CNcHj2NJzsWZrWPRA==
X-Google-Smtp-Source: ABdhPJxpzwgqrWwfOOFqWBaYj3BpvCphsv4P8R5AhcOC6epMQ8Gd9pg8FvzoT5I5+RPtnqDiboN2pRf9Jd+BDerOPdA=
X-Received: by 2002:a19:ec13:: with SMTP id b19mr2871361lfa.649.1619781801067;
 Fri, 30 Apr 2021 04:23:21 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Apr 2021 13:23:10 +0200
Message-ID: <CACRpkdZUvurFuE5sJdg4mRmb2MNBR41auOonaoDz5N9VLqD5Vw@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for the v5.13 kernel cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the big pull request with pin control changes for the v5.13
kernel. There is a lot going on! Details are in the signed tag as
usual.

A few patches hit site outside of pin control, and should all be
ACKed by affected maintainers.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15=
:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.13-1

for you to fetch changes up to 8b242ca700f8043be56542efd8360056358a42ed:

  pinctrl: Add Xilinx ZynqMP pinctrl driver support (2021-04-22 11:13:04 +0=
200)

----------------------------------------------------------------
This is the bulk of the pin control changes for the v5.13 kernel cycle

Core changes:

- A semantic change to handle pinmux and pinconf in explicit order
  while up until now we depended on the semantic order in the
  device tree. The device tree is a functional programming
  language and does not imply any order, so the right thing is
  for the pin control core to provide these semantics.

- Add a new pinmux-select debugfs file which makes it possible to
  go in and select functions for a pin manually (iteratively, at
  the prompt) for debugging purposes.

- Fixes to gpio regmap handling for a new pin control driver
  making use of regmap-gpio.

- Use octal permissions on debugfs files.

New drivers:

- A massive rewrite of the former custom pin control driver for
  MIPS Broadcom devices to instead use the pin control subsystem.
  New pin control drivers for BCM6345, BCM6328, BCM6358, BCM6362,
  BCM6368, BCM63268 and BCM6318 SoC variants are implemented.

- Support for PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
  PMR735B in the Qualcomm PMIC GPIO driver. Also the two GPIOs
  on PM8008 are supported.

- Support for the Rockchip RK3568/RK3566 pin controller.

- Support for Ingenic JZ4730, JZ4750, JZ4755, JZ4775 and
  X2000.

- Support for Mediatek MTK8195.

- Add a new Xilinx ZynqMP pin control driver.

Driver improvements and non-urgent fixes:

- Modularization and improvements of the Rockchip drivers.

- Some new pins added to the description of new Renesas SoCs.

- Clarifications of the GPIO base calculation in the Intel driver.

- Fix the function names for the MPP54 and MPP55 pins in the Armada
  CP110 pin controller.

- GPIO wakeup interrupt map for Qualcomm SC7280 and SM8350.

- Support for ACPI probing of the Qualcomm SC8180x.

- Fix interrupt clear status on rockchip

- Fix some missing pins on the Ingenic JZ4770, some semantic
  fixes for the behaviour of the Ingenic pin controller.
  Add DMIC pins for JZ4780, X1000, X1500 and X1830.

- A slew of janitorial like of_node_put() calls.

----------------------------------------------------------------
Andy Shevchenko (6):
      pinctrl: intel: Show the GPIO base calculation explicitly
      pinctrl: intel: No need to disable IRQs in the handler
      pinctrl: core: Fix kernel doc string for pin_get_name()
      pinctrl: Keep enum pin_config_param ordered by name
      pinctrl: Introduce MODE group in enum pin_config_param
      pinctrl: Add PIN_CONFIG_MODE_PWM to enum pin_config_param

Drew Fustini (4):
      pinctrl: use to octal permissions for debugfs files
      pinctrl: pinmux: Add pinmux-select debugfs file
      Documentation: rename pinctl to pin-control
      docs/pinctrl: document debugfs files

Ezequiel Garcia (1):
      dt-bindings: pinctrl: rockchip: add RK3568 SoC support

Fabio Estevam (2):
      pinctrl: imx: Remove unneeded of_match_ptr()
      pinctrl: imx: Disallow driver unbind

Geert Uytterhoeven (7):
      pinctrl: renesas: Make sh_pfc_pin_to_bias_reg() static
      pinctrl: renesas: Move R-Car bias helpers to sh_pfc.h
      pinctrl: renesas: Factor out common R-Mobile bias handling
      pinctrl: renesas: Add PORT_GP_CFG_7 macros
      pinctrl: renesas: Add support for R-Car SoCs with pull-down only pins
      pinctrl: renesas: r8a7791: Add bias pinconf support
      pinctrl: PINCTRL_ROCKCHIP should depend on ARCH_ROCKCHIP

Guru Das Srinagesh (2):
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8008 support
      pinctrl: qcom-pmic-gpio: Add support for pm8008

Hanna Hawa (3):
      pinctrl: pinctrl-single: remove unused variable
      pinctrl: pinctrl-single: remove unused parameter
      pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when
bits_per_mux is not zero

Jia-Ju Bai (1):
      pinctrl: ti: fix error return code of ti_iodelay_probe()

Jianqun Xu (6):
      pinctrl: rockchip: clear int status when driver probed
      kernel/irq: export irq_gc_set_wake
      arm64: remove select PINCTRL_ROCKCHIP from ARCH_ROCKCHIP
      pinctrl: rockchip: make driver be tristate module
      pinctrl: rockchip: add support for rk3568
      pinctrl: rockchip: do coding style for mux route struct

Julian Braha (1):
      drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB

Junlin Yang (3):
      pinctrl: equilibrium: add missing of_node_put
      pinctrl: stm32: add missing of_node_put
      pinctrl: ti: fix error return code of ti_iodelay_dt_node_to_map()

Konstantin Porotchkin (2):
      pinctrl: cp110-system-controller: fix the pin function names
      pinctrl: armada-cp110 - fix MPP54/MPP55 functions

Krzysztof Kozlowski (1):
      pinctrl: samsung: use 'int' for register masks in Exynos

Lina Iyer (1):
      pinctrl: qcom: sm8350: add GPIO wakeup interrupt map

Linus Walleij (5):
      Merge tag 'renesas-pinctrl-for-v5.13-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'intel-pinctrl-v5.13-1' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge branch 'ib-bcm63xx' into devel
      pinctrl: bcm63xx: Fix dependencies
      Merge tag 'renesas-pinctrl-for-v5.13-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel

Marek Vasut (1):
      pinctrl: stm32: Print invalid AF warning inside
stm32_pctrl_is_function_valid()

Maulik Shah (1):
      pinctrl: qcom: sc7280: Add GPIO wakeup interrupt map

Michal Simek (2):
      pinctrl: core: Handling pinmux and pinconf separately
      pinctrl: core: Set ret to 0 when group is skipped

Niklas S=C3=B6derlund (5):
      pinctrl: renesas: r8a77951: Add vin4_g8 and vin5_high8 pins
      pinctrl: renesas: r8a7796: Add vin4_g8 and vin5_high8 pins
      pinctrl: renesas: r8a77990: Add vin4_g8 and vin5_high8 pins
      pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins
      docs: pin-control: Fix error path for control state example

Randy Dunlap (1):
      pinctrl: bcm63xx: Fix More dependencies

Sai Krishna Potthuri (3):
      dt-bindings: pinctrl: Add binding for ZynqMP pinctrl driver
      firmware: xilinx: Add pinctrl support
      pinctrl: Add Xilinx ZynqMP pinctrl driver support

Shawn Guo (1):
      pinctrl: qcom: sc8180x: add ACPI probe support

Tudor Ambarus (1):
      pinctrl: at91-pio4: Fix slew rate disablement

Tzung-Bi Shih (1):
      pinctrl: mediatek: use spin lock in mtk_rmw

Vinod Koul (2):
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and friends
      pinctrl: qcom: spmi-gpio: Add support for PM8350 and friends

Wan Jiabing (1):
      drivers: pinctrl: Remove duplicate include of io.h

Yang Li (1):
      pinctrl: ingenic: add missing call to of_node_put()

Zhiyong Tao (4):
      pinctrl: add lock in mtk_rmw function.
      dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
      pinctrl: add pinctrl driver on mt8195
      pinctrl: add drive for I2C related pins on MT8195

=C3=81lvaro Fern=C3=A1ndez Rojas (23):
      gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
      gpio: regmap: set gpio_chip of_node
      dt-bindings: improve BCM6345 GPIO binding documentation
      pinctrl: bcm: add bcm63xx base code
      dt-bindings: add BCM6328 pincontroller binding documentation
      dt-bindings: add BCM6328 GPIO sysctl binding documentation
      pinctrl: add a pincontrol driver for BCM6328
      dt-bindings: add BCM6358 pincontroller binding documentation
      dt-bindings: add BCM6358 GPIO sysctl binding documentation
      pinctrl: add a pincontrol driver for BCM6358
      dt-bindings: add BCM6362 pincontroller binding documentation
      dt-bindings: add BCM6362 GPIO sysctl binding documentation
      pinctrl: add a pincontrol driver for BCM6362
      dt-bindings: add BCM6368 pincontroller binding documentation
      dt-bindings: add BCM6368 GPIO sysctl binding documentation
      pinctrl: add a pincontrol driver for BCM6368
      dt-bindings: add BCM63268 pincontroller binding documentation
      dt-bindings: add BCM63268 GPIO sysctl binding documentation
      pinctrl: add a pincontrol driver for BCM63268
      dt-bindings: add BCM6318 pincontroller binding documentation
      dt-bindings: add BCM6318 GPIO sysctl binding documentation
      pinctrl: add a pincontrol driver for BCM6318
      pinctrl: bcm: bcm6362: fix warning

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (12):
      pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
      pinctrl: Ingenic: Add support for read the pin configuration of X1830=
.
      pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
      pinctrl: Ingenic: Improve LCD pins related code.
      pinctrl: Ingenic: Add DMIC pins support for Ingenic SoCs.
      pinctrl: Ingenic: Reformat the code.
      dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
      pinctrl: Ingenic: Add pinctrl driver for JZ4730.
      pinctrl: Ingenic: Add pinctrl driver for JZ4750.
      pinctrl: Ingenic: Add pinctrl driver for JZ4755.
      pinctrl: Ingenic: Add pinctrl driver for JZ4775.
      pinctrl: Ingenic: Add pinctrl driver for X2000.

 .../arm/marvell/cp110-system-controller.txt        |    4 +-
 .../devicetree/bindings/gpio/brcm,bcm6345-gpio.txt |   46 -
 .../bindings/gpio/brcm,bcm6345-gpio.yaml           |   86 +
 .../bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml     |  177 +++
 .../bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml    |  194 +++
 .../bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml     |  162 ++
 .../bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml     |  130 ++
 .../bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml     |  236 +++
 .../bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml     |  246 +++
 .../bindings/pinctrl/brcm,bcm6318-pinctrl.yaml     |  143 ++
 .../bindings/pinctrl/brcm,bcm63268-pinctrl.yaml    |  164 ++
 .../bindings/pinctrl/brcm,bcm6328-pinctrl.yaml     |  127 ++
 .../bindings/pinctrl/brcm,bcm6358-pinctrl.yaml     |   93 ++
 .../bindings/pinctrl/brcm,bcm6362-pinctrl.yaml     |  206 +++
 .../bindings/pinctrl/brcm,bcm6368-pinctrl.yaml     |  217 +++
 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
 .../bindings/pinctrl/pinctrl-mt8195.yaml           |  151 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |   14 +
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    1 +
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      |  336 ++++
 Documentation/driver-api/gpio/legacy.rst           |    2 +-
 Documentation/driver-api/index.rst                 |    2 +-
 .../driver-api/{pinctl.rst =3D> pin-control.rst}     |   39 +-
 MAINTAINERS                                        |    2 +-
 arch/arm64/Kconfig.platforms                       |    2 -
 drivers/firmware/xilinx/zynqmp.c                   |  114 ++
 drivers/gpio/gpio-regmap.c                         |    5 +
 drivers/pinctrl/Kconfig                            |   21 +-
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/bcm/Kconfig                        |   62 +
 drivers/pinctrl/bcm/Makefile                       |    7 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c              |  498 ++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c             |  643 ++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c              |  404 +++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c              |  369 +++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c              |  617 ++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c              |  523 ++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |  109 ++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h              |   43 +
 drivers/pinctrl/core.c                             |   39 +-
 drivers/pinctrl/freescale/pinctrl-imx1.c           |    1 +
 drivers/pinctrl/freescale/pinctrl-imx25.c          |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx27.c          |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx35.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx50.c          |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx51.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx53.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-imx6sll.c        |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx7d.c          |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mm.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mn.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mp.c         |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qm.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    2 +-
 drivers/pinctrl/freescale/pinctrl-vf610.c          |    1 +
 drivers/pinctrl/intel/pinctrl-intel.c              |    7 +-
 drivers/pinctrl/mediatek/Kconfig                   |    6 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c           |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c          |  850 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   19 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    7 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h      | 1669 ++++++++++++++++=
++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    2 +
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c       |    4 +-
 drivers/pinctrl/pinconf-generic.c                  |    6 +-
 drivers/pinctrl/pinconf.c                          |    4 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    8 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |   16 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1649 ++++++++++++++++=
+--
 drivers/pinctrl/pinctrl-k210.c                     |    1 -
 drivers/pinctrl/pinctrl-lpc18xx.c                  |    4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  956 +++++------
 drivers/pinctrl/pinctrl-single.c                   |   71 +-
 drivers/pinctrl/pinctrl-zynq.c                     |    4 +-
 drivers/pinctrl/pinctrl-zynqmp.c                   |  906 +++++++++++
 drivers/pinctrl/pinmux.c                           |  106 +-
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c               |    4 +-
 drivers/pinctrl/qcom/Kconfig                       |    4 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |   24 +
 drivers/pinctrl/qcom/pinctrl-sc8180x.c             |  123 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c              |   21 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    7 +
 drivers/pinctrl/renesas/core.c                     |   20 -
 drivers/pinctrl/renesas/core.h                     |    8 -
 drivers/pinctrl/renesas/pfc-r8a73a4.c              |   48 +-
 drivers/pinctrl/renesas/pfc-r8a7740.c              |   46 +-
 drivers/pinctrl/renesas/pfc-r8a7778.c              |    1 -
 drivers/pinctrl/renesas/pfc-r8a7791.c              |  387 ++++-
 drivers/pinctrl/renesas/pfc-r8a7792.c              |    1 -
 drivers/pinctrl/renesas/pfc-r8a77950.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c             |   31 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c              |   31 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c             |   35 +-
 drivers/pinctrl/renesas/pfc-r8a77970.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77990.c             |   35 +-
 drivers/pinctrl/renesas/pfc-r8a77995.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a779a0.c             |    1 -
 drivers/pinctrl/renesas/pfc-sh73a0.c               |   46 +-
 drivers/pinctrl/renesas/pinctrl.c                  |  109 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |   24 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   10 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   18 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |    7 +-
 drivers/soc/tegra/pmc.c                            |    4 +-
 include/dt-bindings/pinctrl/mt8195-pinfunc.h       |  962 +++++++++++
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h       |   19 +
 include/linux/firmware/xlnx-zynqmp.h               |   90 ++
 include/linux/gpio/driver.h                        |    9 +
 include/linux/gpio/regmap.h                        |    4 +
 include/linux/pinctrl/pinconf-generic.h            |   10 +-
 kernel/irq/generic-chip.c                          |    1 +
 121 files changed, 13669 insertions(+), 1076 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpi=
o.txt
 create mode 100644
Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
 rename Documentation/driver-api/{pinctl.rst =3D> pin-control.rst} (97%)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6318.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63268.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6328.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6358.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6362.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6368.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
 create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
