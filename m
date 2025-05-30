Return-Path: <linux-gpio+bounces-20799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91938AC91DD
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 16:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49204500BDE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 14:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB4D23504F;
	Fri, 30 May 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5rxh+P6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DC22DFAD
	for <linux-gpio@vger.kernel.org>; Fri, 30 May 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616711; cv=none; b=AvJzBe3wCMi4u8mx2RuyiKBjxdsoBFBQUV3qJA6wYBiyrxKmRiUNkTQm7OJxVe8rJwI31dkU+enO4OGFTFrZE6i5btbQMSwj7NO2igE0jwgcgKRulYLrVnJJDzF2bR3sivAKLNUsLeNLlsARb/JDFgaicB/HZ26+HTdKMrfKWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616711; c=relaxed/simple;
	bh=Pozm0+L2zpnMRJcn3ae1TKMn6c26AOXd81hAFxL9Pgw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T0Ysbpyhtz2f2uxRIvXNQygjU+DT8wGgjRkSK9lK7HfGsS8JE+leSBP146UQQ2teVdutTSHhowAowaCt4O4TUjG9FRyAyhNRFm+8yS4y+b8LyjHexO0+sfjJs0YG3VykPx9kvwPeb4V4VQEwZccKbrnqhJ/ouDArmZveLjTE9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5rxh+P6; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e98f73850so2466257e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 May 2025 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748616706; x=1749221506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ELdomJwnFSi74XtzdJRNt2bPgN9Fuu9BPaxW5bQWlGw=;
        b=o5rxh+P6rsBf+aC47ECf4XAsWIX3PW62QnAe5+G3S6ZUUK/oz3rCC7Z5QWZuI4SM6L
         QlhfAVjeMQMlVn+ym1ejJWPcMEo9gKYy/lpeIk8NEc9PTI1+QkWLi8wY/jIvCKWuBLPO
         WUvg+KwCcv6KnErEv0CRkv1VbftDYCp5xP+INIKsjHQqc+FORsanliFgeEmpQjD01lo0
         3Evzf4QixtZj0BTrKN5ofQ69X6p/nwjmnnvpq1iFt5u7FNRP6cZYB8gZ23JaTv4ZXLGE
         djOCDQDbLx8A+D+OUPAzHuc07sTEdph3b4eh5ISZYp6CVG6XSOuHjrefpeNb7JEy/8O1
         B+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616706; x=1749221506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELdomJwnFSi74XtzdJRNt2bPgN9Fuu9BPaxW5bQWlGw=;
        b=fdpGnMGI7+KzPKI1aOWB4UVNpamUNbjv0CXlqzIkHBrW7oLd92oyZj4ashmY7IxjOF
         E2VQ+1HGlwWCLgq84kxApDCsiYTA0s9g7OjwsHtjvjzbZ/b1H8FlLIBzNnLrNtDI/t1e
         BxtgEr/u+aDMxPDwkmyPYWPWi9sjrsyXv+9ClgiBKfu8JCRJIycGap+fJr5eotq88Xen
         K2TfukL/YDYC6QlDtzlLCedclKAYPz0ESjNYPo999rywkrYybZO/BNgeVoFgZfHOMQbr
         dVhe9g94nc7diz3wd3Mg9eALqFHIY8zCm419krdszM683LL9iUZwgihrjaEPPOFNGQD1
         +MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdfBQvKvTcT9hd/R5Gcu+0zJE3Lu4khq0AqYLLGltgBZlCCIn0J6sYG81Zj7VBwqpLRJ/FwqG+z2Ns@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJH8DmRGDF/nXSM61Q7/NDQSkR4NgFxkZ1FgxIito9VMnNZEI
	+TBOihxNtWKQBGCXIbKa07JcY1ULGzOq+t3ZFsdS6SNtAXZq9d60Q7+MlLbgVq+sn8Q4ufK4F/f
	AmJ1lqEl+ibieZUxJAwVtjcrTYh4vnXeaI/nMSU0WxQ==
X-Gm-Gg: ASbGnct+iyFympdMgu9LLJwIG8a4zmiom/azKb2DdM35zNm5c7q6SaJffJN7w4Emnda
	Zg9U9UpjuLqyAZ6LikMfg1AREomYg/fKGiGKcZ0tmFcBg9PqszsTZx8nuI+tTuQhqIEXe1zQIA3
	b1BrGSKlbqoG+6hM96+3pkM4uWJKQrgkyX
X-Google-Smtp-Source: AGHT+IE2wlcRsnSsyhlqlqS8glWDiRgfTyNoYraVlywZO6logkB7bDz/n+CgBBj8G0d3nwMdUWvOc69Flo17s1PmOfk=
X-Received: by 2002:a05:6512:3084:b0:553:2c58:f971 with SMTP id
 2adb3069b0e04-5533b9079ffmr1376108e87.33.1748616705699; Fri, 30 May 2025
 07:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 May 2025 16:51:33 +0200
