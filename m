Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3434110A0DF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2019 16:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfKZPBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Nov 2019 10:01:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42987 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbfKZPBM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2019 10:01:12 -0500
Received: by mail-lf1-f67.google.com with SMTP id y19so14347829lfl.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2019 07:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=r3sUnYNlhWbEfCd0QONln6twUH8AnrRhyaijqie/Qj4=;
        b=OXIxCC+BPPC/zAgOo6C9p9kVpWCkD6b9SFCACdGqmKbhp0cxU4guClG/wy6DGbzG8U
         pHqC6W6dmf7x+pJ1XuFrks2IsDD9gIx4aB4INQfn22nyQ5a6/dg/b8reo/EGNAB8ho8Z
         aSN+9CZXJq9qWJ91HAK5QHXs4eeRJt4WA/PGd3Y8cidkyuAjcwPY5gYnmIWF8fh/867n
         TcfH2hhrBNPlKuSTpWyYE5gEImkpSBEkLZWk6TzIjC9zyEb72fMCbFAZW+w6KGqBjS3L
         Vh2NTDWhI5JxxIueckC6m++Ob5yzbFW+ClIo0nUsLiDLK4lpfvHMyCEhR841pX1XhV+v
         lhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=r3sUnYNlhWbEfCd0QONln6twUH8AnrRhyaijqie/Qj4=;
        b=ATCa+TvwGhlHWKWhNjkDPLZZlOGqUJcuwohIvYNCrg+rPFGGVuJ09SuxaL+u5bmk57
         iw4w2FmtcsInX81K2lXeukVFtrrNGjfBvzp+Mqv/uc/jxvmIzGjcVrJormT9I6KzWJkc
         ftkTrBNYDWVJuHnc426i3IZKhRoi3N9oqExcMFe0llwvMZHxaTEov5LMkHsmF6HzTMwI
         QA+kwS5QQCdfG0BNevXAT5D0m4RGt5VhGeIJIBb9WOveb6bhzT1lIKHetVLnV+qU5nrf
         Fqd0D6jTGWl8Fhh+41fhmK4PvhQ843+wDQ4BoODma5xqlNTh5ipEWEjWZTdHyRyQHDST
         uJWA==
X-Gm-Message-State: APjAAAVmsRwYOoaAqMXEu6rJd4D7RRoUNRhsP/SChgkbOfcXzRNYu8+H
        256bTJ5qJBqIcfpBhDWNK5YFItrWDCHI87JORq+CZA==
X-Google-Smtp-Source: APXvYqydUj5/WyyUWLVeVF077crzPKVYSKzUm8vdxQCNSBPLy56OcY7L+BFWnF45HbH9BiBOdtNhCE//l7iuhcIy47E=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr24522478lfi.93.1574780467681;
 Tue, 26 Nov 2019 07:01:07 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Nov 2019 16:00:55 +0100
Message-ID: <CACRpkdZYR=5-vf29vYN-gZWRNta3axWNxMTve+hoK_ugkUhcnA@mail.gmail.com>
Subject: [GIT PULL] Bulk pin control changes for v5.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

this is the bulk of pin control changes for the v5.5 kernel,
the details are as usual in the signed tag.

It is pretty much business as usual, the most interesting thing
I think is the pin controller for a new Intel chip called
Lightning Mountain, which is according to news reports some
kind of embedded network processor and what is surprising
about it is that Intel have decided to use device tree to describe
the system rather than ACPI that they have traditionally favored.

