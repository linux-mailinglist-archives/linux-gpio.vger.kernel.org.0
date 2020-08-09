Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA3923FE5B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgHINGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgHINGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:06:21 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE4EC061756
        for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2020 06:06:18 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m15so3316513lfp.7
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2020 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=VmTzzfDBJiSQkMltLCbHrfMBNTVx2GG6UiB8oZglHO4=;
        b=ZQp1lzfYeIQwUbTzwd+S6ONOioYJ1IwTaABGreoxDPlkhohWn0BKKaEkhBoFoHPKeG
         0ZbA/Pd9tN0PcgBw5uKB5FbtWntC1fcYvKIdSwZIkF7gXsAXmtY+Br8p+d3mIznV3Cid
         5dL5CbqxLD78mIzIMmR0Pvy5LdSR9m/B9btOrw9WEq13+SX+zbkeKX+zbrc9IhAcM0rb
         NM0VW+n4pif+uc6JM2iMLYOTAXBDe/ADlRpiqwBD63XLxWlqEfOyjsUBHJM0Innlh+yR
         7o4KlTCscUuSmSqmetItV7TOvxFaCPk8sUrp76xiy63dgWmtvI2Me9iRFWMLsR9pkY7x
         dfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=VmTzzfDBJiSQkMltLCbHrfMBNTVx2GG6UiB8oZglHO4=;
        b=VObSNg/1faVyusOHaEmULL6u6HbFaWB6JLaNssPm95dgMg1KOcLFldjtFYNchlQLFa
         yEc8ME7YCNauCkXAzwdSnRkU9Sxqx9NshDgTR8uOW/X/Tk4Qy8PzteSuhKHBMrYMDBNL
         s3bxtC+AItLvrMjPEgmEhPyjOi5mcfo4T109QKU+51LrSnw1npZCAsesAoRu5Siwp1/B
         wS/CsmpJODHjFz9eiabjigzhtDwqOmEnKZKKYpOsySi+je59qadfLdEeVXBZI/38/47o
         X0nvC1qEvXQSC83QFFHxhbpBE5saIx96reIrd3aRZlu2YLSBzw1VefrIBWg9Xf6IHzXJ
         NcUg==
X-Gm-Message-State: AOAM532hxF0cobkK7TH2EktqrLzSBpnm1hjqMMaAj2UArdNd5HKR8r6p
        2UuxmzAQs8EPnfowL4L5uH5KItkGknP1W8UWVB78YzPmLWhSIw==
X-Google-Smtp-Source: ABdhPJxRs/6nh1/XQdh+o37RlQsV+yyruKnaIS3oVkoSkv+utO+keGCR0h8uIMi2pMzWsufXXLtcR/PwghyMiSd9WN0=
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr10911715lfi.21.1596978370600;
 Sun, 09 Aug 2020 06:06:10 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Aug 2020 15:05:59 +0200
Message-ID: <CACRpkdZyVM32opVPtgPonC0Gqg7YVyCCXryvA66FQbQUELdHjg@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v5.9 kernel cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the big bulk of pin control changes for the v5.9
kernel cycle, nothing is particularly interesting.

I expect you to see two conflicts:

drivers/pinctrl/intel/pinctrl-baytrail.c - no idea what this
is about as both HEAD and mine look the same to human
eyes, I suppose whitespace. Take whichever version you
like.

drivers/pinctrl/pinctrl-single.c - use my version, the
documentation fix shall prevail.

There is a revert I made, it was because I by mistake
merged a GPIO patch to the pin control tree and then
later realized my mistake, but other development
was done on top. Sorry.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407=
:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.9-1

for you to fetch changes up to 7ee193e2dda3f48b692fad46ab9df90e99e7b811:

  dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC
(2020-08-04 01:29:58 +0200)

----------------------------------------------------------------
This is the bulk of the pin control changes for the v5.9
kernel series:

Core changes:

- The GPIO patch "gpiolib: Introduce
  for_each_requested_gpio_in_range() macro" was put in an
  immutable branch and merged into the pinctrl tree as well.
  We see these changes also here.

- Improved debug output for pins used as GPIO.

New drivers:

- Ocelot Sparx5 SoC driver.

- Intel Emmitsburg SoC subdriver.

- Intel Tiger Lake-H SoC subdriver.

- Qualcomm PM660 SoC subdriver.

- Renesas SH-PFC R8A774E1 subdriver.

Driver improvements:

