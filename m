Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012FB78DD47
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Aug 2023 20:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243556AbjH3Ssr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Aug 2023 14:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244808AbjH3OHk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2023 10:07:40 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE632FC
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 07:07:35 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d776e1f181bso5417374276.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693404455; x=1694009255; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ECLJU6IZKPUBTrDVnJKrNusO5HCN9hBylg4oheOozUA=;
        b=dE5Qf7Iw7VwSIdSlL8SWQft6L6AKba8Cg9LQmA123r0KfpMguvnPLyQA161CxbJk6v
         he+xwkHxwl1bC/UnYvDzjNQaPlDLW1cEjHzPTHGynEXonlqFjSXEtueh7mq4MHvn444m
         3RYoA/1ZNCNg2kHcEIvxieP6OvbDfWh/Q6IA095NXMZEyfmqYGudd+oSbBwko4nMtiOC
         OM7s0v3V0Nq8GcDOzx5IhhuTrevchRjc8ymT8ycKwps1YbbElzRarg/ptJ6YfyZE4WBL
         66bO3sBVQq+hPD2YN/w//ybWZhudQcn4vmF+/PNnFhhz9b5gC9Q9a34+0pEq0KLiSY8d
         IMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693404455; x=1694009255;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECLJU6IZKPUBTrDVnJKrNusO5HCN9hBylg4oheOozUA=;
        b=LIwX0gm1n7pqjWyIlNOK4LUMWkDq1sgHj/Z/ghwoLEaXpSjN0yoGSPzOGLT9LM9604
         ITvMQKviNDQ3c3i79gB86y42EX4r46MNMjfwH2Vv933edxod+1fnl1QKOigJrvKkJNHn
         /qJURA0gvnOD03LFZH6WkOrIyttYKlyW+HsAzGvyQTWO1X0WNu7sxiMVo2L5L1fr0Gsz
         64PnoOjdn150KiR44QufWwP+4Ku1aaum3u6eeKoiJfbiS94ydQAEHCtNfOzfiIkwFmwL
         21LZCFmj6nqx63G/4Po8Uevm+ygjfn6v/VhE++n4kS4n8o7lIGOApoJGBm9moRmM9qlT
         +KoA==
X-Gm-Message-State: AOJu0YzoAq4UZ8g7nDkW0vVks6i5WN790OrupxM//irqXFzfVLJOfcHq
        PYJvCPhxCwsg0T8gVkEzgRH9WVt2MM4fGJPwXO/W/bzHZksjXlaaYwM=
X-Google-Smtp-Source: AGHT+IHR4zavGwSOuRKl8CFNTXviORg/kRacPXsY3FiJE70RWcnSAdmtcZdBrUCvpuBRlFZDmVK8hY0TEgmMlGh1y3s=
X-Received: by 2002:a25:e7d1:0:b0:bcb:9b43:5a89 with SMTP id
 e200-20020a25e7d1000000b00bcb9b435a89mr2055452ybh.61.1693404454957; Wed, 30
 Aug 2023 07:07:34 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Aug 2023 16:07:23 +0200
Message-ID: <CACRpkdYJc3vdfdWWfk-E2AhBZq7TqJKvVJAzMmoFYfw8kVtMfA@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v6.6 kernel
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of pin control changes for v6.6.

Due to fixes messing around in the Renesas header includes
there will be conflicts! These are related to the device tree
header includes that make up the lion's share of the scattered
diffstat.

It will be those (I think):
drivers/pinctrl/renesas/pinctrl-rza2.c
drivers/pinctrl/renesas/pinctrl-rzg2l.c
drivers/pinctrl/renesas/pinctrl-rzv2m.c

The conflict is the same in all three cases, and in all three
cases <linux/of_device.h> goes and the rest stays, simple.
(This is what is in linux-next.)

We have some patches to DTS[I] files in arm and arm64 as
well, that were merged here as DT headers were being changed.

The most interesting stuff is the Intel Tangier chip support and
AMLogic C3 in my opinion.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.6-1

