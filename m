Return-Path: <linux-gpio+bounces-18154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B3EA77CCC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 15:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9D21891906
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 13:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAECB2046AC;
	Tue,  1 Apr 2025 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efU3FOzH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C982046A3;
	Tue,  1 Apr 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515459; cv=none; b=DqzmK9vOwcWUjf6csP5h9PGtE7mWzMhWkSOBIVm+zkA0YHTGdsodNWxn6azD5D46XwguFh9J9k3ccJ1nq1GeDQe/i/LPeuIrEAbebCG8XE3v9rPlIhWx/Jd6jHresPLyDBF9Miw4Om9nCymp+zaWkDzC0sSPf3jQ2dAvthtanr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515459; c=relaxed/simple;
	bh=+yOUIP/wxkewBozGyqLtl9nzWwm0+nzhe6BD6Ug/5W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GG20Pe2WaHX9CbO6YLebcwAyUAPqGzScxDnltvouHdJj5LlXk3k89xVAxnSEqmtYPQL45HHpuC+3TZ7DPr/DpYeT229vQnvF+Xa8miTW2wytwY2Bq7P/TvKFe43bU5au030Po4nq+d8xvkPIwN7kCTO1pJ4t6NQkvkk158QfCB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efU3FOzH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913b539aabso3262655f8f.2;
        Tue, 01 Apr 2025 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743515454; x=1744120254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9UBfXvbzTVrfxCxZp59nLH9B+e1MagmgO2AVB+E5S0=;
        b=efU3FOzHUJkcDVHCr5j2T6BpCs0WAuWA7QyOOthq6pBZqh8xiJkUEyx3ujNMDeMr3o
         HOY9zIseazLB+j2tPASUzgL5wp7dkgICIIX/lcdWqMeJNLgAfOeMA7ok6qM8oUv/tiHW
         08/aJWnNioV3MoutSW9N3gb0mnLqRR5XmIHNKMgPj84SEi2IWiQYoPiIIOR46798UshK
         /4cUOrHiJ298SHf6HXG/5gd0pDGaQpMzwuLyWzZzlUIj01JYszwa67JqdIHDLm0jAscC
         aKdDyt+8K5Fu9BtYjgswyYmsqtqcEYIG4Jz7y6zoSwZA2UrTyt6ZMw3xpf/IPJTZmw1w
         HE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515454; x=1744120254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9UBfXvbzTVrfxCxZp59nLH9B+e1MagmgO2AVB+E5S0=;
        b=uFYnSpKSPV6GRgX0FD+BYDceysPgOoKfVrnuqGwt0Xj69KmFcTEvNpLkiK3JjeAuQk
         ix6BHfVPhcIOeDt/5YpwsYNKxO3MLwyQtEnroNVdgDl2cmJmPSJ9e8R6YFb/Rp+vxUL6
         /OXGOSodIyTi+1a1wBqiGdnwT+lejFupaG6oPER+v9VRFxQoFtuPGPNDrXJ9aUc76X0o
         HkeLSILKAaeC51OzAQ+ItFnJXoLle6U/HMV3lREtWnMoFlwQdvcT1t6D+rRhyRlXH2QO
         9woVu4ONNDwuH9eeZtpftHlnSBZLoddjrkcOlrd/d/Rilz0R+YDl2KOZo0zDUNDEG4kr
         lrRg==
X-Forwarded-Encrypted: i=1; AJvYcCVw5oEo04Ij543jlzwzLczV/FWh0KJLTRVC/34lDwru3lLoLQAwS+Jdc7KeAyz29SlNKpomRTLL@vger.kernel.org, AJvYcCX3iBURC3OEr1xMYFZXJHVbCP40Rmw6Y6zvEAXbYFvPMQ9z2H/AnFbTI2RXKcECtCFnXqJF7zFD6Idm@vger.kernel.org, AJvYcCXkNJ2oMAUzhMAaOrXEQide34LT/aSpeLqv6fjy8RXBxAltjviQLX4nhI8i1MSiFFrxs5t4FX9jVyGne1+G@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhf/pXy1kMpTYVclsREQdNwq9MgBYgifFNgl536b6EU7hx7VN
	PE7l+ATnpAJf34Zd2cNH74RQ1ZCWLATV8yVbBcUGHFVGgjgYQ4jM
