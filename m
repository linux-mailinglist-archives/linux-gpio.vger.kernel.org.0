Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B44414C78E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 09:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgA2Idi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 03:33:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37552 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgA2Idi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 03:33:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id v17so17496352ljg.4
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 00:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=uF89ZOVbSUW69p7B6m8WJR/8cWtmTHd1PrtCuMBzdXI=;
        b=R/u9azcTl+DGupC8/CjwKz3v5x01jxH6uTAtggx+wjukx1boRoZhdgDiN35HjCVB3k
         yKR1MWYHP5I352RVe9+L8IiOcW7EirEyAj5i8R+bOcqWc5lbrgzqzwPSp5ocxO+067m4
         ktsLi5JH0H7DivSWNoDP++bOHD3Fyk+GRVOTzgoQXYNUW0yIJFp0svAo/JmO6bFGMAo6
         inYZJjtEUV5dozDWl0wfm8EhDX4rEd2yrwyU1o0KiCp97SVpIFKTc/yeLBGoHR/i3opX
         VvqIKSCf/cFbMxB1L1NtkSmrr2gMEvC8x3Qqh8l+V4IWVK2ZJZSijGoM+yRZp00Cb9FL
         OySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=uF89ZOVbSUW69p7B6m8WJR/8cWtmTHd1PrtCuMBzdXI=;
        b=r9P/TAFxwwMYNsa/foxHuM/eiPE59sDVFc3HVm7zxJxgPUaaDSz46uaWhZ+Sc9N05x
         Pb/HBSGBFae6mdI4U8zGhI02YR2yDV8uFS9M7YoUOA8cL/1aSPS2yC+f4fTaxkQlrYjs
         VyztDX7hRwfBP7I8RUud+BBJg394Bh5dTOTPO2JpIDkJnrQ8s2877M7Ve9zY7OnB2v4J
         mr8NOsahRJeOUQRgmqM9Qg42angsZB6xlNpJhav0yR4UfIeYUth2BQSfDUG+QScd0iMD
         g5wSiJcCHpDapJFifhdKlcjtPHi6iKzrc6VNqKTXXk1soYds6g+k1H7PZ+SPbh2VUWvH
         yjZw==
X-Gm-Message-State: APjAAAWTVo/M97ZXMnK9ErDV3tQv9DNLap0luL1QYreezimVlhiXoYpF
        po4+71pKSbYzDrNSmv1vO++2/eAbXVXjkrw6AoDLk6OQawXbcQ==
X-Google-Smtp-Source: APXvYqzkKtapc1PfWAsmDSzwPAtKNZyY44hIqed2cgRqMIp40xGMdpTevktjiH8FbZPtB7g+4X0SX/4edadlgM6fWEA=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr16351913ljc.39.1580286815112;
 Wed, 29 Jan 2020 00:33:35 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Jan 2020 09:33:24 +0100
Message-ID: <CACRpkdYOsqTh51Ta4UR1c77zpu2Vstri5wCQRVYb1iV9Kkt5Aw@mail.gmail.com>
Subject: [GIT PULL] Pin control bulk changes for the v5.6 kernel cycle
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

here is the bulk of pin control changes for v5.6, nothing too
exciting about this.

Some changes hit arch/sh and arch/arm but are well isolated
and acknowledged by the respective arch maintainers.

The major details are in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46=
:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.6-1

for you to fetch changes up to 122ce22cb37b087e7e28ebb16044a622b0a22233:

  pinctrl: madera: Remove extra blank line (2020-01-24 00:31:41 +0100)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.6 kernel cycle:

Core changes:

- Dropped the chained IRQ setup callback into GPIOLIB as we
  got rid of the last users of that in this changeset.

New drivers:

- New driver for Ingenic X1830.

- New driver for Freescale i.MX8MP.

Driver enhancements:

- Fix all remaining Intel drivers to pass their IRQ chips
  along with the GPIO chips.

- Intel Baytrail allocates its irqchip dynamically.

- Intel Lynxpoint is thoroughly rewritten and modernized.

- Aspeed AST2600 pin muxing and configuration is much
  improved.

- Qualcomm SC7180 functions are updated and wakeup interrupt
  map is provided.