X-Gm-Features: AX0GCFu2pgXaj3hqiaBLtxdsZ5EhwHTNkd59xBCUC28P10mZZhYx0xFi8iSjy84
Message-ID: <CACRpkdYuGv=mQJB+i_1itMCdeSYHVj4bcxrbVL1z=uJCEci8OQ@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v6.16 kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

this is the bulk of pin control changes for the v6.16 kernel cycle.

An especially linear and sparse improvement and new drivers
release. Nothing exciting. The biggest change in Bartosz changes
to make gpiochip set/get calls return error codes. (Something we
should have fixed ages ago but is now finally getting fixed.)

Please pull it in! Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8=
:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.16-1

for you to fetch changes up to 08dcbe30be481bc66eb5ee1e82a577d64e451612:

  pinctrl: freescale: Add support for imx943 pinctrl (2025-05-21 10:12:14 +=
0200)

----------------------------------------------------------------
Pin control bulk changes for v6.16:

Core changes:

- Add the devres devm_pinctrl_register_mappings() call that can
  register some pin control machine mappings and have them go away
  with the associated device.

New drivers:

- Support for the Mediatek MT6893 and MT8196 SoCs.

- Support for the Renesas RZ/V2N SoC.

- Support for the NXP Freescale i.MX943 SoC.

Improvements:

- Per-SoC suspend/resume callbacks in the Samsung drivers.

- Set all pins as input (High-Z) at probe in the MCP23S08 driver.

- Switch most GPIO chips to use the setters/getters with a return
  value.

- EGPIO support in the Qualcomm QCM2290 driver.

- Fix up the number of available GPIO lines in Qualcomm QCS8300
  and QCS615.

----------------------------------------------------------------
Alexander Stein (2):
      pinctrl: freescale: Depend imx-scu driver on OF
      pinctrl: freescale: Enable driver if platform is enabled.

Andy Shevchenko (1):
      pinctrl: at91: Fix possible out-of-boundary access

AngeloGioacchino Del Regno (2):
      dt-bindings: pinctrl: mediatek: Add support for MT6893
      pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200

Bartosz Golaszewski (37):
      pinctrl: at91-pio4: use new GPIO line value setter callbacks
      pinctrl: rk805: use new GPIO line value setter callbacks
      pinctrl: abx500: enable building modules with COMPILE_TEST=3Dy
      pinctrl: abx500: use new GPIO line value setter callbacks
      pinctrl: meson: use new GPIO line value setter callbacks
      pinctrl: amlogic-a4: use new GPIO line value setter callbacks
      pinctrl: sx150x: use new GPIO line value setter callbacks
      pinctrl: ocelot: use new GPIO line value setter callbacks
      pinctrl: cy8c95x0: use new GPIO line value setter callbacks
      pinctrl: qcom: lpass-lpi: use new GPIO line value setter callbacks
      pinctrl: qcom: msm: use new GPIO line value setter callbacks
      pinctrl: qcom: spmi-gpio: use new GPIO line value setter callbacks
      pinctrl: qcom: spmi-mpp: use new GPIO line value setter callbacks
      pinctrl: qcom: ssbi-gpio: use new GPIO line value setter callbacks
      pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks
      pinctrl: amd: use new GPIO line value setter callbacks
      pinctrl: axp209: use new GPIO line value setter callbacks
      pinctrl: stmfx: use new GPIO line value setter callbacks
      pinctrl: owl: use new GPIO line value setter callbacks
      pinctrl: stm32: use new GPIO line value setter callbacks
      pinctrl: ingenic: use new GPIO line value setter callbacks
      pinctrl: microchip-sgpio: use new GPIO line value setter callbacks
      pinctrl: at91: allow building the module with COMPILE_TEST=3Dy
      pinctrl: at91: use new GPIO line value setter callbacks
      pinctrl: armada-37xx: use new GPIO line value setter callbacks
      pinctrl: pistachio: use new GPIO line value setter callbacks
      pinctrl: samsung: use new GPIO line value setter callbacks
      pinctrl: at91: drop unneeded dependency on OF_GPIO
      pinctrl: mediatek: airoha: use new GPIO line value setter callbacks
      pinctrl: mediatek: paris: don't double-check the GPIO number
      pinctrl: mediatek: paris: use new GPIO line value setter callbacks
      pinctrl: mediatek: moore: use new GPIO line value setter callbacks
      pinctrl: mediatek: common: use new GPIO line value setter callbacks
      pinctrl: bcm: nsp-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm: iproc-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm2835: use new GPIO line value setter callbacks
      pinctrl: add stubs for OF-specific pinconf functions

Cathy Xu (1):
      dt-bindings: pinctrl: mediatek: Add support for mt8196

Charles Han (1):
      pinctrl: qcom: tlmm-test: Fix potential null dereference in tlmm
kunit test

Frank Li (2):
      dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt to yaml format
      dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt to yaml format

Gabor Juhos (7):
      pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
      pinctrl: armada-37xx: set GPIO output value before setting direction
      pinctrl: armada-37xx: propagate error from
armada_37xx_gpio_direction_output()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
      pinctrl: armada-37xx: propagate error from
armada_37xx_pmx_gpio_set_direction()
      pinctrl: armada-37xx: propagate error from
