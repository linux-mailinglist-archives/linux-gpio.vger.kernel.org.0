Return-Path: <linux-gpio+bounces-26684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDCBAE586
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 20:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C861925AB2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 18:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E343824C669;
	Tue, 30 Sep 2025 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmEgMP5f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C9279DB6
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258105; cv=none; b=lkAV6V+PjwLVjf01MlYZiRn3Sh+mP5bd/+JFk4ZoeUO9fcq0zWWhYPrxBbMyS60LmHQ9uZ1qDtEZk5aGgxPqeVj55OUs4D6KJKzZD4mtSIA34N5svxBLVtSBwsHIfJofEwgl/fsCbCsI6PoBUv62tbSCO1UofVIIp/NnBrEXQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258105; c=relaxed/simple;
	bh=PttWtxy38QwFM5ibgDbSJuaXhakP/1w2D7AqfbXD42w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DiQYanxcdrCqwGEF/SAALXlmvcxz0N7XKMCL33NSUhQPY/xRbkUiShAbGNAwQSnfAtTeni86oplstHaMoVOqU0/lEyGMRlWVTLJjuMEav4LtAdkRfRZHu1Z+N4PRs+lSw6UwSZJCa56wqKh33LAICqlwRsye7HNzZQcqqeaotb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmEgMP5f; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36d77de259bso57778971fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 11:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759258101; x=1759862901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hnh21XvaGOCJAkrapajiN3bceeJjSl7N4i0tV50zqnA=;
        b=KmEgMP5fq5RwHY8oPHC4bQ3U/a7+92nAj/F5XI+poyu9tZ6iiZyXHToTaIx0rD/6ny
         NS0xruF2jtz65S6FvXW8gnRcgUlg6gN0PZJW9+gaH5m9JuCwI77Z9kfjI12SYganC+80
         CryD1LzcTamHhxkFh3FbmyyC7ph0Dq29hU/RVnAoiEhlyzesptMrRA+o4HxVcTS3woox
         Ndj57UIuuVIpvRh3Zft8BcN5fcs2gCCxqZkj3JcLGzTX3b5JYTHt2AODw1AAqylnDgue
         ej/cwWDsUDk4/yy/nFitAjWRKXCDyrA2aDHgQ5fNWag0iyOiPlf0PykxRWvlVi1FNtRw
         ypjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258101; x=1759862901;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hnh21XvaGOCJAkrapajiN3bceeJjSl7N4i0tV50zqnA=;
        b=Y5VV8Vd0nC1XM2diI/s8eMqNX/mT4O+WX1rPMH9lmLYWgK57C0uUw5tw0iEwUua1kv
         9avWy6z1GSwkBCklVAG95ndvRgHd5mGk/ocCC6X2OivYGN2HvKgq8Fjgkwj7vcNL54sJ
         QJnVpHf1hYBeKWBHgSTDjHBcLQ9KOwko1sP9bmKI7D6yzm8iO76VC46a8tm3fGne5B9W
         894VaVc2W+uC6ctYnhOpi1H2fqJLYaBZrwYu/0TZpYxU5yU1cchOtg5/WupPYb6wx1HW
         LTqYYYyR7yXZ6qj+2/meD/OncGYxI1a0BAiiUWOsVXKy+s8KFntgn3cXJ9jju0H6rWoU
         /QsA==
X-Gm-Message-State: AOJu0YylSu0HAFdo6iPZ7LKigBfPuIYH/n55b43REErAEVymeep2lfTw
	/1uLOPGhwpjJmU5h339iU72vcnsdu8NNRlFk+VWGFpVemL7ONE95cpgls1J68UertEBovVc6Vf5
	OBb36Oon47jgPGfjv/bkR7obHkEVvSI2Vnn51hb1d7g==
