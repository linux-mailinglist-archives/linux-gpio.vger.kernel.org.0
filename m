Return-Path: <linux-gpio+bounces-23972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4DB18FBB
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Aug 2025 21:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D49FC7A9A64
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Aug 2025 18:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6A118CC13;
	Sat,  2 Aug 2025 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHkHDwlH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D6517A30A
	for <linux-gpio@vger.kernel.org>; Sat,  2 Aug 2025 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754161230; cv=none; b=p3n2ZyC7xoxsy6UkTWitoetuxDTrvXLYdiJuVcCbk/Q3uz+lmQXubkC6oBW0tgWuA7tNxi7r3JY4rnfhjpkj/+YL0vduzM9Kb7acv0KdCaigZw8jTPYaGRlTonhL0pIPCKt1X20zztWwmGamppEZs5aeIiRByqzT61VB7WTYFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754161230; c=relaxed/simple;
	bh=7Uvlq++l2hNTq1UdRI1ujcKG6WXkg7Ya3oQhrbtz+Mg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=g0f2lCf/5IUvw0w4LZVC4175+t2B7UrNRrv2qGJ4inI1Siq89DXjSlMXqUzLLuCn6aIwTX15/8JCCAGDEXXP/T7OUJyisR970P5eeKlxURrs+D53LqkDICDKmr47s4MhvWaGtRXx/wZjKVAWaNDchQqD9aspNvEa8YWNQFN7Za0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHkHDwlH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55b8bf653dfso2641509e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 02 Aug 2025 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754161226; x=1754766026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G+uoBKNW2u3+utNmO+rn48FjsRY5W0D4LYy17HAuGYM=;
        b=HHkHDwlHwKWO9knQY5WHnmjIVutQsPwZ9iV+6PSTyLF5DvBNigg+Z/iF2PdyOsvDTq
         AfzQuWBnOXMzCZfO7Rn3ytEN5n9K6GWtsjzdxMZGqmIqJycxoHZ7WY/CYQRoEWaOlp7d
         2AIkV4dcmgUXUnoyudaT0ubTzHGzsd301N8Tt59E+jUfwfbLKUYDR/Tgo9OK6t7ChZFq
         4Z0FDXGUwnQXf9nbXrnFHsI+0ihhbmjYwwiwtOnWSIbCAL/6Qxitv3C6qk+fBxj/gOig
         DJBfZbnxf/TwvmIiupriAxksf6YvGRJM6xs3HVK1XKW2TfbgsFaSVHo3eCO560vD71Fs
         v3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754161226; x=1754766026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+uoBKNW2u3+utNmO+rn48FjsRY5W0D4LYy17HAuGYM=;
        b=MWXsa7RSu737N/wQ5M3vQ7VX77ixem/ZOL4lXdyTDUWB6JgPgNmkbbLkzzVgx0nI7d
         bnIo8Yl9qpLK3P+lSBhYUV9a1DOSgFps0Eg6efu/ap8T9aGfyPPyqYI7kvOYhsG7HVKv
         ijxqgHtR32cXb+OvZ3CC5fhk2AMO9j0UhXwbRdUxeSuceqO3A7dCQkr91mL4ZtjzdFgo
         nd6+qou+70wYpKvPasNKf/yQ6vZcHIhnx/iHFcrO2+i+Nl90oBcqKjc1tVVa2puOe8bW
         dOnjPQPmXAtDgcemKQaD8H7r0w3EGOgzaBEEwaDYSnp3p2OW+7wOEybCiNb3tmH4DyF7
         IJPw==
X-Forwarded-Encrypted: i=1; AJvYcCUSyGBSN+DC6TvmWCDuClszQ7wUiKBHXvNPUOwV6J2wVZ/H/EoCU+TrIvBuvEhyh9VKKXApUj3oPfqc@vger.kernel.org
X-Gm-Message-State: AOJu0YysQqXG29VGMmTTY2uCalIZHG44vyeeYFzhaoRE63MpOJthRuA8
	hzU9tDMK0vmPg+TrCQ2PvH0UIHIcQXconW7VRlwhrLB+RwmhsnhlpVZJcDETnBny0XnHzJEC6W+
	OTojC+zmsjNS4pwnFya7AfywgGzwCxbGnicho0YMMkJiC7zY5S7+a+9A=
