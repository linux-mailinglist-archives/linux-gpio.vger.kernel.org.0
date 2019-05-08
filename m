Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32022173CC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 10:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfEHI24 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 04:28:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40679 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfEHI24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 04:28:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id d15so16709815ljc.7
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2019 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Li2d49mzUCijRdjBZvZl5BfDZelXl1h8JGrIA0GByPA=;
        b=hQEiu9NwZ9a4IbxhU6owGDpKuil/IxbGA5l+3dGnkJrMWRKyDArU011X4k/LyLnur0
         Xstppkl66cEtx54D/LyMU9iAlJfz/9WED5xVKGAw6xgUDbOl4WNdUz8qwLNvjcNmA8+F
         5nO9XpanANu7X2s9BM5FEN/IxsdH4uu1Z5QoKCduOP0Ccf9VJ/Va8j/sPyPv2G/z5GyY
         PNRG1VlWHkubDDw6MsZN5tSA7TIuZP19Nk+6fLD4GTb7b2ZHqFtbm2CRCddO1ipsiM2P
         OKjGokhvhGZzj0RXBmhSGIHgOx2I+tPDK3PopsDiIXtl6nRx2x019djnYQPw/IN2CAMe
         L7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Li2d49mzUCijRdjBZvZl5BfDZelXl1h8JGrIA0GByPA=;
        b=JRz6IkOktPtwkwTn2LAq1etLaXO5DWi+ka4TQtyN5Z7ikJVMhs44rR8nkQ/GBZsJdR
         ruNWrQuN5wyhUS8Gg2gdXaT3CpFAvEmZgEGQBCNwQFo6l8sCiKKSl9x4d9nhqbgij/fS
         OZQmeSy+MRNluAJMuKaNdfZsRlNcwT0bVOe40jYuRkVFBHsZv/SzMraBOMqlWl8G92qj
         isGJehDs5yL3zUexOh4pytutkqf3Se20LRkoxijT0gKzbNI31ItZhMI+e55Y9ILkBk7g
         LMm6Qq2L3fxGH+9G8vhTCWFTw889+yxCBr5yf3TMNfmMPnKzI6OvWaRNRItNUnIhomjt
         eR3Q==
X-Gm-Message-State: APjAAAWMTshDW3xZ8rkDr+qoYYwa5YuPgg3Av58Udw1EmcJBwkWgvGIM
        dvEE2xFRmIFLfPHwWVH8gXjY5PNzsAoSxTOJ63Ko9A==
X-Google-Smtp-Source: APXvYqwdytMSTAaaAsjidNhN+zTs9tk31m2UbS9Ja2jgOUZBFtflTnWYtm4JdDbQvZvHCWgTW1UuIDhC/4ynh9i5QP0=
X-Received: by 2002:a2e:834d:: with SMTP id l13mr21017713ljh.97.1557304132981;
 Wed, 08 May 2019 01:28:52 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 May 2019 10:28:41 +0200
Message-ID: <CACRpkdYMDCQEhWUGGqKs6SM-TB_dtPtjcAL7RJnLuHu4Wto=kA@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v5.2
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

here is the bulk changes for pin control for this merge window.
It is pretty calm and chill in pin control for the moment. Just incremental
development.

There is an odd patch to the Super-H architecture, it's coming from
the maintainers so should be fine.

More details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b=
:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.2-1

for you to fetch changes up to e0e31695b53b649dc2784c4dd517bcdd09bce189:

  pinctrl: mcp23s08: Do not complain about unsupported params
(2019-05-07 11:47:14 +0200)

----------------------------------------------------------------
Pin control changes for v5.2:

Nex drivers:
- New driver for Bitmain BM1880 pin controller
- New driver for Mediatek MT8516
- New driver for Cirrus Logich Lochnagar PMIC pins

Updates:
- Incremental development on Renesas SH-PFC
- Incremental development on Intel pin controller and some
  particular updates for Cedarfork.
- Pin configuration support in Allwinner SunXi drivers
- Suspend/resume support in the NXP/Freescale i.MX8MQ driver
- Support for more packaging of the ST Micro STM32

----------------------------------------------------------------
Abel Vesa (1):
      pinctrl: imx8mq: Add suspend/resume ops

Aditya Pakki (2):
      pinctrl: baytrail: Fix potential NULL pointer dereference
      pinctrl: axp209: Fix NULL pointer dereference after allocation

Alexandre Torgue (4):
      dt-bindings: pinctrl: stm32: add new entry for package information
      pinctrl: stm32: introduce package support
      pinctrl: stm32: add package information for stm32mp157c
      pinctrl: stm32: align stm32mp157 pin names

