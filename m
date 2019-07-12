Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9773B669A5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2019 11:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfGLJKw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jul 2019 05:10:52 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44105 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGLJKt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jul 2019 05:10:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so1099027lfm.11
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jul 2019 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yZQ8gbno19WFGgJUmmRFpg3PfdS64YfZm85BQb1O8nE=;
        b=gkqJbBpj/GAFCBr7M4p4/dwXgZvgpAbG68yB2uqLpupgRSG8aBVtQU0B1JxlqNAa2v
         PSlj2dTSwRCLCyZNVMbRnvFjgjGPr1L4I9JWKcUWd5LwsVxpULlWZk0lFiTmfWDOgTem
         1TChpZQ+cm2C6xKbZw0v0QPLwbgtEskLr8mdKittL6IlLKf8KydhWnB7RL2y9o/20xgo
         suhB3HXLKxrJlMhZJYi4Zb4zCVHkFsbrMYCqa2cQmtC/IUfIYNLHW7I1EUZRAJ/0PDYl
         1Ia8FPUbyZM023rCXpN8aDir38RDiYdM05jYHYe7XABBtdbMn54roN/ydoEaothx1Tgz
         QajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yZQ8gbno19WFGgJUmmRFpg3PfdS64YfZm85BQb1O8nE=;
        b=Z8UVD4Mp7Fu3eh40v+NvY2+NFBbMIeLb6PedSWj/prHgjwV23i51jedrxVCfWB2uLh
         J9F0cfBNqXCh0BlGlvEjJiH6Xq0GDurPvp/DLbrM2OdQtmixPvmYp5Dou3LdoRXBc0Je
         Oxo3ohaMN7oJFsuofIvpKUN+gMya4el5KNt8zUxK98jG+adz74lw6PkNqVUvQdQpNSoe
         26RNVRJHONNdEKAgicqQ5uwirlN5b854hvK6eNYSCza+Dmqwakqnz/TVdb48eFsSaOXJ
         Ne+k7FxivWQsOMGoOgUGfG1RJ0AKOcp2yL6I82em82GAVSm/aWagxlwaO3UdB/w8AY7s
         qDwQ==
X-Gm-Message-State: APjAAAUS1ysB59otzssL61PW8FQSyp7pThbr+XHY7RCg4MlYwW94tHqt
        vJ6tJ6BuWZjETs9p5p+AsEmKrC1EtqFtiQ/RzJOB2Q==
X-Google-Smtp-Source: APXvYqyUV+jcEs2cbMs6JYt2hsq3RDdxB5cyn3B1r+vreUsaiihJALZz8dVs2yMzq/1FtDXZ2XOisTVRWERwcRK2Vps=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr4345364lfc.60.1562922645621;
 Fri, 12 Jul 2019 02:10:45 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Jul 2019 11:10:34 +0200
Message-ID: <CACRpkdaaO14KOdsPBqjyx+78ohdGJ9Z0YrF+GcG7-geO1w1R8A@mail.gmail.com>
Subject: [GIT PULL] Pin control bulk changes for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of pin control changes for the v5.3 kernel cycle.