I merged in v5.4-rc and also v5.4-rc5 during development, this
was mainly because we were fixing regressions in the Intel
drivers and the fixes included adding some new infrastructure
(callbacks) that later development in other drivers depended
on.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit d6d5df1db6e9d7f8f76d2911707f7d5877251b02:

  Linux 5.4-rc5 (2019-10-27 13:19:19 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.5-1

for you to fetch changes up to ae75b53e08b95cd189879b00f6a47cbdaab1f0eb:

  pinctrl: ingenic: Add OTG VBUS pin for the JZ4770 (2019-11-21 15:10:36 +0100)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.5 kernel
series:

Core changes:

- Avoid taking direct references to device tree-supplied
  device names: these may changed at runtime under certain
  circumstances to kstrdup them.

GPIO related:

- Work is ongoing to move to passing the irqchip along as a
  templated struct gpio_irq_chip when adding a standard
  gpiolib-based irqchip to a GPIO controller, a few patches
  in this cycle switches a few pin control drivers over to
  using this method.

New hardware support:

- Intel Lightning Mountain SoC pin controller and GPIO
  support, a first Intel platform to use device tree rather
  than ACPI to configure the system. News reports says that
  this SoC is a network processor.

- Qualcomm MSM8976 and MSM8956

- Qualcomm PMIC GPIO now also supports PM6150 and PM6150L

- Qualcomm SPMI MPP and SPMI GPIO for PM8950 and PMI8950

- Rockchip RK3308

- Renesas R8A77961

- Allwinner Meson-A1

Driver improvements:

- get_multiple and set_multiple support for the AT91-PIO4 driver.

- Convert Qualcomm SSBI GPIO to use the hierarchical IRQ helpers
  in the GPIOlib irqchip.

----------------------------------------------------------------
Alexandre Belloni (1):
      pinctrl: at91-pio4: implement .get_multiple and .set_multiple

Amelie Delaunay (1):
      pinctrl: stmfx: add irq_request/release_resources callbacks

Andy Shevchenko (13):
      pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
      pinctrl: cherryview: Fix spelling mistake in the comment
      pinctrl: cherryview: Allocate IRQ chip dynamic
      pinctrl: intel: Introduce intel_restore_padcfg() helper
      pinctrl: intel: Introduce intel_restore_hostown() helper
      pinctrl: intel: Introduce intel_restore_intmask() helper
      pinctrl: intel: Drop level from warning to debug in
intel_restore_hostown()
      pinctrl: intel: Use helper to restore register values on ->resume()
      pinctrl: intel: Add Intel Tiger Lake pin controller support
      pinctrl: intel: Missed type change to unsigned int
      pinctrl: cherryview: Missed type change to unsigned int
      MAINTAINERS: Replace my email by one @kernel.org
      pinctrl: lewisburg: Update pin list according to v1.1v6

AngeloGioacchino Del Regno (6):
      pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
      dt-bindings: pinctrl: Add MSM8976 driver bindings and documentation
      pinctrl: qcom: spmi-gpio: Add PM/PMI8950 compatibility
      dt-bindings: pinctrl: qcom-pmic-gpio: Add support for PM/PMI8950
      pinctrl: qcom: spmi-mpp: Add PM/PMI8950 compatible strings
      dt-bindings: pinctrl: qcom-pmic-mpp: Add support for PM/PMI8950

Baolin Wang (1):
      pinctrl: sprd: Add PIN_CONFIG_BIAS_DISABLE configuration support

Ben Dooks (Codethink) (1):
      pinctrl: amd: fix __iomem annotation in amd_gpio_irq_handler()

Biju Das (2):
      dt-bindings: pinctrl: sh-pfc: Document r8a774b1 PFC support
      pinctrl: sh-pfc: r8a77965: Add R8A774B1 PFC support

Brian Masney (1):
      pinctrl: ssbi-gpio: convert to hierarchical IRQ helpers in gpio core

Bruce Chen (1):
      pinctrl: sprd: Add CM4 sleep mode support

Chris Brandt (1):
      pinctrl: rza2: Fix gpio name typos

Chris Packham (3):
      pinctrl: iproc: use unique name for irq chip
      pinctrl: bcm: nsp: use gpiolib infrastructure for interrupts
      pinctrl: bcm: nsp: implement get_direction

Codrin Ciubotariu (1):
      pinctrl: at91: Enable slewrate by default on SAM9X60

Colin Ian King (2):
      pinctl: ti: iodelay: fix error checking on
pinctrl_count_index_with_args call
      pinctrl: rzn1: Make array reg_drive static, makes object smaller

Geert Uytterhoeven (7):
      Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using
SSI_SCK2 and SSI_WS2"
      Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D"
      pinctrl: sh-pfc: Do not use platform_get_irq() to count interrupts
      dt-bindings: pinctrl: sh-pfc: Document r8a77961 support
      pinctrl: sh-pfc: Rename PINCTRL_PFC_R8A7796 to PINCTRL_PFC_R8A77960
      pinctrl: sh-pfc: r8a7796: Add R8A77961 PFC support
      pinctrl: sh-pfc: sh7734: Fix duplicate TCLK1_B

Gregory CLEMENT (1):
      pinctrl: armada-37xx: Fix irq mask access in armada_37xx_irq_set_type()

Hans de Goede (1):
      pinctrl: cherryview: Fix irq_valid_mask calculation

Jianqun Xu (2):
      dt-bindings: pinctrl: rockchip: add rk3308 SoC support
      pinctrl: rockchip: add rk3308 SoC support

Keiya Nobuta (5):
      pinctrl: sh-pfc: Fix PINMUX_IPSR_PHYS() to set GPSR
      pinctrl: sh-pfc: pfc-r8a7795: Fix typo in pinmux macro for SCL3
      pinctrl: sh-pfc: pfc-r8a7795-es1: Fix typo in pinmux macro for SCL3
      pinctrl: sh-pfc: pfc-r8a7796: Fix typo in pinmux macro for SCL3
      pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3

Kiran Gunda (1):
      dt-bindings: pinctrl: qcom-pmic-gpio: Add support for pm6150/pm6150l

Krzysztof Kozlowski (5):
      pinctrl: samsung: Fix device node refcount leaks in Exynos
wakeup controller init
      pinctrl: samsung: Fix device node refcount leaks in S3C24xx
wakeup controller init
      pinctrl: samsung: Fix device node refcount leaks in S3C64xx
wakeup controller init
      pinctrl: samsung: Fix device node refcount leaks in init code
      pinctrl: Fix Kconfig indentation

Linus Walleij (22):
      pinctrl: coh901: Pass irqchip when adding gpiochip
      pinctrl: pic32: Pass irqchip when adding gpiochip
      pinctrl: spear/plgpio: Pass irqchip when adding gpiochip
      pinctrl: nuvoton: npcm7xx: Pass irqchip when adding gpiochip
      pinctrl: sirf: Pass irqchip when adding gpiochip
      pinctrl: sirf/atlas7: Pass irqchip when adding gpiochip
      pinctrl: at91: Pass irqchip when adding gpiochip
      pinctrl: st: Pass irqchip when adding gpiochip
      pinctrl: oxnas: Pass irqchip when adding gpiochip
      pinctrl: ocelot: Pass irqchip when adding gpiochip
      pinctrl: armada-37xx: Pass irqchip when adding gpiochip
      pinctrl: pistachio: Pass irqchip when adding gpiochip
      pinctrl: ingenic: Pass irqchip when adding gpiochip
      pinctrl: nomadik: Drop support for latent IRQ
      pinctrl: nomadik: Pass irqchip when adding gpiochip
      pinctrl: nomadik: Simplify interrupt handler
      Merge tag 'v5.4-rc4' into devel
      Merge tag 'sh-pfc-for-v5.5-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'sh-pfc-for-v5.5-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'samsung-pinctrl-5.5' of
https://git.kernel.org/.../pinctrl/samsung into devel
      Merge tag 'v5.4-rc5' into devel
      Merge tag 'intel-pinctrl-v5.5-1' of
git://git.kernel.org/.../pinctrl/intel into devel

Matti Vaittinen (1):
      pinctrl: rza1: remove unnecessary static inline function

Maxime Ripard (1):
      pinctrl: Convert Allwinner Pin Controller to a schema

Nishka Dasgupta (1):
      pinctrl: samsung: Add of_node_put() before return in error path

Paul Cercueil (2):
      pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT config
      pinctrl: ingenic: Add OTG VBUS pin for the JZ4770

Qianggui Song (3):
      pinctrl: add compatible for Amlogic Meson A1 pin controller
      pinctrl: meson: add a new callback for SoCs fixup
      pinctrl: meson: add pinctrl driver support for Meson-A1 SoC

Rahul Tanwar (2):
      pinctrl: Add pinmux & GPIO controller driver for a new SoC
      dt-bindings: pinctrl: intel: Add for new SoC

Rajendra Nayak (1):
      pinctrl: qcom: sc7180: Add missing tile info in
SDC_QDSD_PINGROUP/UFS_RESET

Rasmus Villemoes (1):
      pinctrl: devicetree.c: remove orphan pinctrl_dt_has_hogs()

Rob Herring (1):
      dt-bindings: pinctrl: Convert generic pin mux and config
properties to schema

Stephan Gerhold (1):
      pinctrl: nomadik: db8500: Add mc0_a_2 pin group without direction control

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a77990: Rename AVB_AVTP_{MATCH,CAPTURE} pin functions

Thierry Reding (1):
      pinctrl: tegra: xusb: Add note about legacy status

Will Deacon (1):
      pinctrl: devicetree: Avoid taking direct reference to device name string

YueHaibing (3):
      pinctrl: mediatek: use devm_platform_ioremap_resource() to simplify code
      pinctrl: mvebu: use devm_platform_ioremap_resource() to simplify code
      pinctrl: use devm_platform_ioremap_resource() to simplify code

lijiazi (1):
      pinctrl: just return if no valid maps

 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |  243 +++++
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |  164 ---
 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        |  116 ++
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |    1 +
 .../devicetree/bindings/pinctrl/pincfg-node.yaml   |  140 +++
 .../bindings/pinctrl/pinctrl-bindings.txt          |  192 +---
 .../devicetree/bindings/pinctrl/pinmux-node.yaml   |  132 +++
 .../bindings/pinctrl/qcom,msm8976-pinctrl.txt      |  183 ++++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    8 +
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    4 +
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    4 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    1 +
 MAINTAINERS                                        |    2 +-
 arch/sh/include/cpu-sh4/cpu/sh7734.h               |    2 +-
 drivers/pinctrl/Kconfig                            |   36 +-
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/actions/pinctrl-owl.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    4 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |    7 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    5 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |  119 +--
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |    6 +-
 drivers/pinctrl/devicetree.c                       |   50 +-
 drivers/pinctrl/devicetree.h                       |    7 -
 drivers/pinctrl/freescale/Kconfig                  |   12 +-
 drivers/pinctrl/intel/Kconfig                      |    7 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   32 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |  140 ++-
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |  171 +--
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |  454 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    4 +-
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c           |  942 ++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-axg.c          |    1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |    9 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |    1 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |    1 +
 drivers/pinctrl/meson/pinctrl-meson.c              |   38 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |    7 +
 drivers/pinctrl/meson/pinctrl-meson8.c             |    1 +
 drivers/pinctrl/meson/pinctrl-meson8b.c            |    1 +
 drivers/pinctrl/mvebu/Kconfig                      |   10 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   40 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              |    4 +-
 drivers/pinctrl/mvebu/pinctrl-orion.c              |    7 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c   |   12 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   81 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |   32 +-
 drivers/pinctrl/pinctrl-amd.c                      |    3 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |    4 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   65 +-
 drivers/pinctrl/pinctrl-at91.c                     |   55 +-
 drivers/pinctrl/pinctrl-bm1880.c                   |    4 +-
 drivers/pinctrl/pinctrl-coh901.c                   |   54 +-
 drivers/pinctrl/pinctrl-da850-pupd.c               |    4 +-
 drivers/pinctrl/pinctrl-digicolor.c                |    4 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |  944 ++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h              |  144 +++
 drivers/pinctrl/pinctrl-ingenic.c                  |   50 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |    4 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |   23 +-
 drivers/pinctrl/pinctrl-oxnas.c                    |   29 +-
 drivers/pinctrl/pinctrl-pic32.c                    |   29 +-
 drivers/pinctrl/pinctrl-pistachio.c                |   30 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  382 ++++++-
 drivers/pinctrl/pinctrl-rza1.c                     |    8 +-
 drivers/pinctrl/pinctrl-rza2.c                     |    8 +-
 drivers/pinctrl/pinctrl-rzn1.c                     |    2 +-
 drivers/pinctrl/pinctrl-st.c                       |   53 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   21 +
 drivers/pinctrl/pinctrl-tb10x.c                    |    4 +-
 drivers/pinctrl/pinctrl-u300.c                     |    4 +-
 drivers/pinctrl/pinctrl-xway.c                     |    4 +-
 drivers/pinctrl/pxa/pinctrl-pxa25x.c               |   13 +-
 drivers/pinctrl/pxa/pinctrl-pxa27x.c               |   13 +-
 drivers/pinctrl/qcom/Kconfig                       |  101 +-
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    3 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c             | 1127 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |   18 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    5 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    2 +
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |  121 +--
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   14 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |    6 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |    6 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   10 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   12 +-
 drivers/pinctrl/sh-pfc/Makefile                    |    4 +-
 drivers/pinctrl/sh-pfc/core.c                      |   32 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |   35 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |  863 ++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              |   57 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |    4 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    8 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   41 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   43 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c             |   51 +-
 drivers/pinctrl/spear/pinctrl-spear.c              |    4 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |   23 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    4 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |   10 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |    3 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |    2 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |    4 +-
 drivers/pinctrl/zte/pinctrl-zx.c                   |    4 +-
 include/dt-bindings/gpio/meson-a1-gpio.h           |   73 ++
 include/dt-bindings/pinctrl/at91.h                 |    4 +-
 113 files changed, 6440 insertions(+), 1669 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
 create mode 100644 drivers/pinctrl/intel/pinctrl-tigerlake.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8976.c
 create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h