Andy Shevchenko (2):
      pinctrl: cedarfork: Update pin names according to v1.13c
      pinctrl: intel: Increase readability of intel_gpio_update_pad_mode()

Anson Huang (1):
      pinctrl: freescale: use devm_platform_ioremap_resource() to simplify =
code

Binbin Wu (1):
      pinctrl: pinctrl-intel: move gpio suspend/resume to noirq phase

Charles Keepax (2):
      pinctrl: lochnagar: Add initial binding documentation
      pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar

Chris Chiu (1):
      pinctrl: intel: Retain HOSTSW_OWN for requested gpio pin

Christina Quast (1):
      dt-bindings: pinctrl: imx7d: Fix PAD_CTL_DSE_X*

Dan Carpenter (1):
      pinctrl: imx: remove an unnecessary NULL check

Fabien Dessenne (1):
      pinctrl: stm32: check irq controller availability at probe

Fabien Parent (2):
      pinctrl: mt65xx: add OF bindings for MT8516
      pinctrl: mediatek: Add MT8516 Pinctrl driver

Fabrizio Castro (2):
      pinctrl: sh-pfc: r8a7796: Move CANFD pin groups and functions
      pinctrl: sh-pfc: r8a77990: Move CANFD pin groups and functions

Geert Uytterhoeven (16):
      pinctrl: sh-pfc: r8a77970: Rename IOCTRLx registers
      pinctrl: sh-pfc: r8a77980: Rename IOCTRLx registers
      pinctrl: sh-pfc: r8a77990: Rename IOCTRLx registers
      pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging
      pinctrl: sh-pfc: Introduce PINCTRL_SH_FUNC_GPIO helper symbol
      pinctrl: sh-pfc: Add missing #include <linux/errno.h>
      sh: sh7786: Add explicit I/O cast to sh7786_mm_sel()
      pinctrl: sh-pfc: Allow compile-testing of all drivers
      pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG() macro
      pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG_VAR() macro
      pinctrl: sh-pfc: Absorb enum IDs in PINMUX_DATA_REG() macro
      pinctrl: sh-pfc: Validate enum IDs for regs with fixed-width fields
      pinctrl: sh-pfc: Validate enum IDs for regs with variable-width field=
s
      pinctrl: rza1: Remove unneeded spinlock acquisitions
      pinctrl: sh-pfc: Improve PINMUX_IPSR_PHYS() documentation
      pinctrl: sh-pfc: r8a77970: Fix spacing

Jan Kundr=C3=A1t (2):
      gpiolib: export devprop_gpiochip_set_names()
      pinctrl: mcp23s08: Do not complain about unsupported params

Linus Walleij (4):
      Merge tag 'sh-pfc-for-v5.2-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      gpiolib: devprop: Fix syntax error
      pinctrl: artpec6: Drop unused function and rename
      Merge tag 'intel-pinctrl-v5.2-1' of
git://git.kernel.org/.../pinctrl/intel into devel

Manivannan Sadhasivam (4):
      dt-bindings: pinctrl: Add BM1880 pinctrl binding
      pinctrl: Add pinctrl support for BM1880 SoC
      MAINTAINERS: Add entry for BM1880 pinctrl
      pinctrl: Rework Kconfig dependency for BM1880 pinctrl driver

Marek Vasut (1):
      pinctrl: sh-pfc: rcar-gen3: Retain TDSELCTRL register across
suspend/resume

Maxime Ripard (4):
      pinctrl: sunxi: implement pin_config_set
      pinctrl: sunxi: Fix variable assignment syntax
      pinctrl: sunxi: Declare set_config on the GPIO chip
      pinctrl: sunxi: Allow to disable pinctrl drivers

Ondrej Jirman (2):
      pinctrl: sunxi: Prepare for alternative bias voltage setting methods
      pinctrl: sunxi: Support I/O bias voltage setting on H6

Sandeep Singh (1):
      pinctrl: Added IRQF_SHARED flag for amd-pinctrl driver

Takeshi Kihara (9):
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit16 when using NFALE and NF=
RB_N
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using
SSI_SCK2 and SSI_WS2
      pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins, groups, and functio=
ns
      pinctrl: sh-pfc: rcar-gen3: Remove CC5_OSCOUT pin
      pinctrl: sh-pfc: rcar-gen3: Rename RTS{0,1,3,4}# pin function definit=
ions
      pinctrl: sh-pfc: rcar-gen3: Rename SEL_ADG_{A,B,C} to SEL_ADG{A,B,C}
      pinctrl: sh-pfc: rcar-gen3: Rename SEL_NDFC to SEL_NDF
      pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups and functions