X-Gm-Gg: ASbGncv4Yvrkg2rcA+5oJEgPBj3vxQ6b3AqrPdz/khYpqs99Jmj6Xeqr/lR81BjGt3k
	w87vrCwNWNM8IYRw7YFb8UBWtCFqZkQe0kObJxuOmGed+VT4hCm/51WBs0G6mQBY837GLJLWQ4t
	Oa6L5zhY77q+w95oXiIHmVr3SLzGhlEC6EaqjAT5HZdXVHno93YDHSIe8CJYA7lXGf7fjQmek4Q
	5BCQCTMsh0r7ctjHJnAmazSrZr3RfhFG41+0x2ngg==
X-Google-Smtp-Source: AGHT+IEu+JS6aAjVeM7l3f36cMBWUrvsmLP0ZYbhnRAuYvkhfYZ3+h6s9TUMOJQ0Uby8nI6GS+uCDj9ySAWtxEdpyT0=
X-Received: by 2002:a05:651c:248:b0:372:8e46:3705 with SMTP id
 38308e7fff4ca-373a74d37d2mr1440031fa.44.1759258101175; Tue, 30 Sep 2025
 11:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 20:48:10 +0200
X-Gm-Features: AS18NWDPSBVNgomhFeb6TTi2p4886kIxy9yxvmj9JBov6DLckiU2cStki36e5Yk
Message-ID: <CACRpkda=9Q0akFMxAK3HeL74jbJ=+poVZq2Xom9jJr-2rOxe+A@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v6.18
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

this is the big pull request with v6.18 pin control changes.

Most of the details are in the signed tag, we have GPIO
awareness in the pin control core and an interesting AAEON
driver.

At rc6 you expressed strongly that you don't want to see
unsolicited Link: tags unless these provide some additional
information that is actually useful for regressions and
debugging, so at this point I dropped the automated addition
of Link: tags. They are still present on prior commits, I
hope that is OK for now. They will not be in future pull
requests.

Some GPIO and Renesas cross-tree changes are coming
into the diffstat through immutable branches that I pulled
in, including some string helper lib functions and what not.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.18-1

for you to fetch changes up to da3a88e9656c17a34daf49c9acc6d85f73b4d3d9:

  pinctrl: use more common syntax for compound literals (2025-09-24
00:41:08 +0200)

----------------------------------------------------------------
Pin control changes for the v6.18 kernel cycle:

Core changes:

- Allow pins to be identified/marked as GPIO mode with
  a special callback. The pin controller core is now
  "aware" if a pin is in GPIO mode if the callback is
  implemented in the driver, and can thus be marked
  as "strict", i.e. disallowing simultaneous use of a
  line as GPIO and another function such as I2C. This
  is enabled in the Qualcomm TLMM driver and also
  implemeted from day 1 in the new Broadcom STB driver.

- Rename the pin config option PIN_CONFIG_OUTPUT to
  PIN_CONFIG_LEVEL to better describe what the config is
  doing, as well as making it more intuitive what shall
  be returned when reading this property.

New drivers:

- Qualcomm SDM660 LPASS LPI TLMM pin controller subdriver.

- Qualcomm Glymur family pin controller driver.

- Broadcom STB family pin controller driver.

- Tegra186 pin controller driver.

- AAEON UP pin controller support. This is some special
  pin controller that works as an external advanced line
  MUX and amplifier for signals from an Intel SoC.
  A cooperative effort with the GPIO maintainer was
  needed to reach a solution where we reuse code from
  the GPIO aggregator/forwarder driver.

- Renesas RZ/T2H and RZ/N2H pin controller support.

- Axis ARTPEC-8 subdriver for the Samsung pin controller
  driver.

Improvements:

- Output enable (OEN) support in the Renesas RZG2L driver.

- Properly support bias pull up/down in the pinctrl-single
  driver.

- Move over all GPIO portions using generic MMIO GPIO to
  the new generic GPIO chip management which has a nice and
  separate API.

- Proper DT bindings for some older Broadcom SoCs.

- External GPIO (EGPIO) support in the Qualcomm SM8250.

Deleted code:

- Dropped the now unused Samsung S3C24xx drivers.