for you to fetch changes up to 82a65f0844852cec6a70ac05c7d8edb0586c851c:

  Merge tag 'intel-pinctrl-v6.6-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
(2023-08-25 15:47:18 +0200)

----------------------------------------------------------------
Pin control bulk changes for the v6.6 kernel cycle:

No core changes this time.

Drivers:

- Intel Tangier SoC pin control support.

- AMLogic C3 SoC pin control support.

- Texas Instruments AM654 SoC pin control support.

- Qualcomm SM8350 and SM6115 LPASS (Low Power Audio Sub-System)
  pin control support.

- Qualcomm PMX75 and PM7550BA (Power Management) pin control
  support.

- Qualcomm PMC8180 and PMC8180C (Power Management) pin control
  support.

- DROP the Oxnas driver as there is not enough of community
  interest to keep carrying this ARM(11) port.

Enhancements:

- Bias control in the MT7986 pin control driver.

- Misc device tree binding enhancements such as the Broadcom
  11351 being converted to YAML.

- New macro: DEFINE_NOIRQ_DEV_PM_OPS() put to use.

- Clean up some SPDX headers.

- Handle non-unique devicetree subnode names in two Renesas
  drivers.

----------------------------------------------------------------
Andy Shevchenko (11):
      Merge patch series "Introduce Intel Tangier pinctrl driver"
      Merge patch series "Reuse common functions from pinctrl-intel"
      pinctrl: intel: Switch to use exported namespace
      pinctrl: baytrail: Make use of pm_ptr()
      pinctrl: lynxpoint: Make use of pm_ptr()
      pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: cherryview: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: at91: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: mvebu: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: renesas: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: tegra: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper

Asmaa Mnebhi (1):
      pinctrl: mlxbf3: Remove gpio_disable_free()

Biju Das (1):
      pinctrl: renesas: rzg2l: Handle non-unique subnode names

Christophe JAILLET (1):
      pinctrl: renesas: rzg2l: Use devm_clk_get_enabled() helper

Claudiu Beznea (1):
      pinctrl: mcp23s08: check return value of devm_kasprintf()

Daniel Golle (2):
      pinctrl: mediatek: fix pull_type data for MT7981
      pinctrl: mediatek: assign functions to configure pin bias on MT7986

Dhaval Shah (1):
      firmware: xilinx: Add support to get platform information

Dhruva Gole (1):
      dt-bindings: pinctrl: pinctrl-single: add ti,am654-padconf compatible

Florian Fainelli (2):
      pinctrl: iproc-gpio: Silence probe deferral messages
      pinctrl: nsp-gpio: Silence probe deferral messages

Geert Uytterhoeven (2):
      pinctrl: renesas: rzv2m: Handle non-unique subnode names
      pinctrl: renesas: rzv2m: Use devm_clk_get_enabled() helper

Huqiang Qin (5):
      dt-bindings: pinctrl: Add compatibles for Amlogic C3 SoCs
      pinctrl: Add driver support for Amlogic C3 SoCs
      dt-bindings: interrupt-controller: Add header file for Amlogic
Meson-G12A SoCs
      pinctrl: Replace the IRQ number in the driver with the IRQID
macro definition
      arm64: dts: Replace the IRQ number with the IRQID macro definition

Konrad Dybcio (6):
      pinctrl: qcom: lpass-lpi: Make the clocks optional, always
      dt-bindings: pinctrl: qcom: lpass-lpi: Remove qcom,adsp-bypass-mode
      dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add SM6115 LPASS TLMM
      pinctrl: qcom: Introduce SM6115 LPI pinctrl driver
      dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add SM6115 LPASS TLMM
      pinctrl: qcom: Introduce SM6115 LPI pinctrl driver

Krzysztof Kozlowski (5):
      dt-bindings: pinctrl: qcom,sm8350-lpass-lpi: add SM8350 LPASS TLMM
      pinctrl: qcom: sm8350-lpass-lpi: add SM8350 LPASS TLMM
      dt-bindings: pinctrl: qcom,pmic-gpio: document PMC8180 and PMC8180C
      ARM: dts: ux500: switch to enable-gpios
      pinctrl: use capital "OR" for multiple licenses in SPDX

