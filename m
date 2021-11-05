Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993A6446193
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 10:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbhKEJwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 05:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbhKEJwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 05:52:46 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7C4C061714
        for <linux-gpio@vger.kernel.org>; Fri,  5 Nov 2021 02:50:07 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id s19-20020a056830125300b0055ad9673606so11022514otp.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Nov 2021 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=6wn/L7/SSOhEC1CvL6qpAc+L8JOU1SQHvHQXVt2hgdI=;
        b=hlk46Ule8jDc0kHPpvMjrplvYrsNRmNQGi8r/epX8JG/m/iySnRWU4dM1JQzvu2EyO
         T1BdKsnwMrMyBbBWE41IMzLT1wyP8AoJ4x6BYAEnxynEsJDKZchWqKOMtHAxiCr6Jfp5
         mP6WnqHQweE3Phxmbp+GhHc5kJGZJKgjmS/spwvPzvuM2RnS2oSUfH/jI3QccfgXhzhh
         FCiKCzQ9Loa3jIbAXud7vesZ6IakPCBlOsuXymE+krhTrKZ2gJNdU5vEJXnkdljztFn/
         iL+QX2cLpqpb0DZq4qrL5GTR1pIJEhMLHXfnLw/1SrpBEyPfZIXquqIIPZZciffY+qds
         XlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=6wn/L7/SSOhEC1CvL6qpAc+L8JOU1SQHvHQXVt2hgdI=;
        b=DJylGV6uXVO0SDz64jxBTurSctPJcLkgfrZVtAhWnTw3Zn0R3SOe3nwXbXyLxz/bcC
         XlBkBtLDJM6vPuZga7ov0tOOnxIo5Ken4ssvvlOYbIfSrvPeWVbU07PYPWkXZPEYASXd
         oVUo6daahvOpgKElrBVm7lOzt2GO6ykCVG1Fj6CzLs6o4YdP2WG9P5awMb4b/farrzYx
         0Tj2DX7XaDAZ8kWkWwLuNg6U3ZkudgyCVeD3EZTGHjADDnoJvMSmZzn+QnV2fh7t5xO3
         rz8KyHi2t/LGfF3Q0Ut160lb2Kbr89TwtR3XiM2htT/Hua3wxzBCIW1IUWvu5ou72GFj
         eLpQ==
X-Gm-Message-State: AOAM530ug7ggMYm1uQXn8kgFvE03LmumYaHbLJR+MPYUsdSG3walC843
        tzMs3+40y2FwGnaZsfEE/f4YDxr23jKVe5Yg8DCNgIi+a3TGGg==
X-Google-Smtp-Source: ABdhPJx3DMMB+58/dyKZwFRuLmXcKJP5SQvzh+M+qBwz56yovBbYQc5ZStHSiwe8APbGvw+eUhua2OuZnWoqOe/Y/o0=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr44727729otk.179.1636105806759;
 Fri, 05 Nov 2021 02:50:06 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Nov 2021 10:49:54 +0100
Message-ID: <CACRpkdbRu_NTJpSeyOeMRq5TFgj0-7Ny1vTvcak4K9qaY6nunw@mail.gmail.com>
Subject: [GIT PULL] Pin control bulk changes for v5.16
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the big pin control pull request for v5.16.

The details are in the signed tag as usual.

The most interesting aspect is that we now have initial
support for the Apple pin controller as used in the M1
laptops and the iPhones which is a step forward for using
Linux efficiently on this Apple silicon.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.16-1

for you to fetch changes up to a0f160ffcb83de6a04fa75f9e7bdfe969f2863f7:

  pinctrl: add pinctrl/GPIO driver for Apple SoCs (2021-10-27 00:16:52 +0200)

----------------------------------------------------------------
Pin control changes for the v5.16 kernel cycle

Core changes:

- Add infrastructure for per-parent interrupt data to support
  the Apple pin controller.

New drivers:

- New combined pin control and GPIO driver for the Apple SoC.
  This is used in all modern Apple silicon such as the M1
  laptops but also in at least recent iPhone variants.

- New subdriver for the Qualcomm SM6350

- New subdriver for the Qualcomm QCM2290

- New subdriver for the Qualcomm PM6350

- New subdriver for the Uniphier NX1

- New subdriver for the Samsung ExynosAutoV9

- New subdriver for the Mediatek MT7986

- New subdriver for the nVidia Tegra194

Improvements:

- Improve power management in the Mediatek driver.

- Improvements to the Renesas internal consistency checker.

- Convert the Rockchip pin control device tree bindings to YAML.

- Finally convert the Qualcomm PMIC SSBI and SPMI MPP GPIO
  driver to use hierarchical interrupts.

- Convert the Qualcomm PMIC MPP device tree bindings to YAML.

----------------------------------------------------------------
Andrey Gusakov (1):
      pinctrl: renesas: r8a779[56]x: Add MediaLB pins

Biju Das (1):
      pinctrl: renesas: rzg2l: Fix missing port register 21h

Cai Huoqing (2):
      pinctrl: nomadik: Kconfig: Remove repeated config dependency
      pinctrl: intel: Kconfig: Add configuration menu to Intel pin control

Chanho Park (1):
      pinctrl: samsung: support ExynosAutov9 SoC pinctrl

Colin Ian King (1):
      pinctrl: Fix spelling mistake "atleast" -> "at least"

Dmitry Baryshkov (6):
      dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp
bindings to YAML
      pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
      pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
      pinctrl: qcom: spmi-mpp: hardcode IRQ counts
      pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip
      dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells

Du Huanpeng (1):
      pinctrl: gemini: fix typos

Fabien Dessenne (1):
      pinctrl: stm32: do not warn when 'st,package' is absent