----------------------------------------------------------------
Aaron Kling (2):
      dt-bindings: pinctrl: Document Tegra186 pin controllers
      pinctrl: tegra: Add Tegra186 pinmux driver

Andrea della Porta (2):
      pinctrl: rp1: Add regmap ranges to RP1 gpio controller
      dt-bindings: pinctrl: rp1: Describe groups for RP1 pin controller

Bartosz Golaszewski (22):
      pinctrl: stm32: use new generic GPIO chip API
      pinctrl: equilibrium: use new generic GPIO chip API
      pinctrl: npcm8xx: use new generic GPIO chip API
      pinctrl: npcm7xx: use new generic GPIO chip API
      pinctrl: wpcm450: use new generic GPIO chip API
      pinctrl: check the return value of pinmux_ops::get_function_name()
      devres: provide devm_kmemdup_const()
      pinctrl: ingenic: use struct pinfunction instead of struct function_desc
      pinctrl: airoha: replace struct function_desc with struct pinfunction
      pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
      pinctrl: mediatek: moore: replace struct function_desc with
struct pinfunction
      pinctrl: imx: don't access the pin function radix tree directly
      pinctrl: keembay: release allocated memory in detach path
      pinctrl: keembay: use a dedicated structure for the pinfunction
description
      pinctrl: constify pinmux_generic_get_function()
      pinctrl: make struct pinfunction a pointer in struct function_desc
      pinctrl: qcom: use generic pin function helpers
      pinctrl: allow to mark pin functions as requestable GPIOs
      pinctrl: qcom: add infrastructure for marking pin functions as GPIOs
      pinctrl: qcom: mark the `gpio` and `egpio` pins function as
non-strict functions
      pinctrl: qcom: make the pinmuxing strict
      pinctrl: use more common syntax for compound literals

Biju Das (2):
      pinctrl: renesas: rzg2l: Fix OEN resume
      pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt
control registers

Chi Zhang (1):
      pinctrl: single: fix bias pull up/down handling in pin_config_set

Da Xue (2):
      pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
      pinctrl: meson-gxl: add missing i2c_d pinmux

Dan Carpenter (1):
      pinctrl: keembay: fix double free in keembay_build_functions()

Fange Zhang (1):
      pinctrl: sx150x: Make the driver tristate

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag3' into
renesas-pinctrl-for-v6.18

Hendrik Hamerlinck (2):
      pinctrl: spacemit: remove extra line in debug output
      pinctrl: spacemit: fix typo in PRI_TDI pin name

Ivan T. Ivanov (2):
      dt-bindings: pinctrl: Add support for Broadcom STB pin controller
      pinctrl: bcm: Add STB family pin controller driver

Julien Massot (1):
      dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names

Krzysztof Kozlowski (4):
      pinctrl: stm32: Constify static 'pinctrl_desc'
      pinctrl: samsung: Drop unused S3C24xx driver data
      dt-bindings: pinctrl: samsung: Drop S3C2410
      pinctrl: Simplify printks with pOF format

Lad Prabhakar (10):
      pinctrl: renesas: rzg2l: Fix invalid unsigned return in rzg3s_oen_read()
      pinctrl: renesas: rzg2l: Parameterize OEN register offset
      pinctrl: renesas: rzg2l: Unify OEN access by making pin-to-bit
mapping configurable
      pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
      pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
      pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC
      pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks
      dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
      dt-bindings: pinctrl: renesas: Document RZ/T2H and RZ/N2H SoCs
      pinctrl: renesas: rzt2h: Add support for RZ/N2H

Liao Yuanhong (1):
      pinctrl: equilibrium: Remove redundant semicolons

Linus Walleij (6):
      Merge tag 'gpio-aggregator-refactoring-for-v6.18-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel
      Merge branch 'ib-gpio_generic_chip_init' into devel
      Merge tag 'renesas-pinctrl-for-v6.18-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: generic: rename PIN_CONFIG_OUTPUT to LEVEL
      Merge tag 'samsung-pinctrl-6.18' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge tag 'renesas-pinctrl-for-v6.18-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel

