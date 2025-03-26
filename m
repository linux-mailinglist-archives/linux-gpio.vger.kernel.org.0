Return-Path: <linux-gpio+bounces-18004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417CA716A8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 13:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF751688D3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 12:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B689A1E1DE0;
	Wed, 26 Mar 2025 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIbVQDwu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A952A1B2;
	Wed, 26 Mar 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742991870; cv=none; b=hp9WMnbyL4/0kWrTX3LHJHCHI0u0yz20eVp364tIAQ6Xb3BMeg6Vpk9WH02sZXyPPs1DD6GjVUtofkhL3lh+ShNQr7fXYNb6NZu5AeFRfzN12zidTapRE755R4qIdP+tdINGgMCKCabWVKnvl+muQYWiE8vymCVSAnS4oPY0XNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742991870; c=relaxed/simple;
	bh=bv5jTyZQyo6EiNRmYL/XToKM3kJYCbyVixfXDRf+GoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKgY/gthP3KhmmSyssQ8TkFbvB0d/K4fCCm5yKes0nxitArCZgjs8qQUGUCYpqiyuHhuY0is1fe1QhwXd+Q/e2jXM7oqWXRaMq2KICDxPFAVY2WeuYdtaaCZ8DjbKZYBmUmkh5GKhgh9PxiCsdXYoyPy+TqiCYA8wDu/wkDetOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIbVQDwu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912baafc58so5357407f8f.1;
        Wed, 26 Mar 2025 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742991867; x=1743596667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NRsL8co3xhL6jvZlaPLywxAXjXSLFhQ3FC+Y8P5Hm8=;
        b=LIbVQDwuTqXbSJnRN124DmAbj8cvbqjy0TSK015YKz+d9WVkSoKjNH6Y+gziOZz6Os
         mHZZn3mUo+a9ywpT+AOfcJ25BWkXB5h3UzD9FufRTwtXEbUCX3NnfgeMvRVdubcpbjBv
         2hHrm292cjHFlJLgpyq1wD7xmIZvK26345sf6f2b3HiYDSEQkvsJ99w05z9ldDcmejhs
         lMtLkE+SRB5FW9Qriw6lkEA9DgMZTso4dLPeLDYN/0/bmrgF/c1HvijRMldsgIDZEe+D
         R4DzsNC+GMcIakBWM2g2zzgfgRWo+oZS6N3IrWTE8QomTo8IcDAkuIeSdD5dIl2B+Ryo
         0vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742991867; x=1743596667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NRsL8co3xhL6jvZlaPLywxAXjXSLFhQ3FC+Y8P5Hm8=;
        b=uL5/DTPW0p1g1UKZ8B3pmNNhwb3RqXlTYtpMy7vQMrVdW+PmWkdZIf7K6zpGPNICc5
         r1Z2L9aa6jG/92+E6U99plDdKVDrB7l3/8/4lAh8MLdxjROnHtgkWU4DOvEablFNpp2J
         jWnzKN74enhZssPEhgiCDZ8/sUG8/JQJ3WbODyjg9IWpFFi3sJRQnpBLX4ql9lgjS+Nb
         mae+dedXCdVZ3empFhauJteIJNmwGCFuMzndA7X3RRjs929A5SKdSxjwByFF6vPJAt1l
         7U0njWEm9XiprWYEcu3cz+IUdBPUyJdWK0hw9FWo2NJJQVSC3lGNswe9QUr70v704ek+
         ldsw==
X-Forwarded-Encrypted: i=1; AJvYcCVzl+ZZ6e1l2a74M8qJigq5r1hjYwIYxmmHz9Ik92pCYe7q3b/LMJsD/XBXIxQxYb+pnDKcNGWbrE7riJuk@vger.kernel.org, AJvYcCWgugoeMIafXBoaLLiGQYN3bSRgTdWcLNIy009Tpvb+1o+OeF2HNP8/wp1Kngol/RvPPrtPYXZz@vger.kernel.org, AJvYcCXlpjs0wXu+Spq4aMdEh5/QA721FM5Hm7j+3alOFirDxDo0uQ+QSO0wjQeK8PTPDa6IPSJwg9Qtfo0U@vger.kernel.org
X-Gm-Message-State: AOJu0YxyM5hLgmmOAOKUDo4kZPtJjgzHsLvZqDr5ZnX63EyQxbZRdfn3
	WJt4/NEOquRQGXKMG88x978m/x9IF7XyizIuirCiar8jXoDxpuvz
