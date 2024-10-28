Return-Path: <linux-gpio+bounces-12207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FB9B2B4A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C2C1F21F5F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5131AB536;
	Mon, 28 Oct 2024 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtMA6nfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FAC8472;
	Mon, 28 Oct 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107376; cv=none; b=hUCKnj14lVH5m3hNSv0qJODmQFc9JRO05I7p029NeUexOyFlwmLWtI9l/5FYO2ZVPpMGDcSGSTLdJyebwbQy7BBUwQzdsQk5aiT6MZ8SENkqeQABrJHyoIoUMH6sZVi1OVfZeAoQubwVhvhb9QSlHVG/1ESwhkKYU/dAGLcATi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107376; c=relaxed/simple;
	bh=LaoIjVefHly8xHuPd7wZXRSEeRjEx9/k2jRv27uNo9o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZL82Sd4c6lH97mOkIlaWDNXPylLaN4qoslPAKzg2oAmHPVJL0uOFSn3txbX2RoUhfgkqG/uibGkL1mX4hqBuCj71Y3eSk9imaD+5ttM+SQc+mi+BOiP4agp1gdkvI0g46eRIathXlGU7ymApArEWz8avb88R/sSTI4YJL/mm0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtMA6nfr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a0c160b94so4431117e87.2;
        Mon, 28 Oct 2024 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107372; x=1730712172; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJZ/N5H/92rMRLmF3zGIuUS3kiG8D/BSE0Wn8eb2g+g=;
        b=jtMA6nfrLUOo6RWMtOmpPhgwQSKpskMdEDK+dUE7fdkD3tY8wQSRBdiGT9iMeC+zL/
         p/bTqtrF6xZv8gdR71t4TM9/onDopiDz3w9ZojKwkQq+pMSkLO62rijJUu9iwCbDN8nj
         elZUnJeZ1CuN70yzEHn3LHFSISQEF7qlgIWSRbylPauxctyw7v0UMb8+s4UUErPRhN1k
         iHzZk8qFWcsqVEaVHGINhlqnM6EduudFzWvq2A4rWNaBx62CcIJjhie3GeTHftwxeMPx
         8pUmiGeBNKsgV+1IpYIqbdq3vBJ8BuFIWz3WZeP3EAeJgR6LrjDQSTYdRlauBKvnxxyW
         d3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107372; x=1730712172;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJZ/N5H/92rMRLmF3zGIuUS3kiG8D/BSE0Wn8eb2g+g=;
        b=COGL3PzhxJfs9xvu0qGpagNxELF5bWsm/2HKdmuLNuZzApLjrnP61LhpKBBVL/5ZPU
         bU/AHiPe70qvNZDbTxQAW8V7QCGpMxOaIxCpnWU6SjtanzKG/vojsuAqq48QYogrJIgt
         KJVfQtUomi9kp7fkw/ZFTWYQze3KLdhNWqIkZgEmobHAcOTbZdIfSbkUVs32SRpvbRyX
         XOLdq62NJXpXNNDTvZkZjf/EDL5e/MBQs/TgRWE7kWyXrPZ51dtUBJyIJBjttMKXwDLc
         rpDY8h5WkfQhCxK/IoiBt4m23aLVAD8F1jJBZXjKdtO1/9Sujp6MsBr3VSx2IowfbYO5
         ubBg==
X-Forwarded-Encrypted: i=1; AJvYcCWXI340Db2TkFEr1f9NHKSiM689o/70tiUBVkMlTkNSc/42Sjwd9wymB0MOr+6/KRr/8JCs4c+awrW/@vger.kernel.org, AJvYcCWXyYqnD+aBOE+8yabEMa9+sFR+TxaDIdMHRxY3x9CPsBKSSaZMoAlyxP/8uaX9Ec5aCOZpLhxB9ngEpHgE@vger.kernel.org, AJvYcCXH3njgDIRJRfILEW/8pCUWEB23W2UNJZr071WmheTyycRXqn1rt9mkrRPTpe9wsNtzbRIUDwdkYsqF3EsEhqNqxeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxijCij4QqTKpsP4YnU0YSh2rh5/Z90TnJvXAWr1vo+5YAw2/bB
	BYGaj1c9cV1oxx6ckfa7wQLBAaXiXCIouyNrh7xjUK3RX6bZeOR1
X-Google-Smtp-Source: AGHT+IG0x9Scdcs+etVMXKYxChdUdHKQu6TV5m9I0D5Jl1MaNkhUK8rWpK4GF+NFN4LwhTItKkiezg==
X-Received: by 2002:a05:6512:3e08:b0:539:9f3c:3bfd with SMTP id 2adb3069b0e04-53b34a359bbmr2132385e87.58.1730107371611;
        Mon, 28 Oct 2024 02:22:51 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:51 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v4 00/10] Add support for Exynos9810 SoC and Samsung Galaxy
 S9 (SM-G960F)
Date: Mon, 28 Oct 2024 11:22:28 +0200
Message-Id: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRXH2cC/22Qyw6CMBBFf8V0bU1fEOrK/zAuWjpAE6HaYgMh/
 LsFXYBxMYs7yTmTOxMK4C0EdD5MyEO0wbouBXE8oLJRXQ3YmpQRI0zQNBiGsXNBFpRgzQGMlJk
 mWqIEPDxUdlhl11vKjQ298+PqjnTZ/tVEigkGQ4UhJieGFJe6VfZ+Kl2LFk1kWzTboSyhUpaKV
 5zmwOgvyrdovkN5QnUhDUghKKjd1fnTxsPzlT7SfyvN8xsq9xhGLwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=4187;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=LaoIjVefHly8xHuPd7wZXRSEeRjEx9/k2jRv27uNo9o=;
 b=NwrL3Z8glQieV9u8Lg0G6hcirIBC6uZIfEOkVuPlwdcHRMx/7CX0LiAxUBApm85oxFRdLUOrs
 52EQG6iq9kpBR7tbAkA12oK70ga38ZibZQq35ldXSwdb1nm0H2pC69c
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
Changes in v4:
- make DTS build again [typo, misplaced ;] (krzk)
- lowercase hex in pinctrl (ivo)
- removed the perf patchset from dependencies (krzk)
- Link to v3: https://lore.kernel.org/r/20241026-exynos9810-v3-0-b89de9441ea8@gmail.com

Changes in v3:
- fix a blank line between tags (krzk)
- align with the opening " in eint-controller (krzk)
- sort the memory node (ivo)
- drop the \n (ivo)
- drop the perf patches into separate series (krzk)
- elaborate a bit more on dt-bindings (krzk)
- Link to v2: https://lore.kernel.org/r/20241025-exynos9810-v2-0-99ca3f316e21@gmail.com

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
Markuss Broks (10):
      dt-bindings: arm: cpus: Add Samsung Mongoose M3
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
      dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
      pinctrl: samsung: Add Exynos9810 SoC specific data
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 154 +++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 14 files changed, 1065 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


