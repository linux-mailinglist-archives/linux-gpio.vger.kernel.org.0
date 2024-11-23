Return-Path: <linux-gpio+bounces-13207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C869D6A0C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 17:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3877281B87
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 16:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4675A7080E;
	Sat, 23 Nov 2024 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRmUttwK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8F3C466
	for <linux-gpio@vger.kernel.org>; Sat, 23 Nov 2024 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379022; cv=none; b=L3S+OWDjI15bodrqAorRXjIBvKahfFsC18HrkhjbvNN9oTP/nlYz3tECvwKzObyM9rp6Mn6Oy8TtZZ2F/lKVmjXOtRONLPHGwstZ+1DroIFzGR/7/gNnOXcZuvKMuz5Phr4b1SMUlv56Chbf7sEm1+yGfJ84u9lIxRy6gO8WG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379022; c=relaxed/simple;
	bh=dkuMxv7qZXVE0lnAr4OqplCuSKW2TazW+JA5xxRZ6DI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VDZcIMMkKZCIj8uaRjkC1YKE7k3U+qWaqCkGmynM7wK/Pfu53g35NwItv3b/KSXPnVgODBUxpiOTkXEUX8kbV/0eUqEMzMbD/ZbPPdSwavhx5tX05m5bHXOzcXrj45U2089P20LZxz7OYzeRR8gKqkhSrPCcw8EcWJneSAEKitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRmUttwK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so275181e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 23 Nov 2024 08:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732379017; x=1732983817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+56wzwNB3xgSfbc2DFOPPmt8PcdJFulspYoS82bC0Uw=;
        b=DRmUttwKNawcx24FpQ+mK1uiZ4m/TKZ1eA0g9IRAlGVGOSh4ESrslBQU5Dbq5dP6Pk
         nNzchllNSOdBfyFtJXHKQVPiy1QyD9ST5L8gEJmBGfQWlBz0H2YCVTOAUev0ILbp6xlE
         UTSdWmZdkRPbDrLhbtMujtcvOMRTketLzmry94WuJn9yqxTzgk9fwh8XesnxDkqdANZJ
         s/u6ce8oCKm3hvpfPAvBuvP0vZgfsG6CfbZz0bMO3Y3bits0jxaFjASrikF9Q/F5p/UD
         KJrO8rsvqyyjsD2G0pzlc52Y32fXX7lVTEJO448mS3lHsK+c/HTOItMlVLZ2csrVQJRZ
         Xduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732379017; x=1732983817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+56wzwNB3xgSfbc2DFOPPmt8PcdJFulspYoS82bC0Uw=;
        b=Di/SSaF76RST1OrDwCeznmEimpMgVKsqHZOI1qwAP9BKL6urEj23bnXAHN6NfIYu0d
         VXB/Oatn6niTCJ0xI6eXBedjthDuzGVZylUoc/GiouR4ofGrg2Ep9Cd0iUefRUQ+CBVL
         KpihRKjl9azrHxCKKIi9DN1OA91KYITao7pw8FvlnW8JUe7Z2NWMYMray7XTHam5F+K7
         cFvWrxQRCVK7T5UWUtRsNZKiOYvXdCUBgW/YUsj7+jjivknl2r/U3s1sSGw3wez1BAWN
         wCjbIG51lbaI0m65Od/IU9y7l7cf4rlJqBJSAFVqGJ589oQtBmvxDFAnLZMLGapkuTRw
         i/XQ==
X-Gm-Message-State: AOJu0YyWRl6Fc+g4qGLLAJSJ1Tgg8b8tN/GoFXhGra1DABgyfippi2Q8
	IcErjhq8u6mtv9btPRAau+JIulPRYHy7Zane1JrZoFb2ysd84zvuYm3q1DGgPLf43V6Sqbclzsx
	SNvfI+1SYkIldiTcHWbe1r24DwzJ/nzukl8zIuZxEIN7hVJIvBfg=
X-Gm-Gg: ASbGncuDN9w3hhBqwMJUc/g6ECcuTXV6qFvV220zR9oKvVnt9Hl7g0J8qO90OZ8/iVe
	dc6sEGkFAU+S+R69Z3SAwwwMapixBWw==
