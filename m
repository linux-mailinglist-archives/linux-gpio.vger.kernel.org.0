Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21233FF45E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Sep 2021 21:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347373AbhIBTxs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Sep 2021 15:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhIBTxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Sep 2021 15:53:46 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F74C061575
        for <linux-gpio@vger.kernel.org>; Thu,  2 Sep 2021 12:52:47 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id w4so5668647ljh.13
        for <linux-gpio@vger.kernel.org>; Thu, 02 Sep 2021 12:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=lYcZdmzg8UC6W4pRW9UClWposLz6wZv/+oB9v3R7pT4=;
        b=zzKT5Zo2bnE5ewfwoFJTpJ5ldWEdUgytBRN23kQwfHgXpSwAD0jY5qdUPHCm7wsy4E
         gH4bK55Vg+of4UzGFAXWYi8zLr9pLqLj0vn/o5dYiVRRXF7mp6CgCzD9Dc+gf2aYpoIX
         SrXVabxm63SwHOHRPfZpFGIISavQ2GV5suY1NfeSvzDbKPLva8MKTPBRYlOt72Fi2UNw
         humxC+sv2br4SgekYL0ro1CD2pr1z+3rWhiaVMA/x8bj/Hnp0xrwkm3KrKCNVEyXt/X5
         SIWCQVroxRET+xHTX6zRkWHdZaQV7d7X16KU6a6JWdJjS4W1FU5P6xYAa/3Ob2rUICIn
         836Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=lYcZdmzg8UC6W4pRW9UClWposLz6wZv/+oB9v3R7pT4=;
        b=khLGUJ/L3abx77B/BF/HekNw9K5/BiMzT7UhQ3sD5bTxiBJWslJH6wZG8eifaGLtX4
         hfZrsZag+75sannI77se3mUKgLcOBCXNe8toPtIvFc9GHiZJ2Y987dfs91JlO6a1Jubk
         vMc3a23uEQzWBU8B+nxUPaJAar8LB3PBym5eyffGWLpWYqSZKnj+vRczPYl/JuCFPz0k
         EvN3bBgHiekBz9nphoM7EfQifyVPmq9jWqHfNH6HZQAXcohjcsoobVTrvJ+HUSwlNpBE
         miuRqV6DX89912wfD8iQZ66cot5XXMdrkAtjiFF8D27ui79YoljCVab6JFPBPSIrsqyX
         eKpA==
X-Gm-Message-State: AOAM532ei01I1a6Pe72gSccu74WA0wXniThmqVGJxCVHPxsZMVrbaV77
        7aiJEQIspem6q2xjzZkQRJps3Z3S8OGie764esqHRA==
X-Google-Smtp-Source: ABdhPJzv0ExPwADtjsM7AkLV8pdKsyxN9bOjnWl3OKhQMuHHf+hO+wVtIYK2DX58BvuHRbQpPj29txvgBlMFZK8n8iw=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr3628141ljc.273.1630612366200;
 Thu, 02 Sep 2021 12:52:46 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Sep 2021 21:52:35 +0200
Message-ID: <CACRpkdaQGYoyJ2R1zF2P-S5VMFyPZtySdmNAhuv7KVAjE+o_wg@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v5.15
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

this is the major pull request for the v5.15 kernel cycle.
This is a real low-key and uninteresting set of patches,
with just drivers.

Some two immutable branches are included that may
appear in others trees, one for mediatek device tree
changes and one for rockchip pin control/GPIO changes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3=
:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.15-1

