Return-Path: <linux-gpio+bounces-1085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 839EE808199
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38EB8282BC3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9203B210FA;
	Thu,  7 Dec 2023 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g/FdR8q3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0428D1700
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:28 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54cde11d0f4so806313a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932907; x=1702537707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkghlNv0V/SuTZPxwTXU6oUm+Z1UHMMmkJLyVfH/CTs=;
        b=g/FdR8q3/4gaKLPC8MwlRS/lbel73uuZR48NvnIibK2EOkCYK2zG1KKQqgbedZ+QYg
         QZl7U+t6GYvkqgyy0UHteWcQXtZNAiYkxgKUAggwFp5R2HbUj84Js79Wk5z8NdwR9Qws
         QO1o5UuUGDa7FOyCAQ0iElD31ChRCVEMmmmR5pZ3cCPZvWmg5SkJFYEgc2MH61vOWFtg
         jj8bernaxRzi9DBWC1jmRsdflj8tBILAXKyV1BgNuubyGy0UnDCvcEyK/w4hXE8kqe+B
         vT/VoVHjbRXu88yhGKI4IvLCO4taRoPGOrhuWipA7rf6pE3qJV/o0lrhoN+D7UEYvNPv
         8Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932907; x=1702537707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkghlNv0V/SuTZPxwTXU6oUm+Z1UHMMmkJLyVfH/CTs=;
        b=T6M4KTJkc8nAZGnPfSiCYWseWQdRQngKbcEs+/AhMsWW0k5WUU7ZA5hnsEvlh6bz59
         emAJQHJxMY+m53FJdhJ4Klo+45wNRx3L/IcqaqDDCPppka3RosqLap/cUQO0f2oGfbMW
         MdVomHca/iD4NbOMn0/wbW0OvVHyvbVLCRHmSSZfiiMdznBbpkUjpcGf9BHKVHMaMF9T
         KC1Hnkjs1liuuflk3yI4dmB603SGzi/BakJIjzmMM7sT4/RTrG5zO8oFI1u8BxCcGE0Y
         xBaVwr4tpw1MKUbiuFHa+hhgBWFFvjkxY362jZxamtdVkEmHCWdVr2JxA6dWty5sePB7
         NvLA==
X-Gm-Message-State: AOJu0Yx4CZPOOP0rpAXENZhx/Yvs15k96noYGG8z9voD32JQB+E04704
	RzpM6jl8jaCyXscv9GJtPd8D4Q==
X-Google-Smtp-Source: AGHT+IF47v7X3q8qD6gB4ZCRiRsvI7r4bTbz5pfTw8z2mVo3VWRWVZ6UtqKRrNoxLAAITVBzD5hyZg==
X-Received: by 2002:a50:f692:0:b0:54c:4837:a65d with SMTP id d18-20020a50f692000000b0054c4837a65dmr1419834edn.74.1701932907528;
        Wed, 06 Dec 2023 23:08:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 10/11] arm64: renesas: rzg3s-smarc-som: Use switches' names to select on-board functionalities
Date: Thu,  7 Dec 2023 09:06:59 +0200
Message-Id: <20231207070700.4156557-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The intention of the SW_SD0_DEV_SEL and SW_SD2_EN macros was to reflect the
state of SW_CONFIG individual switches available on the RZ/G3S Smarc Module
and at the same time to have a descriptive name for the switch itself.
Each individual switch is associated with a signal name, which might be
active-low or not on the board. Using signal names instead of SW_CONFIG
switch names may be confusing for a user who just playes with switches to
select individual functionalities, but also for the advanced user that
looks over schematics. To avoid even further confusions, use the switches'
names here and instantitate them with an ON/OFF state. This should be
simpler, even though the name of the switch is not that intuitive. The
switch names documentation reflects the switch's purpose.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new and aims to replace patch "arm64: renesas: rzg3s-smarc-som:
  Invert the logic of the SW_SD2_EN macro" from v1


 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 01a4a9da7afc..f59094701a4a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -9,23 +9,31 @@
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 /*
- * Signals of SW_CONFIG switches:
- * @SW_SD0_DEV_SEL:
- *	0 - SD0 is connected to eMMC
- *	1 - SD0 is connected to uSD0 card
- * @SW_SD2_EN:
- *	0 - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
- *	1 - SD2 is connected to SoC
+ * On-board switches' states:
+ * @SW_OFF: switch's state is OFF
+ * @SW_ON:  switch's state is ON
  */
-#define SW_SD0_DEV_SEL	1
-#define SW_SD2_EN	1
+#define SW_OFF		0
+#define SW_ON		1
+
+/*
+ * SW_CONFIG[x] switches' states:
+ * @SW_CONFIG2:
+ *	SW_OFF - SD0 is connected to eMMC
+ *	SW_ON  - SD0 is connected to uSD0 card
+ * @SW_CONFIG3:
+ *	SW_OFF - SD2 is connected to SoC
+ *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
+ */
+#define SW_CONFIG2	SW_ON
+#define SW_CONFIG3	SW_OFF
 
 / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
 		mmc0 = &sdhi0;
-#if SW_SD2_EN
+#if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
 #endif
 	};
@@ -50,7 +58,7 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_SD0_DEV_SEL
+#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -85,7 +93,7 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
-#if SW_SD0_DEV_SEL
+#if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
@@ -116,7 +124,7 @@ &sdhi0 {
 };
 #endif
 
-#if SW_SD2_EN
+#if SW_CONFIG3 == SW_OFF
 &sdhi2 {
 	pinctrl-0 = <&sdhi2_pins>;
 	pinctrl-names = "default";
-- 
2.39.2