X-Gm-Gg: ASbGncuC2hhifo3nuUU3ovptugCs8j/FvFY5Ebmw8c9E5kkyx7K7xInjucgFBAUyqAL
	Q+9r6EK+4nvXUMJw9qAzIZOp/dGNYxDfkxEnqB7W7964NlxcJERJuQUPvhEh9D+cITS0p4qRGFH
	AImy9WB/NFJAdd1iY2DnRxbntkASrH4MotCD2/VlwxrymhpM3vu+GTL/bYyKVwv6L6zvxfYFFsQ
	+L3zmP4yTGFyahXS5MLIJBEoRuOG2qb4Ye8btM8+HnLWKVP5TGpc6RwinHJhneBp6T6xuopoWUR
	jVf3DDWghYW8dKrSaPhOjkUUEi60OpumvzREp8srg5kEpMDaCwfmer5jRrpLED1DDNu7de1tXY5
	fV6X9S+wWT/bNWw==
X-Google-Smtp-Source: AGHT+IG2qRFk4w/M88fUVgpXm6jRkqbjOUl092hkbtAAH0pUblWOlmPF31Mu9h5mFYUDZagqQzRg2Q==
X-Received: by 2002:a05:6000:2cd:b0:391:412b:e22b with SMTP id ffacd0b85a97d-3997f903a95mr18121647f8f.18.1742991866390;
        Wed, 26 Mar 2025 05:24:26 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d82f15585sm407605e9.24.2025.03.26.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 05:24:25 -0700 (PDT)
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
Subject: [PATCH] pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines
Date: Wed, 26 Mar 2025 13:23:54 +0100
Message-ID: <20250326122359.27504-1-ansuelsmth@gmail.com>
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
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 179 +++++++++++-----------
 1 file changed, 90 insertions(+), 89 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 547a798b71c8..9099ad34aa29 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
@@ -112,39 +113,39 @@
 #define REG_LAN_LED1_MAPPING			0x0280
 
 #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
-#define LAN4_PHY4_LED_MAP			BIT(18)
-#define LAN4_PHY2_LED_MAP			BIT(17)
-#define LAN4_PHY1_LED_MAP			BIT(16)
-#define LAN4_PHY0_LED_MAP			0
-#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
+#define LAN4_PHY4_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x4)
+#define LAN4_PHY3_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x3)
+#define LAN4_PHY2_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x2)
+#define LAN4_PHY1_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x1)
+#define LAN4_PHY0_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x0)
 
 #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
-#define LAN3_PHY4_LED_MAP			BIT(14)
-#define LAN3_PHY2_LED_MAP			BIT(13)
-#define LAN3_PHY1_LED_MAP			BIT(12)
-#define LAN3_PHY0_LED_MAP			0
-#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
+#define LAN3_PHY4_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x4)
+#define LAN3_PHY3_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x3)
+#define LAN3_PHY2_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x2)
+#define LAN3_PHY1_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x1)
+#define LAN3_PHY0_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x0)
 
 #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
-#define LAN2_PHY4_LED_MAP			BIT(12)
-#define LAN2_PHY2_LED_MAP			BIT(11)
-#define LAN2_PHY1_LED_MAP			BIT(10)
-#define LAN2_PHY0_LED_MAP			0
-#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
+#define LAN2_PHY4_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x4)
+#define LAN2_PHY3_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x3)
+#define LAN2_PHY2_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x2)
+#define LAN2_PHY1_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x1)
+#define LAN2_PHY0_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x0)
 
 #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
-#define LAN1_PHY4_LED_MAP			BIT(6)
-#define LAN1_PHY2_LED_MAP			BIT(5)
-#define LAN1_PHY1_LED_MAP			BIT(4)
-#define LAN1_PHY0_LED_MAP			0
-#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
+#define LAN1_PHY4_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x4)
+#define LAN1_PHY3_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x3)
+#define LAN1_PHY2_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x2)
+#define LAN1_PHY1_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x1)
+#define LAN1_PHY0_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x0)
 
 #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
-#define LAN0_PHY4_LED_MAP			BIT(3)
-#define LAN0_PHY2_LED_MAP			BIT(2)
-#define LAN0_PHY1_LED_MAP			BIT(1)
-#define LAN0_PHY0_LED_MAP			0
-#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
+#define LAN0_PHY4_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x4)
+#define LAN0_PHY3_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x3)
+#define LAN0_PHY2_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x2)
+#define LAN0_PHY1_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x1)
+#define LAN0_PHY0_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x0)
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
@@ -1476,8 +1477,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1491,8 +1492,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1506,8 +1507,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1521,8 +1522,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1540,8 +1541,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1555,8 +1556,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1570,8 +1571,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1585,8 +1586,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1604,8 +1605,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1619,8 +1620,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1634,8 +1635,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1649,8 +1650,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1668,8 +1669,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1683,8 +1684,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1698,8 +1699,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1713,8 +1714,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1732,8 +1733,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1747,8 +1748,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1762,8 +1763,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1777,8 +1778,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1796,8 +1797,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1811,8 +1812,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1826,8 +1827,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1841,8 +1842,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1860,8 +1861,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1875,8 +1876,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1890,8 +1891,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1905,8 +1906,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1924,8 +1925,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1939,8 +1940,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1954,8 +1955,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1969,8 +1970,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	},
-- 
2.48.1


