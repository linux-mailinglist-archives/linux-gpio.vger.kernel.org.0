Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2FF2DC7EB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 21:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgLPUs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 15:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgLPUs1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 15:48:27 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E92C06179C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 12:47:46 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m12so51848530lfo.7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 12:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jBy6SVLYLmkisIAP+C6ugNwJyFajASGfEZYFMLxYX0s=;
        b=yOOcdxXzYy6Vb2zJiOrNvg00v40DDppAeJ0mfVbsxsmH/3NgZpLF54sRm9Tj/WBoVM
         zeJCXy8vCJUllBopwdvSiYL2yTJh5GQjZ6PiDtP6kbWq90MtR+t+bjtVjPqgqJPxgMWB
         JAUneN5IpQzoTyBtJLPe7GvLO2DYqenLQ7QY62o6/Osroz9aeL/BT+QjdjMoDOxnQJfA
         GVIFTiULdul0A8gPBhBSEbLtvqa4fnliQvTCCbitBWuyrE2jtjftq7s/lluswSp+4F8V
         HPRLbmxYEKsUb10dhW2vbySmcu6i4WKUMTufSdQ7CQuN1UziMkuX9VVPb5SBgQGCe7OD
         nGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jBy6SVLYLmkisIAP+C6ugNwJyFajASGfEZYFMLxYX0s=;
        b=Q3/XceN6HN6TONAmL5DHr665jJz5fbWN6JNn73CEgf0b65MChfETM3R9QErqY/i/ms
         Hn2qkooVCPE0uhZ8a8n/GXv+nCzKCui1M89nmrRCISmDYohIj44WyRKUpAPJHLDHHwIv
         Q/95kNQVE4Bo1kzH4xVGEaPcte5gNBw0RbSEbydZlACIWcBA3SdVR70jyzMMtsFyFJjB
         Sbsl4OElXqouWgXQgryGDNkOOuIgYP9Tz2s+GyqvOuKIlh6qkVnGg7v3nXfpLTWILOwo
         YnsGtVV71PQMZiZzaihiHLB5VC+tI04LlD6EGsMLp5fxD1tT9DX578gQLOhQIANrEYAP
         ErfQ==
X-Gm-Message-State: AOAM533mJ5aFgMOO6nzJ8+fsebyvOjJckJ0pHnbwd9VgYwch7eE4CeaV
        e0BmbYqw9saV3UEN/xTatcKcImbqzsVuJAyW5MBBLQ==
X-Google-Smtp-Source: ABdhPJwAdEsAh7drNBXFnJZYBe22qG8k7fboqOwOJ3WyNds/dp1cqoJrd7VFQhvkMNGQU+P2YuhrUYPwBb/QEXBKKAU=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr14252102lja.200.1608151664870;
 Wed, 16 Dec 2020 12:47:44 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Dec 2020 21:47:34 +0100
Message-ID: <CACRpkdZt184k8wpPZZEKwXDUbeO311KB0JOcawZPdhJJuiuYow@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v5.11 kernel cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of pin control changes for the v5.11 kernel cycle.

Drivers, drivers and drivers. Not a single core change.

Some new stuff, especially a bunch of new Intel, Qualcomm and
Ocelot SoCs.

As part of the modularization attempt, I applied one patch affecting
the firmware subsystem as a functional (not syntactic/semantic)
dependency and then it blew up in our face, so I had to revert it,
bummer. It will come in later, through that subsystem, I guess.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.11-1

for you to fetch changes up to 3df09cb8c92e2bdfb78c81f678f6990bd780f09a:

  pinctrl/spear: simplify the return expression of
spear300_pinctrl_probe() (2020-12-12 01:42:06 +0100)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.11 kernel:

New drivers:

- New driver for the Microchip Serial GPIO "SGPIO".

- Qualcomm SM8250 LPASS (Low Power Audio Subsystem) GPIO driver.

New subdrivers:

- Intel Lakefield subdriver.

- Intel Elkhart Lake subdriver.

- Intel Alder Lake-S subdriver.

- Qualcomm MSM8953 subdriver.

- Qualcomm SDX55 subdriver.

- Qualcomm SDX55 PMIC subdriver.

- Ocelot Luton SoC subdriver.

- Ocelot Serval SoC subdriver.

Modularization:

- The Meson driver can now be built as modules.

- The Qualcomm driver(s) can now be built as modules.

Incremental improvements:

- The Intel driver now supports pin configuration for GPIO-related
  configurations.

- A bunch of Renesas PFC drivers have been augmented with support
  for QSPI pins, groups and functions.

- Non-critical fixes to the irq handling in the Allwinner Sunxi
  driver.

----------------------------------------------------------------
Andy Shevchenko (12):
      pinctrl: intel: Fix 2 kOhm bias which is 833 Ohm
      pinctrl: intel: Set default bias in case no particular value given
      pinctrl: intel: Add Intel Lakefield pin controller support
      pinctrl: intel: Add blank line before endif in Kconfig
      pinctrl: intel: Add Intel Elkhart Lake pin controller support
      pinctrl: intel: Add Intel Alder Lake-S pin controller support
      pinctrl: lynxpoint: Unify initcall location in the code
      pinctrl: lynxpoint: Use defined constant for disabled bias explicitly
      pinctrl: lynxpoint: Enable pin configuration setting for GPIO chip
      pinctrl: jasperlake: Unhide SPI group of pins
      pinctrl: merrifield: Set default bias in case no particular value given
      pinctrl: baytrail: Avoid clearing debounce value when turning it off

