Return-Path: <linux-gpio+bounces-29389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A2CAD798
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BE903071FAB
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0532D63E2;
	Mon,  8 Dec 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjgkgcgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D7A2C029D
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765204446; cv=none; b=m0u1AMz+Vr9SXDP8pFjudlhYSROIi9o+hCYzQi4gVibKdF8+ZWVDkd1LEoHAMe8J701tX348ROoQxC4H6krO9QjZLYJ7RE76f/wkEUmSX8OAQuepbrskvPyn/TH5p9YEldQKRSb/cKnNy9Gi1Z6UL4IeH7yharPaJ3DNhgCLONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765204446; c=relaxed/simple;
	bh=rW41oZrrx2tTE7HfFuok2cS0yN4AHjdFH7/bhzXOilQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Rtq4Q8+7mxCIWuEjW97sn3t6BMBX2KdzdAOsgDOb6gejrwnmpG96uXROD3AFKL7fro66pnjsFbRNlSdIjhfG89RX1Flji96nuZl/axueK6aiqpS5lC6X8ETpqQSX5Homoc6aQSsoUjidlss7PJ5ajnSETcxw6y/ZOwqKB+lnpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjgkgcgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D0AC19422
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765204445;
	bh=rW41oZrrx2tTE7HfFuok2cS0yN4AHjdFH7/bhzXOilQ=;
	h=From:Date:Subject:To:Cc:From;
	b=JjgkgcgLia8G35c64FzUUuR3+Ms/5SvhfQai2A9DrAXlBvW3NrqH7HNBK30Gevlqw
	 eFR1iBpH9aHFuXgKC+qml1rLYGVvqugJ0q0yilKy2GniBeHD2QOPANCAI37OLR00Le
	 NYi005kQhFW7/2PV/njMMRrTJ26WJRBFqOUjo2MJ7+jpZDBT9rBYxyS28eVkolkm72
	 0DrZODkL38IlLXkO0IvUzCyuXo0ahfAxuZfvyWUyHyKdFt3plx5ZSG6W+KqaZZXTVz
	 pDwGgqBxXY9rE/6akO6e3JiBfi9yqW67nSw3/hODEPVmdfjn1RKRH6PlypDUWXm4Lg
	 Ao0j39wt46aFw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787da30c50fso44323977b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 06:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDNeA/m0DqMjUYGFSg7Jb/6DfI/G0GlLeZq09YWSbbjOWcWsrJyxjtrwG3BG/oU2qxQDJJUaoO3G5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5y7aATk9/VDYwpLNxH4IA+yQatKKw1bt8i/lFYTdnSsY2vjLq
	zVJun9AQOyplE0sWi0d04/ncZXDTO/FmU0EgdU0FElFHKE0TBe7Go774MtsOpszw46r7TTsl1IF
	uz21nV8Zdg2M2kQyalLsyuOIcKSSq5WI=
X-Google-Smtp-Source: AGHT+IHJF+FbiQ1G7QcKN6F19bLMkcmTFla3+1w+ZZ38K5BMzUoQnn74szy2JlZO5lPq7gBjyhRAy5jIGk4I2JRmXP4=
X-Received: by 2002:a05:690c:6c93:b0:786:5471:f44c with SMTP id
 00721157ae682-78c33caea30mr158601747b3.63.1765204444932; Mon, 08 Dec 2025
 06:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Dec 2025 15:33:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLkbd9tuMBD6UKY2SNHcyESAFWu78+yxYm=fkpufac1WNg@mail.gmail.com>
X-Gm-Features: AQt7F2ricVtOsDZM73p29pCYea0lpnnAtYQd-yAsMl2BUjc8KKy03kg4rL6UOkQ
Message-ID: <CAD++jLkbd9tuMBD6UKY2SNHcyESAFWu78+yxYm=fkpufac1WNg@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.19
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux pin control <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here is the big bulk of pin control changes for v6.19.