- A whole slew of Renesas SH-PFC cleanups and improvements.

- Fix up the Intel DT bindings to use the generic YAML
  DT bindings schema. (A first user of this.)

----------------------------------------------------------------
Andrew Jeffery (1):
      dt-bindings: pinctrl: aspeed-g6: Add USB functions and groups

Andy Shevchenko (31):
      pinctrl: baytrail: Allocate IRQ chip dynamic
      pinctrl: baytrail: Group GPIO IRQ chip initialization
      pinctrl: baytrail: Move IRQ valid mask initialization to a
dedicated callback
      pinctrl: intel: Share struct intel_pinctrl for wider use
      pinctrl: baytrail: Keep pointer to struct device instead of its conta=
iner
      pinctrl: baytrail: Use local variable to keep device pointer
      pinctrl: baytrail: Reuse struct intel_pinctrl in the driver
      pinctrl: lynxpoint: Move GPIO driver to pin controller folder
      pinctrl: lynxpoint: Use raw_spinlock for locking
      pinctrl: lynxpoint: Correct amount of pins
      pinctrl: lynxpoint: Drop useless assignment
      pinctrl: lynxpoint: Use %pR to print IO resource
      pinctrl: lynxpoint: Use standard pattern for memory allocation
      pinctrl: lynxpoint: Assume 2 bits for mode selector
      pinctrl: lynxpoint: Relax GPIO request rules
      pinctrl: lynxpoint: Keep pointer to struct device instead of its cont=
ainer
      pinctrl: lynxpoint: Switch to memory mapped IO accessors
      pinctrl: lynxpoint: Convert unsigned to unsigned int
      pinctrl: lynxpoint: Extract lp_gpio_acpi_use() for future use
      pinctrl: lynxpoint: Move ->remove closer to ->probe()
      pinctrl: lynxpoint: Move lp_irq_type() closer to IRQ related routines
      pinctrl: lynxpoint: Move ownership check to IRQ chip
      pinctrl: lynxpoint: Implement ->irq_ack() callback
      pinctrl: lynxpoint: Implement intel_gpio_get_direction callback
      pinctrl: lynxpoint: Add pin control data structures
      pinctrl: lynxpoint: Reuse struct intel_pinctrl in the driver
      pinctrl: lynxpoint: Add pin control operations
      pinctrl: lynxpoint: Implement ->pin_dbg_show()
      pinctrl: lynxpoint: Add GPIO <-> pin mapping ranges via callback
      pinctrl: lynxpoint: Switch to pin control API
      pinctrl: lynxpoint: Update summary in the driver

Anson Huang (2):
      dt-bindings: imx: Add pinctrl binding doc for i.MX8MP
      pinctrl: freescale: Add i.MX8MP pinctrl driver support

Ben Dooks (Codethink) (4):
      pinctrl: tegra: fix missing __iomem in suspend/resume
      pinctrl: actions: remove duplicate dsi entry
      pinctrl: qcom: make 'm_voc_groups' static
      pinctrl: artpec6: fix __iomem on reg in set

Boyan Ding (1):
      pinctrl: sunrisepoint: Add missing Interrupt Status register offset

Charles Keepax (1):
      pinctrl: madera: Remove extra blank line

Chris Brandt (1):
      pinctrl: rza1: Reduce printed messages

Geert Uytterhoeven (10):
      pinctrl: sh-pfc: Make legacy function GPIO handling less fragile
      pinctrl: sh-pfc: Remove use of ARCH_R8A7796
      pinctrl: sh-pfc: r8a77965: Fix DU_DOTCLKIN3 drive/bias control
      pinctrl: sh-pfc: r8a7778: Fix duplicate SDSELF_B and SD1_CLK_B
      pinctrl: sh-pfc: sh7264: Fix Port K I/O Register 0 definition
      pinctrl: sh-pfc: sh7264: Fix CAN function GPIOs
      pinctrl: sh-pfc: sh7269: Fix CAN function GPIOs
      sh: sh7264: Remove bogus SSU GPIO function definitions
      sh: sh7269: Remove bogus SSU GPIO function definitions
      pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers

Hamish Martin (1):
      pinctrl: iproc: Set irq handler based on trig type

Hans de Goede (3):
      pinctrl: Allow modules to use pinctrl_[un]register_mappings
      pinctrl: baytrail: Do not clear IRQ flags on direct-irq enabled pins
      pinctrl: baytrail: Replace WARN with dev_info_once when setting
direct-irq pin to output

Johnny Huang (6):
      pinctrl: aspeed-g6: Add AST2600 I3C1 and I3C2 pinmux config
      pinctrl: aspeed-g6: Add support for the AST2600 USB pinmux
      pinctrl: aspeed: Add ASPEED_SB_PINCONF() helper
      pinctrl: aspeed: Move aspeed_pin_config_map to separate source file
      pinctrl: aspeed: Use masks to describe pinconf bitfields
      pinctrl: aspeed-g6: Add AST2600 pinconf support

Julia Lawall (3):
      pinctrl: ssbi-mpp: constify copied structure
      pinctrl: qcom: ssbi-gpio: constify copied structure
      pinctrl: nuvoton: npcm7xx: constify copied structure

Krzysztof Kozlowski (3):
      pinctrl: samsung: Enable compile test for build coverage
      pinctrl: samsung: Clarify the option titles/names
      pinctrl: samsung: Fix missing OF and GPIOLIB dependency on
S3C24xx and S3C64xx

Linus Walleij (10):
      Merge branch 'ib-pinctrl-default-state' into devel
      Merge tag 'v5.5-rc3' into devel
      Merge branch 'ib-pinctrl-unreg-mappings' into devel
      Merge tag 'sh-pfc-for-v5.6-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: intel: Add GPIO <-> pin mapping ranges via callback
      pinctrl: intel: Pass irqchip when adding gpiochip
      pinctrl: dt-bindings: Fix some errors in the lgm and pinmux schema
      Merge tag 'samsung-pinctrl-5.6' of
https://git.kernel.org/.../pinctrl/samsung into devel
      Merge tag 'intel-pinctrl-v5.6-1' of
git://git.kernel.org/.../pinctrl/intel into devel
      gpio: Drop the chained IRQ handler assign function

Ma Feng (1):
      pinctrl: armada-37xx: Remove unneeded semicolon

Martin Blumenstingl (1):
      pinctrl: meson: meson8b: add the GPIOH pinmux settings for ETH_RXD{2,=
3}

Matti Vaittinen (3):
      pinctrl: baytrail: Use GPIO direction definitions
      pinctrl: cherryview: Use GPIO direction definitions
      pinctrl: intel: Use GPIO direction definitions

Maulik Shah (1):
      pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map

Mika Westerberg (2):
      pinctrl: sunrisepoint: Add Coffee Lake-S ACPI ID
      pinctrl: tigerlake: Tiger Lake uses _HID enumeration

Nishad Kamdar (3):
      pinctrl: mediatek: Use the correct style for SPDX License Identifier
      pinctrl: meson-axg: Use the correct style for SPDX License Identifier
      pinctrl: stm32: Use the correct style for SPDX License Identifier

Paul Cercueil (5):
      pinctrl: ingenic: Remove platform ID table
      pinctrl: ingenic: Put ingenic_chip_info pointer in match data
      pinctrl: ingenic: Remove duplicated ingenic_chip_info structures
      pinctrl: ingenic: Factorize irq_set_type function
      pinctrl: ingenic: Use devm_platform_ioremap_resource()

Peng Fan (2):
      pinctrl: sunxi: sun50i-h5 use platform_irq_count
      pinctrl: mvebu: armada-37xx: use use platform api

Rahul Tanwar (1):
      dt-bindings: pinctrl: intel: Update to use generic bindings

Rajendra Nayak (2):
      dt-bindings: pinctrl: qcom: Add new qup functions for sc7180
      pinctrl: qcom: sc7180: Add new qup functions

Rayagonda Kokatanur (1):
      pinctrl: iproc: Use platform_get_irq_optional() to avoid error messag=
e

Stephen Boyd (1):
      pinctrl: qcom: Don't lock around irq_set_irq_wake()

