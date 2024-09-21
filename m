Return-Path: <linux-gpio+bounces-10332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 560ED97DF54
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 00:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0E11C20B0D
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2024 22:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EDE1531E1;
	Sat, 21 Sep 2024 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8QZbN+K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9A9383A5
	for <linux-gpio@vger.kernel.org>; Sat, 21 Sep 2024 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726956974; cv=none; b=Gpp3wc/dxu9uRB1MY436GKGXlPfAPQl2JvwPrpYrA3ZJXFgSp1BD+RKa7lfcmV1kxyogO+PzFheuBg4bwWJJ4geXBdUQczgvo8DOwYzA7rOL+7JQA4T03joRSIKvT9ZMn8eTU8TcIYEDeyudOPPQUsnRfm655pzHBxg9XO28Zic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726956974; c=relaxed/simple;
	bh=Zkoh0a4qGltUAKmHR9FGWFg6MDTJlGAvGMnThTC6UyA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sdtMulbs+fCSXBGCLrY3TGhkp1FBmulsm4K47fQxU6d7+D5NZgBjgDBbZoNLnGnBGB607zYT67VREcWzif9gzsL7kkouksNd5M19we7+A7WYuiYAlGHUywbRxC8Be8KJPjqsSJZ8QM4PTRDMCOsx7XrmPPiS/oxK2pi/e1cDDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8QZbN+K; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365c512b00so3750752e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 Sep 2024 15:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726956969; x=1727561769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ckfl6SQv6q8jyTaGcaY4OqBeiycSnSOtTpecfUzSiXA=;
        b=B8QZbN+Ke2xQoHC7r2QwwcK+y48Acew2v3ZSd3IfNCff8/yqgQVCT4TSFy7oCstaHg
         byRlh2J2s2yO+9etjMvScE5OaSCZN+czYyLwOtwqmODtd5leU9y9ut3nIR+tvACvhyHE
         819Lt6c3vCABenDEL1yxrikyTvOr5Ye2C8EPWvfrUt/GltBuwIjjBvutDnixAuN0s1CN
         o07JnNQhQyDyIoHTKYBxASbnd6COUEIjR9XRK3MJUbPgSkJD1itmOaGNzTZiky0wTMqQ
         0V4YFJREfcHfXlRzEK/LIyFdzSej8rMHpXQyEldkBD2LHrUa11cSDBbbZbyWp6Ek5atg
         nowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726956969; x=1727561769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckfl6SQv6q8jyTaGcaY4OqBeiycSnSOtTpecfUzSiXA=;
        b=CDrcEz7MlioOoRWLk9Kun/hcW2fWoM99I5er7lUmzrgC/RR3Ksv6v+7CIyaErM1bwu
         GI1L0F5Er6LqDkUriebRaFP+c2YduSQydwfeX29sbEsVwmaKL3Y9B4ScwiyGtjLUzsde
         RB7r9YWM2HOgY3HNO96FjLbEYEU5hki9KNi69YApICvo55J64AfBdBLJncwPGO6KvOqf
         FPfTRPgVZzqwFJg8OUHxPX0ZbzoyzvjGhaC+cyF9JuDstYXJDOckXa6twkIU18eAHEJs
         bWjsZzvgtseWiP+ns93fJPNvjiuBHmTjopgpQaO39F3mV6txUoaPy3fMB9ZedR0PaUg7
         zWRQ==
X-Gm-Message-State: AOJu0Yzb05uAuuHbRzI+gjHucz8YtlleXRKNrLFrbw3WUoUFkLTe3L6u
	MMmVO37Qi0SQ/SQmIww/RlNo//gAyebHBDRJYrYQEhfaMiW8VAYeod6Ot2xNv6I5rzGG7qoKfS6
	Ljp7TzvJsT9Z396TrOdQg1iQ7HiYctLwEIydJpA==
X-Google-Smtp-Source: AGHT+IGEpr593XqJoupoZk9m9wSdYpt8YpMHD2Za5MsLsuckIqbB/NSNQ9Z5SqEzZwIdRvx7Fv8zobplR0U61X1fEb8=
X-Received: by 2002:a05:6512:3d1f:b0:533:483f:957b with SMTP id
 2adb3069b0e04-536ac34393fmr3816436e87.61.1726956969054; Sat, 21 Sep 2024
 15:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Sep 2024 00:15:57 +0200
Message-ID: <CACRpkdaSYE1jPCSi8jE7QZ9=yxo2oYM7c4uwBsYBFgqWey3Mog@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.12
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

this is the bulk of pin control changes for v6.12, not a lot this time
but the Sophgo SoC is a bit interesting RISC-V thing for image analysis,
and the Mobil EyeQ5 automotive SoC is interesting because it is *new*
MIPS stuff.

Details are in the signed tag.

I managed to pull some Intel ACPI ID patch into the devel branch first
and then sent the same as fix, so it appears in the diffstat but the
commit IDs should be the same and resolve just fine.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b=
:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.12-1

