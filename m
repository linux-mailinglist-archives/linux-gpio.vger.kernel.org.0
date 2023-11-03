Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C7A7E012B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 11:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbjKCIH4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 04:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234700AbjKCIHz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 04:07:55 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067291B6
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 01:07:50 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d84c24a810dso1810281276.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698998869; x=1699603669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L99sa/++J/QGh7Wa5W7Lu7c2aqv/URS7StWjxWHuPYc=;
        b=V2jPLBYK4P0rQQcel+eS+NnPOpCeOrcji49Rw4di63NKLlGqdO/XVefhxb2t4Zvial
         rVGrBzxXqYkCs/l0gfAN30QGkhEbbwkpEcCIalWztvTAI8OHJj5Suppt+bC4NpltBml0
         Q6bwOVKRVTqBMDfVeOEvPyYBieVWtaY7gDVF1ykWOd6MOGIC9BwQUhemvmC25kyM+JRx
         r6RotGSTXKxbrpfqNQiYw5Su5HS+wV3myZwqHgY91VlG8Tv2XMC+LcM0j8GK8x4otUfw
         6hodpC0oH1dVLobHzjh8UE28g8HmdwRrZsG4XnZhkaZ5UzW6onbBa3041XDbVapzRSrq
         tn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698998869; x=1699603669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L99sa/++J/QGh7Wa5W7Lu7c2aqv/URS7StWjxWHuPYc=;
        b=OJqEOTcArClXf4msAtMDEXmEFEU9NHmQpWPbvUJimjzaqz+9e+ItPcNYaOLO5JK4Tk
         Iez8RvHlyFFMa0HOL8gcE5cU+S9mMXUC80aP6pF6QZKJRa9IQhww70/cZTPzg0GLzeUV
         yKAnqOftCt7Y4ewkHG3F77EifutI/NhI5RXwaw1ov6dzsPZvVvbT7fCARO5t62lTBua6
         8VtdpUBZmIGeFQ0EzIXmAzjWALKSUffitK1aiWwRlHAgCPENpJYkrHuZRQum4OcgGPbB
         TVxJwjv9BIPs8V/XBI5zkdxQ+fSKk0mcfiC6U3XKnA2s1R2gZ2b7y0ZvJ9FShbTkPwX7
         XzAg==
X-Gm-Message-State: AOJu0YxNoNRby1UxM0++exIT92C9rtQ4WqwFOdpzWsdQFRnfg/VeWqYt
        9PYwqC1bFLpLqjfo4gnyeYIle546x+bRBd5xBPL2pyYZWaL1x3bH25E=
X-Google-Smtp-Source: AGHT+IFimB19oyKfvFvqGxu6CeIXdno/1SzjFESn6vv370Im+LsYhy6UHT0Jbz8syBM6wXzl1oaf722DSklA6H5PGV4=
X-Received: by 2002:a25:403:0:b0:da2:a918:36dd with SMTP id
 3-20020a250403000000b00da2a91836ddmr13637236ybe.36.1698998869062; Fri, 03 Nov
 2023 01:07:49 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Nov 2023 09:07:37 +0100
Message-ID: <CACRpkdZS13QkWAzfZo_PfKnm0SxWU0DtLSt_1st6jWwv3+-Jug@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.7
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the pull request for the bulk of pin control changes for v6.7.

No pin control core changes this time.

There is the patch moving ARRAY_SIZE() to a separate
header, affecting <linux/kernel.h> and <linux/string.h>, it comes from
Alajandro Colomar via Andy Shevchenko so I fully trust this change.

