Return-Path: <linux-gpio+bounces-12963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8C9C7120
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6FCC28299B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BED21501C;
	Wed, 13 Nov 2024 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AFu82u2z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58F2213EE9
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504996; cv=none; b=MIrqaAhp7yqQ2P0vFtWe4i4cFcF0bOB5IvizxJ2UWQGyQUYIXo2GTqkRs+5+vg49u18/lbFdktT8SZSnO6q9pnMDQfTwXz2G0NQ/CHjrGo72WM3srpsFCJXZtJDFgcYCcajZtGLI64XpvEC7PpnMMZg5pSN0SxJvN3scEehwgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504996; c=relaxed/simple;
	bh=qS1k96o/qqAKiXui+DlZhWozFLuymhxz+ymouCeH+bs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qr5Vy/WeY9dFHfT7IXibrwNk71PZpk5c1xKaDbUrtgLSaES9aucjDXpzIu4vpztghXwJazunM5A9SrxCxTLHXLuN/PIlymvn940IBZX0o7I1MVH5iIeAIiwHrACA+DAaEdPDNrzvRfQKEhiUerTqtgia4ENfUXSX00drqtNvyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AFu82u2z; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53da07b78dfso822827e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504993; x=1732109793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kauSfylog9xDIG91y5HR7OSUZUu7kJG/k4FJDPappNI=;
        b=AFu82u2ziSNWtO7UobiXOrpNFCi7KWl8CIWiNvSik3JWe/NY7MPGYC/Pu6AHYdOFP4
         i91GoWWfyzr0Ft6C7wabETKdmzmeurCdaT2B9Z9btRUV5/3MZsrWQ2B41Zyv/CsP8jWU
         m/wTz6NGZsnAKm7MWiFNSe+In8F+scdBBNut6hkGNMS8q6Din/opyWPHvhjuFqR78lXu
         EA2vOCrvVjEmEnBHJYTKzhiH9qSAwvUY9hFF2GXdnGWDcNql5ImY33FULWFGFeTjsl3h
         jVlXeyhYuT7Tt+z34dO1rjbJzROhlca+mDPSsHVyjZo0gd/4YEx5r7piIgX6A57falwn
         uC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504993; x=1732109793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kauSfylog9xDIG91y5HR7OSUZUu7kJG/k4FJDPappNI=;
        b=W1PZISsEktQlLIWelCTlTDENT+TCY9wUHV58Tt88PmVccSVGqJtMLhfrX+f5LwZHys
         keA6+6JuKLweah86o+1jAnzrV0Yysscl94ZAM0uoIcvhIZOKyi2e6j30Ca94WZPeIyOZ
         vGhD+rvqIn/QXoEOyCJd74DCDnks3RhgAfqUR1dZv05HgaobYH+nlRfs8M+2KWB0BIej
         4Zdd9md12uURNGk0/fGV4bj70t8Bw/DcZDH5WKvbMr13dI1wDOg7PmZIUeR5TPmvtxs4
         +wKmbCpkJfnVBELwKh13ewLiO6E+KyJZ2vssCseew0mP3auRXy28SPLpvOt7DLaCWSdM
         Wocg==
X-Forwarded-Encrypted: i=1; AJvYcCXp4c1WTigsPCHfIOFqGgx7dqqnhXyuxb9rLXi3SepWCF3reBkxKc6oW+Kid702C4WS63PZDgF2ll60@vger.kernel.org
X-Gm-Message-State: AOJu0YxnC7wU/SbvUdKnGgWSLfckGZ/preXgjRT8Augo5OIBnkG4MDXt
	4FP0pwbDZCYYf4FrsDvKHYpPQa+fNYU3iKlFirjh3Tb6S7kcIWFx57EWXolVUP4=
X-Google-Smtp-Source: AGHT+IHJFbhg5PDWk9kuXqkEhJpbt1r/1k+r+nYLiE9QexH9tx40lRd/5s6ZY6NNyt3YcPzLZXZCgw==
X-Received: by 2002:a05:6512:3b0c:b0:539:f2f6:c6fe with SMTP id 2adb3069b0e04-53d9fe7f4c9mr1520640e87.16.1731504992897;
        Wed, 13 Nov 2024 05:36:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:32 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Date: Wed, 13 Nov 2024 15:35:39 +0200
Message-Id: <20241113133540.2005850-25-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SSI3.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4aa99814b808..6dd439e68bd4 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&audio_clk2 {
+	clock-frequency = <12288000>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -94,6 +99,11 @@ da7212: codec@1a {
 };
 
 &pinctrl {
+	audio_clock_pins: audio-clock {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
 	key-1-gpio-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
@@ -151,6 +161,13 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	ssi3_pins: ssi3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
+	};
 };
 
 &scif0 {
@@ -171,3 +188,12 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
-- 
2.39.2


