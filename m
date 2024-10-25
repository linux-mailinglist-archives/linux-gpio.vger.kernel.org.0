Return-Path: <linux-gpio+bounces-12081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC79B0199
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D9AA1C225CB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA071FCC65;
	Fri, 25 Oct 2024 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0aTSEgh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890051E47DB;
	Fri, 25 Oct 2024 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856970; cv=none; b=bTuRm6Hrda58y/XewuNRg0pdKqvCxvfpgXvqc7Tov9NrpgHiKxJCNNoBZvKbriPy7XG92+TTyMxL0+P4L26k/UukPkf5RwzntVty7i3qSNsfXdTHX1vf5unGUJaY0RaBsLYv397zXQ+rcsHzgKwuXoiV+im3dawK/+OU2QzNMa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856970; c=relaxed/simple;
	bh=nHyQRDtRRtPvE4YCxirrCGGKgYQCnSWllFmKKTrWnuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CL77uF+XVHMxfVkm+nxU21BMdZBlWfTRCNq/4kJ+LAjLqQfFb9Q2Ow0m/epEL2siUyPCCj0wV51dKA2Np1yGgwcvNS0Ip22mwmdsvkQLRLTg1y8gDuDCqa+WIwphpHON94lEQe/63vPztGImv90LvvXrX6k3nvrmgAeEnN1gfFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0aTSEgh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so19951055e9.3;
        Fri, 25 Oct 2024 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856967; x=1730461767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vztMECmolaOLkAvwQUeZqW1KpwJlvFjGfFWGaanGDs=;
        b=H0aTSEghboggTe8/Xe09EBOHveykEAZZYNXQuR0zrNnabWpEUReqFcK3vVNILalyl8
         iJFzT6cYqsAC1QNameLhmdLOFiFH5xWwtzp4DVoe6qLBwyz5kW3GqP3m/HRox+n8ojx9
         NlSkMWOgPd9OiQreGHEd5i52p87eiF01omd67K9gSO//UMgWQX+DImEQjztfW2aGeYMi
         aA5nNKQ+7ZAYPLrqiHhAKMhk9ZVFU0vsM4v2bq5xkR1LxRAExvyhXiRzApEAPHkeXa3F
         j62Nzof738W9ydS2sYJ7yUNGUiGnm2axi8t6EkGOM/PBGoyLuZwtG5AcDX2/Z9EkzHhv
         DBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856967; x=1730461767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vztMECmolaOLkAvwQUeZqW1KpwJlvFjGfFWGaanGDs=;
        b=NfnUwqPJszcJNwo1p4Y1+boxVN7h2ZPltJwSJNgN7zNxiAxaXHHLlasVq4kmN9Jb01
         T6B4hP8XNejxDbYY7CPmShlorl+yqAL36x8NIYkjPB66cfieOHQhDOV0Jk4e0cEXF367
         XMf6jAiQrm0wNfC4YYRc+16ecCPDVr1UwFyHXaYaBdd3vRpt3HiG3V75OoeXE2rqYJZQ
         iD2rGcF9qfMV9sB/nnSCDcIkMbQXUhQDbRTTi1XyqPC/GTOmyMSeLPsY77jtwwloSzXg
         Wf7wMJHVdrvAjesCCRdzFUwAumhh2mr4/gqhUL1R+QvKshuPJXKVhj6BM/JRTi+bBWjt
         vvIA==
X-Forwarded-Encrypted: i=1; AJvYcCUZQFvqR7AwrJmxiAQebuPY2UNjqNve5swn8Zx7o4jFylL5YjFrmQR0HuVb+4A6tl/8+lI2l89g9/oUgqII@vger.kernel.org, AJvYcCXbqTyHMIC47ra+STnqE8jChimYVmSDJ8i+u59r/oc1xf5DxFGqipQMj++FJ9/l+EuxdNVxFBbLT/VNiw==@vger.kernel.org, AJvYcCXtL9iuRzbTO0QVT1VHwV9Vdvy0oExkcvAIVbDqrJZMW1OLx8xMcNaKHur1j4ZPeVbHiw5PcodhHqy3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuy85RKKJMMkA+nr0qzWna/1ETfvvTjwW4bK+FaUUqtMZpsQ73
	EPNk3YzIm8gt5IGEcdT/Z5mwJkhtVqN6FwH9nIeI/1pi02zzx7QP
X-Google-Smtp-Source: AGHT+IGJJ+V0/6N0J6CA2A1LlSs8FNlvBxtBsVl/pwbEuelQcHS9H+vSmCG7EcyYauDoG8g/L2VwzQ==
X-Received: by 2002:a05:600c:502b:b0:431:4880:3120 with SMTP id 5b1f17b1804b1-4318c6f16ccmr40005825e9.11.1729856966564;
        Fri, 25 Oct 2024 04:49:26 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/6] arm64: dts: renesas: rzg3s-smarc: Drop hogging of GPIO pins
Date: Fri, 25 Oct 2024 12:49:09 +0100
Message-ID: <20241025114914.714597-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hogging of gpio pins used as interrupts is not required, as the rzg2l
pinctrl driver sets the direction as input when the pin is requested
as GPIO interrupt.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- No change
---
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 18 ----------------
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 21 -------------------
 2 files changed, 39 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..6e95933cd7ef 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -196,15 +196,6 @@ &sdhi2 {
 #endif
 
 &pinctrl {
-#if SW_CONFIG3 == SW_ON
-	eth0-phy-irq-hog {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(12, 0) GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "eth0-phy-irq";
-	};
-#endif
-
 	eth0_pins: eth0 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* ET0_TXC */
@@ -239,15 +230,6 @@ mux {
 		};
 	};
 
-#if SW_CONFIG3 == SW_ON
-	eth1-phy-irq-hog {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(12, 1) GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "eth1-phy-irq";
-	};
-#endif
-
 	eth1_pins: eth1 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(7, 0, 1)>;	/* ET1_TXC */
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..baeca5ff5d61 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -71,27 +71,6 @@ &i2c0 {
 };
 
 &pinctrl {
-	key-1-gpio-hog {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "key-1-gpio-irq";
-	};
-
-	key-2-gpio-hog {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "key-2-gpio-irq";
-	};
-
-	key-3-gpio-hog {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(0, 3) GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "key-3-gpio-irq";
-	};
-
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0


