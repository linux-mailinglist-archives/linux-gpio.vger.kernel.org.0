Return-Path: <linux-gpio+bounces-11880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BAD9AD7AE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FBED1C20E49
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A99C1FE10B;
	Wed, 23 Oct 2024 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="af1MvjfK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43164D599;
	Wed, 23 Oct 2024 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723032; cv=none; b=imKum1eWOMt2b9vbyedEC3UxbCuLXchdwejWYeuTx/9Ov5yxgkLp300oTr8ciI2O36Bh7/4Y7mYGM2OZcQ1AoftzP/uu0rIByPgqCOVQ9MZ5Xe4lM7urE4ywlsurpFpBAdbtJ2FyPaRpt448JU9OYQPanUgjD7Z418SsNjVk4Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723032; c=relaxed/simple;
	bh=fDYGFSiGfjp1xITeKsF1qgFSp9poh5xdMsaZW2rsHHM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XX8nxaF+aisThI7QAk6H//8gE1EmpRAEz977zzjxNeyyT3dLeYN13Suu8pxCBStfgULHG3oPytBmmR8xHH04b//0zXqxWGd9Uscv/ovvL+ZRsjk+fafeKONgZX69m7SZQe8TAGjfMzNQbK6zCUtDsg+OlTPUTgWh29TYRhHNcdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=af1MvjfK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so305814a12.1;
        Wed, 23 Oct 2024 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723029; x=1730327829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GjLyrUovCAs/itFKkl6SdTkHcCigmbwpVXsabFIzLI=;
        b=af1MvjfKqgoRGJg/78p2N71b5B6XMAFj+iUQDkqeiLRBzluR+STU9D/7lfGffC3aSw
         M5gU2bvQsB1UdEU3dICdY6rUvA+Du4jbFD4yANqE3DD91sqXrfQDxB849Z8rJVB5ptO0
         +se1KGcZ43lR1Te0B+YSZFJNbyOxKIN9y6f9Rul5JFUI+MgZQUc7HZlrGiNQU34ndlHG
         P4qsBwxNKPKThxFO5/KJW1y/1tA3b5nNzG0HVLG9N5PQnxBhk8ND/IEqDK1vslKIn8Eg
         xxIFatY+DQCIWu9AH1A+9xsbUgp+N1SPmfk/MC8qITBmGUVEr8t0qq/l3X5bc/tjD2Sx
         2Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723029; x=1730327829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GjLyrUovCAs/itFKkl6SdTkHcCigmbwpVXsabFIzLI=;
        b=lKdiIn2XBnHXgeZoFpi0gW6YUzg9an9ILOhUPXQEwuUrpMwUsVmmaIH0xu0IfAiF9/
         FmBNMaMDsNXYCtHg3pDNP/7D/upkiFVB69rgBKfR82ZfAKGag/CzhpLO53rQGPMCf0+B
         3eHHg4F/Vv2upGoKfhX9OcF12dOGNZnnpwH0zezaW4VSRw1gRJuOHWbtQ+9j19dvr1+7
         sURwBMHQEutCfYX/CDucmUMKCBqyxCQDgDCco5EwZmMzFQ643sUFkte3U4dgx9wMbgEO
         39VsNXQfPNS5c1Bzqe4o+ttG2fQloyM7FfnF0KURB6cEFdjTbzAltVW9stcEgxnh8pNe
         tMjA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Gk7UmFC1TQVfMyksJDdl447B7jfb6W58BBbgW5hoeORcZ1EzbC/prtDuUk9+mmNc8qbLeKkfYcZZ@vger.kernel.org, AJvYcCVW+YZqjvgdiM4cv2mHmpeg3kR2zd3GUMlQQiD8Q0kyfiAYnACq8fyqJvToUBrGRKGq1oJvo5PBeevYasaX@vger.kernel.org, AJvYcCWkWf1WYecnQg9UlDlU54wj4KcUTCpe92+WDDNzPFNZWdam4FgbN6FTZxCxYN/Qg4Vg7kydWnaoo4/W0x33eV/B5oU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvybQ5vi1e8QTdEs4MWht6ubZH+fitRBF4x3bUyF8IIgdUpg3L
	AVMYI4e057p1syjuPZre4BASXjdFwQP+Mfay7grul7T/TkGvhzWV7QggQqhqvdI=
X-Google-Smtp-Source: AGHT+IHq4uQ4ZWTcwAwjlSwm2uiOqT0ZdpoxlLWuEYMeWjs5pOEq1U85++qtkC7hLnSxG8UrS0ec8g==
X-Received: by 2002:a05:6402:378d:b0:5c5:cd4b:5c4d with SMTP id 4fb4d7f45d1cf-5cb8aca2dd1mr3261325a12.8.1729723028758;
        Wed, 23 Oct 2024 15:37:08 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:08 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 00/12] Add support for Exynos9810 SoC and Samsung Galaxy S9
 (SM-G960F)
Date: Thu, 24 Oct 2024 01:36:31 +0300
Message-Id: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG96GWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDINZNrajMyy+2tDA00E0yTk1NsbQ0TTJIslQCaigoSk3LrAAbFh1bWws
 Akpg/9lwAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=3314;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=fDYGFSiGfjp1xITeKsF1qgFSp9poh5xdMsaZW2rsHHM=;
 b=MrsoCLRlSFg+nm88pTF+R79mqB3Q75TI+feiJWmHp6ies/JafB2nr0nxY/Q6GoYmqczv4OhU3
 u61IG1fjWS5C6gQ8rAXxcj7fdguHLV5SlGpaXKxiGPSxHGqHu9syECh
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
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 525 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 256 ++++++++++
 drivers/perf/arm_pmuv3.c                           |   3 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 154 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 16 files changed, 1074 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


