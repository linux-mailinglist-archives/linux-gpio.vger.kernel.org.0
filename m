Return-Path: <linux-gpio+bounces-12741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8259C1B96
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 11:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 512B51C266E8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094841F81A1;
	Fri,  8 Nov 2024 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NYMrsbIr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278D1F8188
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063074; cv=none; b=rhaj+u+E7NCWH7Moju0Yegb70DV4xgd8QutagqypnHyEj0oNcj54diKALHaRqILTYs7Ipzk1OFkc/dKh3P6OBOnfuQoJIWYJYF/JiX8AUGbprXhNevLDIiEa3kkkXkd8U3Wuckx7Iu3G/TYhZI5OzooNciINs056syqIAKiZU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063074; c=relaxed/simple;
	bh=+elLfA4VfsJY2MnJEDUj2dewBBjmVeBPdM0RWsMhp1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6UU+uSNtCiQgPlZZ5uUecq2iGl4N7ERpHneEHDTjtLiciVGPZvcbAhp3prUdc1Df8ilJo18SR3wxMl2i9Osf3+askFSSMrs6LodWFRE3FWZ36Nratrqaf9UcFytU4KjDbLFKz/fuk3Ebl5DHJBqlxqnA0H+EXArwfWzesYwIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NYMrsbIr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso298759966b.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063071; x=1731667871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snMV9I7XJiOsIBTioF2I79J9msSQHgGVZ9Uaq5lTtJM=;
        b=NYMrsbIrssCJgP6VSEXNbXwxv6JU9D296rshM8eNBFHa2rtLZZQZHlwUh49BF92q0i
         R+PoN44YD0M757RFJg8yDzgriEWBP0+jd+kxJ+/OBRh/t7L4Lhesy2VHO9s3Mi56JoaY
         S5WJtOSEIVVK37eHkdYitqX2/xIWB3OWsczXcR2cmfUzR+0qrPCMyDcXm5PGd/v5MqK4
         3T3rVskEfyUnL0R183781BddMsma4oE+wCXrKV78X44C6s4/JjDjW4DjReR8X65nAt7j
         lQaZtpFt6Dc04NYyWV4haOlzrKk6XJjjLo8ocpReZ9/5KmX4+PXRN5D5hAXAcQ+0E5E4
         79Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063071; x=1731667871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snMV9I7XJiOsIBTioF2I79J9msSQHgGVZ9Uaq5lTtJM=;
        b=oo2mVQqlqIbIH5kv1pGpnDD9UT7/rmvbOaUSnKYktFlcvgfXOnrksotd+NyA/B2B7h
         nSzkIHqlbx6uGkiVwl/wV73WuxeYw3DoK15SuKQiKiImqqArGEVD7MNHb8k5qLtj2Acu
         aIKPgfnw3nlBt/3d/Bt7Vn4UrYQbqTu2u57bAR80IceVXB8AEe2KHh/4pytYpllNTPbd
         +vTj7qgThuB5oZ4JGmdEJWT7POThZmkSTfHGvNkXB2GuCcCRkxNBSRI96KPU3PXhRkI6
         iKWyyKqnpfxigdGok6TP+BPlSPTxZP3O0raS+wJjfhJE6jWycm5A3AnT5aAP3j2UAcSG
         lYLw==
X-Forwarded-Encrypted: i=1; AJvYcCWYeCvNAnNoxyjbJuDf5Bywad1cXOfEULtIHYTmqicxkPlIXm0dp+IkloR84XbEH+WiXNu2Rv0Q5Euw@vger.kernel.org
X-Gm-Message-State: AOJu0YwmsRKKtpSr9ysDkdcKHsCW+n7yUGPKwP6+u3BLYPHcv/+5qDy9
	30Hx1MGJLdw8cMnAYlQfUl92CvI7Eek8XRqCvTNcboW/PbopxWJayF6xwI6NZl0=
X-Google-Smtp-Source: AGHT+IEXk2PGrE7aJCjvmKPF0q+eI385OHavfjmtOJvm3sOKQT90Qxfcy+mFFxyUp6Mj3N/Qcl6BUA==
X-Received: by 2002:a17:906:6a1c:b0:a99:6791:5449 with SMTP id a640c23a62f3a-a9ef0019165mr208984566b.52.1731063071286;
        Fri, 08 Nov 2024 02:51:11 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:10 -0800 (PST)
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
Subject: [PATCH v2 23/25] arm64: dts: renesas: Add da7212 audio codec node
Date: Fri,  8 Nov 2024 12:49:56 +0200
Message-Id: <20241108104958.2931943-24-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the da7212 audio codec node. Along with it regulators nodes were
reworked to be able to re-use them on da7212.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 17 ++++++++++----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 23 +++++++++++++++++++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6e58d47d85b0..5ee9dac4aebb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
-#else
-	reg_1p8v: regulator1 {
+
+	reg_1p8v: regulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-#endif
 
-	vcc_sdhi2: regulator2 {
+	reg_3p3v: regulator3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi2: regulator4 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI2 Vcc";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..4aa99814b808 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -68,6 +68,29 @@ &i2c0 {
 	status = "okay";
 
 	clock-frequency = <1000000>;
+
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+	};
 };
 
 &pinctrl {
-- 
2.39.2


