Return-Path: <linux-gpio+bounces-6470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA68C9992
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 09:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA389B2193D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 07:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2F51BC3F;
	Mon, 20 May 2024 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPVfeYSA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9818E1F
	for <linux-gpio@vger.kernel.org>; Mon, 20 May 2024 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716191761; cv=none; b=QmdUISAc96puVnF276qfB+fotTBWbjrh51KrV2lBDz1F8bquh4sdINeV/riAxQvgADYRgOoW67gfyPoe4kGQi570nwH7TMfMGDJRGyl+mObAlDRVViS+OKVZPRq/OXN6sVVtZir/wJCOCSbbyQ8NSZNQijFay8BgZbz9cnTvKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716191761; c=relaxed/simple;
	bh=GbUxzxc7h8pQ/nE4TnWwJpTxKCZajuWeWSMZb+LFpog=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i2ZjCW8mo2ZnWUVOL5gW6b/bTWM74A7184IT70mpbyqPddxtxGRnwedEJ8z2IYtxi5D+FolbyKfSSmfrZUd4s+1cU3X1m4q5i+EAszMFB6xze/9NKeVLS/fOz2GgOvNtc6LZ4Ao+O636zfaCfthYQnGHSRkbctHQift2HcDHDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPVfeYSA; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc71031680so2003993276.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2024 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716191759; x=1716796559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SN6nOe4VdcVTTAJGaWcvy/5LbNdItcqnWfPe1QXhyCU=;
        b=SPVfeYSAl6hGxGe8jAvV3iaNrfB7COHqMjmY+bvWxofJrbcUAFbDmblAxwNHHGCuDG
         lLgxYyJTF1jnVs+Yev7RAQLVQyetWMGqOH6uPY81eT2Gzdd0hgxl1d9JNGWkxoz3mxYR
         /xBKvGSAAcIKw1jTId8HRIqpdr6ZHT42RZR0cO7S/gwwnUtpKUIJ1sH1xBb2urjIeniN
         P4ScfgabO0RAFNnRJW4QP4FhiygLLq1aiN9R8oMjkQUvcHyfy9WY5m5yX9h7qsupYigc
         A7ROUMRwQoi2vUomr5QUUaZlpnfaJ1v8/bnwCK6X+FnLjxnifSylNzn8sUkqjuIpxb8i
         4i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716191759; x=1716796559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SN6nOe4VdcVTTAJGaWcvy/5LbNdItcqnWfPe1QXhyCU=;
        b=Xse5VXgPCXb9vBffzXbZS8CgcZAOGPU3HFv1iZyJkhVcjpVEEmaoG+dVtU6nSRmFaV
         15hmBTDcUupXGwTgSSJALGByzSWEdmB7UjZwUvHYDuJyPxvbt0Y9yhiEtz3aNAdsw4cE
         5Li9G0inumpalVjUqUtzzJkMmjWKy3ISyRAjm2BmR7MKm+jyzVVvvGikHGGhk7OcfJwZ
         auwOqoUirBWUSCS19N6tTaU7XxODLu2yNMOWullqE/H60OZKlhvacwW/1dHwRQaD/Ld7
         y52d4tgIUoBUHdXtuxp2u3M+Qxa3Yg4zlBX+lYX1/HbvTYmMCeYXDvvV8wDPUa+W3LdJ
         npGw==
X-Gm-Message-State: AOJu0YwSic8SKk7I542izqwhuhP01DBcwSEKmnGViLMzT7b2EwMsNQ5Q
	eAgJBSN4YzGt6A9sXFGflfGiIcK/UCK9abkOkit0EGDVFviC2gbPyjKvG1OCjzbmSRzcclgXzB2
	w1uIFGvzoHL7aVKJpjDuhUG/+Y7nd4kGKM49Yf+4XjxyczDSgXXYtPA==
