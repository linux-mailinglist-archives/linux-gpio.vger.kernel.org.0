Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CD4B8318
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 23:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732915AbfISVIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 17:08:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37111 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732340AbfISVIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 17:08:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so5032648lje.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wLOdMD04PoIJHuLLb6G8gZRdReRHCyb9c1kE1b+TsH8=;
        b=ye+v9U5AVq8bISDFvIAMRNCCPKQ6Y9OcCyugPj8wfS6NdsPdPDtP8uHewXUNMZCbiQ
         qKxCpj2xJZFEjGmCUKRkApWSSZQfJt0NOXa2p4lJpCygwKNztDQH+1jqiFhZYsQCjek7
         84UFH0f/4hV99J1U6Ld+aH0HeckBZx/5mg0pFIPOmtK4w5xNfKc65MyI8Npk/hfmrlT+
         KjnUcw8oQvyMug4Bz/7CveUaOGjMmq0swP6Z5a40BTzF0OSIvKAlwlsFh74aFL9dcRjy
         ppStjzd12xBcKH8ukec4oFGbVIjz+I4CdF/CjeV0nU50w49v/tNBGD8Z7d7PRY4QhO95
         GSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wLOdMD04PoIJHuLLb6G8gZRdReRHCyb9c1kE1b+TsH8=;
        b=OmZJOppQNOFojpgAWLbLuArFE9egz3Kq/b12oJADxBhHeWs5EGtQxl2xTAhbYdBs21
         DF1K39oYNHwhDPLBLBYVSn7GuxAXv/xZjCOOeTwreccrH/ZRyr/btdhaLDd8Jd8UwKqJ
         DzGf7TeoRdWssbq8RqijOh6/4UI0DKPGKPY/siDaoKvYFXbJiAwcboU99JfhGSB4VxR5
         xYNbK5VQnX2vf4RIojnQD4+vXd1Kia5YsJjWvYHOIEMMop8XTbh3wW4XDMCjYgONisUX
         4DtMEea5fcNDphm5a60KeqSYzu88e7V0mcC+Dn1yb3uglOhR4GDoiKqVxPGms6dwMRKB
         FFlA==
X-Gm-Message-State: APjAAAXrQN8rt71Gdi0XoOdh5Trfb8ktyqXkVLWTC0ANWIJgjvmn/OOu
        b3lDwynKIlNcliQd4tMPZeNOtduwnt1PKbaI7LqJeA==
X-Google-Smtp-Source: APXvYqwmG9FIRVQxvELI/NBBY15RF3r4fPPrgkxn4kQ6f/hsP865O9oVwiv0cdfgTevIWctSM2C+ZLgKbckMbKOSsgs=
X-Received: by 2002:a2e:b4c4:: with SMTP id r4mr6660272ljm.69.1568927282645;
 Thu, 19 Sep 2019 14:08:02 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Sep 2019 23:07:51 +0200
Message-ID: <CACRpkdaHfhNjR-3GJOO-47rqopmO1SE9dLAU+AiCaWTuLje=8w@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v5.4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

these are the pin control bulk changes for v5.4, all boiled nicely
in linux-next for a while.

There is one caveat: m68k Atari autobuilder with allmodconfig complains
about a namespace collision like this:

arch/m68k/include/asm/atarihw.h:172:17: error: expected ')' before '(' token
arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or
'(' before 'volatile'
drivers/pinctrl/bcm/pinctrl-bcm2835.c:994:10: error: incompatible
types when assigning to type 'volatile struct SHIFTER' from type
'unsigned int'
drivers/pinctrl/bcm/pinctrl-bcm2835.c:997:27: error: invalid operands
to binary << (have 'int' and 'volatile struct SHIFTER')
drivers/pinctrl/bcm/pinctrl-bcm2835.c:998:16: error: invalid operands
to binary << (have 'unsigned int' and 'volatile struct SHIFTER')

This is fixed in the m68k tree (commit 053b514295694f3336e97f56d5f41c0d4972c109
"m68k: atari: Rename shifter to shifter_st to avoid conflict"), so if
you merge this before
and the build server complains at the tree, it will fix itself.

Alernatively you can wait for the m68k tree to come in first. Or we nudge Geert
to send the changes ASAP. The usage of a wildly different pin
controller on Atari hardware is only a compile testing artifact so
we didn't drill deeper into this.

In hindsight, maybe I should have had that patch applied to the pin control
tree so we build cleanly also under esoteric configurations. Mea culpa.

Please pull it in!
Yours,
Linus Walleij

