Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBA919BCD5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 09:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgDBHim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 03:38:42 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33567 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgDBHil (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 03:38:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id x200so1906528lff.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=NipfvWiw2gZ6l6D1Wzz8ds7qdzyCTAP0t6aKQWA/3gI=;
        b=hPhWbbfwhrJIB3GsrhdhwZLOzjcg0nxiLjC8oPX39rK4eQzuLxeVfSL1NFCNLvn32Q
         V0LSXfpeIduBjzC527k3kEkKt5IjQu67Ph46wt/Lybf4dljy4Lp7KLllznqAgY+0PPd5
         X/G0BTHfYsdn0hqofB1gWj+YsiQsOIRfzEYXvtLcVeDjarErMV4WLMiedaFxB/a+xg5d
         0uFDYz5fLGC3VhnAlUCBPVMslMb8KZgDrNiEknhOHegOhwdx9kP9oplxQ0IVA3MAtgKW
         2lQP2cNgR2t+71FKyoq79yx+8LWiiahTOUMHBC/k+9cMlhLD/ckv1LEa2o/ufttkrj++
         gSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=NipfvWiw2gZ6l6D1Wzz8ds7qdzyCTAP0t6aKQWA/3gI=;
        b=AgOpTGSgN3WrTTko2veNsJvnbIRxV7wDrGJyKvewFemylBJ8BdVJDVxRU+YmxRxYSS
         Ug0Wjes7dOkl32s9Oqp5zWm04/RE5a2PUZW1VmwrfsKmK6xad9HGAzg3AUNzuNqCwhVu
         wR0JDGeUyk01LQjRCgGa0SMYajmM61ry0iOWpeQlJ4i8MbouGta34rgpkCXFPaHv7pxL
         sGQ6OVASB9WBGT7EZXqtvAHJFQaXOJTXcYcG1GVgHL9LQvSMcR+QprxochrkH7cWlNVU
         x3sBCaWfn+gvw4XCBq3Oe0fwiT8UUHiK0T/gs0bn4vvqjpWvLgXIsG2Fo9v9cGRVTlW9
         oYGQ==
X-Gm-Message-State: AGi0PuYLD/i5py1+L3SYPUQBIqTulMY9/n5OA7HVuCSRZOlOVKgUWtrz
        BaLGkMNTxhcpDHzt0QbW5TbGPbdVqeniNKYh7vCGlA==
X-Google-Smtp-Source: APiQypJCaAnTf7Qk4V8kFMIpQGvTj/wK66pRyZwq1MAB+XvoQnSMMM0ebgFNxsP+mcYAq2lKHrDbTv4wzVbne5qNnwQ=
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr1285453lfe.47.1585813117878;
 Thu, 02 Apr 2020 00:38:37 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Apr 2020 09:38:27 +0200
Message-ID: <CACRpkdbO2JBTtU-XTWzfzTkFD_x7EiPqQ-VraPcYJA7_6U-mvA@mail.gmail.com>
Subject: [GIT PULL] bulk pin control changes for v5.7
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

this is the bulk of pin control changes for the v5.7 kernel
cycle.

Nothing special about pin control this time, it is all pretty
linear development, and all in the drivers. Some details
are provided in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9=
:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.7-1

for you to fetch changes up to c42f69b4207e104229242c3d9da43b55d4b95d6d:

  pinctrl: qcom: fix compilation error (2020-03-31 16:43:54 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.7 kernel cycle.
There are no core changes this time, only driver developments.

- New driver for the Dialog Semiconductor DA9062 Power Management
  Integrated Circuit (PMIC).

- Renesas SH-PFC has improved consistency, with group and
  register checks in the configuration checker.

- New subdriver for the Qualcomm IPQ6018.

- Add the RGMII pin control functionality to Qualcomm IPQ8064.

- Performance and code quality cleanups in the Mediatek
  driver.

- Improve the Broadcom BCM2835 support to cover all the GPIOs
  that exist in it.

- The Allwinner/Sunxi driver properly masks non-wakeup IRQs on
  suspend.

- Add some missing groups and functions to the Ingenic driver.

- Convert some of the Freescale device tree bindings to use the
  new and all improved JSON YAML markup.

- Refactorings and support for the SFIO/GPIO in the Tegra194
  SoC driver.

- Support high impedance mode in the Spreadtrum/Unisoc driver.

----------------------------------------------------------------
Ajay Kishore (1):
      pinctrl: qcom: use scm_call to route GPIO irq to Apps

Andy Shevchenko (1):
      MAINTAINERS: Sort entries in database for PIN CONTROLLER

Anson Huang (4):
      dt-bindings: pinctrl: Convert i.MX8MQ to json-schema
      dt-bindings: pinctrl: Convert i.MX8MM to json-schema
      dt-bindings: pinctrl: Convert i.MX8MN to json-schema
      dt-bindings: pinctrl: imx8mp: Replace the uint32-array with uint32-ma=
trix

Ansuel Smith (2):
      ipq8064: pinctrl: Fixed missing RGMII pincontrol definitions
      pinctrl: qcom: fix compilation error

Baolin Wang (3):
      pinctrl: Export some needed symbols at module load time
      pinctrl: sprd: Allow the SPRD pinctrl driver building into a module
      pinctrl: sprd: Fix the kconfig warning

Dan Carpenter (1):
      pinctrl: mediatek: Fix some off by one bugs

Geert Uytterhoeven (15):
      pinctrl: sh-pfc: checker: Move data before code
      pinctrl: sh-pfc: checker: Add helpers for reporting
      pinctrl: sh-pfc: checker: Add helper for safe name comparison
      pinctrl: sh-pfc: checker: Add check for config register conflicts
      pinctrl: sh-pfc: checker: Add check for enum ID conflicts
      pinctrl: sh-pfc: checker: Improve pin checks
      pinctrl: sh-pfc: checker: Improve pin function checks
      pinctrl: sh-pfc: checker: Improve pin group checks
      pinctrl: sh-pfc: checker: Add drive strength register checks
      pinctrl: sh-pfc: checker: Add bias register checks
      pinctrl: sh-pfc: checker: Add ioctrl register checks
      pinctrl: sh-pfc: checker: Add data register checks
      pinctrl: sh-pfc: checker: Add function GPIO checks
      pinctrl: sh-pfc: gpio: Return early in gpio_pin_to_irq()
      pinctrl: sh-pfc: Remove use of ARCH_R8A7795

Gustavo A. R. Silva (2):
      pinctrl: uniphier: Replace zero-length array with flexible-array memb=
er
      pinctrl: sirf/atlas7: Replace zero-length array with flexible-array m=
ember

Igor Vavro (1):
      pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm

Jonathan Neusch=C3=A4fer (1):
      dt-bindings: pinctrl: at91: Fix a typo ("descibe")

Josh Poimboeuf (1):
      pinctrl: ingenic: Improve unreachable code generation

Light Hsieh (6):
      pinctrl: mediatek: Check gpio pin number and use binary search
in mtk_hw_pin_field_lookup()
      pinctrl: mediatek: Supporting driving setting without mapping
current to register value
      pinctrl: mediatek: Refine mtk_pinconf_get() and mtk_pinconf_set()
      pinctrl: mediatek: Refine mtk_pinconf_get()
      pinctrl: mediatek: Backward compatible to previous Mediatek's
bias-pull usage
      pinctrl: mediatek: Add support for pin configuration dump via debugfs=
.

Linhua Xu (2):
      pinctrl: sprd: Use the correct pin output configuration
      pinctrl: sprd: Add pin high impedance mode support

Linus Walleij (2):
      Merge tag 'sh-pfc-for-v5.7-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Revert "pinctrl: mvebu: armada-37xx: use use platform api"

Marco Felsch (2):
      pinctrl: da9062: add driver support
      gpiolib: export gpiochip_get_desc

Matheus Castello (1):
      pinctrl: actions: Fix functions groups names for S700 SoC

Matti Vaittinen (1):
      pinctrl: Use new GPIO_LINE_DIRECTION

Paul Boddie (1):
      pinctrl: ingenic: add hdmi-ddc pin control group

Peng Fan (1):
      pinctrl: freescale: drop the dependency on ARM64 for i.MX8M

Samuel Holland (2):
      pinctrl: sunxi: Forward calls to irq_set_irq_wake
      pinctrl: sunxi: Mask non-wakeup IRQs on suspend

Sricharan R (2):
      dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
      pinctrl: qcom: Add ipq6018 pinctrl driver

Stefan Wahren (3):
      pinctrl: bcm2835: Drop unused define
      pinctrl: bcm2835: Refactor platform data
      pinctrl: bcm2835: Add support for all GPIOs on BCM2711

Takashi Iwai (1):
      pinctrl: mediatek: Use scnprintf() for avoiding potential buffer over=
flow

Thierry Reding (6):
      pinctrl: tegra: Fix whitespace issues for improved readability
      pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
      pinctrl: tegra: Pass struct tegra_pmx for pin range check
      pinctrl: tegra: Do not add default pin range on Tegra194
      pinctrl: tegra: Renumber the GG.0 and GG.1 pins
      pinctrl: tegra: Add SFIO/GPIO programming on Tegra194

YueHaibing (2):
      pinctrl: mediatek: remove set but not used variable 'e'
      pinctrl: da9062: Fix error gpiolib.h path

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (1):
      pinctrl: Ingenic: Add missing parts for X1830.

 .../bindings/pinctrl/atmel,at91-pinctrl.txt        |    2 +-
 .../bindings/pinctrl/fsl,imx8mm-pinctrl.txt        |   36 -
 .../bindings/pinctrl/fsl,imx8mm-pinctrl.yaml       |   82 ++
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.txt        |   39 -
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml       |   82 ++
 .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       |   25 +-
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        |   36 -
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml       |   82 ++
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     |  153 +++
 MAINTAINERS                                        |   37 +-
 drivers/gpio/gpiolib.c                             |    1 +
 drivers/pinctrl/Kconfig                            |   12 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/actions/pinctrl-s700.c             |  510 ++++-----
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  111 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    5 +-
 drivers/pinctrl/core.c                             |    1 +
 drivers/pinctrl/freescale/Kconfig                  |    8 +-
 drivers/pinctrl/mediatek/pinctrl-mt6765.c          |   11 +-
 drivers/pinctrl/mediatek/pinctrl-mt8183.c          |    7 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |  264 ++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |   16 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    5 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |  363 ++++---
 drivers/pinctrl/mediatek/pinctrl-paris.h           |    3 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |   35 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |   27 +
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   17 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    7 +-
 drivers/pinctrl/pinconf-generic.c                  |    1 +
 drivers/pinctrl/pinctrl-amd.c                      |    5 +-
 drivers/pinctrl/pinctrl-at91.c                     |    5 +-
 drivers/pinctrl/pinctrl-axp209.c                   |    7 +-
 drivers/pinctrl/pinctrl-da9062.c                   |  300 ++++++
 drivers/pinctrl/pinctrl-ingenic.c                  |   55 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    5 +-
 drivers/pinctrl/pinctrl-oxnas.c                    |    5 +-
 drivers/pinctrl/pinctrl-pic32.c                    |    5 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    5 +-
 drivers/pinctrl/pinctrl-rk805.c                    |    7 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    5 +-
 drivers/pinctrl/pinctrl-rza1.c                     |    5 +-
 drivers/pinctrl/pinctrl-rza2.c                     |    6 +-
 drivers/pinctrl/pinctrl-st.c                       |   14 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   17 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |    9 +-
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1107 ++++++++++++++++=
++++
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |   10 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   46 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    4 +-
 drivers/pinctrl/sh-pfc/core.c                      |  307 ++++--
 drivers/pinctrl/sh-pfc/gpio.c                      |    5 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |    2 +-
 drivers/pinctrl/sprd/Kconfig                       |   10 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |   25 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   16 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   52 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |    5 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c           |   47 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |    2 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |    6 +-
 64 files changed, 3350 insertions(+), 743 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-da9062.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c
