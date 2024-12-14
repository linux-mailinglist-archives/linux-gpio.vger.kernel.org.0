Return-Path: <linux-gpio+bounces-13883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F39F1F7F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 15:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 526507A05E7
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 14:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C480B19992C;
	Sat, 14 Dec 2024 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqsVFYxy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BADE195985;
	Sat, 14 Dec 2024 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734188221; cv=none; b=aYA47VICqbpOki2kOUnCs+KnHxvnGoKaSA3wRVwEadfOAIxHhndCVKQ09I2iBA9xb9fIRkKfIVyz4EPoCDZbRjvDTM50hfrDHG15LYh8G/0N8HZlscfU/ik6JqMY9hYCzJI2f3oV35TyGsrE4WiabVHnxi2CraAf+ZSdUPhi418=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734188221; c=relaxed/simple;
	bh=bjWNSul3fOJht+CDlmdfokYIaLI2gV/2G2Bsz0/SfoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNi7966kes2oeOHa3t3aRYFmFy/gL55VHNVvoCbu7V+8d24geqSy54e9ZH/JbMB9mnXS7dix6JU8RvhJJkRqQLmgsXYEY6m3eTTZpx7QAigopnU0WPSu4JXLbY4V0ANVfdCXJVul2jGEC2ifng0oBVQYSLsQFYCO8zsQ6VNq7Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqsVFYxy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so4586663a12.2;
        Sat, 14 Dec 2024 06:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734188218; x=1734793018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7nTStB+X6S7XYck+AF7JE+A5RYbVXWl/M2hx3vUuqM=;
        b=aqsVFYxyqPltLArBrGxeou0EoJDIVvUmfJtrWcdfV0ln286MNFF4VPoSmizKaCeDLQ
         idb4TQLKRUBxw1vHg2vRIanuPmZznLg+PbKEpWD4/m7Y53zpVxejQ+g7G+EfqCRPavmr
         iA7RM3V6T2EWibXilSNtXmPzvYcDq8puefUR4H9dTkXlOjF58J0dNn1aJ9lIdUorbvTT
         6RXyjLUomutMeZOzNGL+GYjQKHJn+hxg0nfleOY7kcixqo8kr3Mj4LaSYFi7F3TJ2OkS
         lVx8hzrPcfo8zIcCM6fkOXkAoARXZaa8qLfOTnMEnPkZ1zj82U6yLrCqL0wH3xoKPKdX
         tGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734188218; x=1734793018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7nTStB+X6S7XYck+AF7JE+A5RYbVXWl/M2hx3vUuqM=;
        b=fwV5VRGUmwJkzO8O+gWToO5G89SmCPFvwtMk31q2UpNgjkegvVEkdHW+rSqME08z8O
         FJFOfDsouTNmfx3ZO0Xzti9tKxgMTG5MKohoyAVww11FR9F5ai//GnHExZ1Y07FtFSoO
         TQFQ7MQMiukg9WjFCQ7CesrAUzQQUx28F/+npToeSqvIKGM12BAjR5SPAy6q074dXrhP
         NqejD7uhk4gRCgokjbwByEl4mNRa2rZFbdFgn/pqVYLgSrFUVJmCs+FqSbdk62qMd/Zp
         +CTLYby5dDTlFK0l5tYMoJGJ0a5JTOEyyNzgWM6f1AEYcdCAMrdnlLv+/fAUjXjMqRLG
         FjMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuxpCoAzWjAAQgLkrHLbx71y3HK4c+9E8eECbFKSEfYrInZtIlEnFQfLQMS9CvYAc7NTk0AGBfjGbz@vger.kernel.org, AJvYcCWVOkpOUKVyWzkzAzFDGFAjUzZUlqK1xlwW1tByJ7pjqqUuHtlv6WmEnUejTivG4wYdAKR19y4Daav1MwOR@vger.kernel.org, AJvYcCXYfHBai8+N7LpyTI1zwKXs8uwwA6OitPNVVUfmhpzS0fb4WTNfaLsxJlALQ9XWIX0xyl2KvpPs/apHH6hGV4og1G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2ln2UFw5MYJrdfqoQ54M9UtV5L1n1IYNHYeLX7+dmvs9relG
	mHGOAyuxaAQgp/G+WDzcJiIn2HfAgcnJLez+fGoII9T2v/bLXjxp
X-Gm-Gg: ASbGncsFpzVzjgZNR+OYrYz5j5PTwFmgWpaeoGcpWCrgehfVIhwIubLZtEt9v1z/2ij
	uSLdJlzhrKJ/WCisavX8i3AT8jqMCGsRr+vliMFyT/hz1vf8KB5HhN729lgsiVT/A3bf2TYSTEy
	ZYT2vEcXbSWH4sgRCNIbqkuzca2sEY1pO4kFVAM/P0ERZ6MmWLnQD/vRvZZM0TvrHK6I3s8A8Qn
	JgA2Cg569PVxVJA+evtNu6KS8EtjeH7ficmq1KvBNNPhMF9fQsGNi+N/VR64SV8C6xG
