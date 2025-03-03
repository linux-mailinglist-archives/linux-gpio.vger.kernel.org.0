Return-Path: <linux-gpio+bounces-16981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A3A4CD10
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5A6718963F3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C282523C8A0;
	Mon,  3 Mar 2025 20:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKItLc4q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534A23959E;
	Mon,  3 Mar 2025 20:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741035301; cv=none; b=Prwt+VwRxH8u1YAEbSxHPF82gdMjcivm+r8pQA+/9vEnh6fE1Wpa78fAbl3/Oz3AFADD5a9Fv6S0L8lwgOdsC67BKBoauKA7Az0ejTpbiMr/CSW1bgnyHqhen0V4DHFndWWSzD8QfkfHNk51RjL0m69wI1L7rLLJ2OobDwPIxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741035301; c=relaxed/simple;
	bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBgg/r3ddu/9GPoKfebnr4BNJ/swwDJEJKp1/pR9fuvZd45ecZN2tTjn2Bvq3Z/3VQhphwtJQIqjFs/dwGPMfX5aIi0yE0mIhYjTPe9anOEHdUYZDolNt7B8fgQzvegTpH44CRZKOHNVvInJh1T28Y/kQShvDjwlwQr8YqTwWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKItLc4q; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaedd529ba1so562773866b.1;
        Mon, 03 Mar 2025 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035298; x=1741640098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=hKItLc4qhzDRvNIdWmi6+l/zj5GzZWpf+j+ViPXl5syOgtHW6zzqclB5kkgpvM+vJ/
         9RGPs46moMF8Uf0fD4E2Ys+vs7lNc6XZa80pXcnZpnPqU5Gl6qwW0pQlpsxwcP3PHWi0
         wTytKpKBGw9kVacjGgVHFMZlq++JPG3DqGbNzvJ6iF0QD54NtQsck2M9VrzmnMozwRWq
         XzCJXH0tidTAGEtPaLwUM7iq+5TFbqBf7s6Nau54sEgr0Jdsj7CgpM4fF81pVPjVBX04
         CiSANPYWru4GvS67hDt5WRwCgtroiYczkR/dGg85F3RhF3AzGr9dA0Uv88sHlS/+MMuA
         rQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035298; x=1741640098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=b9M6z8F+fy3+CppHxD1vCzOD+voVyT0FFiGjTrydTUiShS6McHWALQEtL/TLNDYhNx
         N2w1HigOeJxcwni4RX5KsvXW5FYXc4DmFEG6Q28GPEANZrvUJZOazWnCd/wuNr7uDlPz
         D/jSD0nEd4xElwslkhQyrIaNLHG8fJhqu5XgsuMN523p9PK5jaNwxrFXyz8ZG2zJUwjf
         et3RgK3LfSlggKnNUc9CWDObzFuqfnLlC7rsalH12rJgHLyvjdbiI2AmY1Fh9NbtZzwU
         RMD353fSR1e7D4g/bnQe8ILLMWiSJhZ3NVK8INygyamJhmHRWZfABZhuyzQuI4TP8rzj
         4XiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8tSfweYJ1GHKZ4QVWHnuAdP4wIR6BepoKfQr8fk04pTRiBg1JfR1kyxfK0hjxBKgdPfD9GgdBFhAq@vger.kernel.org, AJvYcCXv4xvveJCQiDkrcupd9oZ5vwqJkfvKpoTq003QMwygP61dx24irRMh2Szdg79U++MSqjlpudh36Z8OCBjc@vger.kernel.org
X-Gm-Message-State: AOJu0YzuoLb6HyjDGVsuoHx+93ocvF2gdD8yx7+Ph+4gumLSzlPkePoT
	FosSifuKrkHyASy52VjUezcS4tfA+CJT7o7Yt1Q/AZh7/Hi6jfDe/gCGnQ==
X-Gm-Gg: ASbGncsyAIRA6ZfC1S6U8J2ltU5ybCY/J1BYbyfpAH1F5oGAHO/vBKTrweX7yf00Ofl
	v0AJiW6C8wqKG0PpXWFENp6GnTZVPY/4cFzf/0hE03MVg3+iNBozufxNy5XWcdPcrp1bWSb3PH0
	f0+Q/F99WXGVPWXk9ZxJjc6nk0me+L4eCmBDz8ASjnmF8WhERkacPP7G+PjS+KXfTlc7130dAIP
	H0CW6UdxQTiUy2cQnVMja/9l3uQqTWi7l1f2RPTQy/9DgVKoADymYe7YvDbH44OBBjXVrCS5IiT
	WI5vg97P88iirBzpqEfnVkX8gbdGQ2/ebYPcWvYgFvzn5az5zOMS45y9qRqP83TSNy06V3B4WBa
	oxAAHRXNy7JwTJ6Y=
