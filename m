Return-Path: <linux-gpio+bounces-12150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68069B1AC5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B5D0B21385
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A2E1D514B;
	Sat, 26 Oct 2024 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV7izDDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C84C83;
	Sat, 26 Oct 2024 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974775; cv=none; b=tiVwaJTT0vnb+r+g70FVrZ9bc3tIhmxoPy+UVnfwYOZMtbgkvFY6ylJ99Y5vpRBsc/8ZLwOufQhZ+5t0dD/QuL+CeuhZFlltp3YZugksItw1kSSnfPTpECAy7DLXPZkUO+6ePFVi90lqofdeBpzJ0tdg0LlGeP46wdOSMgmMVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974775; c=relaxed/simple;
	bh=BVUserAhlxXaLf5vKV75bAlUGlUoUuJDtgf69pVLDu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tBTlJzNmFVQGfdrZaG/Qo3JpAoFN5nA5hJ5TlYJFbSflVoG+brrrfF6dAskAAMFdwzc6ip5tqJYVauU8IrXbyoRewlaoasndN4S4domJnYlFhJwT0CGZVCggdkLg6Rq4SOFJU30aeNDoduSeH4J7iEAMjjSMmecr2KP+e2VoCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV7izDDY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3488336e87.0;
        Sat, 26 Oct 2024 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974771; x=1730579571; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF90UXs9kTQIF90liDg8fx2fiF+U0Tmt00BxqVTgios=;
        b=UV7izDDYnqUMqtPb5FujdB/PbJGf/xcd8ckGe5NTCziCzbv+fY2cyz7KzcROZlxrtf
         kzLhg4m3+Udzq5lTCp0fE7atg1pGet9C1dQTXRXv8Te59M1b8CU2izAKTM0mbTnxCmx3
         fQtPkwVmg5sIcl82BXY8bILK/pPlNHf/bV8pbookWdZuXpnidNpkmoB3A/0WuFqIpmoy
         6a8ziQZn0ZKu4dzRhYiV2hvd/RoviJ5q1BL4JpadQLgpxKsKcAPjvQtUdokP4Jzf91y0
         wdml7g8fJ/v2bi2nBtIV02vcdDq/oJ5QVySaq32CK+1uTRwZ2x7r+XvTn4mLdG7SlY/L
         BQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974771; x=1730579571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF90UXs9kTQIF90liDg8fx2fiF+U0Tmt00BxqVTgios=;
        b=hGt2S+uNbs6iQzS/V5lE5zzqDz603LSvzoH67FhmQRcw6B2CfThdIqXM6v4tL+gqXc
         DGOrWzfXfH4kfy1OkfyrPHjljkeJDmtFy3p4Gbi8kqqJ9Wp6iJrefLUB/KFXqo3/qc8M
         9g97TeYI48L8QgGGVT3z1wkTg769qbGnXNZbYCr8592D0n7mzGLhLdALlD8kX3fLUnN4
         NmY3dKpQk3/ZSNaVsCmsg8t0R8yp4H784/xIfJ9trKUQlKP/tiE6SPL1D/UIRXvCioWs
         mSINUEJ8DZ5bBewPIGTjawvQlYCc622EoNp7bURw+yq1j/KAN7Xa2y2CA47z19K/GFIY
         1M9A==
X-Forwarded-Encrypted: i=1; AJvYcCWYlcXO8u1FaDa2qz65hSAAAiG92OJxEmi3m6DU2f5ZHo+kvYnajH9fn4qBu3GuoyKKpsnzmXHZCo/u4xXm04OQHaA=@vger.kernel.org, AJvYcCWarYtd/LshD3JlHnKd6jYxycof25BUgVtL/E7V0fNvx++vtRR8NvRMxKdB6uZKn4vtC57q5ZjKomGcDqRu@vger.kernel.org, AJvYcCWqECnXD+AahIGZ8mAIxTvKH1vIxuFjQ+cg9hZc4/wUtDkwddUIBQt+ynNzf7f7iyMRUUTUWHD7Xjic@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZbn8XHKChfQjTjNVPO0RWU9tppZm9whczmRPiFTh2/NPbDwb
	m1+bO/zKSLKlctno4kMXKeuoCTz3Wet2isHVEwDS0kUm90TQg1XM
X-Google-Smtp-Source: AGHT+IE3SKNbeVLeGX39XHnr0blgOLm1GkrqEWdR6tFG0Rk+a7gOlPARd7s46wjLc1DdWevwB0ADtw==
X-Received: by 2002:a05:6512:692:b0:539:ea0f:cc43 with SMTP id 2adb3069b0e04-53b348d31eemr1162557e87.19.1729974771087;
        Sat, 26 Oct 2024 13:32:51 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:50 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v3 00/10] Add support for Exynos9810 SoC and Samsung Galaxy
 S9 (SM-G960F)
Date: Sat, 26 Oct 2024 23:32:31 +0300
Message-Id: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9RHWcC/22Qy27DIBBFf8ViXSoYHjJe9T+qLAwzdpBqk4JjJ
 Yr878VJF67UBYsLOkf38mCFcqTCuubBMq2xxDTXoN4aFs79PBKPWDMDAVrWw+l2n1NxrRTcKyJ
 0znjhHavAJdMQb0/Z56nmcyxLyvene5X77b+aVXLBCaVGgVagaD/GqY9f7yFNbNescETNHxQq6
 lzo1aCkJZBHdHtVyvR9rbOWVy/m+0K8vk9x6ZoBtFPWGARUaIJ1pt0XWS+0Ci3IAKqnFhU7fkf
 X/FaxfErzmFIVXqYrNwBaECopAnZ172nbfgDWkkiJXwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=4134;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BVUserAhlxXaLf5vKV75bAlUGlUoUuJDtgf69pVLDu0=;
 b=v4bk8vzj3ycQNePCRW5lDbWTwIMLhmyNOm0YdSZdQ34sUyDINDF+20rcnknWCRbCrJP/wTPiG
 H20CfUDFVtXAdep/nMEePOH0AeA9gbplUls27HUffU6b1dlOz/uoIlA
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
prerequisite-change-id: 20241026-mongoose-pmu-52240ed310cd:v1
prerequisite-patch-id: 41ddde9c262005eda3624e381b4a0892836187de
prerequisite-patch-id: d1b80350c60949f7f2671895518ad4b1ceb51e4a

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