Florian Fainelli (1):
      pinctrl: bcm2835: Allow building driver as a module

Geert Uytterhoeven (5):
      pinctrl: renesas: Fix save/restore on SoCs with pull-down only pins
      pinctrl: renesas: checker: Fix off-by-one bug in drive register check
      pinctrl: renesas: checker: Move overlapping field check
      pinctrl: renesas: checker: Fix bias checks on SoCs with
pull-down only pins
      pinctrl: renesas: checker: Prefix common checker output

Horatiu Vultur (2):
      dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
      pinctrl: microchip sgpio: use reset driver

Jason Wang (1):
      pinctrl: renesas: No need to initialise global statics

Joey Gouly (3):
      dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
      dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
      pinctrl: add pinctrl/GPIO driver for Apple SoCs

Johan Jonker (1):
      dt-bindings: pinctrl: convert rockchip,pinctrl.txt to YAML

Konrad Dybcio (2):
      dt-bindings: pinctrl: qcom: Add SM6350 pinctrl bindings
      pinctrl: qcom: Add SM6350 pinctrl driver

Kunihiko Hayashi (3):
      pinctrl: uniphier: Add extra audio pinmux settings for LD11,
LD20 and PXs3 SoCs
      dt-bindings: pinctrl: uniphier: Add NX1 pinctrl binding
      pinctrl: uniphier: Add UniPhier NX1 pinctrl driver

Linus Walleij (3):
      Merge tag 'renesas-pinctrl-for-v5.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'renesas-pinctrl-for-v5.16-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge branch 'ib-gpio-ppid' into devel

Luca Weiss (3):
      pinctrl: qcom: msm8226: fill in more functions
      dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for PM6350
      pinctrl: qcom: spmi-gpio: Add compatible for PM6350

Marc Zyngier (1):
      gpio: Allow per-parent interrupt data

Prathamesh Shete (3):
      pinctrl: tegra: Add pinmux support for Tegra194
      pinctrl: tegra: Use correct offset for pin group
      pinctrl: tegra: Fix warnings and error

Rahul Tanwar (1):
      pinctrl: equilibrium: Fix function addition in multiple groups

Sam Shih (3):
      pinctrl: mediatek: moore: check if pin_desc is valid before use
      dt-bindings: pinctrl: update bindings for MT7986 SoC
      pinctrl: mediatek: add support for MT7986 SoC

Shawn Guo (2):
      dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings
      pinctrl: qcom: Add QCM2290 pinctrl driver

Subbaraman Narayanamurthy (2):
      dt-bindings: pinctrl: qcom-pmic-gpio: Add
output-{enable,disable} properties
      pinctrl: qcom: spmi-gpio: add support to enable/disable output

Suresh Mangipudi (1):
      pinctrl: tegra: include lpdr pin properties

Yang Yingliang (1):
      pinctrl: core: fix possible memory leak in pinctrl_enable()

Zhiyong Tao (6):
      pinctrl: mediatek: mt8195: Add pm_ops
      dt-bindings: pinctrl: mt8195: add rsel define
      dt-bindings: pinctrl: mt8195: change pull up/down description
      pinctrl: mediatek: fix coding style
      pinctrl: mediatek: support rsel feature
      pinctrl: mediatek: add rsel setting on MT8195

 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |   10 +
 .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  |  363 ++++
 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml   |    7 +
 .../bindings/pinctrl/pinctrl-mt8195.yaml           |   86 +-
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    4 +
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |  187 --
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml |  188 ++
 .../bindings/pinctrl/qcom,qcm2290-pinctrl.yaml     |  165 ++
 .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml      |  148 ++
 .../bindings/pinctrl/rockchip,pinctrl.txt          |  114 --
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |  184 ++
 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 .../pinctrl/socionext,uniphier-pinctrl.yaml        |    1 +
 drivers/gpio/gpiolib.c                             |    9 +-
 drivers/pinctrl/Kconfig                            |   16 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/bcm/Kconfig                        |    2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    9 +-
 drivers/pinctrl/core.c                             |    2 +
 drivers/pinctrl/intel/Kconfig                      |    6 +-
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   18 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |  927 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mt8195.c          |  134 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |  231 ++-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |   46 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   68 +-
 drivers/pinctrl/nomadik/Kconfig                    |    1 -
 drivers/pinctrl/pinctrl-apple-gpio.c               |  534 ++++++
 drivers/pinctrl/pinctrl-equilibrium.c              |    7 +-
 drivers/pinctrl/pinctrl-gemini.c                   |    4 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |    7 +
 drivers/pinctrl/pinctrl-st.c                       |    2 +-
 drivers/pinctrl/qcom/Kconfig                       |   17 +
 drivers/pinctrl/qcom/Makefile                      |    2 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |   74 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             | 1129 ++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm6350.c              | 1401 +++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    7 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |  111 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |  133 +-
 drivers/pinctrl/renesas/core.c                     |   83 +-
 drivers/pinctrl/renesas/pfc-r8a77950.c             |   14 +
 drivers/pinctrl/renesas/pfc-r8a77951.c             |   22 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c              |   22 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c             |   22 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |    2 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  108 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   16 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   32 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c           | 1794 +++++++++++++++++++-
 drivers/pinctrl/tegra/pinctrl-tegra210.c           |  330 ++--
 drivers/pinctrl/uniphier/Kconfig                   |    4 +
 drivers/pinctrl/uniphier/Makefile                  |    1 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |   18 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |   35 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c    |  489 ++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |   40 +
 include/dt-bindings/pinctrl/mt65xx.h               |    9 +
 include/linux/gpio/driver.h                        |   19 +-
 64 files changed, 8720 insertions(+), 709 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcm2290.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6350.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c
