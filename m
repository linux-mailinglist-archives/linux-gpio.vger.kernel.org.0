Return-Path: <linux-gpio+bounces-8316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282A938312
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2024 00:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46A9E1C20BF4
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2024 22:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20808148FF6;
	Sat, 20 Jul 2024 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdonwH1c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E809171C1
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2024 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721513876; cv=none; b=oBMJlCZjlHChvjl1WgHcgmzidmf4jPC40AtqlLqF7p3xRtpVuFakevNKn7ZAXAdKT96UqBCNt/BqorKdXT8DsfqvIvPqaPArF7XrWSMxV9x82njWVnuRcxPzhE4ANc04cRyCuTcy6BA9VWBv5VTZ7oTjWFwfKYrG9JcxC5jkyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721513876; c=relaxed/simple;
	bh=JXMRxe/aD7ieR6qGC7Li9xN3VCwt4XPKKXCSiscAuRA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WmA725j7812Y07KI/VXnAQaISuBd8vZbepwjLGL6wafvAFHTUW4XqlSBxoFd/+7B4tPK+zELd4PfKCt8fi9wQAbnp6PYF54B0os02nEY1UgdJuC6Ou3ksVoikf3eU4AhxNVAVhkqRp5qXOO4hLbXOtVmPjymVQQj+fz9a6Y0Yek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdonwH1c; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52efbb55d24so855151e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2024 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721513872; x=1722118672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hOhqbI/Ap4AvLJwLNqNYegobJKpybWaAhudmgd75UFQ=;
        b=bdonwH1cPyE86BNBcxnErrgra0+jRgXZcrNDxLx1laGKYZebRMKwwxwa3FvHpsRbPE
         3/HvTs4+ReH4JLTnKqVVK7zrkK6Z6ZAAYKUWuvtztP2PZz0SlLf85qVPqi+5ur6g+0mT
         xVbNvy1u4Gvqf7fOi8KZ9b1hZZ+K/0Jgf6rIZeD/r7SsljeooFdQd4ugtc0gSc67r/73
         DKwuJBRoaN0y+A2WViU+Z0nWzYP/KGJ2lgapD4yiXstYN2sOh/Xl0DWLVT1WvJ3Im0pn
         sNnbyFVGFWfx7d5sE5cjGOnPheRACwsMuB+p6E2JAC2p77U1CG/3skR6TP1ljn7r16DU
         bzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721513872; x=1722118672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOhqbI/Ap4AvLJwLNqNYegobJKpybWaAhudmgd75UFQ=;
        b=GgIURHqlgJcIM0x70F9EzFj74Iyxk3wwwoRnruPXYa7nL7h4fkxAzoKbOlkGk/obUW
         td6k+MFWBz3Y7eBUB0If5x9oBSbeFmiIPWd+ig3/UEmTYjD1oX/MHHUGijrdisKLVYnR
         YyPjSR9HLXXRL9/8p1RZLn8JUk56r8+I2EGLkoRi1kFzCjPumdKwYb+yrLL8l7+WEl6P
         VZcP7ULoQcF5Dvk27PsYCYG/2wUaPgpdJ64jAmC7FGMSvdKIns19j7imyeoE/f+sGfYj
         C1Vs6MwH5YCQjH6L3xv4HQIWOLzlA9gHMDbAurSvRb2jfuXgrw4E76m2L4e7/B1ugRlF
         UF9g==
X-Gm-Message-State: AOJu0YxjfJ43jItmOIe146BXbtHzynAnaCJNwiwNj5Elk8UKorjURQSL
	yLSLYjJWWwmFpvvj/NzVvwGciJFK7Nr4l2Khphdj34JO78mnp72j0P7lRIKtVOdzCYwVQvNYNOc
	K5kkd93j9LxcqfYLO80bwkHfPjea3fa1ak1X5Tw==
X-Google-Smtp-Source: AGHT+IHX/N+jBn4IPd00IpmdhcRMqbSm1tmnFl8SkFFavDVOKIw3uNBsOmEwfIEArDuBLBRwqSPgeeh8RwyZWPTYi0I=
X-Received: by 2002:ac2:4c55:0:b0:52c:ddef:4eb7 with SMTP id
 2adb3069b0e04-52efb53b6dbmr2088825e87.20.1721513871673; Sat, 20 Jul 2024
 15:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Jul 2024 00:17:40 +0200
Message-ID: <CACRpkdZovNTf+pqdvM6Rx26z7gkmmYyPUWHOBc1Dhu_780fFhg@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.11
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