X-Google-Smtp-Source: AGHT+IGL2YA/WqHKHuyosoZ0FTICgI26SVWArz7fch8CvYRnNoLDjfA4RUT/Cs6K1TVfnuAovJQnFQ==
X-Received: by 2002:a05:6402:274b:b0:5e4:d2c9:456c with SMTP id 4fb4d7f45d1cf-5e4d6b4c7c3mr40715184a12.22.1741035297448;
        Mon, 03 Mar 2025 12:54:57 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:57 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:51 +0100
Subject: [PATCH v3 6/6] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-6-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=7006;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
 b=lHUpV2T1pqdq8Pcb9K+DP254BYkt0/S/jSk0n0VTwrRBdmPVBfNHMbAxri/uC1tu3CHQI2caz
 c6viWOIlAi+BMpIX9XMVgs0a/SDMcc0/RT4lgaP9vMu3qC8toLDnBLR
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add common DTSI with common pin control configs for BCM21664/BCM23550
and include it in bcm2166x-common.dtsi. The configs are kept in a
separate DTSI to keep things cleaner (pin config definitions take up
quite a lot of space).

Currently contains pins for BSC buses and SD/MMC; more pins can be
added in the future.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi  |   2 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi | 297 +++++++++++++++++++++++
 2 files changed, 299 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index d4b412ac8b0343bd3773f50c59a20fa00a3923f8..f535212cb52fec0668abfc06e7268bead70d958a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -337,3 +337,5 @@ master_ccu: master_ccu@3f001000 {
 		};
 	};
 };