X-Gm-Gg: ASbGncsORazxI2BZsMSz52ualcqeLziKMViOt79uqpc7e2rAds2ZdyrlFA+XonOuyJy
	m3qsaK5KvtEpZpcf59/6KlTcMSK+iM+pRl93lEe9SrYmgxus4+5RJRivgwZJ/UPAv00IOiuNCTN
	6Oo3FBg1oJT+4A581rZjUPaH5aZ7CsQyi5gQCBpLyOsGomal3TaOjJzzt+/6j0lWkSZwzBDGJmJ
	eOy7GA=
X-Google-Smtp-Source: AGHT+IHPibWcsx68vEZuGQyPz91u9cXJtgKqdqcLGjiQro7dImdRgESNWmbvyd3yP9vJE198S56xu82cS9E3b7MplN8=
X-Received: by 2002:a05:6512:2313:b0:553:3422:c39d with SMTP id
 2adb3069b0e04-55b97b47654mr1060304e87.37.1754161225515; Sat, 02 Aug 2025
 12:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Aug 2025 21:00:12 +0200
X-Gm-Features: Ac12FXxo8SVeMCdrel_dzRUWLXZdiEcwS8wGFVCukIZep3a_yXBBaWhcPGms8ZA
Message-ID: <CACRpkdZh7pbuFnR6rhVzy_NHb3-Fj_30V46gV5TS=hWwuHSfxQ@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v6.17
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here are the bulk of pin control changes for v6.17.

The details are in the signed tag as usual.

Nothing stands out, apart from maybe the interesting
Eswin EIC7700, a RISC-V SoC I've never seen before.
I found a datasheet:
https://www.eswincomputing.com/bocupload/2024/06/07/171773119629660z9pt.pdf

The stray change to drivers/rtc/rtc-stm32.c concerns
pin control and was ACKed by the RTC maintainer,
and other noise outside of the pin control directory is
also authorized.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.17-1

for you to fetch changes up to a3fe1324c3c5c292ec79bd756497c1c44ff247d2:

  pinctrl: mediatek: Add pinctrl driver for mt8189 (2025-07-23 13:35:40 +02=
00)

----------------------------------------------------------------
Pin control changes for v6.17

Core changes:

- Open code PINCTRL_FUNCTION_DESC() instead of defining
  a complex macro only used in one place.

- Add pinmux_generic_add_pinfunction() helper and
  use this in a few drivers.

New drivers:

- Amlogic S7, S7D and S6 pin control support.

- Eswin EIC7700 pin control support.

- Qualcomm PMIV0104, PM7550 and Milos pin control
  support.

  Because of unhelpful numbering schemes, the Qualcomm
  driver now needs to start to rely on SoC codenames.

- STM32 HDP pin control support.

- Mediatek MT8189 pin control support.

Improvements:

- Switch remaining pin control drivers over to the
  new GPIO set callback that provides a return value.

- Support RSVD (reserved) pins in the STM32 driver.

- Move many fixed assignments over to pinctrl_desc
  definitions.

- Handle multiple TLMM regions in the Qualcomm driver.

----------------------------------------------------------------
Andy Shevchenko (2):
      Merge patch series "pinctrl: intel: use new GPIO line value
setter callbacks"
      pinctrl: intel: fix build warnings about export.h

Antonio Borneo (4):
      pinctrl: stm32: Declare stm32_pmx_get_mode() as static
      pinctrl: stm32: Add RIF support for stm32mp257
      MAINTAINERS: Add entry for STM32 pinctrl drivers and documentation
      dt-bindings: pinctrl: stm32: Add missing blank lines

Arnd Bergmann (1):
      pinctrl: zynq: add CONFIG_OF dependency