Biju Das (6):
      pinctrl: renesas: r8a77951: Optimize pinctrl image size for R8A774E1
      pinctrl: renesas: r8a7796: Optimize pinctrl image size for R8A774A1
      pinctrl: renesas: r8a77965: Optimize pinctrl image size for R8A774B1
      pinctrl: renesas: r8a77990: Optimize pinctrl image size for R8A774C0
      pinctrl: renesas: r8a7790: Optimize pinctrl image size for R8A7742
      pinctrl: renesas: r8a7791: Optimize pinctrl image size for R8A774[34]

Coiby Xu (1):
      pinctrl: amd: print debounce filter info in debugfs

Cristian Ciocaltea (1):
      pinctrl: actions: pinctrl-s500: Constify s500_padinfo[]

Eugen Hristev (1):
      pinctrl: at91-pio4: add support for fewer lines on last PIO bank

Evan Green (1):
      pinctrl: jasperlake: Fix HOSTSW_OWN offset

Fabio Estevam (1):
      pinctrl: imx21: Remove the driver

Frank Wunderlich (1):
      pinctrl: mt7622: drop pwm ch7 as mt7622 only has 6 channels

Geert Uytterhoeven (9):
      pinctrl: Remove hole in pinctrl_gpio_range
      pinctrl: renesas: Remove superfluous goto in sh_pfc_gpio_set_direction()
      pinctrl: renesas: Singular/plural grammar fixes
      pinctrl: renesas: Reorder struct sh_pfc_pin to remove hole
      pinctrl: renesas: Optimize sh_pfc_pin_config
      pinctrl: renesas: Factor out common R-Car Gen3 bias handling
      pinctrl: renesas: r8a7778: Use physical addresses for PUPR regs
      pinctrl: renesas: r8a7778: Use common R-Car bias handling
      pinctrl: renesas: Protect GPIO leftovers by CONFIG_PINCTRL_SH_FUNC_GPIO

Gregory CLEMENT (2):
      dt-bindings: pinctrl: ocelot: Add Luton SoC support
      dt-bindings: pinctrl: ocelot: Add Serval SoC support

Gustavo A. R. Silva (1):
      pinctrl: renesas: Fix fall-through warnings for Clang

He Zhe (1):
      pinctrl: core: Add missing #ifdef CONFIG_GPIOLIB

Jeevan Shriram (1):
      pinctrl: qcom: Add SDX55 pincontrol driver

John Stultz (4):
      pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a depenency
rather then a selected config
      pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
      firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a
permenent module
      pinctrl: qcom: Fix msm8953 Kconfig entry to depend on, not
select PINCTRL_MSM

Kaixu Xia (1):
      pinctrl: ocelot: Remove unnecessary conversion to bool

Kevin Hilman (1):
      pinctrl/meson: enable building as modules

Lad Prabhakar (5):
      pinctrl: renesas: r8a7790: Add VIN1-B and VIN2-G pins, groups
and functions
      pinctrl: renesas: r8a77990: Add QSPI[01] pins, groups and functions
      pinctrl: renesas: r8a77951: Add QSPI[01] pins, groups and functions
      pinctrl: renesas: r8a7796: Add QSPI[01] pins, groups and functions
      pinctrl: renesas: r8a77965: Add QSPI[01] pins, groups and functions

Lars Povlsen (7):
      pinctrl: ocelot: Add support for Luton platforms
      pinctrl: ocelot: Add support for Serval platforms
      dt-bindings: pinctrl: Add bindings for pinctrl-microchip-sgpio driver
      pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for
Microsemi Serial GPIO
      pinctrl: pinctrl-microchip-sgpio: Add OF config dependency
      pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)
      dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add irq support

Linus Walleij (6):
      pinctrl: nomadik: db8500: Add more detailed LCD groups
      Merge tag 'renesas-pinctrl-for-v5.11-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
as a permenent module"
      Merge tag 'intel-pinctrl-v5.11-1' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'renesas-pinctrl-for-v5.11-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'samsung-pinctrl-5.11' of
https://git.kernel.org/.../pinctrl/samsung into devel

Martin Kaiser (1):
      pinctrl: pinctrl-at91-pio4: Set irq handler and data in one go

Paul Cercueil (2):
      pinctrl: ingenic: Get rid of repetitive data
      pinctrl: ingenic: Add lcd-8bit group for JZ4770

Rajendra Nayak (2):
      dt-bindings: pinctrl: qcom: Add sc7280 pinctrl bindings
      pinctrl: qcom: Add sc7280 pinctrl driver

Rikard Falkeborn (1):
      pinctrl: renesas: Constify sh73a0_vccq_mc0_ops

