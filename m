Return-Path: <linux-gpio+bounces-20617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E0AC5CE2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 502E37AFDEA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85267218AB0;
	Tue, 27 May 2025 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL2L7TlI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41B218589;
	Tue, 27 May 2025 22:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384475; cv=none; b=KfOE4eZPV36AYxDqWmTeqluHNHxJHsHN/mzJQNxgiSzgDzJ3HsSnb+lkfTm5Wp+kV4amf+FyOLWa9J0bC0RBx4Z/oW+psMpmrRGlUYvXjY4UQ/oaalBDUqP5tySY2i7BY95SiP3OReKgxxSmUq2d3gPLd6pPBXy8oFTuAYhEEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384475; c=relaxed/simple;
	bh=ygCoAPyEsRn8cTC+hq5mMwhQnzh45Aou0feTyw4/f54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgP3Hw+rIUBvqFvxfS+sM7Rz7Mq17srFjmih7ZngxockvxFheP+JWi/wwxMkXISbEga71qRC7NCLaoiRVMMmzB5dbQazrx1dU5FWabyqHtgpGa38UKMsGWfahxJh2gJT2arZhD67s2IUy+2YVs8JPpttErwz+7XzBYiU+zd4/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL2L7TlI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so51034185e9.2;
        Tue, 27 May 2025 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384471; x=1748989271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AggbAoer8aihrj/9JPsYJaBFXWWV9oNzHPhuCFT7QCk=;
        b=XL2L7TlIoiEEzcVaDnj4WTBXWBW1qBEhQnVYGyvfL2sgp+6oM3iQc4a3sdL+gRTUCu
         Xwo9AQ89UG3a9/pKJ0UeGD1WN+Wo3Q0jQ75pc3hUqoO/n4UsoBK+Tny50nXsHYEXs9K0
         ud8obx0yNZdi0aMhrThTyynQgxsJvnAHYgwTBtBtqmHcJV2IuErgbOE8I9PtpaknKeWn
         Rn0mmYaq9r4mY9zktSM1owIzINhm7wC78HaCu2/51FQRENtGQrPZLbz9cQTfHr5otmnq
         9yE4ZU55HCn86hE7t6baU65IoPYQaTHBbez6Ca8Py08VlaUkxLjW36QyxtlZp+ZCdUtw
         CQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384471; x=1748989271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AggbAoer8aihrj/9JPsYJaBFXWWV9oNzHPhuCFT7QCk=;
        b=M4zOYxXB1cIa+xxPgs8R1/3taI0nf9VZwfJLOkxANVyVFNIhioINNDY52Q3u+S8yJl
         z2JXl7CK59kpPluj1yBbC7jUmEgWStmubr0iNa56ubbfJyJXeE/SSGF5iltNTwX1Haf1
         7tuzu/DqcVle5Xk16G8n2af7JgDZZJusGpHqzMmv1a6x2FHSdzVulk1qb0URqEVvqh2K
         YSGGdsFmE99hKzRQjtX3q0fQ3qa/2YxBNcz1n4GOPSy1M2qP3Nvq4JNqMOoDInxxsUwL
         9cQo3DAa5qG0Z4jYT77UvbcDOfZ1lKKZu10jzhkIchddJo4zLrpwirWr3x8wCAIBBWFU
         7EBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGAFAH5Ef8U27qHuP0984emaIoyqD0shcTBWrMS+hiU10dxBH2cDRyr3CALdo71Zk5XA3PyXl7IDE/fA==@vger.kernel.org, AJvYcCVJGw64RXWyXv5b9vU3W2PjsfJkHyrti2+3Y4HZdpTRStQSZucoKJJ44th9xdT7BoOeNBn9Lp/Z2Uf2@vger.kernel.org, AJvYcCW6lrzTwKI07OQlww2qyXSc+CGwS0Q7js7eN+RGu9Sr3FA0agUByd8HorcH2NRsLhzuf8xjESR00YnL1H2P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yrm1SNjHWrWprKx+n/RjbJdzol6jbq4Vue+ImvsnODBZLVvq
	HYw81SKY1+xcJwS1HR25g+y5/lDY7PKIgbkIep3n8DnRZ1EgzmCVf3FU
X-Gm-Gg: ASbGncum8Buud3AbPPulP3WkMhNcZP0RDUpPv0TecASWLIyPb22FP8XO3lOe/FJc7Fr
	zxeGPkKwv3PIOybg+4PKTCW0fq3JOFZYpiPxGDAhRlspcK08xpVcu5kJFfymto4j8+Ds1lUobvm
	f0lSLYc5xekw18PLlunD0H8tCYourEblT+h1Jlvs8jd6GWVllDyd89bUAfBDvGtwMDajO+rKobj
	niBfgZfV8SQN4vtuG3C708B6ALP9dkCzp3ZhLIsAErS51ligGBF5M5VmmiDqwYwMd+xxac1yBC5
	FjW8MhExVtntoMYCS9DEvRiR0I/gi6vtBO/W+HLbzp49UC+KKSNnOr1KTkGhePJVb4pfnAe5tq4
	QvymEROsGPoUwadveEipQ
X-Google-Smtp-Source: AGHT+IFgcWjFt3t+Gd0QlozEXUdvBZljoWDzDgLnlXD9We55QUCHYxtD/XfLhKis+uydSn+n11Pc8g==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:e841:ee6f with SMTP id ffacd0b85a97d-3a4e841eeddmr337078f8f.24.1748384471261;
        Tue, 27 May 2025 15:21:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/6] pinctrl: airoha: convert PHY LED GPIO to macro
Date: Wed, 28 May 2025 00:20:35 +0200
Message-ID: <20250527222040.32000-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY LED GPIO pinctrl struct definition is very similar across the
different 4 PHY and 2 LED and it can be generelized to a macro.

To reduce code size, convert them to a common macro.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 570 ++++------------------
 1 file changed, 82 insertions(+), 488 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 8af9109db992..2b532334d759 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1475,516 +1475,110 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_PHY_LED(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	{
-		.name = "gpio33",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED0_MODE_MASK,
-			GPIO_LAN0_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio34",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED0_MODE_MASK,
-			GPIO_LAN1_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio35",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED0_MODE_MASK,
-			GPIO_LAN2_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(0)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(1)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(2)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	{
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN0_LED1_MODE_MASK,
-			GPIO_LAN0_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN0_LED_MAPPING_MASK,
-			LAN0_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN1_LED1_MODE_MASK,
-			GPIO_LAN1_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN2_LED1_MODE_MASK,
-			GPIO_LAN2_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED1_MODE_MASK,
-			GPIO_LAN3_LED1_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY_LED_MAP(3)
-		},
-		.regmap_size = 2,
-	},
+	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-- 
2.48.1