Bartosz Golaszewski (38):
      pinctrl: baytrail: use new GPIO line value setter callbacks
      pinctrl: cherryview: use new GPIO line value setter callbacks
      pinctrl: intel: use new GPIO line value setter callbacks
      pinctrl: lynxpoint: use new GPIO line value setter callbacks
      pinctrl: renesas: gpio: Use new GPIO line value setter callbacks
      pinctrl: renesas: rzg2l: Use new GPIO line value setter callbacks
      pinctrl: renesas: rza1: Use new GPIO line value setter callbacks
      pinctrl: renesas: rzv2m: Use new GPIO line value setter callbacks
      pinctrl: renesas: rza2: Use new GPIO line value setter callbacks
      pinctrl: cirrus: lochnagar: use new GPIO line value setter callbacks
      pinctrl: cirrus: cs42l43: use new GPIO line value setter callbacks
      pinctrl: starfive: jh7100: use new GPIO line value setter callbacks
      pinctrl: starfive: jh7110: use new GPIO line value setter callbacks
      pinctrl: sppctl: use new GPIO line value setter callbacks
      pinctrl: st: use new GPIO line value setter callbacks
      pinctrl: da9062: use new GPIO line value setter callbacks
      pinctrl: mcp23s08: use new GPIO line value setter callbacks
      pinctrl: wmt: use new GPIO line value setter callbacks
      pinctrl: aw9523: use new GPIO line value setter callbacks
      pinctrl: xway: statify xway_pinconf_group_set()
      pinctrl: xway: use new GPIO line value setter callbacks
      pinctrl: digicolor: use new GPIO line value setter callbacks
      pinctrl: apple: use new GPIO line value setter callbacks
      pinctrl: pic32: use new GPIO line value setter callbacks
      pinctrl: spear: use new GPIO line value setter callbacks
      pinctrl: keembay: use new GPIO line value setter callbacks
      pinctrl: sunxi: use new GPIO line value setter callbacks
      pinctrl: as3722: use new GPIO line value setter callbacks
      pinctrl: amdisp: use new GPIO line value setter callbacks
      pinctrl: aw9523: fix mutex unlock in error path
      pinctrl: ma35: use new GPIO line value setter callbacks
      pinctrl: pinmux: open-code PINCTRL_FUNCTION_DESC()
      pinctrl: provide pinmux_generic_add_pinfunction()
      pinctrl: equilibrium: use pinmux_generic_add_pinfunction()
      pinctrl: airoha: use pinmux_generic_add_pinfunction()
      pinctrl: mediatek: moore: use pinmux_generic_add_pinfunction()
      pinctrl: keembay: use pinmux_generic_add_pinfunction()
      pinctrl: ingenic: use pinmux_generic_add_pinfunction()

Cathy Xu (2):
      dt-bindings: pinctrl: mediatek: Add support for mt8189
      pinctrl: mediatek: Add pinctrl driver for mt8189

Cheick Traore (1):
      pinctrl: stm32: Manage irq affinity settings

Cl=C3=A9ment Le Goffic (4):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
      dt-bindings: pinctrl: stm32: Introduce HDP
      pinctrl: stm32: Introduce HDP driver
      MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer

Colin Ian King (1):
      pinctrl: eswin: Fix unsigned comparison to less than zero issue

Da Xue (1):
      pinctrl: meson-g12a: add g12b pwm groups

Fabien Dessenne (2):
      pinctrl: stm32: Handle RSVD pin configuration
      dt-bindings: pinctrl: stm32: Add RSVD mux function

Frank Li (1):
      dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt to yaml format

Geert Uytterhoeven (1):
      pinctrl: renesas: Simplify PINCTRL_RZV2M logic

Jack Ping CHNG (1):
      pinctrl: equilibrium: Add request and free hooks

Jacky Chou (1):
      pinctrl: aspeed-g6: Add PCIe RC PERST pin group

Jiri Slaby (SUSE) (1):
      pinctrl: Use dev_fwnode()

