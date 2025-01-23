Return-Path: <linux-gpio+bounces-15019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3563A19FE2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 09:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91203188F6B7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 08:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524D820C03B;
	Thu, 23 Jan 2025 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cy3Zh7Fg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53AB20C029
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737620751; cv=none; b=SHYui2I0+h9yI+vnTOMSW85shNaoknVdeeHBMSefUiAFL3fmFTzGYgZVWgb5wJyGgyuIeaVzR2vt8g9fri1grWaNAu61eKOwjTKaGG9PufxKn3itDZwcU+x/XvCm5e3qzFW8mPg4h27GB328uW9BLCOL100hiDgXg+lqQ4KWmmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737620751; c=relaxed/simple;
	bh=pGJW4d+BPX3zTvKVKtaULQmYNwzZ9XUG6856YsMqROw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dSpkRzPqALgccnzi3YKkT889/xEIvEy602Iq5xXjCI7y2faV3jJKW97Kp1s9cCfWiG6FE+3KswPeOmFAqRHyXkRed/Z7B3pQMYMZthA/FZy+2XDJj97XRZgNA3uUHCzH4stui+fjtb363qF0BLnIgAwki6v1MAdGNhx9ZABOMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cy3Zh7Fg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53f22fd6887so722970e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 00:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737620747; x=1738225547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5sr+pbQzmmQJuNsL1YAfAYorF6QuNBgcH7rqKXKpS0=;
        b=cy3Zh7FgAeyf8mmMaZna+eVRy0svTzWb7CMQ1JUsxXwUdXc8rIFYgnb+dBQO4/HW6w
         7e6NWmCTKlQ5xvOvzz6D0W1KwTAo+K3wuwTetzktTk+3CdhV+H8bFkizGpKHLlWSU2OM
         eLzQkJKiKdyXV6VS1JscSOWu7rf3AyhIpc1cx5xgFqGcmx2tVFXKwMZ4BjB6vz6nRDVS
         MQsFc1+rpOArVfhl7PuKkYwFCrnzRcq7VOlpWbwK89EjlA8InAVtmSIvPM4FkplU3yYM
         veWMdotiPCKfykLdxRGOaQRyl2xQ5B0r7IgktihEnz8MXkIa3+rDY1yNOz4acXCuVK7E
         EBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620747; x=1738225547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5sr+pbQzmmQJuNsL1YAfAYorF6QuNBgcH7rqKXKpS0=;
        b=HAhULJDa+rp3XaZs4Jb6AQAqMDsYgf6tMsf3EiWvm/Pw1AzlPpijMK87JsDplP1P9U
         PyLcVQw4JM7ddOQyPfYFi12dESagGaGyThEIzg0ihT1Gp1OTfhU9tFms/LWaUlQ2ugJJ
         3dquP20g97c79JLfGbKJS6OE2qOhZWKOI4yKexlGAMgoCfPo9CgkV22O59YSYLhf+FoK
         hcmV2ZmE8Azai6ANrRqJdRALxuN5YOQxDlv93NfStLsmRkm7mpDZgKLJpD+f6ToVrfED
         CJxHFtKb9V//TPEwxG05IeAQmR+q7AEsjGPW26yvkPzcp02KPraFx++ZGNXo+XX5U80z
         p++Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD4WB/0JYxGUEwbzf3avDWYOUYJAbZR3PdtpPEjh1uRG6q4W83I4Ybp3yyxiBNnKh12FTGywKd57ru@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9T7GhQHBu/QyAo/E84OfDo8663wVCyCUnqc/HEZYap/AtssQ
	XokFFseAuDiKRmSbo0rRPL3qU0NQwrE+d5sVEs4zClGtGIv4IPhk3pDL6uL3cWX29tKMdt0kEsa
	8HjlWKvm0nX17eiGU1pQ6KAaUHRTKYWhwFB1EAQ==
X-Gm-Gg: ASbGncuJOx13dKMNxcZHhZn0iXbkOs8VAK8V/f2v9MkPnTRw0VKXVtW6VT0D/xr7yAl
	a8xkA+vSbVkmUBMZVqDEALipCO9KN7pE/yvhcjPrNcvV5MalFvzn/zhMHB9h5
X-Google-Smtp-Source: AGHT+IGVv+JjTeid55Ear6UiVGCP/46s2SPUbIQJX5oWa0lm2pJNXBRzRK88XUFuA3ESzztMOkbTSRQq6IyZC55vTLA=
X-Received: by 2002:a05:6512:b94:b0:53e:368c:ac4f with SMTP id
 2adb3069b0e04-5439c22a810mr7693992e87.9.1737620746739; Thu, 23 Jan 2025
 00:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Jan 2025 09:25:35 +0100
X-Gm-Features: AbW1kvZkEplgZRNKjS0pE54paa0A55UCApl0N7z-Si9ajeaoj6ITr19No22R47A
Message-ID: <CACRpkdYZCX7F+yoxZb5=qDfieAndOvS+mWfe2EYRvg6=zVOciA@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.14
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here is the bulk of pin control changes for the v6.14 kernel cycle.