Srinivas Kandagatla (2):
      dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
      pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver

Tiezhu Yang (1):
      pinctrl: at91-pio4: Make PINCTRL_AT91PIO4 depend on HAS_IOMEM to
fix build error

Tom Rix (1):
      pinctrl: samsung: s3c24xx: remove unneeded break

Vinod Koul (4):
      dt-bindings: pinctrl: qcom: Add SDX55 pinctrl bindings
      pinctrl: qcom: sdx55: update kconfig dependency
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx55 support
      pinctrl: qcom-pmic-gpio: Add support for pmx55

Vladimir Lypak (2):
      pinctrl: qcom: add pinctrl driver for msm8953
      dt-bindings: pinctrl: qcom: add msm8953 pinctrl bindings

Yangtao Li (3):
      pinctrl: sunxi: fix irq bank map for the Allwinner A100 pin controller
      pinctrl: sunxi: Mark the irq bank not found in
sunxi_pinctrl_irq_handler() with WARN_ON
      pinctrl: sunxi: Always call chained_irq_{enter, exit} in
sunxi_pinctrl_irq_handler

Yu Kuai (1):
      pinctrl: falcon: add missing put_device() call in pinctrl_falcon_probe()

Zheng Yongjun (2):
      pinctrl: mediatek: simplify the return expression of
mtk_pinconf_bias_disable_set_rev1()
      pinctrl/spear: simplify the return expression of spear300_pinctrl_probe()

Zhiyong Tao (1):
      pinctrl: mtk: Fix low level output voltage issue

Zou Wei (1):
      pinctrl: pinctrl-microchip-sgpio: Mark some symbols with static keyword

 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml   |  161 ++
 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt       |    3 +-
 .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   |  130 ++
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml     |  167 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    3 +
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      |  158 ++
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml       |  154 ++
 MAINTAINERS                                        |    1 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pinctrl/Kconfig                            |   20 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/actions/pinctrl-s500.c             |    2 +-
 drivers/pinctrl/core.c                             |    2 +
 drivers/pinctrl/freescale/Kconfig                  |    7 -
 drivers/pinctrl/freescale/Makefile                 |    1 -
 drivers/pinctrl/freescale/pinctrl-imx21.c          |  330 ----
 drivers/pinctrl/intel/Kconfig                      |   25 +
 drivers/pinctrl/intel/Makefile                     |    3 +
 drivers/pinctrl/intel/pinctrl-alderlake.c          |  437 +++++
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    8 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |  513 ++++++
 drivers/pinctrl/intel/pinctrl-intel.c              |   40 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |  452 ++---
 drivers/pinctrl/intel/pinctrl-lakefield.c          |  375 ++++
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   10 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |    8 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c          |   13 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   10 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    8 +-
 drivers/pinctrl/meson/Kconfig                      |   17 +-
 drivers/pinctrl/meson/pinctrl-meson-a1.c           |    4 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c      |    3 +
 drivers/pinctrl/meson/pinctrl-meson-axg.c          |    4 +-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |    4 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |    4 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |    4 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    8 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    1 +
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c         |    2 +
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c   |   10 +-
 drivers/pinctrl/pinctrl-amd.c                      |   43 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   22 +-
 drivers/pinctrl/pinctrl-falcon.c                   |   14 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1267 +++++---------
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |  892 ++++++++++
 drivers/pinctrl/pinctrl-ocelot.c                   |  186 +-
 drivers/pinctrl/qcom/Kconfig                       |   88 +-
 drivers/pinctrl/qcom/Makefile                      |    4 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  695 ++++++++
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    2 +
 drivers/pinctrl/qcom/pinctrl-msm8953.c             | 1844 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sc7280.c              | 1495 ++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sdx55.c               | 1018 +++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    2 +
 drivers/pinctrl/renesas/core.c                     |    2 +
 drivers/pinctrl/renesas/core.h                     |    4 +
 drivers/pinctrl/renesas/gpio.c                     |    2 +-
 drivers/pinctrl/renesas/pfc-r8a7778.c              |   55 +-
 drivers/pinctrl/renesas/pfc-r8a7790.c              |  146 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c              |   18 +
 drivers/pinctrl/renesas/pfc-r8a77950.c             |   45 +-
 drivers/pinctrl/renesas/pfc-r8a77951.c             |  134 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c              |  132 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c             |  132 +-
 drivers/pinctrl/renesas/pfc-r8a77990.c             |  132 +-
 drivers/pinctrl/renesas/pfc-sh73a0.c               |    2 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    1 +
 drivers/pinctrl/renesas/pinctrl.c                  |   68 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |   12 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |    5 -
 drivers/pinctrl/spear/pinctrl-spear300.c           |    8 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c        |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    9 +-
 include/linux/pinctrl/pinctrl.h                    |    4 +-
 74 files changed, 9814 insertions(+), 1775 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
 delete mode 100644 drivers/pinctrl/freescale/pinctrl-imx21.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-alderlake.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-elkhartlake.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-lakefield.c
 create mode 100644 drivers/pinctrl/pinctrl-microchip-sgpio.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8953.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7280.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx55.c