You will get a sweet merge conflict in MAINTAINERS because
both Bartosz and I moved our mail addresses over to kernel.org
at the same time. This also makes the conflict resolution obvious:
both should have @kernel.org addresses after the merge.

The technical details are in the signed tag. For me the CIX Semi
and Axis Communications ARTPEC-9 SoCs were the most
interesting new drivers in this merge window.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.19-1

for you to fetch changes up to 666065caa31aeb812978740bae21871067bb14b6:

  pinctrl: add CONFIG_OF dependencies for microchip drivers
(2025-12-04 20:38:57 +0100)

----------------------------------------------------------------
Pin control changes for the v6.19 kernel cycle:

Core changes:

- Handle per-direction skew control in the generic pin config.

- Drop the pointless subsystem boilerplate banner message during
  boot. Less noise in the console. It's available as debug message
  if someone really want it.

New drivers:

- Samsung Exynos 8890 SoC support.

- Samsung Exynos derived Axis Communications ARTPEC-9 SoC support.
  These guys literally live next door to me, ARTPEC spells out
  "Axis Real-Time Picture Encoding Chip" and is tailored for camera
  image streams and is something they have evolved for a quarter of
  a century.

- Mediatek MT6878 SoC support.

- Qualcomm Glymur PMIC support (mostly just compatible strings).

- Qualcomm Kaanapali SoC TLMM support.

- Microchip pic64gx "gpio2" SoC support.

- Microchip Polarfire "iomux0" SoC support.

- CIX Semiconductors SKY1 SoC support.

- Rockchip RK3506 SoC support.

- Airhoa AN7583 chip support.

Improvements:

- Improvements for ST Microelectronics STM32 handling of skew
  settings so input and output can have different skew settings.

- A whole bunch of device tree binding cleanups: Marvell Armada and
  Berlin, Actions Semiconductor S700 and S900, Broadcom Northstar 2
  (NS2), Bitmain BM1880 and Spreadtrum SC9860 are moved over to schema.

----------------------------------------------------------------
Abel Vesa (2):
      pinctrl: qcom: glymur: Drop unnecessary platform data from match table
      pinctrl: qcom: glymur: Fix the gpio and egpio pin functions

Alexey Klimov (1):
      dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add QCM2290 compatible

Ali Tariq (1):
      pinctrl: starfive: use dynamic GPIO base allocation

Andy Shevchenko (26):
      pinctrl: baytrail: Unify messages with help of dev_err_probe()
      pinctrl: cherryview: Unify messages with help of dev_err_probe()
      pinctrl: intel: Unify messages with help of dev_err_probe()
      pinctrl: lynxpoint: Unify messages with help of dev_err_probe()
      pinctrl: tangier: Unify messages with help of dev_err_probe()
      Merge patch series "pinctrl: intel: Unify error messages"
      pinctrl: intel: Introduce INTEL_GPP() macro
      pinctrl: alderlake: Switch to INTEL_GPP() macro
      pinctrl: cannonlake: Switch to INTEL_GPP() macro
      pinctrl: icelake: Switch to INTEL_GPP() macro
      pinctrl: jasperlake: Switch to INTEL_GPP() macro
      pinctrl: lakefield: Switch to INTEL_GPP() macro
      pinctrl: meteorlake: Switch to INTEL_GPP() macro
      pinctrl: meteorpoint: Switch to INTEL_GPP() macro
      pinctrl: tigerlake: Switch to INTEL_GPP() macro
      pinctrl: sunrisepoint: Switch to INTEL_GPP() macro
      Merge patch series "pinctrl: intel: Consolidate struct
intel_padgroup initialisers"
      pinctrl: cedarfork: Switch to INTEL_GPP() macro
      pinctrl: denverton: Switch to INTEL_GPP() macro
      pinctrl: emmitsburg: Switch to INTEL_GPP() macro
      pinctrl: cherryview: Switch to INTEL_GPP() macro
      pinctrl: elkhartlake: Switch to INTEL_GPP() macro
      Merge patch series "pinctrl: intel: Convert the rest to use INTEL_GPP()"
      pinctrl: intel: Export intel_gpio_add_pin_ranges()
      pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()
      Merge patch series "pinctrl: intel: Export