Marek Vasut (1):
      pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment

Mario Limonciello (AMD) (2):
      pinctrl: amd: Add PM debugging message for turning on/off wakes
      pinctrl: amd: Don't access irq_data's hwirq member directly

Mohammad Rafi Shaik (1):
      dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document
the clock property

Nickolay Goppen (2):
      pinctrl: qcom: lpass-lpi: Add ability to use custom pin offsets
      dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl

Pankaj Patil (2):
      dt-bindings: pinctrl: qcom: Add Glymur pinctrl
      pinctrl: qcom: Add glymur pinctrl driver

Qianfeng Rong (7):
      pinctrl: microchip-sgpio: use kcalloc() instead of kzalloc()
      pinctrl: pinctrl-zynqmp: use kcalloc() instead of kzalloc()
      pinctrl: qcom: sc8180x: use kcalloc() instead of kzalloc()
      pinctrl: sunxi: use kcalloc() instead of kzalloc()
      pinctrl: renesas: Use int type to store negative error codes
      pinctrl: armada-37xx: Use int type to store negative error codes
      pinctrl: ma35: Use int type to store negative error codes

Richard Acayan (1):
      pinctrl: qcom: Add SDM660 LPASS LPI TLMM

Rob Herring (Arm) (2):
      dt-bindings: pinctrl: Convert brcm,bcm2835-gpio to DT schema
      dt-bindings: pinctrl: Convert brcm,iproc-gpio to DT schema

Sean Parker (1):
      pinctrl: qcom: sm8250: Add egpio support

SeonGu Kang (2):
      dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
      pinctrl: samsung: Add ARTPEC-8 SoC specific configuration

Thierry Bultel (1):
      pinctrl: renesas: Add support for RZ/T2H

Thomas Richard (10):
      gpiolib: add support to register sparse pin range
      gpio: aggregator: move GPIO forwarder allocation in a dedicated function
      gpio: aggregator: refactor the code to add GPIO desc in the forwarder
      gpio: aggregator: refactor the forwarder registration part
      gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
      gpio: aggregator: export symbols of the GPIO forwarder library
      gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
      gpio: aggregator: add possibility to attach data to the forwarder
      lib/string_choices: Add str_input_output() helper
      pinctrl: Add pin controller driver for AAEON UP boards

Wolfram Sang (1):
      pinctrl: remove unneeded 'fast_io' parameter in regmap_config

Xichao Zhao (1):
      pinctrl: bcm: use PTR_ERR_OR_ZERO() to simplify code