X-Gm-Gg: ASbGncuxoQF33Tk1i6AYHuF/jg/QMqBAWVXYXWi6jEaD2MA8yYKndhKE9lFjun2JGV3
	nTjkEIATf54K4wVMhsLVp4LzdiucR6sCwcd5lC4JoVDFZlTxkDIyrwyUM07+w3+VTejWGtGtusL
	KSFEs979euKDuNMXb6AFjpP5bvM/R3Me1RAKXEYbRbMPSv5bOJzja+4K+pm3wQ+tmWETCSmD4+1
	c5HITPUnZ3g0rh8sMxhuqZie/KyF3pbq/aXc27v/qzAQJogNLaVIvqusop3WQqR6m7poRkX2k+O
	yrz5LUV1nkUhAkGLuUDouEKSkNjzanf0Mtf9ylioAeDHvJ+Dy1goKZB/zwQ6EVOtWS3vLrdGwNH
	0Nw2e+niaejw0Mg==
X-Google-Smtp-Source: AGHT+IEvptfLcamhWwedLuGlHspFwqiEnrR1KRa0sGTY6aYu1yAGzOSsMK+B81u/IJ926N+Vf0G7Tw==
X-Received: by 2002:a05:6000:2183:b0:39c:1257:c7a3 with SMTP id ffacd0b85a97d-39c1257c7damr8161644f8f.59.1743515454380;
        Tue, 01 Apr 2025 06:50:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b66a75fsm14015125f8f.41.2025.04.01.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:50:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines
Date: Tue,  1 Apr 2025 15:50:21 +0200
Message-ID: <20250401135026.18018-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current PHY2 LED define are wrong and actually set BITs outside the
related mask. Fix it and set the correct value. While at it, also use
FIELD_PREP_CONST macro to make it simple to understand what values are
actually applied for the mask.

Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
the register define mapping for 5 PHY port, starting from 0. The mapping
was wrongly defined starting from PHY1. Reorder the function group to
start from PHY0. PHY4 is actually never supported as we don't have a
GPIO pin to assign.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add Reviewed-by tag
- Use more symbolic macro

 drivers/pinctrl/mediatek/pinctrl-airoha.c | 159 ++++++++++------------
 1 file changed, 70 insertions(+), 89 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 547a798b71c8..5d84a778683d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
@@ -112,39 +113,19 @@
 #define REG_LAN_LED1_MAPPING			0x0280
 
 #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
-#define LAN4_PHY4_LED_MAP			BIT(18)
-#define LAN4_PHY2_LED_MAP			BIT(17)
-#define LAN4_PHY1_LED_MAP			BIT(16)
-#define LAN4_PHY0_LED_MAP			0
-#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
+#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
 
 #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
-#define LAN3_PHY4_LED_MAP			BIT(14)
-#define LAN3_PHY2_LED_MAP			BIT(13)
-#define LAN3_PHY1_LED_MAP			BIT(12)
-#define LAN3_PHY0_LED_MAP			0
-#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
+#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
 
 #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
-#define LAN2_PHY4_LED_MAP			BIT(12)
-#define LAN2_PHY2_LED_MAP			BIT(11)
-#define LAN2_PHY1_LED_MAP			BIT(10)
-#define LAN2_PHY0_LED_MAP			0
-#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
+#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
 
 #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
-#define LAN1_PHY4_LED_MAP			BIT(6)
-#define LAN1_PHY2_LED_MAP			BIT(5)
-#define LAN1_PHY1_LED_MAP			BIT(4)
-#define LAN1_PHY0_LED_MAP			0
-#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
+#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
 
 #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
-#define LAN0_PHY4_LED_MAP			BIT(3)
-#define LAN0_PHY2_LED_MAP			BIT(2)
-#define LAN0_PHY1_LED_MAP			BIT(1)
-#define LAN0_PHY0_LED_MAP			0
-#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
+#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
@@ -1476,8 +1457,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1491,8 +1472,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1506,8 +1487,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1521,8 +1502,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	},
@@ -1540,8 +1521,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1555,8 +1536,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1570,8 +1551,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1585,8 +1566,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	},
@@ -1604,8 +1585,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1619,8 +1600,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1634,8 +1615,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1649,8 +1630,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	},
@@ -1668,8 +1649,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1683,8 +1664,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1698,8 +1679,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1713,8 +1694,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	},
@@ -1732,8 +1713,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1747,8 +1728,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1762,8 +1743,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1777,8 +1758,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	},
@@ -1796,8 +1777,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1811,8 +1792,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1826,8 +1807,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1841,8 +1822,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	},
@@ -1860,8 +1841,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1875,8 +1856,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1890,8 +1871,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1905,8 +1886,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	},
@@ -1924,8 +1905,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1939,8 +1920,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1954,8 +1935,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1969,8 +1950,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	},
-- 
2.48.1