- Linear improvement and cleanups of the Intel drivers for
  Cherryview, Lynxpoint, Baytrail etc. Improved locking among
  other things.

- Renesas SH-PFC has added support for RPC pins, groups, and
  functions to r8a77970 and r8a77980.

- The newere Freescale (now NXP) i.MX8 pin controllers have
  been modularized. This is driven by the Google Android
  GKI initiative I think.

- Open drain support for pins on the Qualcomm IPQ4019.

- The Ingenic driver can handle both edges IRQ detection.

- A big slew of documentation fixes all over the place.

- A few irqchip template conversions by yours truly.

----------------------------------------------------------------
Alexander A. Klimov (2):
      pinctrl: rockchip: Replace HTTP links with HTTPS ones
      pinctl: ti: iodelay: Replace HTTP links with HTTPS ones

Alexandre Torgue (2):
      pinctrl: stm32: return proper error code in pin_config_set
      pinctrl: stm32: add possibility to configure pins individually

Andrew Jeffery (2):
      pinctrl: aspeed: Improve debug output
      pinctrl: aspeed: Describe the heartbeat function on ball Y23

Andy Shevchenko (26):
      gpiolib: Introduce for_each_requested_gpio_in_range() macro
      ARM/orion/gpio: Make use of for_each_requested_gpio()
      gpio: mvebu: Make use of for_each_requested_gpio()
      gpio: xra1403: Make use of for_each_requested_gpio()
      pinctrl: at91: Make use of for_each_requested_gpio()
      pinctrl: cherryview: Introduce chv_readl() helper
      pinctrl: cherryview: Introduce helpers to IO with common registers
      pinctrl: cherryview: Convert chv_writel() to use chv_padreg()
      pinctrl: intel: Allow drivers to define total amount of IRQs per comm=
unity
      pinctrl: intel: Allow drivers to define ACPI address space ID
      pinctrl: cherryview: Re-use data structures from pinctrl-intel.h (par=
t 3)
      pinctrl: intel: Disable input and output buffer when switching to GPI=
O
      pinctrl: intel: Reduce scope of the lock
      pinctrl: intel: Make use of IRQ_RETVAL()
      pinctrl: intel: Get rid of redundant 'else' in intel_config_set_debou=
nce()
      pinctrl: intel: Drop the only label in the code for consistency
      pinctrl: intel: Split intel_config_get() to three functions
      pinctrl: intel: Protect IO in few call backs by lock
      pinctrl: intel: Make use of for_each_requested_gpio_in_range()
      pinctrl: lynxpoint: Make use of for_each_requested_gpio()
      pinctrl: lynxpoint: Introduce helpers to enable or disable input
      pinctrl: lynxpoint: Drop no-op ACPI_PTR() call
      pinctrl: baytrail: Drop no-op ACPI_PTR() call
      pinctrl: merrifield: Update pin names in accordance with official lis=
t
      pinctrl: merrifield: Add I=C2=B2S bus 2 pins to groups and functions
      pinctrl: intel: Add Intel Emmitsburg pin controller support

Andy Teng (1):
      dt-bindings: pinctrl: add bindings for MediaTek MT6779 SoC

Anson Huang (9):
      pinctrl: imx: Support i.MX8 SoCs pinctrl driver built as module
      pinctrl: imx: scu: Support i.MX8 SCU SoCs pinctrl driver built as mod=
ule
      pinctrl: imx8mm: Support building as module
      pinctrl: imx8mn: Support building as module
      pinctrl: imx8mq: Support building as module
      pinctrl: imx8mp: Support building as module
      pinctrl: imx8qxp: Support building as module
      pinctrl: imx8qm: Support building as module
      pinctrl: imx8dxl: Support building as module

Brian Norris (1):
      dt-bindings: pinctrl: qcom: add drive-open-drain to ipq4019

Drew Fustini (6):
      pinctrl-single: fix pcs_parse_pinconf() return value
      pinctrl: single: parse #pinctrl-cells =3D 2
      ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
      pinctrl: single: fix function name in documentation
      gpio: omap: handle pin config bias flags
      pinctrl: core: print gpio in pins debugfs file

Etienne Carriere (2):
      pinctrl: stm32: don't print an error on probe deferral during clock g=
et
      pinctrl: stm32: defer probe if reset resource is not yet ready

Fabien Dessenne (1):
      pinctrl: stm32: use the hwspin_lock_timeout_in_atomic() API

Furquan Shaikh (1):
      pinctrl: amd: Honor IRQ trigger type requested by the caller