intel_gpio_add_pin_ranges() and use it"

Anjelique Melendez (1):
      pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 & PMH01XX PMICs support

Antonio Borneo (11):
      pinctrl: pinconf-generic: Fix minor typos in comments
      pinctrl: pinconf-generic: Handle string values for generic properties
      pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put-ps'
      dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put-ps'
      pinctrl: stm32: Rework stm32_pconf_parse_conf()
      pinctrl: stm32: Simplify handling of backup pin status
      pinctrl: stm32: Drop useless spinlock save and restore
      pinctrl: stm32: Avoid keeping a bool value in a u32 variable
      pinctrl: stm32: Support I/O synchronization parameters
      dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
      dt-bindings: pinctrl: stm32: Support I/O synchronization parameters

Antony Kurniawan Soemardi (1):
      dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node to tlmm

Arnd Bergmann (1):
      pinctrl: add CONFIG_OF dependencies for microchip drivers

Biju Das (2):
      pinctrl: renesas: rzg2l: Drop unnecessary pin configurations
      pinctrl: renesas: rzg2l: Fix PMC restore

Bryan Brattlof (1):
      dt-bindings: pinctrl: pinctrl-single: add ti,am62l-padconf compatible

Chen Ni (1):
      pinctrl: airoha: convert comma to semicolon

Christian Marangi (5):
      pinctrl: airoha: generalize pins/group/function/confs handling
      pinctrl: airoha: convert PHY LED GPIO to macro
      pinctrl: airoha: convert PWM GPIO to macro
      dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
      pinctrl: airoha: add support for Airoha AN7583 PINs

Chukun Pan (1):
      pinctrl: airoha: fix pinctrl function mismatch issue

Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Fix ISEL restore on resume

Conor Dooley (7):
      dt-bindings: soc: microchip: document the simple-mfd syscon on
PolarFire SoC
      dt-bindings: pinctrl: document pic64gx "gpio2" pinmux
      pinctrl: add pic64gx "gpio2" pinmux driver
      dt-bindings: pinctrl: document polarfire soc iomux0 pinmux
      pinctrl: add polarfire soc iomux0 pinmux driver
      MAINTAINERS: add Microchip RISC-V pinctrl drivers/bindings to entry
      pinctrl: mpfs-iomux0: fix compile-time constant warning for LLVM
prior to 17

Cosmin Tanislav (2):
      pinctrl: renesas: rzg2l: Remove extra semicolons
      pinctrl: renesas: rzg2l: Remove useless wrappers

Dan Carpenter (1):
      pinctrl-scmi: remove unused struct members

Frank Wunderlich (1):
      dt-bindings: pinctrl: mt7988: allow gpio-hogs

Gary Yang (2):
      dt-bindings: pinctrl: Add cix,sky1-pinctrl
      pinctrl: cix: Add pin-controller support for sky1

Gatien Chevallier (1):
      pinctrl: stm32: handle semaphore acquisition when handling pinctrl/pinmux

Geert Uytterhoeven (3):
      pinctrl: renesas: Remove unneeded semicolons
      pinctrl: renesas: rza1: Make mux_conf const in rza1_pin_mux_single()
      pinctrl: renesas: r8a779h0: Remove STPWT_EXTFXR

Haotian Zhang (2):
      pinctrl: stm32: fix hwspinlock resource leak in probe function
      pinctrl: single: Fix incorrect type for error return variable

Huy Bui (3):
      pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
      pinctrl: renesas: r8a779g0: Remove STPWT_EXTFXR
      pinctrl: renesas: r8a779h0: Remove CC5_OSCOUT

Igor Belwon (3):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl

Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: add exynos8890 compatible
      dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
      pinctrl: samsung: add exynos8890 SoC pinctrl configuration

Jacky Chou (1):
      dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group

Jingyi Wang (2):
      dt-bindings: pinctrl: describe Kaanapali TLMM
      pinctrl: qcom: add the tlmm driver for Kaanapali platforms

