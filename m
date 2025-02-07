Return-Path: <linux-gpio+bounces-15576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E9A2CD77
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9101B3ACEC2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5F11B4F02;
	Fri,  7 Feb 2025 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIajXiA8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F81B040E;
	Fri,  7 Feb 2025 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958582; cv=none; b=h+bYUxZOxH8judLChy8FpP2GlZdXa4CgMcirGcFVSVsfliM90p6ra7H5wmlidpQe9v1rs8N8bYwBDN6lz4zIcZ0/lREByaP6KiX4vA9y55WR3XesWKo8WE80b0g2db72oBiI/A+Co5c4gJnuEeFDnyBZJ5qLaP3LWMDQ2r2pnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958582; c=relaxed/simple;
	bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSe7uPH2xTfLxG7WesxUItagMp+3zDUVYxiUy+5PBJmaiN0g9+I4b3LCUAkOfdanCSZzZdNiX2mlzF+P70SCsRGlweuqPmuzI9gT0yrUYuBC9mIi93h8Yc1Ewch0ELGEQsg8s1V3+YcMFC2FBoAclOOzocXkez83kuy7cVU7BDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIajXiA8; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dcd8d6f130so4892191a12.1;
        Fri, 07 Feb 2025 12:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958579; x=1739563379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=lIajXiA855pRqbKqsSzaLCvI8E+dzeE0PCEyWEB55J9XYL+FjUA7r3NfHFaBLMBE1I
         KINigj4McX8LbV8551OD90JPjiST1lOth1fY8K8gnXuYP+LIjgBvGVSl/yBNVvAip+gz
         kH0rx3U+BhVkbyiSKlKRjjXeyRn+YZbKXM5HMfzzIPYAIUUOhq825Uj5Ymr9c3rqMRqe
         NpiZoZvQTGUlDJ8UN9J60dj+h4ItWR8x+nLrklNR324RgQkXgqRMI3HeWWxZS4xUju4M
         7vBK2Cqfpem9tkgygG2pDfj+BT9XEzYun8NhsnIZdzQ8azGhMPw3zpR2y9yFX5aw1eLV
         Y70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958579; x=1739563379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=kEiqrfZqw2HQdqSVxq5JeFRE/8PPkToAroMh/v897D58+nc+YvYyO8K4GQOOUvJ9at
         L9meCoot18WozlUgPepjFxwqtSd++oDBsaCakmQfB6FCvVo7MlWedKyIXfKxqIMRd/w3
         VbsOF2uyJyaxFZqTcIW6r6kdkuM5XrWAu60rpQPuQ0NM4pz9y3CLxzP3BAbkC6UXFQW+
         9GLxaHjpO9GlxtLGRTzga/YrSdYPxS8mSjrdfIgpU2alE3O6gIbufYK78NrFGunMhbJg
         a3WvsAdZ/tVE4nBj+4XMlBqkVS5Tle/DZsW/03XQg+dNU65Wi09RlVahbkGOvyz/BRT4
         +VAg==
X-Forwarded-Encrypted: i=1; AJvYcCVmm0B/OCLOK3NbtzPlkc6t9z0wfZat6MzGc1fD0lnvpcFPID3WhUNMcdQ/pTa3pS0n5HxktxDdAfE5@vger.kernel.org, AJvYcCXRMDKeM8v0Qqk3coa28E6961r/DvjnECKUjxAelNxn7HP6qoNBBA7PdWc6IQGWIXhJO8wOjHRBSDPkgIco@vger.kernel.org
X-Gm-Message-State: AOJu0YyN1S3398RoTDFPQmGIR/tbcaQrMNOB7tbJlTOE9sFHKOt7GIUo
	Cm9DeTfc8MsJg+2gB/8wqLPxX2DEUnKJMbTLa59vIY4rhm6lM7ZEh7ugMA==
X-Gm-Gg: ASbGncti18OLz4n7WrusxiqDee1vfAyzetxqMGfRxIj4b/dAnC802PrRELFlHyVIekN
	hr2reqyX10f7VYCyldbjlj9LZCxuO6zBFDTYHOgTBuOiZpW5CzoOkwPRbVCFWfddnjn55xnQgSY
	tcyfdnjl6/hGRquYHvZn5EWr8xTori7YpRTMzrYDUxVG9bBkFAmhjcMEucq7g+IFvxdr3RQH9y5
	w1U7CiPDqSejUlQX8eAn01G+lF+0eUHW6uZF7zk/4aYrM/RzKKjmhKaNc4wQ0VMn3/UOLfnOkxM
	TfJ4DZg6CNfISYfa90/GCS29ceB+e5VZ+D7U7+MSBvYaD+WqK9RfK6yV
X-Google-Smtp-Source: AGHT+IE4QF7IVhoaNhrO3jS9kTfFrHnXGutu8tKTKQs8oJYJmgx7PdCZKkvctu+cUBQJ84rNlQSPwQ==
X-Received: by 2002:a05:6402:5202:b0:5dc:74fd:abf0 with SMTP id 4fb4d7f45d1cf-5de45070621mr6028965a12.15.1738958578486;
        Fri, 07 Feb 2025 12:02:58 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:58 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:46 +0100
Subject: [PATCH 7/7] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-7-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=7006;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
 b=3SwA1y2LTND27CT78fpcsbZg+FtSHEAc3BBHVRg7suIc10IJeHBu/J6a3bYG73aCy+5q8lI0j
 iqru4LSW8KUC3c4ZmUd1dEGY39q+Apw1eYtlE1kglnfu3ADK+nTj1OQ
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