Geert Uytterhoeven (1):
      dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to json-schema

Gustavo A. R. Silva (4):
      pinctrl: lpc18xx: Use fallthrough pseudo-keyword
      pinctrl: baytrail: Use fallthrough pseudo-keyword
      pinctrl: qcom: spmi-gpio: Use fallthrough pseudo-keyword
      pinctrl: single: Use fallthrough pseudo-keyword

Hanks Chen (4):
      pinctrl: mediatek: update pinmux definitions for mt6779
      pinctrl: mediatek: avoid virtual gpio trying to set reg
      pinctrl: mediatek: add pinctrl support for MT6779 SoC
      pinctrl: mediatek: add mt6779 eint support

Hans de Goede (1):
      pinctrl: baytrail: Fix pin being driven low for a while on
gpiod_get(..., GPIOD_OUT_HIGH)

Hyeonki Hong (1):
      pinctrl: meson: fix drive strength register and bit calculation

Jaiganesh Narayanan (1):
      pinctrl: qcom: ipq4019: add open drain support

Kathiravan T (1):
      pinctrl: qcom: ipq8074: route gpio interrupts to APPS

Konrad Dybcio (2):
      pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
      Documentation: Document pm660(l) SPMI GPIOs compatible

Lad Prabhakar (1):
      pinctrl: sh-pfc: pfc-r8a77951: Add R8A774E1 PFC support

Lars Povlsen (1):
      pinctrl: ocelot: Add Sparx5 SoC support

Lee Jones (24):
      pinctrl: rza1: Demote some kerneldoc headers and fix others
      pinctrl: actions: pinctrl-owl: Supply missing 'struct
owl_pinctrl' attribute descriptions
      pinctrl: sirf: pinctrl-atlas7: Fix a bunch of documentation misdemean=
ours
      pinctrl: bcm: pinctrl-bcm281xx: Demote obvious misuse of
kerneldoc to standard comment blocks
      pinctrl: bcm: pinctrl-iproc-gpio: Rename incorrectly documented
function param
      pinctrl: qcom: pinctrl-msm: Complete 'struct msm_pinctrl' documentati=
on
      pinctrl: samsung: pinctrl-samsung: Demote obvious misuse of
kerneldoc to standard comment blocks
      pinctrl: samsung: pinctrl-s3c24xx: Fix formatting issues
      pinctrl: samsung: pinctrl-s3c64xx: Fix formatting issues
      pinctrl: qcom: pinctrl-msm8976: Remove unused variable 'nav_tsync_gro=
ups'
      pinctrl: mediatek: pinctrl-mtk-common-v2: Mark
'mtk_default_register_base_names' as __maybe_unused
      pinctrl: core: Fix a bunch of kerneldoc issues
      pinctrl: pinmux: Add some missing parameter descriptions
      pinctrl: devicetree: Add one new attribute description and
rename another two
      pinctrl: pinconf-generic: Add function parameter description 'pctldev=
'
      pinctrl: pinctrl-at91-pio4: PM related attribute descriptions
      pinctrl: pinctrl-at91: Demote non-kerneldoc header and complete anoth=
er
      pinctrl: pinctrl-bm1880: Rename ill documented struct attribute entri=
es
      pinctrl: pinctrl-rockchip: Fix a bunch of kerneldoc misdemeanours
      pinctrl: pinctrl-single: Fix struct/function documentation blocks
      pinctrl: tegra: pinctrl-tegra194: Do not initialise field twice
      pinctrl: meson: pinctrl-meson-a1: Remove unused const variable
'i2c_slave_groups'
      pinctrl: mvebu: pinctrl-armada-37xx: Update documentation block
for 'struct armada_37xx_pin_group'
      pinctrl: pinctrl-amd: Do not define 'struct acpi_device_id' when
!CONFIG_ACPI

Linus Walleij (9):
      Merge branch 'ib-for-each-requested' of /home/linus/linux-gpio into d=
evel
      Merge tag 'sh-pfc-for-v5.9-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'sh-pfc-for-v5.9-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Revert "gpio: omap: handle pin config bias flags"
      Merge tag 'intel-pinctrl-v5.9-1' of
git://git.kernel.org/.../pinctrl/intel into devel
      pinctrl: sx150x: Use irqchip template
      pinctrl: mcp23s08: Use irqchip template
      pinctrl: amd: Use irqchip template
      pinctrl: stmfx: Use irqchip template

Marek Szyprowski (1):
      pinctrl: samsung: Use bank name as irqchip name