Jishnu Prakash (1):
      dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO bindings for Glymur PMICs

John Madieu (1):
      pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling

Krzysztof Kozlowski (1):
      dt-bindings: pinctrl: toshiba,visconti: Drop redundant functions type

Linus Walleij (10):
      pinctrl: Demote subsystem banner message
      pinctrl: pinmux: Add missing .function_is_gpio kerneldoc
      Merge tag 'mpfs-pinctrl-binding-base' of
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into devel
      pinctrl: cix: sky1: Provide pin control dummy states
      Merge tag 'renesas-pinctrl-for-v6.19-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.19' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge tag 'renesas-pinctrl-for-v6.19-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: cix: Fix obscure dependency
      Merge tag 'intel-pinctrl-v6.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      MAINTAINERS: Change Linus Walleij mail address

Maksim Kiselev (1):
      pinctrl: mcp23s08: init reg_defaults from HW at probe and switch
cache type

Marek Vasut (2):
      pinctrl: renesas: Drop duplicate newlines
      dt-bindings: pinctrl: cix,sky1-pinctrl: Drop duplicate newline

Nathan Chancellor (1):
      pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in
an7583_pinctrl_match_data

Rob Herring (Arm) (7):
      dt-bindings: pinctrl: Convert Marvell Berlin pinctrl to DT schema
      dt-bindings: pinctrl: Convert
marvell,armada-3710-(sb|nb)-pinctrl to DT schema
      dt-bindings: pinctrl: Convert actions,s700-pinctrl to DT schema
      dt-bindings: pinctrl: Convert actions,s900-pinctrl to DT schema
      dt-bindings: pinctrl: Convert brcm,ns2-pinmux to DT schema
      dt-bindings: pinctrl: Convert bitmain,bm1880-pinctrl to DT schema
      dt-bindings: pinctrl: Convert sprd,sc9860-pinctrl to DT schema

SeonGu Kang (2):
      dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-9 SoC
      pinctrl: samsung: Add ARTPEC-9 SoC specific configuration

Subbaraman Narayanamurthy (1):
      pinctrl: qcom: spmi-gpio: add support for {LV_VIN2, MV_VIN3}_CLK subtypes

Svyatoslav Ryhel (1):
      pinctrl: tegra20: register csus_mux clock

Thanh Quan (1):
      pinctrl: renesas: r8a779g0: Remove AVB[01]_MII