this is the bulk of pin control changes for the v6.11 kernel cycle.
Some new drivers is the main part, the rest is cleanups and
nonurgent fixes. New drivers listed in the signed tag.
Nothing much special about this, no core changes this time.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0=
:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.11-1

for you to fetch changes up to 11eaac6e8e72001c28d2043eb160736187b7977d:

  Merge tag 'renesas-pinctrl-for-v6.11-tag3' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel (2024-07-05 12:08:48 +0200)

----------------------------------------------------------------
Pin control bulk changes for the v6.11 kernel series:

Core changes: None.

New drivers:

- Renesas RZ/V2H(P) SoC

- NXP Freescale i.MX91 SoC

- Nuvoton MA35D1 SoC

- Qualcomm PMC8380, SM4250, SM4250 LPI

Enhancements:

- A slew of scoped-based simplifications of of_node_put().

----------------------------------------------------------------
Alexey Klimov (1):
      pinctrl: qcom: lpass-lpi: increase MAX_NR_GPIO to 32

Andrew Jeffery (3):
      dt-bindings: pinctrl: aspeed: Use block syntax for function and group=
s
      dt-bindings: pinctrl: aspeed,ast2500-pinctrl: Describe SGPM
      dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Describe I3C, USB

Andy Shevchenko (11):
      pinctrl: berlin: Make use of struct pinfunction
      pinctrl: equilibrium: Make use of struct pinfunction
      pinctrl: ingenic: Provide a helper macro INGENIC_PIN_FUNCTION()
      pinctrl: mediatek: moore: Provide a helper macro PINCTRL_PIN_FUNCTION=
()
      pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
      pinctrl: pinmux: Embed struct pinfunction into struct function_desc
      pinctrl: imx: Convert to use func member
      pinctrl: ingenic: Convert to use func member
      pinctrl: keembay: Convert to use func member
      pinctrl: mediatek: moore: Convert to use func member
      pinctrl: pinmux: Remove unused members from struct function_desc

Chen Ni (1):
      pinctrl: mlxbf3: Fix return value check for devm_platform_ioremap_res=
ource

Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}

Dan Carpenter (1):
      pinctrl: nuvoton: ma35d1: Fix an IS_ERR() vs NULL check

Dmitry Yashin (1):
      pinctrl: rockchip: update rk3308 iomux routes

Geert Uytterhoeven (13):
      pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()
      pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
      pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
      pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
      pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
      pinctrl: renesas: r8a779g0: Fix IRQ suffixes
      pinctrl: renesas: r8a779g0: FIX PWM suffixes
      pinctrl: renesas: r8a779g0: Fix TCLK suffixes
      pinctrl: renesas: r8a779g0: Fix TPU suffixes
      pinctrl: renesas: r8a779h0: Add AVB MII pins and groups
      pinctrl: renesas: r8a779g0: Remove unneeded separators
      pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups, and function
      pinctrl: renesas: r8a779h0: Remove unneeded separators

Inochi Amaoto (1):
      dt-bindings: pinctrl: pinctrl-single: fix schmitt related properties

Jacky Huang (3):
      dt-bindings: reset: Add syscon to nuvoton ma35d1 system-management no=
de
      dt-bindings: pinctrl: Document nuvoton ma35d1 pin control
      pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver

Jeff Johnson (1):
      pinctrl: add missing MODULE_DESCRIPTION() macros