Linus Walleij (3):
      Merge tag 'renesas-pinctrl-for-v6.6-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'qcom-pinctrl-6.6' of
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into
devel
      Merge tag 'intel-pinctrl-v6.6-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Mario Limonciello (1):
      pinctrl: amd: Don't show `Invalid config param` errors

Mark Brown (1):
      pinctrl: sunxi: Add some defensiveness for regulators array

Neil Armstrong (5):
      dt-bindings: pinctrl: amlogic,meson-pinctrl: allow gpio-line-names
      dt-bindings: pinctrl: amlogic,meson-pinctrl-common: allow gpio hogs
      pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
      dt-bindings: pinctrl: oxnas,pinctrl: remove obsolete bindings
      dt-bindings: gpio: gpio_oxnas: remove obsolete bindings

Patrick Rudolph (2):
      dt-bindings: pinctrl: cypress,cy8c95x0: Add reset pin
      pinctrl: cy8c95x0: Add reset support

Prathamesh Shete (1):
      pinctrl: tegra: Add support to display pin function

Raag Jadav (10):
      pinctrl: baytrail: consolidate common mask operation
      pinctrl: tangier: Introduce Intel Tangier driver
      pinctrl: merrifield: Adapt to Intel Tangier driver
      pinctrl: moorefield: Adapt to Intel Tangier driver
      pinctrl: intel: export common pinctrl functions
      pinctrl: baytrail: reuse common functions from pinctrl-intel
      pinctrl: cherryview: reuse common functions from pinctrl-intel
      pinctrl: lynxpoint: reuse common functions from pinctrl-intel
      pinctrl: intel: consolidate ACPI dependency
      pinctrl: cherryview: fix address_space_handler() argument

Rob Herring (4):
      pinctrl: Explicitly include correct DT includes
      dt-bindings: pinctrl: Drop 'phandle' properties
      dt-bindings: pinctrl: aspeed: Allow only defined pin mux node properties
      dt-bindings: pinctrl: renesas,rza2: Use 'additionalProperties'
for child nodes

Rohit Agarwal (4):
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7550ba support
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx75 support
      pinctrl: qcom-pmic-gpio: Add support for pm7550ba
      pinctrl: qcom-pmic-gpio: Add support for pmx75

Ruan Jinjie (1):
      pinctrl: stmfx: Do not check for 0 return after calling platform_get_irq()

Sai Krishna Potthuri (3):
      firmware: xilinx: Add version check for TRISTATE configuration
      dt-bindings: pinctrl-zynqmp: Add output-enable configuration
      pinctrl: pinctrl-zynqmp: Add support for output-enable and
bias-high impedance

Sergey Shtylyov (4):
      pinctrl: core: handle radix_tree_insert() errors in
pinctrl_generic_add_group()
      pinctrl: core: handle radix_tree_insert() errors in
pinctrl_register_one_pin()
      pinctrl: pinmux: handle radix_tree_insert() errors in
pinmux_generic_add_function()
      pinctrl: at91-pio4: drop useless check in atmel_conf_pin_config_dbg_show()

Sricharan Ramabadhran (1):
      pinctrl: qcom: Remove the unused _groups variable build warning

Stanislav Jakubek (1):
      dt-bindings: pinctrl: brcm,bcm11351-pinctrl: Convert to YAML

Tony Lindgren (2):
      dt-bindings: pinctrl: Update pinctrl-single to use yaml
      pinctrl: single: Add compatible for ti,am654-padconf

Valentin Caron (1):
      pinctrl: stm32: set default gpio line names using pin names

