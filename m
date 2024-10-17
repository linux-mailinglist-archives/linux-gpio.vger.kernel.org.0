Return-Path: <linux-gpio+bounces-11523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED69A2123
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03E2028883A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BF01DD0C0;
	Thu, 17 Oct 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZY3865oF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47461D90AD;
	Thu, 17 Oct 2024 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165197; cv=none; b=owOTvQhUBPpiC1LzBsci5L+ouOrTScO0uJ5X7SvEa95bD+zgHaNcIPljWgciv3+7m97kPkZ8D5gnMPNAPrcBu6pMb+nva8KzBQiYENfCeHKMlc7N+En0XdkCZtOU8oKr4V6b+bRAF/dtFo7XBnpovKKcd9A+Tz1p1XwezC0ePRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165197; c=relaxed/simple;
	bh=qlR6ObnhH4NlsW8lM16McDwfiatXRX/s0Itc5XwWhl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqxBTXFnhYILWUakE4O1JO4i8CP0tn30/bDpr6zWuhL05UwNielJpa1P7kqTR/5SgXFy0Jz7kJmjIAewUOFY3biTQH3+Kv2rqFlCX9Zbp3IEddqtg2Te0evJCnEz7UK0m0361wp/67ynA1hsDhNVA8tgPFQkeXTYQUhwYxNQB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZY3865oF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so2497965e9.1;
        Thu, 17 Oct 2024 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165190; x=1729769990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQzzqjy/V1j18xV+ShAVaELtJkfUG5uygFgkkTcvbLI=;
        b=ZY3865oFtN+hkdAJSWMVV2cHE2QG1rzBXHh0T7yg3omF/EeIZnDooZUhhy0AYZurdw
         Q9HhTWJimYnbX2ftIT6Bb3pGCzjv3fshXrK5PHz62eg8N+vyL5ZCo3wr2jFPGhmkpkhh
         Cm1cH2ZT4GTAt8OKrZe7qnVHT634yzQZHdW8jBV/rnGrnOVEPIVLjhNeXtKp+vpk8Pba
         igt42EMfcdimRZYmc4ckEbbiiCwK/sE0R33JWQLHWlQmPsR7vPAyigAqNYyhAO8uf7v8
         AExTvIoREERbmzwJdhFJt3BTRqMJpwJPqkVYmNRlVc9eLpBvfdFho2P6opvIITa96DvZ
         bRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165190; x=1729769990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQzzqjy/V1j18xV+ShAVaELtJkfUG5uygFgkkTcvbLI=;
        b=rfm7B71aZQQ4bbGYpP+r4qahWULMxMHbIsRaEDxDojR5fFDvyDnHFZGu/zDNJtlqcg
         acC1VRFZbcXZwJjeczodhDmkTp9s1EKkPdEr54DEJ1TTNT9+WOuN71Ai7IWfEua2Ex9d
         W6NUKPmprm8IOci4JPDhOTgu8B6Jl0gWuBmDdVkz+idlrBWqHqz8K2SzHpPD/kHjrI1m
         DwsBXXJdzKHiwocAxQB52bXrnRTMylVH4czVfNYI3a1lpYCNNEJYYkYdajI0N7xv4VR6
         pFNN7DS7B1mWt1+d0+u9cPlu/qCWinZh0Qx9R8yd6avUmIwHb9AyXviNh1NXvqAK4aFO
         OX+w==
X-Forwarded-Encrypted: i=1; AJvYcCUrwRDiT8VEy7t47y5/z9GAZpN3+bgwqMCl7K4I/D1Xiv41MoM9pTKD3bj/EvLpSHhHQkHCOZT8O9xkshdPVFYxvkc=@vger.kernel.org, AJvYcCWec29A0aAV7xisN0lo6HgvEYYSK/RkUIR30OqUVkn9DZi8sW2lW1R6KYQtNB11ZnTgsZkVvdaDEVbaKg==@vger.kernel.org, AJvYcCWsHPGtT+oGjo8swqRujRIYjjXU0H8V27l4jXhMWbFH0AHfNLStHSmwcHEUvrGfFtjX2hsb880Knd/T@vger.kernel.org
X-Gm-Message-State: AOJu0YydQktaRiko/uc8JEgxkLNmg2o0zaQwYnZxYjx1CipizqMY4pwJ
	MCjK37/NpH5FY1q0NR2xymbKMsRRKtSzdWry0jQT0xMjhsg6ZjIb
X-Google-Smtp-Source: AGHT+IE/vOBNUxNZaU3B0mXlsh+R/CdHDhu9rfX7AjUSjSjwcjVHQcgOd8IPe838k4oBDPfr7buUBA==
X-Received: by 2002:a05:600c:3b99:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-4314a3abe93mr64609015e9.30.1729165189917;
        Thu, 17 Oct 2024 04:39:49 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/7] arm64: dts: renesas: rzg3s-smarc: Drop hogging of GPIO pins
Date: Thu, 17 Oct 2024 12:39:36 +0100
Message-ID: <20241017113942.139712-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