X-Google-Smtp-Source: AGHT+IFd/eYccSt5jFx4PaSpi0/AzLQNh3kdfmI+7dhMHLiExAf3BQ91iE7QZFhHaM8l4fK0g5EvAEOTnO7wVAAIOYo=
X-Received: by 2002:ac2:5de2:0:b0:53d:d434:500a with SMTP id
 2adb3069b0e04-53dd4345056mr2585855e87.5.1732379017435; Sat, 23 Nov 2024
 08:23:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 23 Nov 2024 17:23:26 +0100
Message-ID: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.13
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here is the bulk of pin control changes for the v6.13 kernel cycle.

The contents are described in the signed tag, no big surprises,
no core changes whatsoever and just a big pile of new driver code.
Notably Qualcomm forge ahead with a lot of new silicon.

Some oneliners touch other subsystems but these should be
properly authorized, we had some buzz around who should merge
some DT bindings but this was resolved.

CONFLICTS:

- One trivial conflict will appear in MAINTAINERS, because the
  same entry is used for a bunch of subsystems. You know what
  to do.

- The second issue is more sneaky: a recent fixup patch to one
   of the rc:s (I think -rc4) fixed some error path bugs in
   the AW9523 driver, then a patch to the regular devel is
   improving the use of devres so the fixed errorpath fixes
   things broken.

I have been applying the following fixup patch for -next to work:

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9=
523.c
index ebd590a3cec6..90059b0d20e5 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -983,11 +983,8 @@ static int aw9523_probe(struct i2c_client *client)
        lockdep_set_subclass(&awi->i2c_lock,
i2c_adapter_depth(client->adapter));

        pdesc =3D devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
-       if (!pdesc) {
-               ret =3D -ENOMEM;
-               goto err_disable_vregs;
-       }
-
+       if (!pdesc)
+               return -ENOMEM;
        ret =3D aw9523_hw_init(awi);
        if (ret)
                return ret;

This can be folded in as an "evil merge" or applied separately on
top, your pick.

Please pull it in and patch it up!

Yours,
Linus Walleij


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc=
:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.13-1

for you to fetch changes up to ac6f0825e582f2216a582c9edf0cee7bfe347ba6:

  pinctrl: airoha: Use unsigned long for bit search (2024-11-18 23:57:38 +0=
100)

----------------------------------------------------------------
This is the bulk of the pin control changes for v6.13:

No core changes this time.

New drivers:

- Xlinix Versal pin control driver.

- Ocelot LAN969x pin control driver.

- T-Head TH1520 RISC-V SoC pin control driver.

- Qualcomm SM8750, IPQ5424, QCS8300, SAR2130P and QCS615 SoC
  pin control drivers.

- Qualcomm SM8750 LPASS (low power audio subsystem)
  pin control driver.

- Qualcomm PM8937 mixsig IC pin control support, GPIO and
  MPP (multi-purpose-pin).

- Samsung Exynos8895 and Exynos9810 SoC pin control driver.

- SpacemiT K1 SoC pin control driver.

- Airhoa EN7581 IC pin control driver.

Improvements:

- The Renesas subdriver now supports schmitt-trigger and
  open drain pin configurations if the hardware supports it.

- Support GPIOF and GPIOG banks in the Aspeed G6 SoC.

- Support the DSW community in the Intel Elkhartlake SoC.

----------------------------------------------------------------
Andrei Stefanescu (1):
      pinctrl: s32: add missing pins definitions

Andy Shevchenko (8):
      pinctrl: intel: Add a human readable decoder for pull bias values
      pinctrl: elkhartlake: Add support for DSW community
      pinctrl: cy8c95x0: Use 2-argument strscpy()
      pinctrl: cy8c95x0: switch to using devm_regulator_get_enable()
      pinctrl: cy8c95x0: use flexible sleeping in reset function
      pinctrl: cy8c95x0: Use temporary variable for struct device
      pinctrl: cy8c95x0: embed iterator to the for-loop
      pinctrl: cy8c95x0: remove unneeded goto labels

Arnd Bergmann (1):
      pinctrl: th1520: add a CONFIG_OF dependency

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (4):
      dt-bindings: pinctrl: qcom,pmic-gpio: add PM8937
      pinctrl: qcom-pmic-gpio: add support for PM8937
      dt-bindings: pinctrl: qcom,pmic-mpp: Document PM8937 compatible
      pinctrl: qcom: spmi-mpp: Add PM8937 compatible

