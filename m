Return-Path: <linux-gpio+bounces-12068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F07269B011F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AE1C284241
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE73E201016;
	Fri, 25 Oct 2024 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn8/gwV2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3C71FDF87;
	Fri, 25 Oct 2024 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855513; cv=none; b=nBIFt3AVzOvWRngbyNgKZ8ndUjJnqI7tj6iUhMr3gWhr0aLrg7Rq+bcO5I39a5AgFBPPxe1C/kYPBOwvD8rRZaYzDd6rgRSm5q+b4uNAZYbU6v2MknT0l7IiH8a1iibUoGWFp6C+3/g7RVxQSnjOx7SoDcAfe5HHrqw6aH4c53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855513; c=relaxed/simple;
	bh=54KeIELGN5UoU7VoTMqUmaFmxCb6rTL4TU17Be6imWM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qt//AEON6PICcy5+/ws/xQR7lbA+zcgygXHycoAuXhtGgVdtmdt5nzw5TdiYoOQGlHib2ipgsAAprEbyKwVZzyJwhVPVrbiIaPaQ6e18RDsFggvOdA/KIJhlMOCCHV9g53FgN7OtwORWFdtFbZAgC8tXACVg84xUVe5qhlYqTm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn8/gwV2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1785643e87.2;
        Fri, 25 Oct 2024 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855509; x=1730460309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGDxFbsJCpgRnwwlevb7m4c9bmH+TBe47/8+WZp8fvI=;
        b=Nn8/gwV2suADXxQvm+Ageo9jYzgWrFylGFEjRQPrTTelyhDu0KJK8KsYVv/1PAMqXk
         S/JytJepcaN5OwHSURvNySQy9m2fojGMhfCtoKyNQyLGGmSXn/j7jioSheJx+AYi7L0s
         SMLyelyaAkVa3PXNM4NlCzJzwUC9u8i6HwGd5JdebCzzHLYKrABikjpWP+7dwpTKNUXw
         SexMCVKGmfnRvOuLeKhIjU/RVEYyb783jEKD3Nzr9ZV7UqPa0DAFbjTUVCJHsp6gAics
         tSJHjEcQXP9S1mdiyyJl24p/hMGh66aU5yJhax+8vwJGe/kauJLcCpP1gTH9RJSpC/W4
         X/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855509; x=1730460309;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGDxFbsJCpgRnwwlevb7m4c9bmH+TBe47/8+WZp8fvI=;
        b=PQ8W/+YjVgbBdzO8Mzs/zv9CxMIQ6sBLbpspya2HU0i8OEG0I3a13bCm3SrSP6zH5y
         UDmCmabxvOnPAI1puP4GYBYEqahU+K5R8QewjCr+TNf/yd+aO1UDq8HP1KxjtTeSANmU
         TiKhmWfd6I7L/vXPyqjJKdFoKl7r2yrfAl/D7Diq0JjlggE4BdxaM+ZPTZGs/QIQI/Ok
         yF/JdtVk8qExRV2EHqgd/LEmS4qWWDnKZTTHGIxuD6a+IbeqHaSSyltz/HwFEiLfqF53
         WJis182ArGo2di/ZwcTtMdvTnfspiv0OIIrIXbhAgFPOugheuLoTBCrGJ/JzAqBaRi0p
         O8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAZlT8EXtguZyJYuTLCHGynAXnn53TgSrxgi8l7cPbQ5TWQv0B1qkPkaNUP2Y5N1Ko/KYNKokXA332@vger.kernel.org, AJvYcCVgsefpZsBUzyclgIuzkwowNQ1ckyytS9sC/t02f7U8bb/uvuASDeNEXtr6jA9Ayaby1yBMsAayUVrOQuJy7CjbGgQ=@vger.kernel.org, AJvYcCXUrG7oHazLqcMr+Pu6UrLuly9ZaQGY5TLqxG37Tmr0977TP8qEeVKtef1e/SZOnduNWiVN0I70YXCIvMdu@vger.kernel.org