Marian-Cristian Rotariu (1):
      dt-bindings: pinctrl: sh-pfc: Document r8a774e1 PFC support

Mark Tomlinson (1):
      pinctrl: nsp: Set irq handler based on trig type

Mika Westerberg (1):
      pinctrl: tigerlake: Add support for Tiger Lake-H

Paul Cercueil (6):
      pinctrl: ingenic: Add NAND FRE/FWE pins for JZ4740
      pinctrl: ingenic: Add ingenic,jz4725b-gpio compatible string
      dt-bindings: pinctrl: Convert ingenic,pinctrl.txt to YAML
      pinctrl: ingenic: Enhance support for IRQ_TYPE_EDGE_BOTH
      pinctrl: ingenic: Properly detect GPIO direction when configured for =
IRQ
      dt-bindings: ingenic,pinctrl: Support pinmux/pinconf nodes

Randy Dunlap (1):
      pinctrl: mediatek: fix build for tristate changes

Sergei Shtylyov (2):
      pinctrl: sh-pfc: r8a77980: Add RPC pins, groups, and functions
      pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions

 .../bindings/pinctrl/ingenic,pinctrl.txt           |   81 -
 .../bindings/pinctrl/ingenic,pinctrl.yaml          |  176 ++
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  202 ++
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |    3 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    2 +
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 .../bindings/pinctrl/renesas,rza2-pinctrl.txt      |   87 -
 .../bindings/pinctrl/renesas,rza2-pinctrl.yaml     |  100 +
 arch/arm/boot/dts/am33xx-l4.dtsi                   |    2 +-
 arch/arm/plat-orion/gpio.c                         |    8 +-
 drivers/gpio/gpio-mvebu.c                          |    8 +-
 drivers/gpio/gpio-xra1403.c                        |    8 +-
 drivers/pinctrl/actions/pinctrl-owl.c              |    4 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |    7 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |   25 +-
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    6 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |   18 +-
 drivers/pinctrl/core.c                             |   33 +-
 drivers/pinctrl/devicetree.c                       |    5 +-
 drivers/pinctrl/freescale/Kconfig                  |   14 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |    2 +
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    5 +
 drivers/pinctrl/freescale/pinctrl-imx8mm.c         |    6 +
 drivers/pinctrl/freescale/pinctrl-imx8mn.c         |    6 +
 drivers/pinctrl/freescale/pinctrl-imx8mp.c         |    6 +
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |    6 +
 drivers/pinctrl/freescale/pinctrl-imx8qm.c         |    5 +
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    5 +
 drivers/pinctrl/freescale/pinctrl-scu.c            |    4 +
 drivers/pinctrl/intel/Kconfig                      |    8 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   74 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  418 ++--
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |  387 ++++
 drivers/pinctrl/intel/pinctrl-intel.c              |  192 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    4 +
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   28 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |   50 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |  358 ++++
 drivers/pinctrl/mediatek/Kconfig                   |   12 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c          |  785 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   26 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    3 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h      | 2085 ++++++++++++++++=
++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    7 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c           |    5 -
 drivers/pinctrl/meson/pinctrl-meson.c              |   11 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |    7 +-
 drivers/pinctrl/pinconf-generic.c                  |    3 +-
 drivers/pinctrl/pinctrl-amd.c                      |   34 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    2 +
 drivers/pinctrl/pinctrl-at91.c                     |   13 +-
 drivers/pinctrl/pinctrl-bm1880.c                   |    4 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |   15 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |   12 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   44 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |  430 +++-
 drivers/pinctrl/pinctrl-rockchip.c                 |   24 +-
 drivers/pinctrl/pinctrl-rza1.c                     |   24 +-
 drivers/pinctrl/pinctrl-single.c                   |   39 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   32 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   44 +-
 drivers/pinctrl/pinmux.c                           |    5 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   19 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    2 +
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    8 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   58 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |    6 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |    6 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    4 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    4 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77951.c              |  877 ++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   76 +
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              |   76 +
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   21 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  138 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c           |    1 -
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |    2 +-
 include/dt-bindings/pinctrl/mt6779-pinfunc.h       | 1242 ++++++++++++
 include/dt-bindings/pinctrl/omap.h                 |    2 +-
 include/linux/gpio/driver.h                        |   16 +
 90 files changed, 7371 insertions(+), 1226 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
 create mode 100644 drivers/pinctrl/intel/pinctrl-emmitsburg.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6779.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
 create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