This is pretty linear development in pin control, nothing really
stand out. We had a bit of SPDX fuzz with tglx fixing up tags
with scripts at the same time as maintainers were fixing up the
same tags, but I regard that as a one-off and not a good time
for an exercise in "what can be done differently". Let's resolve
the conflicts and move on (I don't know if there will be any,
don't think so.)

Please pull it in! Technical details in the signed tag.

Yours,
Linus Walleij

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.3-1

for you to fetch changes up to 4c105769bf6de29856bf80a4045e6725301c58ce:

  pinctrl: aspeed: Strip moved macros and structs from private header
(2019-07-10 11:19:20 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.3 kernel
cycle:

Core changes:

- Device links can optionally be added between a pin control
  producer and its consumers. This will affect how the system
  power management is handled: a pin controller will not suspend
  before all of its consumers have been suspended. This was
  necessary for the ST Microelectronics STMFX expander and
  need to be tested on other systems as well: it makes sense
  to make this default in the long run. Right now it is
  opt-in per driver.

- Drive strength can be specified in microamps. With decreases
  in silicon technology, milliamps isn't granular enough, let's
  make it possible to select drive strengths in microamps. Right
  now the Meson (AMlogic) driver needs this.

New drivers:

- New subdriver for the Tegra 194 SoC.

- New subdriver for the Qualcomm SDM845.

- New subdriver for the Qualcomm SM8150.

- New subdriver for the Freescale i.MX8MN (Freescale is now a
  product line of NXP).

- New subdriver for Marvell MV98DX1135.

Driver improvements:

- The Bitmain BM1880 driver now supports pin config in
  addition to muxing.

- The Qualcomm drivers can now reserve some GPIOs as taken
  aside and not usable for users. This is used in ACPI systems
  to take out some GPIO lines used by the BIOS so that
  noone else (neither kernel nor userspace) will play with them
  by mistake and crash the machine.

- A slew of refurbishing around the Aspeed drivers (board
  management controllers for servers) in preparation for the
  new Aspeed AST2600 SoC.

- A slew of improvements over the SH PFC drivers as usual.

- Misc cleanups and fixes.

----------------------------------------------------------------
Alexandre Torgue (4):
      pinctrl: stm32: add suspend/resume management
      pinctrl: stm32: Enable suspend/resume for stm32mp157c SoC
      pinctrl: stm32: add lock mechanism for irqmux selection
      dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema

Andrew Jeffery (9):
      dt-bindings: pinctrl: aspeed: Split bindings document in two
      dt-bindings: pinctrl: aspeed: Convert AST2400 bindings to json-schema
      dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema
      MAINTAINERS: Add entry for ASPEED pinctrl drivers
      pinctrl: aspeed: Correct comment that is no longer true
      pinctrl: aspeed: Clarify comment about strapping W1C
      pinctrl: aspeed: Split out pinmux from general pinctrl
      pinctrl: aspeed: Add implementation-related documentation
      pinctrl: aspeed: Strip moved macros and structs from private header

Andy Shevchenko (3):
      pinctrl: baytrail: Use defined macro instead of magic in
byt_get_gpio_mux()
      pinctrl: baytrail: Re-use data structures from pinctrl-intel.h
      pinctrl: baytrail: Use GENMASK() consistently

Anson Huang (3):
      dt-bindings: imx: Correct pinfunc head file path for i.MX8MM
      dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
      pinctrl: freescale: Add i.MX8MN pinctrl driver support

Benjamin Gaignard (2):
      pinctrl: Enable device link creation for pin control
      pinctrl: stmfx: enable links creations

Bjorn Andersson (1):
      pinctrl: qcom: sdm845: Expose ufs_reset as gpio

Charles Keepax (1):
      pinctrl: madera: Fixup SPDX headers

Chris Packham (2):
      dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
      pinctrl: mvebu: Add support for MV98DX1135

Colin Ian King (1):
      dt-bindings: pinctrl: fix spelling mistakes in pinctl documentation

Doug Berger (1):
      pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB

Enrico Weigelt (1):
      gpio: Fix build warnings on undefined struct pinctrl_dev

Florian Fainelli (1):
      dt-bindings: pinctrl: bcm2835-gpio: Document BCM7211 compatible

Geert Uytterhoeven (26):
      pinctrl: sh-pfc: Correct printk level of group reference warning
      pinctrl: sh-pfc: Mark run-time debug code __init
      pinctrl: sh-pfc: Add check for empty pinmux groups/functions
      pinctrl: sh-pfc: Validate pin tables at runtime
      pinctrl: sh-pfc: Rename 2-parameter CPU_ALL_PORT() variant
      pinctrl: sh-pfc: Add SH_PFC_PIN_CFG_PULL_UP_DOWN shorthand
      pinctrl: sh-pfc: Move PIN_NONE to shared header file
      pinctrl: sh-pfc: r8a77970: Remove MMC_{CD,WP}
      pinctrl: sh-pfc: r8a7795-es1: Add TPU pins, groups and functions
      pinctrl: sh-pfc: r8a7795: Add TPU pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add TPU pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add TPU pins, groups and functions
      pinctrl: sh-pfc: Add PORT_GP_27 helper macro
      pinctrl: sh-pfc: r8a7778: Use common PORT_GP_CFG_27() macro
      pinctrl: sh-pfc: Add new non-GPIO helper macros
      pinctrl: sh-pfc: emev2: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7778: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7790: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7795-es1: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7795: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7796: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a77965: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a77990: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: sh73a0: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros
      dt-bindings: pinctrl: pic32: Spelling s/configuraion/configuration/

Guillaume La Roque (6):
      dt-bindings: pinctrl: add a 'drive-strength-microamp' property
      pinctrl: generic: add new 'drive-strength-microamp' property support
      dt-bindings: pinctrl: meson: Add drive-strength-microamp property
      pinctrl: meson: Rework enable/disable bias part
      pinctrl: meson: add support of drive-strength-microamp
      pinctrl: meson: g12a: add DS bank value

Gustavo A. R. Silva (1):
      pinctrl: tb10x: Use flexible-array member and struct_size() helper

Hongwei Zhang (1):
      pinctrl: aspeed: Add SGPM pinmux

Icenowy Zheng (2):
      dt-bindings: pinctrl: add missing compatible string for V3s
      dt-bindings: pinctrl: add compatible string for Allwinner V3 pinctrl

Jerome Brunet (2):
      dt-bindings: pinctrl: meson: add output support in pinconf
      pinctrl: meson: add output support in pinconf

Krishna Yarlagadda (3):
      pinctrl: Add Tegra194 pinctrl DT bindings
      pinctrl: tegra: Support 32 bit register access
      pinctrl: tegra: Add Tegra194 pinmux driver

Lee Jones (2):
      pinctrl: msm: Add ability for drivers to supply a reserved GPIO list
      pinctrl: qcom: sdm845: Provide ACPI support

Linus Walleij (8):
      pinctrl: core: Do not add device links for hogs
      pinctrl: stm32: Add links to consumers
      pinctrl: u300: Fix SPDX tags
      pinctrl: nomadik: Fix SPDX tags
      Merge tag 'sh-pfc-for-v5.3-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge branch 'ib-qcom-acpi' into devel
      pinctrl: Minimize SPDX hamming distance
      pinctrl: aspeed: Fix missed include

Manivannan Sadhasivam (6):
      dt-bindings: pinctrl: Modify pinctrl memory map
      pinctrl: Rework the pinmux handling for BM1880 SoC
      dt-bindings: pinctrl: Document pinconf bindings for BM1880 SoC
      pinctrl: Add pinconf support for BM1880 SoC
      dt-bindings: pinctrl: Document drive strength settings for BM1880 SoC
      pinctrl: Add drive strength support for BM1880 SoC

Masahiro Yamada (5):
      pinctrl: add include guard to pinctrl-state.h
      pinctrl: remove unneeded initializer for list_for_each_entry() iterator
      pinctrl: remove unused pin_is_valid()
      pinctrl: make pinconf.h self-contained
      pinctrl: remove unneeded #ifdef around declarations

Nathan Chancellor (1):
      pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard

Neil Armstrong (5):
      pinctrl: meson: update with SPDX Licence identifier
      dt-bindings: gpio: meson-gxbb-gpio: update with SPDX Licence identifier
      dt-bindings: gpio: meson-gxl-gpio: update with SPDX Licence identifier
      dt-bindings: gpio: meson8-gpio: update with SPDX Licence identifier
      dt-bindings: gpio: meson8b-gpio: update with SPDX Licence identifier

Nicolas Boichat (2):
      pinctrl: mediatek: Add pm_ops to pinctrl-paris
      pinctrl: mediatek: mt8183: Add pm_ops

Prasad Sodagudi (2):
      dt-bindings: pinctrl: qcom: Add SM8150 pinctrl binding
      pinctrl: qcom: Add SM8150 pinctrl driver

Srinivas Ramana (1):
      pinctrl: qcom: Add irq_enable callback for msm gpio

Thierry Reding (2):
      pinctrl: tegra: Set specific GPIO compatible string
      pinctrl: tegra: Add bitmask support for parked bits

Vinod Koul (1):
      dt-bindings: pinctrl: qcom: Document missing gpio nodes

Wen Yang (1):
      pinctrl: rockchip: fix leaked of_node references

Young Xiao (1):
      pinctrl: ns2: Fix potential NULL dereference

YueHaibing (1):
      pinctrl: bcm2835: Fix build error without CONFIG_OF

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    2 +
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   |   81 +
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   |  134 ++
 .../bindings/pinctrl/bitmain,bm1880-pinctrl.txt    |   34 +-
 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         |    3 +
 .../bindings/pinctrl/fsl,imx8mm-pinctrl.txt        |    2 +-
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.txt        |   39 +
 .../bindings/pinctrl/marvell,kirkwood-pinctrl.txt  |   44 +-
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   16 +-
 .../bindings/pinctrl/microchip,pic32-pinctrl.txt   |    2 +-
 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    |  107 ++
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  172 ---
 .../bindings/pinctrl/pinctrl-bindings.txt          |    3 +
 .../bindings/pinctrl/qcom,apq8084-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,ipq8074-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,mdm9615-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,msm8916-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,msm8960-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,msm8994-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,msm8996-pinctrl.txt      |    6 +-
 .../bindings/pinctrl/qcom,msm8998-pinctrl.txt      |   16 +-
 .../bindings/pinctrl/qcom,qcs404-pinctrl.txt       |    6 +-
 .../bindings/pinctrl/qcom,sdm660-pinctrl.txt       |    6 +-
 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt       |    8 +-
 .../bindings/pinctrl/qcom,sm8150-pinctrl.txt       |  190 +++
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |  208 ---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |  264 ++++
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h     |  646 ++++++++
 drivers/pinctrl/aspeed/Makefile                    |    2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |   94 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  127 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  246 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  542 +------
 drivers/pinctrl/aspeed/pinmux-aspeed.c             |   96 ++
 drivers/pinctrl/aspeed/pinmux-aspeed.h             |  735 ++++++++++
 drivers/pinctrl/bcm/Kconfig                        |    6 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    2 +
 drivers/pinctrl/cirrus/pinctrl-cs47l35.c           |    6 +-
 drivers/pinctrl/cirrus/pinctrl-cs47l85.c           |    6 +-
 drivers/pinctrl/cirrus/pinctrl-cs47l90.c           |    6 +-
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |    6 +-
 drivers/pinctrl/cirrus/pinctrl-madera.h            |    6 +-
 drivers/pinctrl/core.c                             |   44 +-
 drivers/pinctrl/freescale/Kconfig                  |    7 +
 drivers/pinctrl/freescale/Makefile                 |    1 +
 drivers/pinctrl/freescale/pinctrl-imx8mn.c         |  348 +++++
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  322 +---
 drivers/pinctrl/mediatek/pinctrl-mt8183.c          |    1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   19 +
 drivers/pinctrl/mediatek/pinctrl-paris.h           |    2 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |   36 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |    8 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |    8 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |  358 +++--
 drivers/pinctrl/meson/pinctrl-meson.h              |   26 +-
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c         |    8 +-
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h         |    8 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |    8 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |    8 +-
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c           |  576 ++++----
 drivers/pinctrl/nomadik/Kconfig                    |    1 +
 drivers/pinctrl/nomadik/pinctrl-ab8500.c           |    5 +-
 drivers/pinctrl/nomadik/pinctrl-ab8505.c           |    5 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    6 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    5 +-
 drivers/pinctrl/pinconf-generic.c                  |    2 +
 drivers/pinctrl/pinctrl-bm1880.c                   |  733 ++++++---
 drivers/pinctrl/pinctrl-coh901.c                   |    2 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    1 +
 drivers/pinctrl/pinctrl-stmfx.c                    |    1 +
 drivers/pinctrl/pinctrl-tb10x.c                    |   12 +-
 drivers/pinctrl/pinctrl-u300.c                     |    1 +
 drivers/pinctrl/qcom/Kconfig                       |   11 +-
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   43 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |   46 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c              | 1548 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/core.c                      |   60 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 |   70 +-
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  125 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |   36 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |  434 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  414 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  414 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |  410 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   26 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              |  181 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |    2 +-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |   21 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |    2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   90 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  184 ++-
 drivers/pinctrl/stm32/pinctrl-stm32.h              |    2 +
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c         |    5 +
 drivers/pinctrl/tegra/Kconfig                      |    4 +
 drivers/pinctrl/tegra/Makefile                     |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   26 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |   12 +-
 drivers/pinctrl/tegra/pinctrl-tegra114.c           |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra124.c           |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c           |  170 +++
 drivers/pinctrl/tegra/pinctrl-tegra20.c            |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra210.c           |   62 +-
 drivers/pinctrl/tegra/pinctrl-tegra30.c            |    4 +-
 include/dt-bindings/gpio/meson-gxbb-gpio.h         |    8 +-
 include/dt-bindings/gpio/meson-gxl-gpio.h          |    8 +-
 include/dt-bindings/gpio/meson8-gpio.h             |    8 +-
 include/dt-bindings/gpio/meson8b-gpio.h            |    8 +-
 include/linux/gpio.h                               |    1 +
 include/linux/gpio/driver.h                        |    2 +
 include/linux/pinctrl/pinconf-generic.h            |   23 +-
 include/linux/pinctrl/pinconf.h                    |    4 +-
 include/linux/pinctrl/pinctrl-state.h              |    5 +
 include/linux/pinctrl/pinctrl.h                    |   19 +-
 include/linux/pinctrl/pinmux.h                     |    4 -
 126 files changed, 7708 insertions(+), 3300 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.h
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8mn.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8150.c
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra194.c