for you to fetch changes up to 04853352952b7dd17f355ed54bd81305b341af55:

  Merge tag 'samsung-pinctrl-5.15' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel (2021-08-17 21:58:41 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.15 kernel cycle,
no core changes at all this time, just driver work!

New drivers:

- New subdriver for Intel Keem Bay (an ARM-based SoC)

- New subdriver for Qualcomm MDM9607 and SM6115

- New subdriver for ST Microelectronics STM32MP135

- New subdriver for Freescale i.MX8ULP ("Ultra Low Power")

- New subdriver for Ingenic X2100

- Support for Qualcomm PMC8180, PMC8180C, SA8155p-adp PMIC GPIO

- Support Samsung Exynos850

- Support Renesas RZ/G2L

Enhancements:

- A major refactoring of the Rockchip driver, breaking part of it out
  to a separate GPIO driver in drivers/gpio

- Pin bias support on Renesas r8a77995

- Add SCI pins support to Ingenic JZ4755 and JZ4760

- Mediatek device tree bindings converted to YAML

----------------------------------------------------------------
Alexandre Torgue (2):
      dt-bindings: pinctrl: stm32: add new compatible for STM32MP135 SoC
      pinctrl: stm32: Add STM32MP135 SoC support

Anson Huang (1):
      pinctrl: imx8ulp: Add pinctrl driver support

Bhupesh Sharma (4):
      dt-bindings: pinctrl: qcom,pmic-gpio: Arrange compatibles alphabetica=
lly
      dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
      pinctrl: qcom/pinctrl-spmi-gpio: Arrange compatibles alphabetically
      pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on
SA8155p-adp

Bjorn Andersson (1):
      pinctrl: qcom: spmi-gpio: Add pmc8180 & pmc8180c

Chen-Yu Tsai (1):
      dt-bindings: pinctrl: mt8195: Use real world values for
drive-strength arguments

Fabio Estevam (4):
      pinctrl: imx8ulp: Initialize pin_reg
      pinctrl: imx8mn: Constify imx_pinctrl_soc_info
      pinctrl: imx8qxp: Constify imx_pinctrl_soc_info
      pinctrl: imx8dxl: Constify imx_pinctrl_soc_info

Geert Uytterhoeven (3):
      pinctrl: renesas: rcar: Avoid changing PUDn when disabling bias
      pinctrl: renesas: r8a77995: Add bias pinconf support
      pinctrl: renesas: Fix pin control matching on R-Car H3e-2G

Hsin-Yi Wang (3):
      arm: dts: mt8135: Move pinfunc to include/dt-bindings/pinctrl
      arm: dts: mt8183: Move pinfunc to include/dt-bindings/pinctrl
      dt-bindings: mediatek: convert pinctrl to yaml

Iskren Chernev (2):
      dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
      drivers: qcom: pinctrl: Add pinctrl driver for sm6115

Jacky Bai (1):
      dt-bindings: pinctrl: imx8ulp: Add pinctrl binding

Jaehyoung Choi (1):
      pinctrl: samsung: Fix pinctrl bank pin count

Jason Wang (1):
      pinctrl: bcm2835: Replace BUG with BUG_ON

Jianqun Xu (9):
      pinctrl/rockchip: always enable clock for gpio controller
      pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
      pinctrl/rockchip: add pinctrl device to gpio bank struct
      dt-bindings: gpio: change items restriction of clock for
rockchip,gpio-bank
      gpio/rockchip: add driver for rockchip gpio
      gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
      gpio/rockchip: support next version gpio controller
      gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
      pinctrl/rockchip: drop the gpio related codes

Jiaxun Yang (1):
      pinctrl: pistachio: Make it as an option

Konrad Dybcio (2):
      dt-bindings: pinctrl: qcom: Add bindings for MDM9607
      pinctrl: qcom: Add MDM9607 pinctrl driver

Lad Prabhakar (2):
      dt-bindings: pinctrl: renesas: Add DT bindings for RZ/G2L pinctrl
      pinctrl: renesas: Add RZ/G2L pin and gpio controller driver

Lakshmi Sowjanya D (2):
      dt-bindings: pinctrl: Add bindings for Intel Keembay pinctrl driver
      pinctrl: Add Intel Keem Bay pinctrl driver

Linus Walleij (5):
      Merge tag 'renesas-pinctrl-for-v5.15-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge branch 'ib-mt8135' into devel
      Merge tag 'renesas-pinctrl-for-v5.15-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge branch 'ib-rockchip' into devel
      Merge tag 'samsung-pinctrl-5.15' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel

Marc Zyngier (1):
      pinctrl: stmfx: Fix hazardous u8[] to unsigned long cast

Marek Beh=C3=BAn (1):
      pinctrl: armada-37xx: Correct PWM pins definitions

Paul Cercueil (3):
      pinctrl: ingenic: Fix incorrect pull up/down info
      pinctrl: ingenic: Fix bias config for X2000(E)
      pinctrl: ingenic: Add .max_register in regmap_config

Randy Dunlap (1):
      pinctrl: aspeed: placate kernel-doc warnings

Sai Krishna Potthuri (3):
      dt-bindings: pinctrl: pinctrl-zynq: Convert to yaml
      dt-bindings: pinctrl-zynq: Replace 'io-standard' with 'power-source'
      pinctrl: pinctrl-zynq: Add support for 'power-source' parameter

Sam Protsenko (2):
      dt-bindings: pinctrl: samsung: Add Exynos850 doc
      pinctrl: samsung: Add Exynos850 SoC specific data

Shyam Sundar S K (1):
      MAINTAINERS: Add maintainers for amd-pinctrl driver

Yang Yingliang (1):
      pinctrl: zynqmp: Drop pinctrl_unregister for devm_ registered device

Zhen Lei (2):
      pinctrl: single: Fix error return code in
pcs_parse_bits_in_pinctrl_entry()
      pinctrl: single: Move test PCS_HAS_PINCONF in
pcs_parse_bits_in_pinctrl_entry() to the beginning

kernel test robot (1):
      pinctrl: mediatek: fix platform_no_drv_owner.cocci warnings

satya priya (2):
      dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio
bindings to YAML
      dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (4):
      pinctrl: Ingenic: Improve the code.
      pinctrl: Ingenic: Add SSI pins support for JZ4755 and JZ4760.
      dt-bindings: pinctrl: Add bindings for Ingenic X2100.
      pinctrl: Ingenic: Add pinctrl driver for X2100.

 .../bindings/gpio/rockchip,gpio-bank.yaml          |    5 +-
 .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml      |   79 +
 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   10 +-
 .../bindings/pinctrl/intel,pinctrl-keembay.yaml    |  135 ++
 .../pinctrl/marvell,armada-37xx-pinctrl.txt        |    8 +-
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  |  206 +++
 .../bindings/pinctrl/mediatek,mt6797-pinctrl.yaml  |  173 ++
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  |  373 +++++
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |  228 +++
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |  156 --
 .../devicetree/bindings/pinctrl/pinctrl-mt6797.txt |   83 -
 .../devicetree/bindings/pinctrl/pinctrl-mt7622.txt |  490 ------
 .../devicetree/bindings/pinctrl/pinctrl-mt8183.txt |  132 --
 .../bindings/pinctrl/pinctrl-mt8195.yaml           |    5 +-
 .../bindings/pinctrl/qcom,mdm9607-pinctrl.yaml     |  133 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  288 ----
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  239 +++
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml      |  179 ++
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  155 ++
 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |    1 +
 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt         |  105 --
 .../bindings/pinctrl/xlnx,zynq-pinctrl.yaml        |  214 +++
 MAINTAINERS                                        |   17 +-
 arch/arm/boot/dts/mt8135.dtsi                      |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    2 +-
 drivers/gpio/Kconfig                               |    8 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-rockchip.c                       |  771 +++++++++
 drivers/pinctrl/Kconfig                            |   24 +-
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |    4 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.c             |    3 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    3 +-
 drivers/pinctrl/freescale/Kconfig                  |    7 +
 drivers/pinctrl/freescale/Makefile                 |    1 +
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mn.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c        |  278 ++++
 drivers/pinctrl/mediatek/pinctrl-mt8365.c          |    1 -
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   16 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |  545 +++++-
 drivers/pinctrl/pinctrl-keembay.c                  | 1731 ++++++++++++++++=
++++
 drivers/pinctrl/pinctrl-rockchip.c                 |  909 +---------
 drivers/pinctrl/pinctrl-rockchip.h                 |  287 ++++
 drivers/pinctrl/pinctrl-single.c                   |   21 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    6 +-
 drivers/pinctrl/pinctrl-zynq.c                     |    2 +
 drivers/pinctrl/pinctrl-zynqmp.c                   |   10 -
 drivers/pinctrl/qcom/Kconfig                       |   17 +
 drivers/pinctrl/qcom/Makefile                      |    2 +
 drivers/pinctrl/qcom/pinctrl-mdm9607.c             | 1087 ++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |  923 +++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   37 +-
 drivers/pinctrl/renesas/Kconfig                    |   11 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/core.c                     |   29 +-
 drivers/pinctrl/renesas/pfc-r8a77995.c             |  320 +++-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 1175 +++++++++++++
 drivers/pinctrl/renesas/pinctrl.c                  |   16 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |    7 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  116 ++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   29 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 drivers/pinctrl/stm32/Kconfig                      |    6 +
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp135.c         | 1679 ++++++++++++++++=
+++
 .../dt-bindings/pinctrl}/mt8135-pinfunc.h          |    0
 .../dt-bindings/pinctrl}/mt8183-pinfunc.h          |    0
 include/dt-bindings/pinctrl/pinctrl-zynq.h         |   17 +
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h        |   23 +
 73 files changed, 11223 insertions(+), 2332 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65x=
x.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt679=
7.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt762=
2.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt818=
3.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpi=
o.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8ulp.c
 create mode 100644 drivers/pinctrl/pinctrl-keembay.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-mdm9607.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp135.c
 rename {arch/arm/boot/dts =3D>
include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)
 rename {arch/arm64/boot/dts/mediatek =3D>
include/dt-bindings/pinctrl}/mt8183-pinfunc.h (100%)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynq.h
 create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h