A single qualcomm patch also hits an SoC device tree down
in arch/arm/boot/dts/qcom/* for dependency reasons.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d=
:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.7-1

for you to fetch changes up to 63bffc2d3a99eaabc786c513eea71be3f597f175:

  pinctrl: Use device_get_match_data() (2023-10-30 14:50:42 +0100)

----------------------------------------------------------------
Pin control changes for the v6.7 kernel cycle

New drivers:

- Realtek RTD family pin control driver and RTD1619B,
  RTD1319D and RTD1315E subdrivers.

- Nuvoton NPCM8xx combined pin control and GPIO driver.

- Amlogic T7 pin control driver.

- Renesas RZ/G3S pin control driver.

Improvements:

- A number of additional UART groups added to the Mediatek
  MT7981 driver.

- MPM pin maps added for Qualcomm MSM8996, SM6115, SM6125
  and SDM660.

- Extra GPIO banks for the Sunxi H616.

- MLSP I2C6 function support in Qualcomm MSM8226.

- Some __counted_by() annotations for dynamic arrays.

- Ongoing work to make remove() return void.

- LSBC groups and functions in the Renesas R8A7778.

----------------------------------------------------------------
Alejandro Colomar (1):
      kernel.h: Move ARRAY_SIZE() to a separate header

Andy Shevchenko (15):
      pinctrl: intel: Simplify code with cleanup helpers
      pinctrl: denverton: Enable platform device in the absence of
ACPI enumeration
      pinctrl: Replace kernel.h by what is actually being used
      pinctrl: intel: Replace kernel.h by what is actually being used
      Merge patch series "Drop runtime PM support for Baytrail and
Lynxpoint pinctrl"
      pinctrl: baytrail: Replace kernel.h by what is actually being used
      pinctrl: cherryview: Replace kernel.h by what is actually being used
      pinctrl: lynxpoint: Replace kernel.h by what is actually being used
      pinctrl: merrifield: Replace kernel.h by what is actually being used
      pinctrl: moorefield: Replace kernel.h by what is actually being used
      pinctrl: broxton: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      pinctrl: denverton: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      pinctrl: cherryview: Avoid duplicated I/O
      pinctrl: cherryview: Simplify code with cleanup helpers
      pinctrl: core: Remove unneeded {} around one line conditional body

Biju Das (6):
      pinctrl: cy8c95x0: Simplify probe()
      pinctrl: sx150x: Simplify probe()
      pinctrl: renesas: rzg2l: Make reverse order of enable() for disable()
      pinctrl: mcp23s08_i2c: Extend match support for OF tables
      pinctrl: mcp23s08_spi: Simplify probe()
      pinctrl: mcp23s08: Simplify probe()/mcp23s08_spi_regmap_init()

Claudiu Beznea (8):
      pinctrl: renesas: rzg2l: Make struct
rzg2l_pinctrl_data::dedicated_pins constant
      pinctrl: renesas: rzg2l: Index all registers based on port offset
      pinctrl: renesas: rzg2l: Adapt for different SD/PWPR register offsets
      pinctrl: renesas: rzg2l: Adapt function number for RZ/G3S
      pinctrl: renesas: rzg2l: Move DS and OI to SoC-specific configuration
      pinctrl: renesas: rzg2l: Add support for different DS values on
different groups
      dt-bindings: pinctrl: renesas: Document RZ/G3S SoC
      pinctrl: renesas: rzg2l: Add RZ/G3S support

Dan Carpenter (1):
      pinctrl: realtek: Fix error handling in probe()

Daniel Golle (1):
      pinctrl: mediatek: mt7981: add additional uart groups

Fabio Estevam (1):
      pinctrl: mxs: Remove undocumented 'fsl,mxs-gpio' property

Geert Uytterhoeven (5):
      pinctrl: renesas: r8a7779: s/LSBC/LBSC/
      pinctrl: berlin: Drop superfluous ampersands
      pinctrl: nuvoton: Use pinconf_generic_dt_node_to_map_all()
      pinctrl: renesas: rzg2l: Rename rzg2l_gpio_configs[]
      pinctrl: renesas: r8a7778: Add LBSC pins, groups, and functions

Huqiang Qin (2):
      dt-bindings: pinctrl: Add support for Amlogic T7 SoCs
      pinctrl: Add driver support for Amlogic T7 SoCs

Jernej Skrabec (1):
      pinctrl: pinmux: Remove duplicate error message in pin_request()

Joe Wang (1):
      pinctrl: pinctrl-aspeed-g6: Add more settings for USB2AHP function

Karina Yankevich (2):
      pinctrl: mediatek: paris: handle mtk_hw_set_value() errors in
mtk_pmx_set_mux()
      pinctrl: mediatek: moore: handle mtk_hw_set_value() errors in
mtk_pinmux_set_mux()

Kees Cook (2):
      pinctrl: uniphier: Annotate struct uniphier_pinctrl_reg_region
with __counted_by
      pinctrl: samsung: Annotate struct exynos_muxed_weint_data with
__counted_by

Konrad Dybcio (4):
      pinctrl: qcom: msm8996: Add MPM pin mappings
      pinctrl: qcom: sm6115: Add MPM pin mappings
      pinctrl: qcom: sm6125: Add MPM pin mappings
      pinctrl: qcom: sdm660: Add MPM pin mappings

Krzysztof Kozlowski (1):
      dt-bindings: pinctrl: qcom,sa8775p-tlmm: add missing wakeup-parent

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Add validation of GPIO pin in
rzg2l_gpio_request()

Linus Walleij (8):
      pinctrl: nuvoton: Fix up Kconfig deps
      Merge branch 'ib-amlogic-t7' into devel
      Merge tag 'renesas-pinctrl-for-v6.7-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: realtek: Tag unused pins as __maybe_unused
      pinctrl: realtek: Fix some NULL dereference warnings
      Merge tag 'renesas-pinctrl-for-v6.7-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.7' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge tag 'intel-pinctrl-v6.7-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Luca Ceresoli (1):
      pinctrl: tegra: add OF node when logging OF parsing errors

Luca Weiss (4):
      dt-bindings: pinctrl: qcom,msm8226: Add blsp_i2c6 function
      pinctrl: qcom: msm8226: Add blsp_i2c6 function
      ARM: dts: qcom: msm8226: Add blsp1_i2c6 and blsp1_uart2
      dt-bindings: pinctrl: qcom,sc7280: Allow gpio-reserved-ranges

Martin Kaiser (1):
      dt-bindings: pinctrl: st,stm32: fix phandle-array warning

Masahiro Yamada (1):
      pinctrl: single: remove get rid of __maybe_unused

Mateusz Majewski (4):
      pinctrl: samsung: defer pinctrl_enable
      pinctrl: samsung: use add_pin_ranges method to add pinctrl ranges
      pinctrl: samsung: choose GPIO numberspace base dynamically
      pinctrl: samsung: do not offset pinctrl numberspaces

Matti Lehtim=C3=A4ki (2):
      pinctrl: qcom: msm8226: Add MPM pin mappings
      pinctrl: qcom: msm8974: Add MPM pin mappings

Raag Jadav (6):
      pinctrl: baytrail: fix debounce disable case
      pinctrl: baytrail: drop runtime PM support
      pinctrl: lynxpoint: drop runtime PM support
      pinctrl: intel: refine intel_config_set_pull() function
      pinctrl: cherryview: reduce scope of PIN_CONFIG_BIAS_HIGH_IMPEDANCE c=
ase
      pinctrl: intel: fetch community only when we need it

Rob Herring (4):
      dt-bindings: pinctrl: Add missing additionalProperties on child
node schemas
      dt-bindings: pinctrl: brcm: Ensure all child node properties are
documented
      dt-bindings: pinctrl: nuvoton,npcm845: Add missing
additionalProperties on gpio child nodes
      pinctrl: Use device_get_match_data()

Tomer Maimon (2):
      dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
      pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver

Tzuyi Chang (7):
      pinctrl: realtek: Add common pinctrl driver for Realtek DHC RTD SoCs
      pinctrl: realtek: Add pinctrl driver for RTD1315E
      pinctrl: realtek: Add pinctrl driver for RTD1319D
      pinctrl: realtek: Add pinctrl driver for RTD1619B
      dt-bindings: pinctrl: realtek: add RTD1315E pinctrl binding
      dt-bindings: pinctrl: realtek: add RTD1319D pinctrl binding
      dt-bindings: pinctrl: realtek: add RTD1619B pinctrl binding

Uwe Kleine-K=C3=B6nig (22):
      pinctrl: stmfx: Improve error message in .remove()'s error path
      pinctrl: single: Drop if block with always false condition
      pinctrl: ti: ti-iodelay: Drop if block with always false condition
      pinctrl: cirrus: madera-core: Convert to platform remove
callback returning void
      pinctrl: nomadik: abx500: Convert to platform remove callback
returning void
      pinctrl: amd: Convert to platform remove callback returning void
      pinctrl: artpec6: Convert to platform remove callback returning void
      pinctrl: as3722: Convert to platform remove callback returning void
      pinctrl: rockchip: Convert to platform remove callback returning void
      pinctrl: single: Convert to platform remove callback returning void
      pinctrl: stmfx: Convert to platform remove callback returning void
      pinctrl: tb10x: Convert to platform remove callback returning void
      pinctrl: qcom: spmi-gpio: Convert to platform remove callback
returning void
      pinctrl: qcom: spmi-mpp: Convert to platform remove callback
returning void
      pinctrl: qcom: ssbi-gpio: Convert to platform remove callback
returning void
      pinctrl: qcom: ssbi-mpp: Convert to platform remove callback
returning void
      pinctrl: ti: ti-iodelay: Convert to platform remove callback
returning void
      pinctrl: qcom/lpi: Convert to platform remove callback returning void
      pinctrl: qcom/msm: Convert to platform remove callback returning void
      pinctrl: sprd-sc9860: Convert to platform remove callback returning v=
oid
      pinctrl: cherryview: Convert to platform remove callback returning vo=
id
      pinctrl: renesas: rzn1: Convert to platform remove callback returning=
 void

Zev Weiss (1):
      pinctrl: aspeed: Allow changing SPI mode from hardware strap defaults

iuncuim (1):
      pinctrl: sunxi: h616: add extra gpio banks

 .../bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml    |   18 +-
 .../bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml     |    2 +-
 .../bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml     |    2 +-
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    1 +
 .../bindings/pinctrl/brcm,bcm6318-pinctrl.yaml     |    5 +
 .../bindings/pinctrl/brcm,bcm63268-pinctrl.yaml    |   25 +-
 .../bindings/pinctrl/brcm,bcm6328-pinctrl.yaml     |    5 +
 .../bindings/pinctrl/brcm,bcm6358-pinctrl.yaml     |    5 +-
 .../bindings/pinctrl/brcm,bcm6362-pinctrl.yaml     |    7 +-
 .../bindings/pinctrl/brcm,bcm6368-pinctrl.yaml     |    7 +-
 .../bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml  |  217 ++
 .../bindings/pinctrl/qcom,mdm9607-tlmm.yaml        |    3 +-
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml     |    4 +-
 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml        |    1 +
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      |    4 +
 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml |  188 ++
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml |  187 ++
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml |  186 ++
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   21 +
 .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml    |    1 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    2 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |    3 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   33 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |   19 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |   19 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |    7 +-
 drivers/pinctrl/bcm/pinctrl-ns.c                   |    8 +-
 drivers/pinctrl/berlin/berlin-bg2.c                |    8 +-
 drivers/pinctrl/berlin/berlin-bg2cd.c              |    8 +-
 drivers/pinctrl/berlin/berlin-bg2q.c               |    8 +-
 drivers/pinctrl/berlin/berlin-bg4ct.c              |    9 +-
 drivers/pinctrl/berlin/berlin.c                    |    8 +-
 drivers/pinctrl/berlin/pinctrl-as370.c             |    9 +-
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |    6 +-
 drivers/pinctrl/core.c                             |    6 +-
 drivers/pinctrl/freescale/pinctrl-mxs.c            |   13 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   32 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |    3 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  157 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |    7 +
 drivers/pinctrl/intel/pinctrl-intel.c              |  194 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   34 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |    2 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c         |    2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |    9 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c          |   16 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    4 +-
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c         | 1611 +++++++++++++
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c         |    9 +-
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c         |    9 +-
 drivers/pinctrl/mvebu/pinctrl-armada-ap806.c       |    5 +-
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c       |    6 +-
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c          |    9 +-
 drivers/pinctrl/mvebu/pinctrl-dove.c               |    6 +-
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c           |    7 +-
 drivers/pinctrl/mvebu/pinctrl-orion.c              |    7 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |   14 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   10 +-
 drivers/pinctrl/nuvoton/Kconfig                    |   17 +-
 drivers/pinctrl/nuvoton/Makefile                   |    1 +
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |   15 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          | 2491 ++++++++++++++++=
++++
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |   12 +-
 drivers/pinctrl/pinconf-generic.c                  |   16 +-
 drivers/pinctrl/pinconf.c                          |   14 +-
 drivers/pinctrl/pinctrl-amd.c                      |    6 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |    6 +-
 drivers/pinctrl/pinctrl-as3722.c                   |    5 +-
 drivers/pinctrl/pinctrl-at91.c                     |   11 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |    4 +-
 drivers/pinctrl/pinctrl-mcp23s08.h                 |    8 +
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c             |   93 +-
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |   97 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    6 +-
 drivers/pinctrl/pinctrl-single.c                   |   21 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   16 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |    7 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    6 +-
 drivers/pinctrl/pinctrl-utils.c                    |    6 +-
 drivers/pinctrl/pinctrl-xway.c                     |   11 +-
 drivers/pinctrl/pinmux.c                           |    6 +-
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    4 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |    2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    4 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |   22 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c             |   16 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c             |   14 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c  |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c            |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c              |   16 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |   14 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c              |   19 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    5 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    5 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    6 +-
 drivers/pinctrl/realtek/Kconfig                    |   23 +
 drivers/pinctrl/realtek/Makefile                   |    6 +
 drivers/pinctrl/realtek/pinctrl-rtd.c              |  596 +++++
 drivers/pinctrl/realtek/pinctrl-rtd.h              |  124 +
 drivers/pinctrl/realtek/pinctrl-rtd1315e.c         | 1440 +++++++++++
 drivers/pinctrl/realtek/pinctrl-rtd1319d.c         | 1610 +++++++++++++
 drivers/pinctrl/realtek/pinctrl-rtd1619b.c         | 1601 +++++++++++++
 drivers/pinctrl/renesas/pfc-r8a7778.c              |   38 +
 drivers/pinctrl/renesas/pfc-r8a7779.c              |    2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  715 ++++--
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |    6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |    2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |    2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   56 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    4 +-
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |    2 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |    3 +-
 drivers/pinctrl/sprd/pinctrl-sprd.h                |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c        |  380 ++-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |    8 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |   29 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |    2 +-
 .../dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h  |  179 ++
 include/linux/array_size.h                         |   13 +
 include/linux/kernel.h                             |    7 +-
 include/linux/pinctrl/machine.h                    |    2 +-
 include/linux/string.h                             |    1 +
 175 files changed, 12226 insertions(+), 952 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-t7.c
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
 create mode 100644 drivers/pinctrl/realtek/Kconfig
 create mode 100644 drivers/pinctrl/realtek/Makefile
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd.c
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd.h
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1315e.c
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1319d.c
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1619b.c
 create mode 100644 include/dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h
 create mode 100644 include/linux/array_size.h