for you to fetch changes up to 264c13114bd71ddfd7b25c7b94f6cda4587eca25:

  Merge tag 'intel-pinctrl-v6.12-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
(2024-09-11 10:27:30 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v6.12 kernel cycle:

Core changes:

- Add support for "input-schmitt-microvolt" property, as used in the
  Sophgo SoC.

New drivers:

- Mobileye EyeQ5 pin controller, I think this is an automotive SoC.

- Rockchip rk3576 pin control support.

- Sophgo CV1800 series pin controllers: CV1800B, CV1812H and SG2000.

Improvements:

- Gradual improvements to Renesas, Samsung, Qualcomm, Nuvoton
  and a few other drivers.

----------------------------------------------------------------
Andrei Stefanescu (3):
      pinctrl: s32cc: enable the input buffer for a GPIO
      pinctrl: s32cc: configure PIN_CONFIG_DRIVE_PUSH_PULL
      pinctrl: s32cc: add update and overwrite options when setting pinconf

Andy Shevchenko (11):
      pinctrl: intel: Move debounce validation out of the lock
      pinctrl: intel: Refactor __intel_gpio_set_direction() to be more usef=
ul
      pinctrl: intel: Add __intel_gpio_get_direction() helper
      pinctrl: intel: Implement high impedance support
      pinctrl: intel: Constify intel_get_community() returned object
      pinctrl: intel: Introduce for_each_intel_gpio_group() helper et al.
      pinctrl: stmfx: Use string_choices API instead of ternary operator
      pinctrl: renesas: rzg2l: Replace of_node_to_fwnode() with more
suitable API
      pinctrl: intel: Inline intel_gpio_community_irq_handler()
      pinctrl: baytrail: Drop duplicate return statement
      pinctrl: intel: Constify struct intel_pinctrl parameter

Biju Das (1):
      pinctrl: renesas: rzg2l: Use dev_err_probe()

Christophe JAILLET (3):
      pinctrl: ti: ti-iodelay: Fix some error handling paths
      pinctrl: ti: ti-iodelay: Constify struct ti_iodelay_reg_data
      pinctrl: meson: Constify some structures

Detlev Casanova (1):
      dt-bindings: pinctrl: Add rk3576 pinctrl support

Fabio Estevam (1):
      pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()

Geert Uytterhoeven (1):
      pinctrl: Join split messages and remove double whitespace

Inochi Amaoto (8):
      dt-bindings: pincfg-node: Add "input-schmitt-microvolt" property
      pinctrl: pinconf-generic: Add support for
"input-schmitt-microvolt" property
      dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
      pinctrl: sophgo: add support for CV1800B SoC
      pinctrl: sophgo: add support for CV1812H SoC
      pinctrl: sophgo: add support for SG2000 SoC
      pinctrl: sophgo: add support for SG2002 SoC
      pinctrl: sophgo: cv18xx: fix missed __iomem type identifier

Javier Carrasco (2):
      pinctrl: ti-iodelay: Constify struct regmap_config
      pinctrl: realtek: Constify struct regmap_config

Krzysztof Kozlowski (1):
      dt-bindings: pinctrl: qcom: add missing type to GPIO hogs

Lad Prabhakar (3):
      pinctrl: renesas: rzg2l: Return -EINVAL if the pin doesn't
support PIN_CFG_OEN
      pinctrl: renesas: rzg2l: Introduce single macro for digital
noise filter configuration
      pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call
outside of switch cases

Li Zetao (1):
      pinctrl: Remove redundant null pointer checks in
pinctrl_remove_device_debugfs()

Liao Chen (2):
      pinctrl: pinctrl-zynq: fix module autoloading
      pinctrl: bcm2835: fix module autoloading

Linus Walleij (6):
      Merge tag 'intel-pinctrl-v6.11-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'renesas-pinctrl-for-v6.12-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge branch 'ib-sophgo-pintrl' into devel
      Merge tag 'samsung-pinctrl-6.12' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge tag 'renesas-pinctrl-for-v6.12-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'intel-pinctrl-v6.12-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Mika Westerberg (1):
      pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID

Oliver Rhodes (1):
      dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC su=
pport

Peng Fan (1):
      pinctrl: samsung: Use scope based of_node_put() cleanups

Rayyan Ansari (4):
      dt-bindings: pinctrl: qcom,apq8064-pinctrl: convert to dtschema
      dt-bindings: pinctrl: qcom,ipq8064-pinctrl: convert to dtschema
      dt-bindings: pinctrl: qcom,ipq4019-pinctrl: convert to dtschema
      dt-bindings: pinctrl: qcom,apq8084-pinctrl: convert to dtschema

Rob Herring (Arm) (2):
      pinctrl: samsung: Use of_property_present()
      pinctrl: mediatek: Use of_property_read_bool()

Shen Lichuan (4):
      pinctrl: samsung: Use kmemdup_array instead of kmemdup for
multiple allocation
      pinctrl: renesas: Switch to use kmemdup_array()
      drivers/pinctrl: Switch to use kmemdup_array()
      pinctrl: freescale: imx-scmi: Use kmemdup_array instead of
kmemdup for multiple allocation

Steven Liu (1):
      pinctrl: rockchip: Add rk3576 pinctrl support

Th=C3=A9o Lebrun (2):
      Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl: add bindings"
      pinctrl: eyeq5: add platform driver

Tomer Maimon (7):
      dt-bindings: pinctrl: npcm8xx: remove non-existent groups and functio=
ns
      pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, function=
s
      pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
      pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
      pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
      pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
      pinctrl: nuvoton: npcm8xx: modify pins flags

Vishnu Reddy (1):
      pinctrl: samsung: Add support for pull-up and pull-down

Wang Jianzheng (3):
      pinctrl: sunxi: Use devm_clk_get_enabled() helpers
      pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
      pinctrl: k210: Use devm_clk_get_enabled() helpers

Yan Zhen (1):
      pinctrl: madera: Simplify with dev_err_probe()

Yang Yingliang (1):
      pinctrl: single: fix missing error code in pcs_probe()

Yu Jiaoliang (1):
      pinctrl: nomadik: Use kmemdup_array instead of kmemdup for
multiple allocation

 .../bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml   | 242 -------
 .../bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml  |  70 +-
 .../devicetree/bindings/pinctrl/pincfg-node.yaml   |   3 +
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |  95 ---
 .../bindings/pinctrl/qcom,apq8064-pinctrl.yaml     | 110 +++
 .../bindings/pinctrl/qcom,apq8084-pinctrl.txt      | 188 -----
 .../bindings/pinctrl/qcom,apq8084-pinctrl.yaml     | 129 ++++
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |  85 ---
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.yaml     | 103 +++
 .../bindings/pinctrl/qcom,ipq8064-pinctrl.txt      | 101 ---
 .../bindings/pinctrl/qcom,ipq8064-pinctrl.yaml     | 108 +++
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |   1 +
 .../bindings/pinctrl/qcom,sdm845-pinctrl.yaml      |   1 +
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |   1 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |   1 +
 .../bindings/pinctrl/sophgo,cv1800-pinctrl.yaml    | 122 ++++
 drivers/pinctrl/Kconfig                            |  16 +
 drivers/pinctrl/Makefile                           |   2 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |   1 +
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |   9 +-
 drivers/pinctrl/core.c                             |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |   7 +-
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   7 +-
 drivers/pinctrl/intel/pinctrl-intel.c              | 324 +++++----
 drivers/pinctrl/intel/pinctrl-intel.h              |   3 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   2 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |   1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   7 +-
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c         |  12 +-
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c         |  12 +-
 drivers/pinctrl/meson/pinctrl-meson-a1.c           |  12 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c      |  12 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h      |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c          |  24 +-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c         |  24 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  16 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  16 +-
 drivers/pinctrl/meson/pinctrl-meson-s4.c           |  12 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |  25 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   8 +-
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c         |   6 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  16 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  16 +-
 drivers/pinctrl/mvebu/pinctrl-dove.c               |  42 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |   3 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   3 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  64 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |  51 +-
 drivers/pinctrl/pinconf-generic.c                  |   2 +
 drivers/pinctrl/pinctrl-eyeq5.c                    | 575 +++++++++++++++
 drivers/pinctrl/pinctrl-k210.c                     |  35 +-
 drivers/pinctrl/pinctrl-rockchip.c                 | 207 ++++++
 drivers/pinctrl/pinctrl-rockchip.h                 |   1 +
 drivers/pinctrl/pinctrl-single.c                   |   3 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   5 +-
 drivers/pinctrl/pinctrl-utils.c                    |   4 +-
 drivers/pinctrl/pinctrl-zynq.c                     |   1 +
 drivers/pinctrl/pinmux.c                           |   7 +-
 drivers/pinctrl/realtek/pinctrl-rtd.c              |   2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 117 ++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |   3 +-
 drivers/pinctrl/renesas/pinctrl.c                  |   3 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c       |  14 +
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  16 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |  14 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          | 108 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |  21 +
 drivers/pinctrl/sophgo/Kconfig                     |  54 ++
 drivers/pinctrl/sophgo/Makefile                    |   7 +
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c           | 462 ++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c           | 771 +++++++++++++++++=
++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c            | 765 +++++++++++++++++=
+++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            | 155 +++++
 drivers/pinctrl/sophgo/pinctrl-sg2000.c            | 771 +++++++++++++++++=
++++
 drivers/pinctrl/sophgo/pinctrl-sg2002.c            | 542 +++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  14 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |  58 +-
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h      |  63 ++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h      | 127 ++++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h       |  19 +
 include/dt-bindings/pinctrl/pinctrl-sg2000.h       | 127 ++++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h       |  79 +++
 include/linux/pinctrl/pinconf-generic.h            |   3 +
 85 files changed, 6002 insertions(+), 1274 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-eyeq5.c
 create mode 100644 drivers/pinctrl/sophgo/Kconfig
 create mode 100644 drivers/pinctrl/sophgo/Makefile
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1800b.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1812h.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.h
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2000.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2002.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h