Ulf Hansson (1):
      pinctrl: core: Add pinctrl_select_default_state() and export it

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (5):
      pinctrl: Ingenic: Fix bugs in X1000 and X1500.
      pinctrl: Ingenic: Add missing parts for X1000 and X1500.
      pinctrl: Ingenic: Introduce reg_offset and use it instead hard code.
      dt-bindings: pinctrl: Add bindings for Ingenic X1830.
      pinctrl: Ingenic: Add pinctrl driver for X1830.

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |   9 +-
 .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       |  69 ++
 .../bindings/pinctrl/ingenic,pinctrl.txt           |   8 +-
 .../devicetree/bindings/pinctrl/intel,lgm-io.yaml  |  75 ++
 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 116 ---
 .../devicetree/bindings/pinctrl/pinmux-node.yaml   |   2 +-
 .../bindings/pinctrl/qcom,sc7180-pinctrl.txt       |   5 +-
 Documentation/driver-api/gpio/driver.rst           |   5 -
 MAINTAINERS                                        |   1 -
 arch/arm/mach-u300/core.c                          |   2 +-
 arch/sh/include/cpu-sh2a/cpu/sh7264.h              |   6 -
 arch/sh/include/cpu-sh2a/cpu/sh7269.h              |  17 +-
 drivers/gpio/Kconfig                               |   8 -
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/gpio-lynxpoint.c                      | 471 ----------
 drivers/gpio/gpio-mt7621.c                         |   3 +-
 drivers/gpio/gpio-xgs-iproc.c                      |   3 +-
 drivers/gpio/gpiolib.c                             |  25 +-
 drivers/pinctrl/actions/pinctrl-s700.c             |   1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 170 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 212 ++---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         | 387 +++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  50 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  38 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h             |   1 +
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |  10 +-
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |   1 -
 drivers/pinctrl/core.c                             |  74 +-
 drivers/pinctrl/core.h                             |   4 -
 drivers/pinctrl/devicetree.c                       |   4 +-
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx8mp.c         | 345 ++++++++
 drivers/pinctrl/intel/Kconfig                      |  13 +
 drivers/pinctrl/intel/Makefile                     |   1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           | 311 ++++---
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   5 +-
 drivers/pinctrl/intel/pinctrl-intel.c              | 101 +--
 drivers/pinctrl/intel/pinctrl-intel.h              |  44 +
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          | 975 +++++++++++++++++=
++++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |   2 +
 drivers/pinctrl/intel/pinctrl-tigerlake.c          | 547 ++++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h      |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h      |   2 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |   7 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |  16 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |   2 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |   2 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 637 +++++++++-----
 drivers/pinctrl/pinctrl-rza1.c                     |   4 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   5 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |   2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |  78 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |   2 +-
 drivers/pinctrl/samsung/Kconfig                    |  16 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |  12 +-
 drivers/pinctrl/sh-pfc/Makefile                    |   4 +-
 drivers/pinctrl/sh-pfc/core.c                      |  57 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |  11 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |   4 +-
 .../sh-pfc/{pfc-r8a7795-es1.c =3D> pfc-r8a77950.c}   |  26 +-
 .../sh-pfc/{pfc-r8a7795.c =3D> pfc-r8a77951.c}       |  39 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |   6 +-
 drivers/pinctrl/sh-pfc/pfc-sh7264.c                |  33 +-
 drivers/pinctrl/sh-pfc/pfc-sh7269.c                |  39 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   4 +-
 drivers/pinctrl/stm32/pinctrl-stm32.h              |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c          |  13 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   4 +-
 include/linux/gpio/driver.h                        |   5 -
 include/linux/pinctrl/consumer.h                   |   6 +
 include/linux/pinctrl/machine.h                    |   5 +
 73 files changed, 3379 insertions(+), 1798 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-io.=
yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 delete mode 100644 drivers/gpio/gpio-lynxpoint.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8mp.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-lynxpoint.c
 rename drivers/pinctrl/sh-pfc/{pfc-r8a7795-es1.c =3D> pfc-r8a77950.c} (99%=
)
 rename drivers/pinctrl/sh-pfc/{pfc-r8a7795.c =3D> pfc-r8a77951.c} (99%)