Ye Zhang (2):
      dt-bindings: pinctrl: Add rk3506 pinctrl support
      pinctrl: rockchip: Add rk3506 pinctrl support

 .../bindings/clock/armada3700-xtal-clock.txt       |   29 -
 .../devicetree/bindings/mfd/syscon-common.yaml     |    3 -
 .../bindings/pinctrl/actions,s700-pinctrl.txt      |  170 --
 .../bindings/pinctrl/actions,s700-pinctrl.yaml     |  204 ++
 .../bindings/pinctrl/actions,s900-pinctrl.txt      |  204 --
 .../bindings/pinctrl/actions,s900-pinctrl.yaml     |  219 ++
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    |  402 ++++
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |    2 +
 .../devicetree/bindings/pinctrl/berlin,pinctrl.txt |   47 -
 .../bindings/pinctrl/bitmain,bm1880-pinctrl.txt    |  126 -
 .../bindings/pinctrl/bitmain,bm1880-pinctrl.yaml   |  132 +
 .../bindings/pinctrl/brcm,ns2-pinmux.txt           |  102 -
 .../bindings/pinctrl/brcm,ns2-pinmux.yaml          |  111 +
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml         |   91 +
 .../pinctrl/marvell,armada-37xx-pinctrl.txt        |  195 --
 .../pinctrl/marvell,armada3710-xb-pinctrl.yaml     |  124 +
 .../pinctrl/marvell,berlin2-soc-pinctrl.yaml       |   86 +
 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  211 ++
 .../bindings/pinctrl/mediatek,mt7988-pinctrl.yaml  |    5 +
 .../pinctrl/microchip,mpfs-pinctrl-iomux0.yaml     |   89 +
 .../pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml   |   74 +
 .../devicetree/bindings/pinctrl/pincfg-node.yaml   |   17 +
 .../bindings/pinctrl/pinctrl-single.yaml           |    1 +
 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml      |  127 +
 .../bindings/pinctrl/qcom,msm8960-pinctrl.yaml     |    4 +-
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |   15 +
 .../pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml     |    8 +-
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |    1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |    6 +-
 .../devicetree/bindings/pinctrl/sprd,pinctrl.txt   |   83 -
 .../bindings/pinctrl/sprd,sc9860-pinctrl.txt       |   70 -
 .../bindings/pinctrl/sprd,sc9860-pinctrl.yaml      |  199 ++
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |  101 +-
 .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml |    1 -
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   |   58 +
 MAINTAINERS                                        |   64 +-
 drivers/pinctrl/Kconfig                            |   19 +
 drivers/pinctrl/Makefile                           |    3 +
 drivers/pinctrl/cix/Kconfig                        |   15 +
 drivers/pinctrl/cix/Makefile                       |    4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c            |  587 +++++
 drivers/pinctrl/cix/pinctrl-sky1.c                 |  559 +++++
 drivers/pinctrl/cix/pinctrl-sky1.h                 |   48 +
 drivers/pinctrl/core.c                             |    3 +-
 drivers/pinctrl/intel/pinctrl-alderlake.c          |   68 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   20 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |   68 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |   37 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   86 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |   21 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |   43 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |   33 +-
 drivers/pinctrl/intel/pinctrl-icelake.c            |   60 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   36 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |   11 +
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |   34 +-
 drivers/pinctrl/intel/pinctrl-lakefield.c          |   26 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   28 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |   54 +-
 drivers/pinctrl/intel/pinctrl-meteorpoint.c        |   46 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |   26 +-
 drivers/pinctrl/intel/pinctrl-tangier.c            |    3 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |   70 +-
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2523 ++++++++++----------
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1478 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 +++++++++++++++++
 drivers/pinctrl/pinconf-generic.c                  |   65 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   40 +-
 drivers/pinctrl/pinctrl-mpfs-iomux0.c              |  278 +++
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c            |  356 +++
 drivers/pinctrl/pinctrl-rockchip.c                 |  442 +++-
 drivers/pinctrl/pinctrl-rockchip.h                 |    4 +
 drivers/pinctrl/pinctrl-scmi.c                     |    2 -
 drivers/pinctrl/pinctrl-single.c                   |    7 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c              |    6 +-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           | 1803 ++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    9 +
 drivers/pinctrl/renesas/pfc-emev2.c                |    1 -
 drivers/pinctrl/renesas/pfc-r8a73a4.c              |    2 -
 drivers/pinctrl/renesas/pfc-r8a7778.c              |    1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c              |    1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77970.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77995.c             |    2 -
 drivers/pinctrl/renesas/pfc-r8a779f0.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a779g0.c             |  100 +-
 drivers/pinctrl/renesas/pfc-r8a779h0.c             |    7 +-
 drivers/pinctrl/renesas/pfc-sh7723.c               |    1 -
 drivers/pinctrl/renesas/pfc-sh7724.c               |    1 -
 drivers/pinctrl/renesas/pfc-sh7734.c               |    1 -
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    7 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  171 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            |    4 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |   10 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  206 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    2 +
 .../pinctrl/starfive/pinctrl-starfive-jh7110-aon.c |    2 -
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |    2 -
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |    2 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h |    1 -
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  396 ++-
 drivers/pinctrl/stm32/pinctrl-stm32.h              |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c         |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra20.c            |   11 +-
 include/linux/pinctrl/pinconf-generic.h            |   19 +-
 include/linux/pinctrl/pinmux.h                     |   10 +
 116 files changed, 12567 insertions(+), 3082 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6878.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-kaanapali.c