X-Gm-Message-State: AOJu0YxCD/oi0A7uIV9CMc4LO4gkT5+hUr/ay463aw8n5MmHWG24Q26r
	z8Def9m2iUcG5+7LCvT1JevSAE7Q2L3w9dft0HwGp9/RWNiNnliuunoSFg==
X-Google-Smtp-Source: AGHT+IGLZ+DwA6Tv+psqxv1iXTbBvh4nLKYcWHwMvOU0NZepTzQtBH2heZMmyHzsdO30dYav8AWDTA==
X-Received: by 2002:a05:6512:692:b0:539:da76:c77e with SMTP id 2adb3069b0e04-53b23ddcf22mr3404001e87.5.1729855508445;
        Fri, 25 Oct 2024 04:25:08 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:08 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v2 00/12] Add support for Exynos9810 SoC and Samsung Galaxy
 S9 (SM-G960F)
Date: Fri, 25 Oct 2024 14:24:47 +0300
Message-Id: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP9/G2cC/22MQQ6CMBBFr0Jmbc20oqGuvIdhQZkRJhFKWtNAS
 O9uZe3iL95P3tshchCOcK92CJwkip8LmFMF/djNAyuhwmDQ1LpM8brNPtpGo3IXZrL26tBZKMI
 S+CXrEXu2hUeJHx+2o5307/2bSVqhYtI1Id2QsHkMUyfvc+8naHPOX/PxgvOkAAAA
X-Change-ID: 20241024-exynos9810-b3eed995b0b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=3840;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=54KeIELGN5UoU7VoTMqUmaFmxCb6rTL4TU17Be6imWM=;
 b=aFoIQjX4s33D+HoI0XHlci/aW6O5Iloyc1/DSx9Q7I4F7SnEG1WTOSJvqq2kcGnSIDGXDPyz9
 S7TvTxv4posB5BR3Egq4IG5rt1QLJcAB096BsSCEVtJjEBTym4LTI/n
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Hello,

This series adds initial SoC support for the Samsung Exynos 9810
SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
codenamed starlte.

The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
should be fairly simple to add support for other devices based on this SoC,
considering they're quite similar.

The support added in this series includes:
- cpus
- pinctrl and gpio
- simple-framebuffer

This is enough to boot to a minimal initramfs shell.

The preferred way to boot this device is by using a small shim bl called
uniLoader [1], which packages the mainline kernel and DT and jumps to
the kernel. This is done in order to work around some issues caused by
the stock, and non-replacable Samsung S-Boot bootloader. For example,
S-Boot leaves the decon trigger control unset, which causes the framebuffer
to not refresh, so simple-framebuffer wouldn't work without a secondary loader.
Ideally, there'll be a kernel driver for the display subsystem some day to
resolve this issue.

[1] https://github.com/ivoszbg/uniLoader

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
Changes in v2:
- sort the pinctrl nodes alphabetically (ivo)
- move the interrupts from pinctrl file to SoC dtsi (krzk)
- move the wakeup-eint from pinctrl file to SoC dtsi (krzk)
- sort gpio-keys pinctrl-0 and pinctrl-names (ivo)
- rename the bixby key node to "wink" (ivo)
- sort gpio-keys subnodes (ivo)
- sort pinctrl_alive gpio-keys pin descriptions (ivo)
- fix the Co-developed-by tags and add a signoff (krzk)

- Link to v1: https://lore.kernel.org/r/20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com

---
Markuss Broks (12):
      dt-bindings: arm: cpus: Add Samsung Mongoose M3
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
      dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding
      dt-bindings: arm: pmu: Add Samsung Mongoose core compatible
      perf: arm_pmuv3: Add support for Samsung Mongoose PMU
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
      pinctrl: samsung: Add Exynos9810 SoC specific data
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/pmu.yaml     |   1 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 120 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 drivers/perf/arm_pmuv3.c                           |   3 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 154 +++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 16 files changed, 1070 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