Yangtao Li (4):
      pinctrl: berlin: as370: Use devm_platform_get_and_ioremap_resource()
      pinctrl: mvebu: Use devm_platform_get_and_ioremap_resource()
      pinctrl: pic32: Convert to devm_platform_ioremap_resource()
      pinctrl: ti: Convert to devm_platform_get_and_ioremap_resource()

 .../devicetree/bindings/arm/omap/ctrl.txt          |    2 +-
 .../devicetree/bindings/gpio/gpio_oxnas.txt        |   47 -
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    5 +
 .../pinctrl/amlogic,meson-pinctrl-common.yaml      |    7 +
 .../pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  |    3 +
 .../amlogic,meson-pinctrl-g12a-periphs.yaml        |    3 +
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      |    4 +
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       |    4 +
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   |   52 +-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   |   56 +-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |  120 +-
 .../bindings/pinctrl/brcm,bcm11351-pinctrl.txt     |  461 -------
 .../bindings/pinctrl/brcm,bcm11351-pinctrl.yaml    |  259 ++++
 .../bindings/pinctrl/cypress,cy8c95x0.yaml         |    4 +
 .../bindings/pinctrl/ingenic,pinctrl.yaml          |    4 -
 .../bindings/pinctrl/nvidia,tegra114-pinmux.yaml   |    2 -
 .../bindings/pinctrl/nvidia,tegra124-pinmux.yaml   |    2 -
 .../bindings/pinctrl/nvidia,tegra194-pinmux.yaml   |    2 -
 .../bindings/pinctrl/nvidia,tegra20-pinmux.yaml    |    2 -
 .../bindings/pinctrl/nvidia,tegra210-pinmux.yaml   |    2 -
 .../bindings/pinctrl/nvidia,tegra30-pinmux.yaml    |    2 -
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |   56 -
 .../devicetree/bindings/pinctrl/pinctrl-single.txt |  262 ----
 .../bindings/pinctrl/pinctrl-single.yaml           |  207 ++++
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    8 +
 .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     |    5 -
 .../pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml     |  135 ++
 .../pinctrl/qcom,sm8350-lpass-lpi-pinctrl.yaml     |  143 +++
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |    4 -
 .../bindings/pinctrl/renesas,rza1-ports.yaml       |    4 -
 .../bindings/pinctrl/renesas,rza2-pinctrl.yaml     |   61 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    4 -
 .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml     |    4 -
 .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml    |    4 -
 .../pinctrl/socionext,uniphier-pinctrl.yaml        |    2 -
 .../bindings/pinctrl/ti,omap-pinctrl.txt           |   13 -
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      |    4 +
 arch/arm/boot/dts/st/ste-href520-tvk.dts           |    2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts      |    2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts        |    2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts     |    2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts       |    2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |    1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    2 +-
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |    2 +-
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |    2 +-
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |    4 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |    2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |    2 +-
 .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |    2 +-
 .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |    4 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |    2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |    2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   12 +-
 .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |    2 +-
 drivers/firmware/xilinx/zynqmp.c                   |   49 +
 drivers/pinctrl/Kconfig                            |   11 -
 drivers/pinctrl/Makefile                           |    1 -
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |   10 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |   11 +-
 drivers/pinctrl/berlin/pinctrl-as370.c             |    3 +-
 drivers/pinctrl/core.c                             |   20 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx23.c          |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx25.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx27.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx28.c          |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx35.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx50.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx51.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx53.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx6sll.c        |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx7d.c          |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        |    5 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx8mm.c         |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c        |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx93.c          |    4 +-
 drivers/pinctrl/freescale/pinctrl-imxrt1050.c      |    2 +-
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c      |    2 +-
 drivers/pinctrl/freescale/pinctrl-vf610.c          |    4 +-
 drivers/pinctrl/intel/Kconfig                      |   49 +-
 drivers/pinctrl/intel/Kconfig.tng                  |   33 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-alderlake.c          |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  135 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |    1 +
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |    2 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |    1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   84 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |    1 +
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |    2 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |    2 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c         |    1 +
 drivers/pinctrl/intel/pinctrl-icelake.c            |    2 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   36 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |   12 +
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |    1 +
 drivers/pinctrl/intel/pinctrl-lakefield.c          |    1 +
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |    2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   93 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |  677 +---------
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |    1 +
 drivers/pinctrl/intel/pinctrl-moorefield.c         |  640 +---------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |    1 +
 drivers/pinctrl/intel/pinctrl-tangier.c            |  589 +++++++++
 drivers/pinctrl/intel/pinctrl-tangier.h            |   92 ++
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt2701.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt2712.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt7981.c          |   44 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |    8 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt8167.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt8365.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt8516.c          |    1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    2 -
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c         | 1108 +++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c      |    3 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h      |    2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c          |    3 +-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |   37 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    1 -
 drivers/pinctrl/mvebu/pinctrl-ac5.c                |    1 -
 drivers/pinctrl/mvebu/pinctrl-armada-370.c         |    1 -
 drivers/pinctrl/mvebu/pinctrl-armada-375.c         |    1 -
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   16 +-
 drivers/pinctrl/mvebu/pinctrl-dove.c               |    3 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              |    2 -
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |    2 +-
 drivers/pinctrl/nxp/pinctrl-s32g2.c                |    2 +-
 drivers/pinctrl/pinctrl-amd.c                      |    4 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    7 +-
 drivers/pinctrl/pinctrl-at91.c                     |   10 +-
 drivers/pinctrl/pinctrl-axp209.c                   |    1 -
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |   15 +
 drivers/pinctrl/pinctrl-k210.c                     |    2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |    4 +-
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |   10 +
 drivers/pinctrl/pinctrl-mlxbf3.c                   |   16 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    4 +-
 drivers/pinctrl/pinctrl-oxnas.c                    | 1292 --------------------
 drivers/pinctrl/pinctrl-palmas.c                   |    1 -
 drivers/pinctrl/pinctrl-pic32.c                    |    5 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    5 +-
 drivers/pinctrl/pinctrl-single.c                   |   14 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    4 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |    1 -
 drivers/pinctrl/pinctrl-zynqmp.c                   |    9 +
 drivers/pinctrl/pinmux.c                           |    6 +-
 drivers/pinctrl/pxa/pinctrl-pxa25x.c               |    1 -
 drivers/pinctrl/pxa/pinctrl-pxa27x.c               |    1 -
 drivers/pinctrl/qcom/Kconfig                       |   19 +
 drivers/pinctrl/qcom/Makefile                      |    2 +
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |   10 -
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    9 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c               |    1 -
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    |  175 +++
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c    |  167 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    2 +
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    2 +-
 drivers/pinctrl/renesas/core.c                     |   17 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    3 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c             |    3 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   63 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |   63 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +-
 drivers/pinctrl/spear/pinctrl-spear1310.c          |    2 +-
 drivers/pinctrl/spear/pinctrl-spear1340.c          |    2 +-
 drivers/pinctrl/spear/pinctrl-spear300.c           |    2 +-
 drivers/pinctrl/spear/pinctrl-spear310.c           |    2 +-
 drivers/pinctrl/spear/pinctrl-spear320.c           |    2 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |    1 -
 .../pinctrl/starfive/pinctrl-starfive-jh7110-aon.c |    5 +-
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |    2 -
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |    1 -
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   38 +-
 drivers/pinctrl/sunplus/sppctl.c                   |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c      |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c       |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c         |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c      |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun5i.c              |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c       |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c         |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c         |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c          |    1 -
 drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c      |    1 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    6 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   24 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c           |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra210.c           |    2 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |   11 +-
 include/dt-bindings/gpio/amlogic-c3-gpio.h         |   72 ++
 .../amlogic,meson-g12a-gpio-intc.h                 |  126 ++
 include/linux/firmware/xlnx-zynqmp.h               |   13 +
 include/linux/pm.h                                 |    9 +
 228 files changed, 3909 insertions(+), 4314 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm11351-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm11351-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm8350-lpass-lpi-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt
 create mode 100644 drivers/pinctrl/intel/Kconfig.tng
 create mode 100644 drivers/pinctrl/intel/pinctrl-tangier.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-tangier.h
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-c3.c
 delete mode 100644 drivers/pinctrl/pinctrl-oxnas.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
 create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h
 create mode 100644
include/dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h