Krzysztof Kozlowski (17):
      pinctrl: starfive: Allow compile testing on other platforms
      pinctrl: Allow compile testing for K210, TB10X and ZYNQ
      pinctrl: amd: Constify pointers to 'pinctrl_desc'
      pinctrl: Constify pointers to 'pinctrl_desc'
      pinctrl: aspeed: Constify static 'pinctrl_desc'
      pinctrl: nuvoton: Constify static 'pinctrl_desc'
      pinctrl: bcm: Constify static 'pinctrl_desc'
      pinctrl: bcm: cygnus-mux: Move fixed assignments to
'pinctrl_desc' definition
      pinctrl: bcm: cygnus-ns2: Move fixed assignments to
'pinctrl_desc' definition
      pinctrl: bcm: cygnus-nsp: Move fixed assignments to
'pinctrl_desc' definition
      pinctrl: as3722: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: max77620: Move fixed assignments to 'pinctrl_desc' definitio=
n
      pinctrl: palmas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: renesas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: pistachio: Constify static 'pinctrl_desc'
      pinctrl: Constify static 'pinctrl_desc'
      rtc: stm32: Constify static 'pinctrl_desc'

Kuninori Morimoto (2):
      pinctrl: renesas: Sort Renesas Kconfig configs
      pinctrl: renesas: Unify config naming

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Validate pins before setting mux function

Linus Walleij (6):
      Merge tag 'gpio-mmio-bgpiof-no-input-flag-for-v6.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel
      pinctrl: amlogic: Staticize some local structs
      Merge tag 'renesas-pinctrl-for-v6.17-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'renesas-pinctrl-for-v6.17-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'intel-pinctrl-v6.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'samsung-pinctrl-6.17' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel

Luca Weiss (6):
      dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104 support
      pinctrl: qcom: spmi: Add PMIV0104
      dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550 support
      pinctrl: qcom: spmi: Add PM7550
      dt-bindings: pinctrl: document the Milos Top Level Mode Multiplexer
      pinctrl: qcom: Add Milos pinctrl driver

Mukesh Ojha (1):
      pinmux: fix race causing mux_owner NULL with active mux_usecount

Nicolas Frattaroli (1):
      dt-bindings: pinctrl: rockchip: increase max amount of device functio=
ns

Paul Kocialkowski (1):
      pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux

Peter Griffin (3):
      pinctrl: samsung: rename exynosautov920_retention_data to
no_retention_data
      pinctrl: samsung: add support for gs101 wakeup mask programming
      pinctrl: samsung: Fix gs101 irq chip

Shiji Yang (1):
      pinctrl: falcon: mark pinctrl_falcon_init() as static

Stephane Danieau (1):
      pinctrl: stm32: Allow compile as module for stm32mp257

Thomas Richard (1):
      pinctrl: cirrus: madera-core: Use devm_pinctrl_register_mappings()

Xianwei Zhao (3):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string
for S7/S7D/S6
      pinctrl: meson: a4: remove special data processing
      pinctrl: meson: support amlogic S6/S7/S7D SoC

Yuan Chen (2):
      pinctrl: sunxi: Fix memory leak on krealloc failure
      pinctrl: berlin: fix memory leak in berlin_pinctrl_build_state()

Yuanjie Yang (1):
      pinctrl: qcom: add multi TLMM region option parameter

Yulin Lu (2):
      dt-bindings: pinctrl: eswin: Document for EIC7700 SoC
      pinctrl: eswin: Add EIC7700 pinctrl driver