X-Google-Smtp-Source: AGHT+IGChIi8QXwHMF5+ngfiRBN2ka1NvZfJRURrCniZBbnzVAnq6Zit8D96fFDFZn8e8GEyn3gP37eM3i8jB4KExd4=
X-Received: by 2002:a25:b94e:0:b0:dee:998b:1459 with SMTP id
 3f1490d57ef6-dee998b211bmr17372329276.39.1716191758672; Mon, 20 May 2024
 00:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 May 2024 09:55:47 +0200
Message-ID: <CACRpkdbKNem0KB4W9a6R7o6e7V4+eh9cLMKYV0xv5Hv3tEpysg@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v6.10
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here is the bulk of pin control changes for v6.10. This time
low activity and not very much interesting, it's even very little
driver activity.

Anyways: details in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit 4cece764965020c22cff7665b18a012006359095=
:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.10-1

for you to fetch changes up to 83906257f2e4441a4610f83ae24a713ba609b64a:

  Merge tag 'samsung-pinctrl-6.10' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel (2024-05-06 08:53:50 +0200)

----------------------------------------------------------------
Pin control changes for the v6.10 kernel cycle:

Core changes:

- Use DEFINE_SHOW_STORE_ATTRIBUTE() in debugfs entries.

New drivers:

- Qualcomm PMIH0108, PMD8028, PMXR2230 and PM6450
  pin control support.

Improvements:

- Serious cleanup of the recently merged aw9523 driver.

- Fix PIN_CONFIG_BIAS_DISABLE handling in pinctrl-single.

- A slew of device tree binding cleanups.

- Support a bus clock in the Samsung driver.

----------------------------------------------------------------
Andr=C3=A9 Draszik (2):
      dt-bindings: pinctrl: samsung: google,gs101-pinctrl needs a clock
      pinctrl: samsung: support a bus clock

Andy Shevchenko (13):
      pinctrl: pxa2xx: Make use of struct pinfunction
      pinctrl: pxa2xx: Make use of struct pingroup
      pinctrl: aw9523: Destroy mutex on ->remove()
      pinctrl: aw9523: Use correct error code for not supported functionali=
ty
      pinctrl: aw9523: Always try both ports in aw9523_gpio_set_multiple()
      pinctrl: aw9523: Make use of struct pinfunction and PINCTRL_PINFUNCTI=