Bartosz Golaszewski (2):
      pinctrl: aw9523: fix kerneldoc for _aw9523_gpio_get_multiple()
      pinctrl: zynqmp: drop excess struct member description

Biju Das (1):
      pinctrl: renesas: rzg2l: Fix missing return in rzg2l_pinctrl_register=
()

Billy Tsai (1):
      pinctrl: aspeed-g6: Support drive-strength for GPIOF/G

Chen Wang (1):
      dt-bindings: pinctrl: correct typo of description for cv1800

Christian Marangi (1):
      dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controlle=
r

Colin Ian King (1):
      pinctrl: th1520: Fix potential null pointer dereference on func

Dan Carpenter (1):
      pinctrl: spacemit: fix double free of map

Daniel Machon (2):
      dt-bindings: ocelot: document lan969x-pinctrl
      pinctrl: ocelot: add support for lan969x SoC pinctrl

Dmitry Baryshkov (2):
      dt-bindings: pinctrl : qcom: document SAR2130P TLMM
      pinctrl: qcom: add support for TLMM on SAR2130P

Drew Fustini (3):
      pinctrl: th1520: Fix return value for unknown pin error
      pinctrl: th1520: Convert thp->mutex to guarded mutex
      pinctrl: th1520: Convert dt child node loop to scoped iterator

Duje Mihanovi=C4=87 (2):
      dt-bindings: pinctrl: pinctrl-single: add
marvell,pxa1908-padconf compatible
      pinctrl: single: add marvell,pxa1908-padconf compatible

Emil Renner Berthing (5):
      dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
      pinctrl: Add driver for the T-Head TH1520 SoC
      pinctrl: th1520: Fix pinconf return values
      pinctrl: th1520: Update pinmux tables
      pinctrl: th1520: Factor out casts

Esben Haabendal (4):
      ARM: imx: Allow user to disable pinctrl
      pinctrl: freescale: Use CONFIG_SOC_IMXRT to guard i.MX RT1xxx drivers
      pinctrl: freescale: enable use with COMPILE_TEST
      pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU

Fabrizio Castro (1):
      pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX

Geert Uytterhoeven (3):
      pinctrl: renesas: rza2: Mark GPIOs as used
      pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
      pinctrl: PINCTRL_K230 should depend on ARCH_CANAAN

Heiko Schocher (1):
      dt-bindings: pinctrl: sx150xq: allow gpio line naming

Himanshu Bhavani (1):
      dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to yaml format

Igor Belwon (3):
      dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos990-wakeup-eint compatible
      pinctrl: samsung: Add Exynos 990 SoC pinctrl configuration

Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
      dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
      pinctrl: samsung: Add exynos8895 SoC pinctrl configuration

Jean Delvare (1):
      pinctrl: imx-scmi: Drop obsolete dependency on COMPILE_TEST

Jingyi Wang (2):
      dt-bindings: pinctrl: describe qcs8300-tlmm
      pinctrl: qcom: add the tlmm driver for QCS8300 platforms

Johan Hovold (1):
      pinctrl: qcom: spmi: fix debugfs drive strength

Kees Cook (1):
      pinctrl: airoha: Use unsigned long for bit search

Krzysztof Kozlowski (3):
      dt-bindings: pinctrl: samsung: Fix interrupt constraint for
variants with fallbacks
      dt-bindings: pinctrl: samsung: Add missing constraint for
Exynos8895 interrupts
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add SM8750

Lad Prabhakar (5):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow schmitt and
open drain properties
      pinctrl: renesas: rzg2l: Add support for enabling/disabling
open-drain outputs
      pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger
      pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC
      pinctrl: renesas: rzg2l: Use
gpiochip_populate_parent_fwspec_twocell helper

Lijuan Gao (2):
      dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer
      pinctrl: qcom: add the tlmm driver for QCS615 platform

Linus Walleij (8):
      Merge branch 'ib-thead-th1520' into devel
      pinctrl: imx1: Fix too generic defines
      pinctrl: imx27: Fix too generic defines
      pinctrl: k230: Drop unused code
      Merge tag 'renesas-pinctrl-for-v6.13-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.13' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge tag 'renesas-pinctrl-for-v6.13-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'intel-pinctrl-v6.13-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Lorenzo Bianconi (4):
      dt-bindings: arm: airoha: Add the chip-scu node for EN7581 SoC
      dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
      dt-bindings: pwm: airoha: Add EN7581 pwm
      pinctrl: airoha: Add support for EN7581 SoC