The following changes since commit d1abaeb3be7b5fa6d7a1fbbd2e14e3310005c4c1:

  Linux 5.3-rc5 (2019-08-18 14:31:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.4-1

for you to fetch changes up to cb0438e4436085d89706b5ccfce4d5da531253de:

  pinctrl: meson-gxbb: Fix wrong pinning definition for uart_c
(2019-09-13 14:40:41 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.4 kernel
cycle:

Core changes:

- Fix errors in example code in the documentation.

New drivers:

- Add support for JZ4760, JZ4760B, X1000, X1000E and X1500 to
  the Ingenic driver.

- Support Cirrus Logic Madera CS47L92 and CS47L15.

- Support Allwinner Sunxi V3S.

- Support Aspeed 2600 BMC.

- Support Qualcomm SC7180.

- Support Marvell MVEBU CS115.

Driver improvements:

- Clean up a few drivers to use the devm_platform_ioremap_resource()
  helper.

- Pass the irqchip when registering the gpio_chip in some pin
  controllers that are also GPIO controllers.

- Support suspend/resume in the Tegra driver.

- Support pull-up on the Broadcom BCM2711.

- The Intel driver can now request locked pads.

- Fix the UFS reset pin in the Qualcomm SDM845 driver.

----------------------------------------------------------------
Alexandre Torgue (1):
      pinctrl: stmfx: update pinconf settings

Anders Roxell (2):
      pinctrl: rockchip: Mark expected switch fall-through
      pinctrl: qcom: spmi-gpio: Mark expected switch fall-through

Andrew Jeffery (9):
      dt-bindings: pinctrl: aspeed: Strip unnecessary quotes
      dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
      pinctrl: aspeed: Rename pin declaration macros
      pinctrl: aspeed: Add PIN_DECL_3() helper
      pinctrl: aspeed: Add multiple pin group support for functions
      pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
      pinctrl: aspeed: Add AST2600 pinmux support
      pinctrl: aspeed: Document existence of deprecated compatibles
      dt-bindings: aspeed: Remove mention of deprecated compatibles

Andy Shevchenko (20):
      pinctrl: baytrail: Use devm_platform_ioremap_resource()
      pinctrl: cherryview: Use devm_platform_ioremap_resource()
      pinctrl: intel: Use devm_platform_ioremap_resource()
      pinctrl: merrifield: Use devm_platform_ioremap_resource()
      pinctrl: intel: Drop double check for data in intel_pinctrl_probe_by_uid()
      pinctrl: msm: Switch to use device_property_count_uXX()
      pinctrl: qdf2xxx: Switch to use device_property_count_uXX()
      pinctrl: intel: Simplify offset validation in intel_get_padcfg()
      pinctrl: broxton: Provide Interrupt Status register offset
      pinctrl: cannonlake: Provide Interrupt Status register offset
      pinctrl: geminilake: Provide Interrupt Status register offset
      pinctrl: icelake: Provide Interrupt Status register offset
      pinctrl: sunrisepoint: Provide Interrupt Status register offset
      pinctrl: denverton: Provide Interrupt Status register offset
      pinctrl: lewisburg: Provide Interrupt Status register offset
      pinctrl: intel: Remove default Interrupt Status offset
      pinctrl: baytrail: Re-use data structures from pinctrl-intel.h (part 2)
      pinctrl: intel: Use NSEC_PER_USEC for debounce calculus
      pinctrl: denverton: Update pin names according to v1.08
      pinctrl: intel: Allow to request locked pads

Arnd Bergmann (1):
      pinctrl: intel: mark intel_pin_to_gpio __maybe_unused

Baolin Wang (2):
      pinctrl: sprd: Change to use devm_platform_ioremap_resource()
      pinctrl: sprd: Combine the condition of MISC_PIN and COMMON_PIN

Charles Keepax (2):
      pinctrl: madera: Use local copy of pdata
      pinctrl: madera: Add configuration for Cirrus Logic CS47L92

Chris Chiu (1):
      pinctrl: intel: remap the pin number to gpio offset for irq enabled pin

Colin Ian King (1):
      pinctrl: bcm: remove redundant assignment to pointer log

Dan Carpenter (1):
      pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()

Daniel Drake (1):
      pinctrl: amd: disable spurious-firing GPIO IRQs

Geert Uytterhoeven (5):
      pinctrl: devicetree: Use strlen() instead of hardcoded number
      pinctrl: lantiq: Use kasprintf() instead of fixed buffer formatting
      pinctrl: xway: Use devm_kasprintf() instead of fixed buffer formatting
      pinctrl: sh-pfc: Use dev_notice_once() instead of open-coding
      pinctrl: rza1: Use devm_platform_ioremap_resource() helper

Grzegorz Jaszczyk (2):
      dt-bindings: cp110: document the new CP115 pinctrl compatible
      pinctrl: mvebu: add additional variant for standalone CP115

Icenowy Zheng (1):
      pinctrl: sunxi: v3s: introduce support for V3

Jitendra Sharma (2):
      dt-bindings: pinctrl: qcom: Add SC7180 pinctrl binding
      pinctrl: qcom: Add SC7180 pinctrl driver

Konstantin Porotchkin (1):
      pinctrl: mvebu: Add CP110 missing pin functionality

Kunihiko Hayashi (5):
      pinctrl: uniphier: Separate modem group from UART ctsrts group
      pinctrl: uniphier: Add another audio I/O pin-mux settings for LD20
      pinctrl: uniphier: Add 5th LD20 MPEG2-TS input pin-mux setting
      pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
      pinctrl: uniphier: Fix Pro5 SD pin-mux setting

Li Jin (1):
      pinctrl: iproc-gpio: Fix incorrect pinconf configurations

Linus Walleij (12):
      pinctrl: qcom: Pass irqchip when adding gpiochip
      Merge tag 'sh-pfc-for-v5.4-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: bcm-iproc: Pass irqchip when adding gpiochip
      pinctrl: st: Include the right header
      Merge tag 'v5.3-rc5' into devel
      pinctrl: sh-pfc: Include the right header
      pinctrl: rza2: Drop driver use of consumer flags
      pinctrl: rza2: Include the appropriate headers
      Merge tag 'sh-pfc-for-v5.4-tag2' of
https://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: bcm2835: Pass irqchip when adding gpiochip
      Merge tag 'intel-pinctrl-v5.4' of
git://git.kernel.org/.../pinctrl/intel into devel
      Merge tag 'intel-pinctrl-v5.4-2' of
git://git.kernel.org/.../pinctrl/intel into devel

Luca Ceresoli (1):
      docs/pinctrl: fix compile errors in example code

Marc Gonzalez (1):
      pinctrl: msm8998: Squash TSIF pins together

Masahiro Yamada (1):
      pinctrl: pinctrl-single: add header include guard

Nathan Chancellor (1):
      pinctrl: aspeed: g6: Remove const specifier from
aspeed_g6_sig_expr_set's ctx parameter

Neil Armstrong (1):
      pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux

Nishka Dasgupta (13):
      pinctrl: rzn1: Add of_node_put() before return
      pinctrl: falcon: Add of_node_put() before return
      pinctrl: nomadik: nomadik: Add of_node_put() before return
      pinctrl: nomadik: abx500: Add of_node_put() before return
      pinctrl: freescale: mxs: Add of_node_put() before return
      pinctrl: spear: spear: Add of_node_put() before return
      pinctrl: stm32: stm32: Add of_node_put() before return
      pinctrl: sprd: Add of_node_put() before return to prevent memory leak
      pinctrl: freescale: imx: Add of_node_put() before return
      pinctrl: rk805: Make structures constant
      pinctrl: st: Add of_node_put() before return
      pinctrl: rza1: Add of_node_put() before return
      pinctrl: meson: meson: Add of_node_put() before return

Otto Meier (1):
      pinctrl: meson-gxbb: Fix wrong pinning definition for uart_c

Rayagonda Kokatanur (2):
      pinctrl: iproc-gpio: Handle interrupts for multiple instances
      pinctrl: iproc: Add 'get_direction' support

Richard Fitzgerald (1):
      pinctrl: madera: Add configuration for Cirrus Logic CS47L15

Sowjanya Komatineni (4):
      pinctrl: tegra: Add suspend and resume support
      pinctrl: tegra210: Add Tegra210 pinctrl pm ops
      pinctrl: tegra: Fix write barrier placement in pmx_writel
      pinctrl: tegra: Flush pinctrl writes during resume

Stefan Wahren (3):
      pinctrl: bcm2835: Add brcm,bcm2711 compatible
      pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
      pinctrl/gpio: Take MUX usage into account

Stephen Boyd (4):
      pinctrl: Remove dev_err() usage after platform_get_irq()
      pinctrl: intel: Remove dev_err() usage after platform_get_irq()
      pinctrl: cherryview: Remove dev_err() usage after platform_get_irq()
      pinctrl: qcom: sdm845: Fix UFS_RESET pin

Vinod Koul (3):
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150 support
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150b support
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150l support

Yoshihiro Shimoda (3):
      pinctrl: sh-pfc: Add new flags into struct sh_pfc_pin_config
      pinctrl: sh-pfc: Remove incomplete flag "cfg->type"
      pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed

YueHaibing (2):
      pinctrl: sprd: Fix platform_no_drv_owner.cocci warnings
      pinctrl: oxnas: remove set but not used variable 'arg'

Zhou Yanjie (6):
      dt-bindings: pinctrl: Add JZ4760 and JZ4760B bindings.
      pinctrl: Ingenic: Add pinctrl driver for JZ4760 and JZ4760B.
      dt-bindings: pinctrl: Add X1000 and X1000E bindings.
      pinctrl: Ingenic: Add pinctrl driver for X1000 and X1000E.
      dt-bindings: pinctrl: Add X1500 bindings.
      pinctrl: Ingenic: Add pinctrl driver for X1500.

 .../arm/marvell/cp110-system-controller.txt        |    4 +-
 .../devicetree/bindings/mfd/aspeed-scu.txt         |    2 -
 .../devicetree/bindings/misc/aspeed-p2a-ctrl.txt   |    2 -
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   |   45 +-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   |   49 +-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |  115 +
 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         |    1 +
 .../bindings/pinctrl/ingenic,pinctrl.txt           |   17 +-
 .../bindings/pinctrl/qcom,msm8998-pinctrl.txt      |    5 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    6 +
 .../bindings/pinctrl/qcom,sc7180-pinctrl.txt       |  186 ++
 Documentation/driver-api/pinctl.rst                |    6 +-
 drivers/gpio/gpiolib.c                             |    3 +-
 drivers/pinctrl/aspeed/Kconfig                     |    8 +
 drivers/pinctrl/aspeed/Makefile                    |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1825 ++++++++-------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 1869 ++++++++-------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         | 2395 ++++++++++++++++++++
 drivers/pinctrl/aspeed/pinmux-aspeed.h             |  227 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  156 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |    1 -
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |  158 +-
 drivers/pinctrl/cirrus/Kconfig                     |    6 +
 drivers/pinctrl/cirrus/Makefile                    |    6 +
 drivers/pinctrl/cirrus/pinctrl-cs47l15.c           |   40 +
 drivers/pinctrl/cirrus/pinctrl-cs47l92.c           |   40 +
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |   24 +-
 drivers/pinctrl/cirrus/pinctrl-madera.h            |    2 +
 drivers/pinctrl/core.c                             |   28 +
 drivers/pinctrl/devicetree.c                       |    6 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |   13 +-
 drivers/pinctrl/freescale/pinctrl-mxs.c            |   12 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   67 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |    4 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |    2 +
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    8 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |   53 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c         |    2 +
 drivers/pinctrl/intel/pinctrl-icelake.c            |    2 +
 drivers/pinctrl/intel/pinctrl-intel.c              |  120 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    9 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |    2 +
 drivers/pinctrl/intel/pinctrl-merrifield.c         |    4 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |    2 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |    9 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |   12 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    1 +
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c       |   20 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    1 +
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    1 +
 drivers/pinctrl/pinctrl-amd.c                      |   16 +-
 drivers/pinctrl/pinctrl-falcon.c                   |   11 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |  755 +++++-
 drivers/pinctrl/pinctrl-oxnas.c                    |    8 +-
 drivers/pinctrl/pinctrl-pic32.c                    |    4 +-
 drivers/pinctrl/pinctrl-rk805.c                    |    4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    1 +
 drivers/pinctrl/pinctrl-rza1.c                     |   16 +-
 drivers/pinctrl/pinctrl-rza2.c                     |   17 +-
 drivers/pinctrl/pinctrl-rzn1.c                     |   12 +-
 drivers/pinctrl/pinctrl-st.c                       |   12 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   28 +-
 drivers/pinctrl/pinctrl-xway.c                     |    4 +-
 drivers/pinctrl/pinmux.c                           |   24 +
 drivers/pinctrl/pinmux.h                           |    8 +
 drivers/pinctrl/qcom/Kconfig                       |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   36 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c             |   76 +-
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c              | 1146 ++++++++++
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    8 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    8 +
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    5 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |   11 +-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   43 +-
 drivers/pinctrl/spear/pinctrl-spear.c              |    8 +-
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |    1 -
 drivers/pinctrl/sprd/pinctrl-sprd.c                |   32 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    5 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |  265 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   67 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |    3 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c           |    1 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |   10 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |   20 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c    |   10 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c   |   10 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c   |   10 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c   |   17 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c   |   10 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |   10 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c   |   10 +-
 include/linux/pinctrl/consumer.h                   |    6 +
 include/linux/platform_data/pinctrl-single.h       |    6 +
 96 files changed, 7978 insertions(+), 2367 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs47l15.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs47l92.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7180.c