+
+#include "bcm2166x-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..51b8730c8feea501f2c5ca6a7bad8233ed708c82
--- /dev/null
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Common pinmux configrations for BCM2166x (BCM21664/BCM23550).
+ *
+ * Copyright (C) 2025 Artur Weber <aweber.kernel@gmail.com>
+ */
+
+&pinctrl {
+	/* BSC1 */
+	bsc1_pins: bsc1-pins {
+		bsc1clk-grp0 {
+			pins = "bsc1clk";
+			function = "alt1"; /* BSC1CLK */
+		};
+
+		bsc1dat-grp0 {
+			pins = "bsc1dat";
+			function = "alt1"; /* BSC1DAT */
+		};
+	};
+
+	/* BSC2 */
+	bsc2_pins: bsc2-pins {
+		bsc2clk-grp0 {
+			pins = "gpio16";
+			function = "alt2"; /* BSC2CLK */
+		};
+
+		bsc2dat-grp0 {
+			pins = "gpio17";
+			function = "alt2"; /* BSC2DAT */
+		};
+	};
+
+	/* BSC3 */
+	bsc3_pins: bsc3-pins {
+		bsc3clk-grp0 {
+			pins = "lcdscl";
+			function = "alt1"; /* BSC3_CLK */
+		};
+
+		bsc3dat-grp0 {
+			pins = "lcdsda";
+			function = "alt1"; /* BSC3_SDA */
+		};
+	};
+
+	/* BSC4 */
+	bsc4_pins: bsc4-pins {
+		bsc4clk-grp0 {
+			pins = "lcdres";
+			function = "alt1"; /* BSC4_CLK */
+		};
+
+		bsc4dat-grp0 {
+			pins = "lcdte";
+			function = "alt1"; /* BSC4_SDA */
+		};
+	};
+
+	/* PMBSC */
+	pmbsc_pins: pmbsc-pins {
+		pmbscclk-grp0 {
+			pins = "pmbscclk";
+			function = "alt1"; /* PMBSCCLK */
+		};
+
+		pmbscdat-grp0 {
+			pins = "pmbscdat";
+			function = "alt1"; /* PMBSCDAT */
+		};
+	};
+
+	/* SD */
+	sd_width1_pins: sd-width1-pins {
+		sdck-grp0 {
+			pins = "sdck";
+			function = "alt1"; /* SDCK */
+			bias-disable;
+		};
+
+		sdcmd-grp0 {
+			pins = "sdcmd";
+			function = "alt1"; /* SDCMD */
+			bias-pull-up;
+		};
+
+		sddat-grp0 {
+			pins = "sddat0";
+			function = "alt1"; /* SDDATx */
+			bias-pull-up;
+		};
+	};
+
+	sd_width4_pins: sd-width4-pins {
+		sdck-grp0 {
+			pins = "sdck";
+			function = "alt1"; /* SDCK */
+			bias-disable;
+		};
+
+		sdcmd-grp0 {
+			pins = "sdcmd";
+			function = "alt1"; /* SDCMD */
+			bias-pull-up;
+		};
+
+		sddat-grp0 {
+			pins = "sddat0", "sddat1", "sddat2", "sddat3";
+			function = "alt1"; /* SDDATx */
+			bias-pull-up;
+		};
+	};
+
+	/* SD1 */
+	sd1_width1_pins: sd1-width1-pins {
+		sd1ck-grp0 {
+			pins = "mmc1dat7";
+			function = "alt6"; /* SD1CK */
+			bias-disable;
+		};
+
+		sd1cmd-grp0 {
+			pins = "spi0txd";
+			function = "alt2"; /* SD1CMD */
+			bias-pull-up;
+		};
+
+		sd1dat0-grp0 {
+			pins = "mmc1dat5";
+			function = "alt6"; /* SD1DAT0 */
+			bias-pull-up;
+		};
+	};
+
+	sd1_width4_pins: sd1-width4-pins {
+		sd1ck-grp0 {
+			pins = "mmc1dat7";
+			function = "alt6"; /* SD1CK */
+			bias-disable;
+		};
+
+		sd1cmd-grp0 {
+			pins = "spi0txd";
+			function = "alt2"; /* SD1CMD */
+			bias-pull-up;
+		};
+
+		sd1dat0-grp0 {
+			pins = "mmc1dat5";
+			function = "alt6"; /* SD1DAT0 */
+			bias-pull-up;
+		};
+
+		sd1dat1-grp0 {
+			pins = "gpio93";
+			function = "alt1"; /* SD1DAT1 */
+			bias-pull-up;
+		};
+
+		sd1dat2-grp0 {
+			pins = "gpio94";
+			function = "alt1"; /* SD1DAT2 */
+			bias-pull-up;
+		};
+
+		sd1dat3-grp0 {
+			pins = "mmc1dat3";
+			function = "alt6"; /* SD1DAT3 */
+			bias-pull-up;
+		};
+	};
+
+	/* MMC0 */
+	mmc0_width1_pins: mmc0-width1-pins {
+		mmc0ck-grp0 {
+			pins = "mmc0ck";
+			function = "alt1"; /* MMC0CK */
+			bias-disable;
+		};
+
+		mmc0cmd-grp0 {
+			pins = "mmc0cmd";
+			function = "alt1"; /* MMC0CMD */
+			bias-pull-up;
+		};
+
+		mmc0dat-grp0 {
+			pins = "mmc0dat0";
+			function = "alt1"; /* MMC0DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc0_width4_pins: mmc0-width4-pins {
+		mmc0ck-grp0 {
+			pins = "mmc0ck";
+			function = "alt1"; /* MMC0CK */
+			bias-disable;
+		};
+
+		mmc0cmd-grp0 {
+			pins = "mmc0cmd";
+			function = "alt1"; /* MMC0CMD */
+			bias-pull-up;
+		};
+
+		mmc0dat-grp0 {
+			pins = "mmc0dat0", "mmc0dat1", "mmc0dat2", "mmc0dat3";
+			function = "alt1"; /* MMC0DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc0_width8_pins: mmc0-width8-pins {
+		mmc0ck-grp0 {
+			pins = "mmc0ck";
+			function = "alt1"; /* MMC0CK */
+			bias-disable;
+		};
+
+		mmc0cmd-grp0 {
+			pins = "mmc0cmd";
+			function = "alt1"; /* MMC0CMD */
+			bias-pull-up;
+		};
+
+		mmc0dat-grp0 {
+			pins = "mmc0dat0", "mmc0dat1", "mmc0dat2", "mmc0dat3",
+			       "mmc0dat4", "mmc0dat5", "mmc0dat6", "mmc0dat7";
+			function = "alt1"; /* MMC0DATx */
+			bias-pull-up;
+		};
+	};
+
+	/* MMC1 */
+	mmc1_width1_pins: mmc1-width1-pins {
+		mmc1ck-grp0 {
+			pins = "mmc1ck";
+			function = "alt1"; /* MMC1CK */
+			bias-disable;
+		};
+
+		mmc1cmd-grp0 {
+			pins = "mmc1cmd";
+			function = "alt1"; /* MMC1CMD */
+			bias-pull-up;
+		};
+
+		mmc1dat-grp0 {
+			pins = "mmc1dat0";
+			function = "alt1"; /* MMC1DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc1_width4_pins: mmc1-width4-pins {
+		mmc1ck-grp0 {
+			pins = "mmc1ck";
+			function = "alt1"; /* MMC1CK */
+			bias-disable;
+		};
+
+		mmc1cmd-grp0 {
+			pins = "mmc1cmd";
+			function = "alt1"; /* MMC1CMD */
+			bias-pull-up;
+		};
+
+		mmc1dat-grp0 {
+			pins = "mmc1dat0", "mmc1dat1", "mmc1dat2", "mmc1dat3";
+			function = "alt1"; /* MMC1DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc1_width8_pins: mmc1-width8-pins {
+		mmc1ck-grp0 {
+			pins = "mmc1ck";
+			function = "alt1"; /* MMC1CK */
+			bias-disable;
+		};
+
+		mmc1cmd-grp0 {
+			pins = "mmc1cmd";
+			function = "alt1"; /* MMC1CMD */
+			bias-pull-up;
+		};
+
+		mmc1dat-grp0 {
+			pins = "mmc1dat0", "mmc1dat1", "mmc1dat2", "mmc1dat3",
+			       "mmc1dat4", "mmc1dat5", "mmc1dat6", "mmc1dat7";
+			function = "alt1"; /* MMC1DATx */
+			bias-pull-up;
+		};
+	};
+};

-- 
2.48.1