Ze Huang (2):
      pinctrl: canaan: k230: add NULL check in DT parse
      pinctrl: canaan: k230: Fix order of DT parse and pinctrl register

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |    9 +-
 .../bindings/pinctrl/eswin,eic7700-pinctrl.yaml    |  156 ++
 .../bindings/pinctrl/mediatek,mt8189-pinctrl.yaml  |  213 ++
 .../bindings/pinctrl/nxp,lpc1850-scu.txt           |   71 -
 .../bindings/pinctrl/nxp,lpc1850-scu.yaml          |   79 +
 .../bindings/pinctrl/qcom,milos-tlmm.yaml          |  133 ++
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    4 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    2 +-
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |  187 ++
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   25 +
 MAINTAINERS                                        |   14 +
 arch/arm64/Kconfig.platforms                       |    1 -
 drivers/gpio/gpio-mmio.c                           |   11 +-
 drivers/pinctrl/Kconfig                            |   21 +-
 drivers/pinctrl/Makefile                           |    3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |    2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |    2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |   14 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |    2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |    2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |    2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |    8 +-
 drivers/pinctrl/bcm/pinctrl-ns.c                   |    2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    8 +-
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |    8 +-
 drivers/pinctrl/berlin/berlin.c                    |   10 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |   23 +-
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c         |   25 +-
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |   14 +-
 drivers/pinctrl/core.c                             |   13 +-
 drivers/pinctrl/core.h                             |    2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    8 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    6 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   20 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |    6 +-
 drivers/pinctrl/mediatek/Kconfig                   |   12 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    4 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |   10 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |    5 +-
 drivers/pinctrl/mediatek/pinctrl-mt8189.c          | 1700 ++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h      | 2452 ++++++++++++++++=
++++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |  118 +-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |   22 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             |    6 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |    2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |    2 +-
 drivers/pinctrl/pinctrl-amd.c                      |    8 +-
 drivers/pinctrl/pinctrl-amdisp.c                   |    6 +-
 drivers/pinctrl/pinctrl-apple-gpio.c               |    6 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |    2 +-
 drivers/pinctrl/pinctrl-as3722.c                   |   23 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    6 +-
 drivers/pinctrl/pinctrl-aw9523.c                   |   26 +-
 drivers/pinctrl/pinctrl-bm1880.c                   |    2 +-
 drivers/pinctrl/pinctrl-da9062.c                   |   14 +-
 drivers/pinctrl/pinctrl-digicolor.c                |    8 +-
 drivers/pinctrl/pinctrl-eic7700.c                  |  704 ++++++
 drivers/pinctrl/pinctrl-equilibrium.c              |    9 +-
 drivers/pinctrl/pinctrl-falcon.c                   |    2 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |    5 +-
 drivers/pinctrl/pinctrl-k210.c                     |    2 +-
 drivers/pinctrl/pinctrl-k230.c                     |   13 +-
 drivers/pinctrl/pinctrl-keembay.c                  |   19 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |    2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |    9 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   20 +-
 drivers/pinctrl/pinctrl-mlxbf3.c                   |    2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |    4 +-
 drivers/pinctrl/pinctrl-pic32.c                    |    8 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    8 +-
 drivers/pinctrl/pinctrl-st.c                       |    6 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    2 +-
 drivers/pinctrl/pinctrl-xway.c                     |   18 +-
 drivers/pinctrl/pinctrl-zynq.c                     |    2 +-
 drivers/pinctrl/pinmux.c                           |   45 +-
 drivers/pinctrl/pinmux.h                           |   10 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-milos.c               | 1339 +++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    2 +
 drivers/pinctrl/qcom/tlmm-test.c                   |   47 +-
 drivers/pinctrl/renesas/Kconfig                    |  249 +-
 drivers/pinctrl/renesas/gpio.c                     |    6 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    7 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c             |    7 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   53 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |    4 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |    8 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |    6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  103 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    4 +
 drivers/pinctrl/spear/pinctrl-plgpio.c             |   11 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |   10 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |    7 +-
 drivers/pinctrl/stm32/Kconfig                      |   20 +-
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  720 ++++++
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  144 +-
 drivers/pinctrl/stm32/pinctrl-stm32.h              |   22 +-
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c         |   15 +-
 drivers/pinctrl/sunplus/sppctl.c                   |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   21 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |   17 +-
 drivers/rtc/rtc-stm32.c                            |    2 +-
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |    1 +
 include/linux/gpio/driver.h                        |    1 +
 include/linux/pinctrl/pinctrl.h                    |    8 +-
 include/linux/soc/samsung/exynos-regs-pmu.h        |    1 +
 111 files changed, 8737 insertions(+), 549 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.=
yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8189.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-milos.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c