Yulin Lu (1):
      pinctrl: eswin: Fix regulator error check and Kconfig dependency

 .../bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml   |  137 ++
 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         |   99 -
 .../bindings/pinctrl/brcm,bcm2835-gpio.yaml        |  120 ++
 .../bindings/pinctrl/brcm,iproc-gpio.txt           |  123 --
 .../bindings/pinctrl/brcm,iproc-gpio.yaml          |  111 ++
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |    2 +
 .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   |  285 +++
 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  133 ++
 .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     |   16 +
 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     |  109 ++
 .../bindings/pinctrl/raspberrypi,rp1-gpio.yaml     |   35 +-
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         |  172 ++
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   19 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml          |    5 +-
 Documentation/driver-api/pin-control.rst           |    4 +-
 drivers/base/devres.c                              |   21 +
 drivers/gpio/gpio-aggregator.c                     |  388 +++-
 drivers/gpio/gpio-rockchip.c                       |    2 +-
 drivers/gpio/gpiolib.c                             |   29 +-
 drivers/pinctrl/Kconfig                            |   23 +-
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/bcm/Kconfig                        |   12 +
 drivers/pinctrl/bcm/Kconfig.stb                    |   10 +
 drivers/pinctrl/bcm/Makefile                       |    2 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    6 +-
 drivers/pinctrl/bcm/pinctrl-bcm6358.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c      |  747 ++++++++
 drivers/pinctrl/bcm/pinctrl-brcmstb.c              |  442 +++++
 drivers/pinctrl/bcm/pinctrl-brcmstb.h              |   93 +
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |   45 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |   23 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   12 +-
 drivers/pinctrl/mediatek/pinctrl-moore.h           |    7 +-
 drivers/pinctrl/mediatek/pinctrl-mt7622.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c          |   44 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    4 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |    6 +-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |    8 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |   10 +
 drivers/pinctrl/meson/pinctrl-meson.c              |    6 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |    6 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    6 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             |    3 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  187 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  160 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |   44 +-
 drivers/pinctrl/pinconf-generic.c                  |    6 +-
 drivers/pinctrl/pinctrl-amd.c                      |   41 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    2 +-
 drivers/pinctrl/pinctrl-aw9523.c                   |    6 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |    2 +-
 drivers/pinctrl/pinctrl-eic7700.c                  |    2 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |   30 +-
 drivers/pinctrl/pinctrl-equilibrium.h              |    2 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |   53 +-
 drivers/pinctrl/pinctrl-k210.c                     |    2 +-
 drivers/pinctrl/pinctrl-keembay.c                  |   30 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |    6 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    4 +-
 drivers/pinctrl/pinctrl-pic32.c                    |    4 +-
 drivers/pinctrl/pinctrl-rk805.c                    |    4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    6 +-
 drivers/pinctrl/pinctrl-rp1.c                      |   96 +-
 drivers/pinctrl/pinctrl-scmi.c                     |    2 +-
 drivers/pinctrl/pinctrl-single.c                   |    8 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    4 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   12 +-
 drivers/pinctrl/pinctrl-upboard.c                  | 1070 +++++++++++
 drivers/pinctrl/pinctrl-zynqmp.c                   |    2 +-
 drivers/pinctrl/pinmux.c                           |   70 +-
 drivers/pinctrl/pinmux.h                           |    9 +-
 drivers/pinctrl/qcom/Kconfig                       |   11 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    2 +
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 1777 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   26 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   18 +
 drivers/pinctrl/qcom/pinctrl-mdm9607.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   51 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    5 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |    4 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |    4 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |    4 +-
 drivers/pinctrl/qcom/pinctrl-sar2130p.c            |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |    4 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c             |    4 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c            |    4 +-
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    |  160 ++
 drivers/pinctrl/qcom/pinctrl-sdm660.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |   83 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c              |    4 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c              |    4 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c              |    4 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    8 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    8 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    4 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    4 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    2 +-
 drivers/pinctrl/renesas/Kconfig                    |   13 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c             |    2 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    4 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c             |    2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  220 +--
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            |  813 ++++++++
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |    2 +-
 drivers/pinctrl/renesas/pinctrl.c                  |    3 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |   50 +
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    5 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              |    4 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |    9 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |   36 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    2 +-
 drivers/pinctrl/sunplus/sppctl.c                   |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c           |   11 +-
 drivers/pinctrl/tegra/Kconfig                      |    4 +
 drivers/pinctrl/tegra/Makefile                     |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra186.c           | 1979 ++++++++++++++++++++
 drivers/soc/tegra/Kconfig                          |    1 +
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |    1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |    1 +
 .../pinctrl/renesas,r9a09g077-pinctrl.h            |   22 +
 include/linux/device/devres.h                      |    2 +
 include/linux/gpio/driver.h                        |   51 +-
 include/linux/gpio/forwarder.h                     |   41 +
 include/linux/pinctrl/pinconf-generic.h            |   12 +-
 include/linux/pinctrl/pinctrl.h                    |   14 +
 include/linux/pinctrl/pinmux.h                     |    2 +
 include/linux/string_choices.h                     |    6 +
 sound/hda/codecs/side-codecs/cirrus_scodec_test.c  |    2 +-
 177 files changed, 9804 insertions(+), 1027 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/Kconfig.stb
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.h
 create mode 100644 drivers/pinctrl/pinctrl-upboard.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra186.c
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
 create mode 100644 include/linux/gpio/forwarder.h