Marc Ferland (1):
      pinctrl: amd: Fix two small typos

Marek Vasut (1):
      dt-bindings: pinctrl: fsl,imx6ul-pinctrl: Convert i.MX35/5x/6 to YAML

Mark Brown (1):
      pinctrl: sx150x: Use maple tree register cache

Markuss Broks (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-e=
int
      pinctrl: samsung: Add Exynos9810 SoC specific data

Melody Olvera (2):
      dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
      pinctrl: qcom: Add sm8750 pinctrl driver

Mukesh Ojha (1):
      pinmux: Use sequential access to access desc->pinmux data

Neil Armstrong (1):
      dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
gpio-line-names minItems for meson8b

Nikunj Kela (1):
      dt-bindings: pinctrl: Add SA8255p TLMM

Quentin Schulz (1):
      pinctrl: rockchip: improve error message for incorrect
rockchip,pins property

Rob Herring (Arm) (1):
      pinctrl: Use of_property_present() for non-boolean properties

Rosen Penev (3):
      pinctrl: aw9523: use enable for regulator
      pinctrl: aw9523: add missing mutex_destroy
      pinctrl: aw9523: use devm_mutex_init

Sai Krishna Potthuri (3):
      dt-bindings: pinctrl: Add support for Xilinx Versal platform
      firmware: xilinx: Add Pinctrl Get Attribute ID
      pinctrl: pinctrl-zynqmp: Add support for Versal platform

Sricharan Ramabadhran (2):
      dt-bindings: pinctrl: qcom: add IPQ5424 pinctrl
      pinctrl: qcom: Introduce IPQ5424 TLMM driver

Thomas Bonnefille (1):
      pinctrl: sophgo: fix typo in tristate of SG2002

Uwe Kleine-K=C3=B6nig (2):
      pinctrl: aw9523: Drop explicit initialization of struct
i2c_device_id::driver_data to 0
      pinctrl: Switch back to struct platform_driver::remove()

Wolfram Sang (1):
      pinctrl: renesas: rza1: Mark GPIOs as used

Yixun Lan (2):
      dt-bindings: pinctrl: spacemit: add support for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC

Ze Huang (2):
      dt-bindings: pinctrl: Add support for canaan,k230 SoC
      pinctrl: canaan: Add support for k230 SoC

clingfei (1):
      pinctrl: thead1520: Fix Null pointer dereference

zhang jiao (1):
      pinctrl: k210: Undef K210_PC_DEFAULT

 .../bindings/arm/airoha,en7581-chip-scu.yaml       |   42 +
 .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    |   90 +
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    |  400 +++
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       |    2 +-
 .../bindings/pinctrl/canaan,k230-pinctrl.yaml      |  127 +
 .../bindings/pinctrl/fsl,imx35-pinctrl.txt         |   33 -
 ...,imx6ul-pinctrl.yaml =3D> fsl,imx35-pinctrl.yaml} |   88 +-
 .../bindings/pinctrl/fsl,imx50-pinctrl.txt         |   32 -
 .../bindings/pinctrl/fsl,imx51-pinctrl.txt         |   32 -
 .../bindings/pinctrl/fsl,imx53-pinctrl.txt         |   32 -
 .../bindings/pinctrl/fsl,imx6dl-pinctrl.txt        |   38 -
 .../bindings/pinctrl/fsl,imx6q-pinctrl.txt         |   38 -
 .../bindings/pinctrl/fsl,imx6sl-pinctrl.txt        |   39 -
 .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt       |   40 -
 .../bindings/pinctrl/fsl,imx6sx-pinctrl.txt        |   36 -
 .../bindings/pinctrl/microchip,mcp23s08.yaml       |  161 ++
 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      |   27 +-
 .../bindings/pinctrl/pinctrl-mcp23s08.txt          |  148 -
 .../bindings/pinctrl/pinctrl-single.yaml           |    4 +
 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml        |  114 +
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml |    2 +
 .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         |  124 +
 .../bindings/pinctrl/qcom,qcs8300-tlmm.yaml        |  118 +
 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml        |    8 +-
 .../bindings/pinctrl/qcom,sar2130p-tlmm.yaml       |  138 +
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml     |    6 +-
 .../bindings/pinctrl/qcom,sm8750-tlmm.yaml         |  138 +
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    4 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   23 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml          |    3 +
 .../bindings/pinctrl/semtech,sx1501q.yaml          |   43 +
 .../bindings/pinctrl/sophgo,cv1800-pinctrl.yaml    |    2 +-
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  124 +
 .../bindings/pinctrl/thead,th1520-pinctrl.yaml     |  176 ++
 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml      |  278 ++
 .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml |   34 +
 MAINTAINERS                                        |    9 +
 arch/arm/mach-imx/Kconfig                          |   16 -
 drivers/pinctrl/Kconfig                            |   26 +
 drivers/pinctrl/Makefile                           |    3 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |    4 +
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |    2 +-
 drivers/pinctrl/core.c                             |    3 +
 drivers/pinctrl/core.h                             |    1 +
 drivers/pinctrl/freescale/Kconfig                  |   93 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |    6 +-
 drivers/pinctrl/freescale/pinctrl-imx1.c           |  228 +-
 drivers/pinctrl/freescale/pinctrl-imx27.c          |  350 +--
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    2 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |   38 +
 drivers/pinctrl/intel/pinctrl-intel.c              |   12 +
 drivers/pinctrl/mediatek/Kconfig                   |   17 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2971 ++++++++++++++++=