X-Google-Smtp-Source: AGHT+IEiYyDeUivGYEHR2jzFSlLz3gdHUTSoU3IIG4hZumg8pc7RfJTwIqj8vPyNgKABD7nLonclpQ==
X-Received: by 2002:a05:6402:5109:b0:5d0:bcdd:ff90 with SMTP id 4fb4d7f45d1cf-5d63c2f82bfmr5162909a12.2.1734188217414;
        Sat, 14 Dec 2024 06:56:57 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35b5bsm1057698a12.89.2024.12.14.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 06:56:56 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 14 Dec 2024 16:56:46 +0200
Subject: [PATCH RESEND v4 1/2] arm64: dts: exynos: Add Exynos9810 SoC
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-exynos9810-v4-1-4e91fbbc2133@gmail.com>
References: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
In-Reply-To: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734188212; l=18139;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=bjWNSul3fOJht+CDlmdfokYIaLI2gV/2G2Bsz0/SfoY=;
 b=EZlrvaeRQPpZk6UhARm3rkXVqZ0r8iY8HXfMN4/gOGC69sVYBvCVmO0TrirSRr34zBfwaZtcv
 iG+XSntvOQbDlHny8PyXL6b+MfWmjezSlktd8EZ/qaES9uE5TBPeiXS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
Note 9 (crownlte) and perhaps others.

Add minimal support for this SoC, including basic stuff like:
- PSCI for bringing up secondary cores
- ARMv8 generic timer
- GPIO and pinctrl.

The firmware coming with the devices based on this SoC is buggy
and doesn't configure CNTFRQ_EL0, as required by spec, so it's
needed to hardcode the frequency in the timer node.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 2 files changed, 776 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..88091bf09e4e91b05801cafe956283984d564449
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung's Exynos 9810 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
+ * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
+ */
+
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+	etc1: etc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	gpa3: gpa3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	gpa4: gpa4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpq0: gpq0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_aud {
+	gpb0: gpb0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb1: gpb1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb2: gpb2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_chub {
+	gph0: gph0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph1: gph1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_cmgp {
+	gpm0: gpm0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm1: gpm1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm2: gpm2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm3: gpm3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm4: gpm4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm5: gpm5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm6: gpm6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm7: gpm7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm10: gpm10-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm11: gpm11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm12: gpm12-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm13: gpm13-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm14: gpm14-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm15: gpm15-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm16: gpm16-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm17: gpm17-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm40: gpm40-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm41: gpm41-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm42: gpm42-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm43: gpm43-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&pinctrl_fsys0 {
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_fsys1 {
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpg0: gpg0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg1: gpg1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg2: gpg2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp0: gpp0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp1: gpp1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp2: gpp2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp3: gpp3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_peric1 {
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc1: gpc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd0: gpd0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg3: gpg3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp4: gpp4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp5: gpp5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp6: gpp6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_vts {
+	gpt0: gpt0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos9810.dtsi b/arch/arm64/boot/dts/exynos/exynos9810.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..70b67b2574d5b66eb5fa421a87dd6f4e49f8f54e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9810.dtsi
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Exynos 9810 SoC device tree source
+ *
+ * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
+ * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos9810";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_aud;
+		pinctrl2 = &pinctrl_chub;
+		pinctrl3 = &pinctrl_cmgp;
+		pinctrl4 = &pinctrl_fsys0;
+		pinctrl5 = &pinctrl_fsys1;
+		pinctrl6 = &pinctrl_peric0;
+		pinctrl7 = &pinctrl_peric1;
+		pinctrl8 = &pinctrl_vts;
+	};
+
+	arm-a55-pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	mongoose-m3-pmu {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x3>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m3";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m3";
+			reg = <0x101>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m3";
+			reg = <0x102>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m3";
+			reg = <0x103>;
+			enable-method = "psci";
+		};
+	};
+
+	oscclk: osc-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	psci {
+		compatible = "arm,psci";
+		method = "smc";
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+		cpu_suspend = <0xc4000001>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos9810-chipid",
+				     "samsung,exynos850-chipid";
+			reg = <0x10000000 0x100>;
+		};
+
+		gic: interrupt-controller@10101000 {
+			compatible = "arm,gic-400";
+			reg = <0x10101000 0x1000>,
+			      <0x10102000 0x1000>,
+			      <0x10104000 0x2000>,
+			      <0x10106000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+			#address-cells = <0>;
+			#size-cells = <1>;
+		};
+
+		pinctrl_peric0: pinctrl@10430000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x10430000 0x1000>;
+			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric1: pinctrl@10830000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x10830000 0x1000>;
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_fsys0: pinctrl@11050000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x11050000 0x1000>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_fsys1: pinctrl@11430000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x11430000 0x1000>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_vts: pinctrl@13880000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x13880000 0x1000>;
+		};
+
+		pinctrl_chub: pinctrl@13a80000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x13a80000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_alive: pinctrl@14050000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x14050000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos9810-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pmu_system_controller: system-controller@14060000 {
+			compatible = "samsung,exynos9810-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x14060000 0x10000>;
+		};
+
+		pinctrl_cmgp: pinctrl@14220000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x14220000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos9810-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_aud: pinctrl@17c60000 {
+			compatible = "samsung,exynos9810-pinctrl";
+			reg = <0x17c60000 0x1000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <26000000>;
+	};
+};
+
+#include "exynos9810-pinctrl.dtsi"
+#include "arm/samsung/exynos-syscon-restart.dtsi"

-- 
2.47.0


