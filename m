Return-Path: <linux-gpio+bounces-13882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EABC9F1F7A
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 15:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A18166E53
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 14:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9A5194C92;
	Sat, 14 Dec 2024 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS0Fn97r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985C946C;
	Sat, 14 Dec 2024 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734188219; cv=none; b=jSlf0Gc727Kfs4k6qYYhSRkDmPv0ZCY0lEpMxz8n6W25zE/N03TuYaCjXpjcP69gB1jXTcSd6MmJeW5DcyimlckBa15hQH7fWRYU62XlxpmksNg+BEU6a6r25ccIN+YYNcLXtNpNVsPoQtUM94LES3Sia2XyIu24zUzU7GAK2NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734188219; c=relaxed/simple;
	bh=mRczhs/xzX2xQZ8w0m2HvG1tEXpyCuzUCo8FCVrqwpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LD7hj+s3UbgzvQ9YpaDtSMOkFt7K8ZSn6bNNptBcM13eDMsUgBRFpusEmv6FmOJsrf7xP14RwaMUrxsr7B5CE4y1DXfgeANXWHFIFS22WBPpHi6zO0qQfxjx2QiPlLTbI0pM0MsazKpsF1nYCqwN5yvPRgh9e9I8utihN+3UVPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZS0Fn97r; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so349539166b.0;
        Sat, 14 Dec 2024 06:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734188215; x=1734793015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Pk7g3pQspO9VmDHlEH1a+IKv291+qN6GSVn3ge65Ds=;
        b=ZS0Fn97riqEdQsCF6vP4+qdRhd6p9IhXiN9lf9Q+dDdz9p2vtdvALLM39FAtao//3H
         AMm1Cdvm0kLVkZISfpu1qpQVdKDHmBGRcjwwBHmwlKsHHLcy1UEZnJm23tS3TJFJsFv4
         RYvgjEV43riPSKUlDRyFnVFpAEhkPPK9TcmIIKp9NL+3xlWY+c5QETlKV8LhY0209KWy
         Lhntmqo0h5mg01IEY7Ebicp5exk/Ze+ws69oI/5Cq9y/2Dv1yjpcFlckqZGz6eZRIM3E
         sLFIa78rRJMn0nnpyxqQQdUR7n/WiVCRHXGQNvxujfjmgoPBb65Ucw1KJ2AhIPmidqZX
         1HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734188215; x=1734793015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pk7g3pQspO9VmDHlEH1a+IKv291+qN6GSVn3ge65Ds=;
        b=h5w/7i5dI4yDL8FGB+xamaDIQ/hkl/fJi9UD1n7vTNoBl2rUzC3RJhdWjVgX4riNgD
         LaVrc6e3MkEHyY1nsgijfwiK0WFdvJ7mWnFzm4QFrW6XfkVWQwYG0+1yIddUvmaPnUXm
         i6lRXNc/w5sZ/LUYTfaG89GxTIPmfgpCsKhgq4Bd0T4F8qkslBDFzNPVRJgVJU86LJak
         VPEn3USrF7XvHn+W6OeKZ2ZCi0RYfxaEi+7nBIhGRdNmWb8N34ptW+XRm0NeSGR0YSNR
         6a+eYtvL4+aNHHFrZqDU9r2yNO+5Se0/75+AJ9oCMCOT+jPNOl+kaJ23U96awLO/lDk8
         yCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Z0jC3nM6EVha6udsuhRFwnZoJf6NCDKFMpkqbsbXgL4M1OTqWBB2d9zoAAd3jCbxOTXO8xt42vL3@vger.kernel.org, AJvYcCXFCzaPLviVS+ukuPD6FRvXHibZxVyJ2A7Nnydb7+nJ3x6kAOU6iWQpJhheT3gVQQXIe/9mvE+74lusU35u@vger.kernel.org, AJvYcCXXj7MiHuFPVr4MfIrxyvATFFMLNJLwXbnU4FmnGP8BiUxLxsKHn3+pttEmOs4QJOrs7av2uihNXIOjG3ggQ0TqaoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3F8udB2wGiEEPmQvTplx0MdDFJxnGyKUOSPlcIdq2WqXyny6
	6SodzJVNNMPJl661QFUoxJaZgrPPNh3JfV5A46GkWBKDXU1pUGSA
X-Gm-Gg: ASbGnctR4q7XsQtT7OBJnuf8Hci68U6RYVzgBFNwy0EMkKwRtXdTojJ5xBhbftYTTXS
	diPQYHEHtEaKRAF/20KdRZg8WSEPCop/lbRZ1chTWxQeIOB7nmjsCNkY3BEou7wcDnoz1lEq2fv
	IXP6snaRLSs/lJBPZk4W4FDc7BP5QlwBMfeKvzvm9XVp4yBuxnWA+TcR7UUq3Ew8Nfgi0SFbGVV
	rM4PxqSiCkUQaB7a6iDqwvrbYF4J1b7sDs0XK6S3etvDoiKo3+gmtsjkuoP1MPKbF2o
X-Google-Smtp-Source: AGHT+IGlc2KM+T4wRDPFeJUNWICS4zV9hyHb4SSOC/OGn2gaI4XQmGyiy+GVnvwzWstR1+w27/xS7A==
X-Received: by 2002:a05:6402:40d4:b0:5d0:e73c:b7f0 with SMTP id 4fb4d7f45d1cf-5d63c405fbbmr15854962a12.28.1734188215208;
        Sat, 14 Dec 2024 06:56:55 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35b5bsm1057698a12.89.2024.12.14.06.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 06:56:54 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH RESEND v4 0/2] Add support for Exynos9810 SoC and Samsung
 Galaxy S9 (SM-G960F)
Date: Sat, 14 Dec 2024 16:56:45 +0200
Message-Id: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2cXWcC/23QsW7CMBAG4FdBnjG6s02UY+pQVgY6IoYkvoAlk
 rQ2jUAo784pLAnt4OF8+u6X/odKHAMntVk8VOQ+pNC1MrjlQlXnoj2xDl5mZcA4lKf5dm+7RDm
 CLi2zJ1qXUJIS8B25Drfx2EHtt1/b3ac6yv85pGsX72NGj+P2v3M9atDs0XnwGXjIP05NES6rq
 mvGM72Z0vWMGqFEVWFrixkbfKd2SrMZtULLnDyTc8jFn1Q3pfmMOqEZEtbkoYJ6ljq8Con88yu
 lXl+tHIfhCWSMaHJyAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734188212; l=3140;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=mRczhs/xzX2xQZ8w0m2HvG1tEXpyCuzUCo8FCVrqwpI=;
 b=5H07vo9fmg56LQhkrkIqroP7x+EHwJtbOB0K0CyVnK3eTY8ZM4f/Yp6tC3DVj5DMQ4Sj1iopv
 aQobjV68walBkb3KFj7WrH/fKAHvSMOsy+4wh4MOnstMsGbBT62AbAu
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
Changes in v4 RESEND:
- dropped applied patches
- Link to v4: https://lore.kernel.org/r/20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com

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
Markuss Broks (2):
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 4 files changed, 896 insertions(+)
---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