ON()
      pinctrl: aw9523: Use temporary variable for HW IRQ number
      pinctrl: aw9523: Get rid of redundant ' & U8_MAX' pieces
      pinctrl: aw9523: Remove unused irqchip field in struct aw9523_irq
      pinctrl: aw9523: Make use of dev_err_probe()
      pinctrl: aw9523: Sort headers and group pinctrl/*
      pinctrl: aw9523: Fix indentation in a few places
      pinctrl: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for debugfs

Anjelique Melendez (4):
      dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIH0108 and PMD8028 suppor=
t
      pinctrl: qcom: spmi-gpio: Add PMXR2230 and PM6450 support
      pinctrl: qcom: spmi-gpio: Add PMIH0108 and PMD8028 support
      dt-bindings: pinctrl: qcom,pmic-gpio: Fix "comptaible" typo for PMIH0=
108

Arnd Bergmann (1):
      pinctrl: armada-37xx: remove an unused variable

Christophe JAILLET (2):
      pinctrl: max77620: Remove an unused fields in struct
max77620_pin_info and max77620_pctrl_info
      pinctrl: pinctrl-single: Remove some unused fields in struct pcs_func=
tion

Claudiu Beznea (2):
      pinctrl: renesas: rzg2l: Execute atomically the interrupt configurati=
on
      pinctrl: renesas: rzg2l: Configure the interrupt type on resume

Danila Tikhonov (1):
      pinctrl: qcom: pinctrl-sm7150: Fix sdc1 and ufs special pins regs

David Collins (1):
      dt-bindings: pinctrl: qcom,pmic-gpio: Add PMXR2230 and PM6450 support

Geert Uytterhoeven (2):
      pinctrl: renesas: r8a779h0: Fix IRQ suffixes
      pinctrl: renesas: r8a779h0: Add INTC-EX pins, groups, and function

Herman van Hazendonk (1):
      dt-bindings: pinctrl: qcom,pmic-mpp: add support for PM8901

Krzysztof Kozlowski (8):
      dt-bindings: pinctrl: samsung: drop unused header with register const=
ants
      pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
      pinctrl: freescale: imx8ulp: fix module autoloading
      pinctrl: mediatek: fix module autoloading
      pinctrl: loongson2: fix module autoloading
      pinctrl: qcom: sm7150: fix module autoloading
      pinctrl: realtek: fix module autoloading
      pinctrl: samsung: drop redundant drvdata assignment

Lad Prabhakar (2):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow 'input' and
'output-enable' properties
      pinctrl: renesas: rzg2l: Remove extra space in function parameter

Linus Walleij (2):
      Merge tag 'renesas-pinctrl-for-v6.10-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.10' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel

Luca Weiss (1):
      dt-bindings: pinctrl: qcom,pmic-gpio: Allow gpio-hog nodes

Matthijs Kooijman (1):
      pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling

Paul Barker (1):
      pinctrl: renesas: rzg2l: Limit 2.5V power supply to Ethernet interfac=
es

Peng Fan (1):
      pinctrl: pinconf-generic: print hex value

Rafa=C5=82 Mi=C5=82ecki (3):
      dt-bindings: pinctrl: mediatek: mt7622: add "gpio-ranges" property
      dt-bindings: pinctrl: mediatek: mt7622: fix array properties
      dt-bindings: pinctrl: mediatek: mt7622: add "antsel" function

Stefan Wahren (3):
      pinctrl: bcm2835: Implement bcm2835_pinconf_get
      pinctrl: bcm2835: Implement bcm2711_pinconf_get
      pinctrl: bcm2835: Make pin freeing behavior configurable

Tengfei Fan (1):
      dt-bindings: pinctrl: qcom: update functions to match with driver

Thomas Richard (1):
      pinctrl: pinctrl-single: move suspend()/resume() callbacks to noirq

 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  | 113 ++++++++++-------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  38 ++++++
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml |   1 +
 .../bindings/pinctrl/qcom,sm4450-tlmm.yaml         |  52 +++-----
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |  21 ++++
 MAINTAINERS                                        |   1 -
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  83 +++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c        |   1 +
 drivers/pinctrl/mediatek/pinctrl-mt6765.c          |   1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c          |   1 +
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   3 -
 drivers/pinctrl/pinconf-generic.c                  |   2 +-
 drivers/pinctrl/pinctrl-aw9523.c                   | 131 +++++++----------=
---
 drivers/pinctrl/pinctrl-loongson2.c                |   1 +
 drivers/pinctrl/pinctrl-max77620.c                 |   2 -
 drivers/pinctrl/pinctrl-single.c                   |  50 ++++----
 drivers/pinctrl/pinmux.c                           |  26 ++--
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c               |  55 ++++-----
 drivers/pinctrl/pxa/pinctrl-pxa2xx.h               |  15 +--
 drivers/pinctrl/qcom/pinctrl-sm7150.c              |  21 ++--
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   4 +
 drivers/pinctrl/realtek/pinctrl-rtd1315e.c         |   1 +
 drivers/pinctrl/realtek/pinctrl-rtd1319d.c         |   1 +
 drivers/pinctrl/renesas/pfc-r8a779h0.c             | 136 +++++++++++++++++=
++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  18 ++-
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 112 +++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  95 +++++++++++++-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        |   1 -
 include/dt-bindings/pinctrl/samsung.h              |  95 --------------
 31 files changed, 694 insertions(+), 391 deletions(-)
 delete mode 100644 include/dt-bindings/pinctrl/samsung.h