armada_37xx_gpio_get_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_nam=
e()

Guodong Liu (1):
      pinctrl: mediatek: Add pinctrl driver on mt8196

Hao Chang (2):
      pinctrl: mediatek: Fix the invalid conditions
      pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin

Jacky Bai (1):
      pinctrl: freescale: Add support for imx943 pinctrl

John Madieu (1):
      pinctrl: apple: Make regmap_config static const and fix indentation

Krzysztof Kozlowski (5):
      pinctrl: meson: Do not enable by default during compile testing
      pinctrl: uniphier: Do not enable by default during compile testing
      dt-bindings: pinctrl: mediatek: Drop unrelated nodes from DTS example
      dt-bindings: pinctrl: mediatek: Correct indentation and style in
DTS example
      pinctrl: meson: Drop unused aml_pctl_find_group_by_name()

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC

Lijuan Gao (4):
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs61=
5
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs83=
00
      pinctrl: qcom: correct the ngpios entry for QCS615
      pinctrl: qcom: correct the ngpios entry for QCS8300

Linus Walleij (4):
      pinctr: nomadik: abx500: Restrict compile test
      Merge tag 'renesas-pinctrl-for-v6.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.16' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge branch 'ib-armada-for-v6.16' into devel

Mike Looijmans (1):
      pinctrl: mcp23s08: Reset all pins to input at probe

N=C3=ADcolas F. R. A. Prado (1):
      pinctrl: mediatek: eint: Fix invalid pointer dereference for v1 platf=
orms

Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs10=
1

Thomas Richard (2):
      pinctrl: remove extern specifier for functions in machine.h
      pinctrl: core: add devm_pinctrl_register_mappings()

Wentao Liang (1):
      pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()

Wojciech Slenska (1):
      pinctrl: qcom: pinctrl-qcm2290: Add egpio support

Xianwei Zhao (1):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5

Yixun Lan (2):
      dt-bindings: pinctrl: spacemit: add clock and reset property
      pinctrl: spacemit: add clock support for K1 SoC

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |    7 +-
 .../bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml      |   99 +
 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |   53 -
 .../bindings/pinctrl/fsl,vf610-iomuxc.yaml         |   83 +
 .../bindings/pinctrl/fsl,vf610-pinctrl.txt         |   41 -
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  |   95 +-
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |    5 -
 .../bindings/pinctrl/mediatek,mt6893-pinctrl.yaml  |  193 ++
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  |   56 +-
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |   70 +-
 .../bindings/pinctrl/mediatek,mt8192-pinctrl.yaml  |   78 +-
 .../bindings/pinctrl/mediatek,mt8196-pinctrl.yaml  |  236 ++
 .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         |    2 +-
 .../bindings/pinctrl/qcom,qcs8300-tlmm.yaml        |    2 +-
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |   18 +
 drivers/pinctrl/Kconfig                            |    4 +-
 drivers/pinctrl/actions/pinctrl-owl.c              |    8 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    9 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |    6 +-
 drivers/pinctrl/core.c                             |   29 +
 drivers/pinctrl/freescale/Kconfig                  |   11 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |    4 +
 drivers/pinctrl/mediatek/Kconfig                   |   22 +
 drivers/pinctrl/mediatek/Makefile                  |    2 +
 drivers/pinctrl/mediatek/mtk-eint.c                |   30 +-
 drivers/pinctrl/mediatek/mtk-eint.h                |    7 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |   19 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   18 +-
 drivers/pinctrl/mediatek/pinctrl-mt6893.c          |  879 ++++++
 drivers/pinctrl/mediatek/pinctrl-mt8196.c          | 1860 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |    9 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   15 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h      | 2283 +++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h      | 3085 ++++++++++++++++=
++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   29 +-
 drivers/pinctrl/meson/Kconfig                      |   24 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |   22 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    6 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   43 +-
 drivers/pinctrl/nomadik/Kconfig                    |    6 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |   12 +-
 drivers/pinctrl/pinconf.h                          |   17 +
 drivers/pinctrl/pinctrl-amd.c                      |    7 +-
 drivers/pinctrl/pinctrl-apple-gpio.c               |   30 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   18 +-
 drivers/pinctrl/pinctrl-at91.c                     |   21 +-
 drivers/pinctrl/pinctrl-axp209.c                   |   35 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |   17 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |    8 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    8 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |    8 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |   17 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    8 +-
 drivers/pinctrl/pinctrl-rk805.c                    |   26 +-
 drivers/pinctrl/pinctrl-scmi.c                     |    1 +
 drivers/pinctrl/pinctrl-stmfx.c                    |   13 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   23 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    6 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |   70 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    6 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    7 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    7 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |    1 +
 drivers/pinctrl/renesas/Kconfig                    |    1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  299 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |   52 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  294 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   28 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   34 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    8 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              |   10 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    7 +-
 drivers/pinctrl/uniphier/Kconfig                   |    2 +-
 include/linux/pinctrl/machine.h                    |   19 +-
 79 files changed, 9753 insertions(+), 857 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6893.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