Ulrich Hecht (2):
      pinctrl: sh-pfc: r8a7779: Add HSCIF0/1 pins
      pinctrl: sh-pfc: r8a7796: Remove placeholder I2C pin data

Wen Yang (4):
      pinctrl: samsung: fix leaked of_node references
      pinctrl: st: fix leaked of_node references
      pinctrl: pistachio: fix leaked of_node references
      pinctrl: zte: fix leaked of_node references

YueHaibing (2):
      pinctrl: fsl: Make pinctrl_ipc_handle static
      pinctrl: artpec6: Make two functions static

Zhiyong Tao (2):
      pinctrl: mt8183: add DT binding document
      pinctrl: add drive for I2C related pins on MT8183

 .../bindings/pinctrl/bitmain,bm1880-pinctrl.txt    |   98 ++
 .../bindings/pinctrl/cirrus,lochnagar.txt          |  141 +++
 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         |    6 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 .../devicetree/bindings/pinctrl/pinctrl-mt8183.txt |  132 +++
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    2 +
 MAINTAINERS                                        |    2 +
 arch/sh/include/cpu-sh4/cpu/sh7786.h               |    2 +-
 drivers/gpio/gpiolib-devprop.c                     |    2 +
 drivers/gpio/gpiolib.h                             |    3 -
 drivers/pinctrl/Kconfig                            |    8 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/cirrus/Kconfig                     |   10 +
 drivers/pinctrl/cirrus/Makefile                    |    2 +
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c         | 1235 ++++++++++++++++=
++++
 drivers/pinctrl/freescale/pinctrl-imx.c            |   25 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |    1 +
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |    1 +
 drivers/pinctrl/freescale/pinctrl-scu.c            |    2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    2 +
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |   18 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   66 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |   11 +-
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8183.c          |   50 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c          |  362 ++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   49 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |   11 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h      | 1182 ++++++++++++++++=
+++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   21 +
 drivers/pinctrl/pinctrl-amd.c                      |    4 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |   19 +-
 drivers/pinctrl/pinctrl-axp209.c                   |    2 +
 drivers/pinctrl/pinctrl-bm1880.c                   |  965 +++++++++++++++
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    3 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    2 +
 drivers/pinctrl/pinctrl-rza1.c                     |   18 +-
 drivers/pinctrl/pinctrl-st.c                       |   15 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |  204 ++--
 drivers/pinctrl/sh-pfc/Makefile                    |   15 +
 drivers/pinctrl/sh-pfc/core.c                      |  130 +++
 drivers/pinctrl/sh-pfc/gpio.c                      |    8 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 |   67 +-
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |   64 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |   56 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              |  136 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  101 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c               |  235 +++-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  132 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |  156 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               |  134 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |  127 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |  222 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  201 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  225 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |  294 +++--
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |  123 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              |  135 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              |  214 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |  120 +-
 drivers/pinctrl/sh-pfc/pfc-sh7203.c                |  152 +--
 drivers/pinctrl/sh-pfc/pfc-sh7264.c                |  232 ++--
 drivers/pinctrl/sh-pfc/pfc-sh7269.c                |  252 ++--
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |   52 +-
 drivers/pinctrl/sh-pfc/pfc-sh7720.c                |  144 +--
 drivers/pinctrl/sh-pfc/pfc-sh7722.c                |  220 ++--
 drivers/pinctrl/sh-pfc/pfc-sh7723.c                |  200 ++--
 drivers/pinctrl/sh-pfc/pfc-sh7724.c                |  204 ++--
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |  140 ++-
 drivers/pinctrl/sh-pfc/pfc-sh7757.c                |  244 ++--
 drivers/pinctrl/sh-pfc/pfc-sh7785.c                |  136 +--
 drivers/pinctrl/sh-pfc/pfc-sh7786.c                |   80 +-
 drivers/pinctrl/sh-pfc/pfc-shx3.c                  |   32 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   68 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  105 +-
 drivers/pinctrl/stm32/pinctrl-stm32.h              |   14 +
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c         | 1089 +++++++++-------=
-
 drivers/pinctrl/sunxi/Kconfig                      |   57 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   96 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   18 +-
 drivers/pinctrl/zte/pinctrl-zx.c                   |    1 +
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |    6 +
 include/linux/gpio/driver.h                        |    3 +
 88 files changed, 8120 insertions(+), 3012 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt818=
3.txt
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8516.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h
 create mode 100644 drivers/pinctrl/pinctrl-bm1880.c