There is nothing special this time at all. Just new drivers, gradual
improvements. Some fixes.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37=
:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.14-1

for you to fetch changes up to c9da9958ba14d89fdf360872c36dc89f4c70861f:

  dt-bindings: pinctrl: sunxi: add compatible for V853 (2025-01-16
10:08:10 +0100)

----------------------------------------------------------------
Pin control changes for the v6.14 kernel cycle:

No core changes this time

New drivers:

- New subdriver for the Qualcomm MSM8917 SoC TLMM

- New subdriver for the Mediatek MT7988 SoC

- New subdriver for the Rockchip RK3562 SoC

- New subdriver for the Renesas RZ/G3E SoC

Improvements:

- Fix some missing pins in the Qualcomm IPQ5424 TLMM

- Fix some missing LVDS pins in the Sunxi A100/A133

- Support Sunxi V853 (simple compatible string)

- Cleanups in the Samsung driver

- Fix some AMD suspend behaviour

- Cleanups

----------------------------------------------------------------
Andras Szemzo (1):
      dt-bindings: pinctrl: sunxi: add compatible for V853

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl

Biju Das (7):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II E=
VK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support for R=
Z/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      pinctrl: renesas: rzg2l: Update r9a09g057_variable_pin_cfg table
      pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC

Christophe JAILLET (2):
      pinctrl: samsung: Fix irq handling if an error occurs in
exynos_irq_demux_eint16_31()
      pinctrl: ocelot: Constify some structures

Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Add audio clock pins on RZ/G3S

Daniel Golle (2):
      pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
      pinctrl: mediatek: add MT7988 pinctrl driver

Frank Wunderlich (1):
      dt-bindings: pinctrl: add binding for MT7988 SoC

Geert Uytterhoeven (3):
      pinctrl: ingenic: Replace seq_printf() by seq_puts()
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into
renesas-pinctrl-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into
renesas-pinctrl-for-v6.14

Javier Carrasco (2):
      pinctrl: samsung: fix fwnode refcount cleanup if
platform_get_irq_optional() fails
      pinctrl: samsung: update child reference drop comment

Kever Yang (1):
      dt-bindings: pinctrl: Add rk3562 pinctrl support

Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: Correct indentation and style in DTS example
      pinctrl: Use str_enable_disable-like helpers

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Fix PFC_MASK for RZ/V2H and RZ/G3E

Linus Walleij (5):
      Merge tag 'renesas-pinctrl-for-v6.14-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.14' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      pinctrl: mediatek: Drop mtk_pinconf_bias_set_pd()
      Merge tag 'renesas-pinctrl-for-v6.14-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'renesas-pinctrl-for-v6.14-tag3' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel

Maciej S. Szmigiero (1):
      pinctrl: amd: Take suspend type into consideration which pins are non=
-wake

Manikanta Mylavarapu (2):
      dt-bindings: pinctrl: qcom: update spi0 function
      pinctrl: qcom: ipq5424: split spi0 pin group

Mingwei Zheng (2):
      pinctrl: nomadik: Add check for clk_enable()
      pinctrl: stm32: Add check for clk_enable()

Mukesh Ojha (1):
      pinctrl: Fix the clean up on pinconf_apply_setting failure

Otto Pfl=C3=BCger (1):
      pinctrl: qcom: Add MSM8917 tlmm pinctrl driver

Parthiban Nallathambi (1):
      pinctrl: sunxi: add missed lvds pins for a100/a133

Steven Liu (1):
      pinctrl: rockchip: add rk3562 support

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   15 +-
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |   13 +
 .../bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml |   72 +-
 .../bindings/pinctrl/mediatek,mt7988-pinctrl.yaml  |  575 +++++++
 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml        |    4 +-
 .../bindings/pinctrl/qcom,msm8917-pinctrl.yaml     |  160 ++
 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml |   54 +-
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml |   54 +-
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml |   54 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    7 +-
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    1 +
 .../bindings/pinctrl/xlnx,pinctrl-zynq.yaml        |   61 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   17 +
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |    3 +-
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c         |    3 +-
 drivers/pinctrl/core.c                             |   50 +-
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c          | 1556 ++++++++++++++++=
+++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   57 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    1 +
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    5 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   42 +-
 drivers/pinctrl/pinctrl-amd.c                      |   30 +-
 drivers/pinctrl/pinctrl-amd.h                      |    7 +-
 drivers/pinctrl/pinctrl-gemini.c                   |   11 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |    2 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |   20 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  200 ++-
 drivers/pinctrl/pinctrl-rockchip.h                 |    3 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    2 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |    6 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5424.c             |   34 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    3 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c             | 1620 ++++++++++++++++=
++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    3 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    3 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    3 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |   10 +-
 drivers/pinctrl/renesas/Kconfig                    |    1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  190 ++-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |    6 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    4 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   81 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c        |   12 +
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |   21 +
 .../pinctrl/renesas,r9a09g047-pinctrl.h            |   41 +
 .../pinctrl/renesas,r9a09g057-pinctrl.h            |   31 +
 49 files changed, 4850 insertions(+), 307 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8917-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8917.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