++++
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    2 +-
 drivers/pinctrl/nxp/pinctrl-s32g2.c                |   52 +
 drivers/pinctrl/pinctrl-amd.c                      |    4 +-
 drivers/pinctrl/pinctrl-amd.h                      |    4 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |    2 +-
 drivers/pinctrl/pinctrl-aw9523.c                   |   57 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |  142 +-
 drivers/pinctrl/pinctrl-k210.c                     |   17 +-
 drivers/pinctrl/pinctrl-k230.c                     |  641 +++++
 drivers/pinctrl/pinctrl-ocelot.c                   |  203 ++
 drivers/pinctrl/pinctrl-rockchip.c                 |    6 +-
 drivers/pinctrl/pinctrl-single.c                   |    3 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    2 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |    2 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    2 +-
 drivers/pinctrl/pinctrl-th1520.c                   |  918 ++++++
 drivers/pinctrl/pinctrl-xway.c                     |    2 +-
 drivers/pinctrl/pinctrl-zynqmp.c                   |   98 +-
 drivers/pinctrl/pinmux.c                           |  173 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |   39 +
 drivers/pinctrl/qcom/Makefile                      |    5 +
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c             |  792 ++++++
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c              | 1107 ++++++++
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             | 1246 ++++++++
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sar2130p.c            | 1505 ++++++++++
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c  |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c            |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c              |    2 +-
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
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c    |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c              | 1729 ++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    8 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    3 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    4 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    2 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    2 +-
 drivers/pinctrl/renesas/Kconfig                    |    1 +
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    7 +
 drivers/pinctrl/renesas/pinctrl-rza2.c             |    3 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   68 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |    2 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  431 +++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    6 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    3 +
 drivers/pinctrl/sophgo/Kconfig                     |    2 +-
 drivers/pinctrl/spacemit/Kconfig                   |   17 +
 drivers/pinctrl/spacemit/Makefile                  |    3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 1051 +++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              |   40 +
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |    2 +-
 include/linux/firmware/xlnx-zynqmp.h               |    1 +
 161 files changed, 15900 insertions(+), 1166 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
 create mode 100644
Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
 rename Documentation/devicetree/bindings/pinctrl/{fsl,imx6ul-pinctrl.yaml
=3D> fsl,imx35-pinctrl.yaml} (50%)
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/airoha,en7581-pwm=
.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-airoha.c
 create mode 100644 drivers/pinctrl/pinctrl-k230.c
 create mode 100644 drivers/pinctrl/pinctrl-th1520.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5424.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs615.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs8300.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sar2130p.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8750.c
 create mode 100644 drivers/pinctrl/spacemit/Kconfig
 create mode 100644 drivers/pinctrl/spacemit/Makefile
 create mode 100644 drivers/pinctrl/spacemit/pinctrl-k1.c
 create mode 100644 drivers/pinctrl/spacemit/pinctrl-k1.h