Konrad Dybcio (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMC8380
      pinctrl: qcom: spmi: Add PMC8380

Lad Prabhakar (19):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Remove the check
from the object
      pinctrl: renesas: rzg2l: Allow more bits for pin configuration
      pinctrl: renesas: rzg2l: Drop struct rzg2l_variable_pin_cfg
      pinctrl: renesas: rzg2l: Enable variable configuration for all
      pinctrl: renesas: rzg2l: Validate power registers for SD and ETH
      pinctrl: renesas: rzg2l: Add function pointer for PFC register lockin=
g
      pinctrl: renesas: rzg2l: Add function pointer for PMC register write
      pinctrl: renesas: rzg2l: Add function pointers for OEN register acces=
s
      pinctrl: renesas: rzg2l: Add support to configure slew-rate
      pinctrl: renesas: rzg2l: Add support for pull-up/down
      pinctrl: renesas: rzg2l: Pass pincontrol device to
pinconf_generic_parse_dt_config()
      pinctrl: renesas: rzg2l: Add support for custom parameters
      pinctrl: renesas: rzg2l: Acquire lock in rzg2l_pinctrl_pm_setup_pfc()
      dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
      pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC
      pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro to be 32-bit wid=
e
      pinctrl: renesas: rzg2l: Adjust bit masks for PIN_CFG_VARIABLE
to use BIT(62)
      pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN definition to top
of the file
      pinctrl: renesas: rzg2l: Reorganize variable configuration macro

Linus Walleij (4):
      Merge tag 'renesas-pinctrl-for-v6.11-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: freescale: Select missing features
      Merge tag 'renesas-pinctrl-for-v6.11-tag2-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'renesas-pinctrl-for-v6.11-tag3' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel

L=C3=A9o DUBOIN (2):
      pinctrl: core: take into account the pins array in pinctrl_pins_show(=
)
      pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()

Micha=C5=82 Miros=C5=82aw (1):
      pinctrl: renesas: sh73a0: Use rdev_get_drvdata()

Nathan Chancellor (1):
      pinctrl: keembay: Fix func conversion in keembay_build_functions()

Nirmala Devi Mal Nadar (1):
      pinctrl: pinctrl-tps6594: make tps65224_muxval_remap and
tps6594_muxval_remap as static to fix sparse warning

Nishanth Menon (1):
      dt-bindings: pinctrl: pinctrl-single: Fix
pinctrl-single,gpio-range description

Patrick Rudolph (5):
      pinctrl: cy8c95x0: Use single I2C lock
      pinctrl: cy8c95x0: Use regmap ranges
      pinctrl: cy8c95x0: Use REGCACHE_MAPLE
      pinctrl: cy8c95x0: Use cleanup.h
      pinctrl: cy8c95x0: Update cache modification

Paul Barker (3):
      pinctrl: renesas: rzg2l: Clarify OEN read/write support
      pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functio=
ns
      pinctrl: renesas: rzg2l: Support output enable on RZ/G2L

Peng Fan (24):
      pinctrl: renesas: Use scope based of_node_put() cleanups
      dt-bindings: pinctrl: imx: Support i.MX91 IOMUXC
      pinctrl: imx: Add pinctrl driver support for i.MX91
      pinctrl: stm32: Use scope based of_node_put() cleanups
      pinctrl: st: Use scope based of_node_put() cleanups
      dt-bindings: firmware: arm,scmi: Add properties for i.MX95
Pinctrl OEM extensions
      pinctrl: scmi: add blocklist
      pinctrl: imx: support SCMI pinctrl protocol for i.MX95
      pinctrl: tegra: Use scope based of_node_put() cleanups
      pinctrl: starfive: Use scope based of_node_put() cleanups
      pinctrl: sprd: Use scope based of_node_put() cleanups
      pinctrl: spear: Use scope based of_node_put() cleanups
      pinctrl: rockchip: Use scope based of_node_put() cleanups
      pinctrl: at91: Use scope based of_node_put() cleanups
      pinctrl: s32cc: Use scope based of_node_put() cleanups
      pinctrl: nomadik: Use scope based of_node_put() cleanups
      pinctrl: mediatek: Use scope based of_node_put() cleanups
      pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
      pinctrl: pinconf-generic: Use scope based of_node_put() cleanups
      pinctrl: freescale: mxs: Fix refcount of child
      pinctrl: k210: Use scope based of_node_put() cleanups
      pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
      pinctrl: equilibrium: Use scope based of_node_put() cleanups
      pinctrl: freescale: Use scope based of_node_put() cleanups

Potin Lai (2):
      dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
      pinctrl: aspeed-g6: Add NCSI pin group config

Richard Acayan (1):
      pinctrl: qcom: sdm670: add pdc wakeirq map

Sean Anderson (2):
      dt-bindings: pinctrl: xilinx: Add support for function with pins
      pinctrl: zynqmp: Support muxing individual pins

Srinivas Kandagatla (2):
      dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
      pinctrl: qcom: Introduce SM4250 LPI pinctrl driver

Stefan Wahren (1):
      pinctrl: bcm2835: Use string_choices API instead of ternary operator

Swati Agarwal (1):
      pinctrl: pinctrl-zynqmp: Use pin numbers stored in pin descriptor

Tomer Maimon (1):
      dt-bindings: pinctrl: npcm8xx: add missing pin group and mux function

Weihao Li (1):
      pinctrl: ralink: mt76x8: fix pinmux function

Yang Yingliang (3):
      pinctrl: core: fix possible memory leak when pinctrl_enable() fails
      pinctrl: single: fix possible memory leak when pinctrl_enable() fails
      pinctrl: ti: ti-iodelay: fix possible memory leak when
pinctrl_enable() fails

 .../devicetree/bindings/firmware/arm,scmi.yaml     |    4 +-
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  |   53 +
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   |  169 +-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   |  188 +-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |  514 +++++-
 ...sl,imx93-pinctrl.yaml =3D> fsl,imx9-pinctrl.yaml} |    8 +-
 .../bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml   |  178 ++
 .../bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml  |   22 +-
 .../bindings/pinctrl/pinctrl-single.yaml           |   17 +-
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    2 +
 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     |  118 ++
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   52 +-
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      |  349 ++--
 .../bindings/reset/nuvoton,ma35d1-reset.yaml       |    3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |   10 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    5 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |    1 +
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |    4 +-
 drivers/pinctrl/berlin/berlin.c                    |   21 +-
 drivers/pinctrl/berlin/berlin.h                    |    6 -
 drivers/pinctrl/core.c                             |   30 +-
 drivers/pinctrl/core.h                             |    2 +-
 drivers/pinctrl/freescale/Kconfig                  |   18 +
 drivers/pinctrl/freescale/Makefile                 |    2 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |  357 ++++
 drivers/pinctrl/freescale/pinctrl-imx.c            |   39 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |   16 +-
 drivers/pinctrl/freescale/pinctrl-imx91.c          |  271 +++
 drivers/pinctrl/freescale/pinctrl-mxs.c            |   18 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   10 +-
 drivers/pinctrl/mediatek/pinctrl-moore.h           |    6 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c          |   32 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |   42 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c          |   20 +-
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c          |   88 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c          |   34 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |   24 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    4 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    4 +-
 drivers/pinctrl/meson/pinctrl-meson-a1.c           |    1 +
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c      |    1 +
 drivers/pinctrl/meson/pinctrl-meson-axg.c          |    1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |    1 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |    1 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |    1 +
 drivers/pinctrl/meson/pinctrl-meson-s4.c           |    1 +
 drivers/pinctrl/meson/pinctrl-meson.c              |    1 +
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c         |    1 +
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    4 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    4 +-
 drivers/pinctrl/nuvoton/Kconfig                    |   19 +
 drivers/pinctrl/nuvoton/Makefile                   |    2 +
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             | 1187 +++++++++++++
 drivers/pinctrl/nuvoton/pinctrl-ma35.h             |   52 +
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c           | 1799 ++++++++++++++++=
++++
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |   31 +-
 drivers/pinctrl/pinconf-generic.c                  |    7 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    7 +-
 drivers/pinctrl/pinctrl-at91.c                     |   14 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |  212 +--
 drivers/pinctrl/pinctrl-equilibrium.c              |   45 +-
 drivers/pinctrl/pinctrl-equilibrium.h              |   12 -
 drivers/pinctrl/pinctrl-ingenic.c                  |  707 ++++----
 drivers/pinctrl/pinctrl-k210.c                     |    7 +-
 drivers/pinctrl/pinctrl-keembay.c                  |   24 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    1 +
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c             |    1 +
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |    1 +
 drivers/pinctrl/pinctrl-mlxbf3.c                   |   12 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   28 +-
 drivers/pinctrl/pinctrl-scmi.c                     |    9 +
 drivers/pinctrl/pinctrl-single.c                   |    7 +-
 drivers/pinctrl/pinctrl-st.c                       |   37 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    1 +
 drivers/pinctrl/pinctrl-tps6594.c                  |    4 +-
 drivers/pinctrl/pinctrl-zynqmp.c                   |   85 +-
 drivers/pinctrl/pinmux.c                           |   19 +-
 drivers/pinctrl/pinmux.h                           |   19 +-
 drivers/pinctrl/qcom/Kconfig                       |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c              |   19 +
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    |  236 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c             |  830 +++++----
 drivers/pinctrl/renesas/pfc-r8a779h0.c             |   82 +-
 drivers/pinctrl/renesas/pfc-sh73a0.c               |    4 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c             |   14 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  913 +++++++---
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |   26 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |    7 +-
 drivers/pinctrl/renesas/pinctrl.c                  |    7 +-
 drivers/pinctrl/spear/pinctrl-spear.c              |   13 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |   14 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |   27 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |   18 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    4 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |    7 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |    4 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |   42 +-
 100 files changed, 7428 insertions(+), 1959 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
 rename Documentation/devicetree/bindings/pinctrl/{fsl,imx93-pinctrl.yaml
=3D> fsl,imx9-pinctrl.yaml} (93%)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yam=
l
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx-scmi.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx91.c
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.c
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.h
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c

