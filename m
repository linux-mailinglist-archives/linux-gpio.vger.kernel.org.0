Return-Path: <linux-gpio+bounces-28231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECFEC3DEC7
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 00:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A2E188BB61
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 23:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CAB30101E;
	Thu,  6 Nov 2025 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNJO0QdA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE72F7ACA
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473450; cv=none; b=JnKcwgkJPJZ+bfM128FRDhgxpH5sn5Ldrl92Ruq8EeBzhfj2zEglCAtzKWFEQ3h0dTLYUVMdmwg1V0nnVAtZrCIrqELZXsu14YdnLayI5NG/pI4U4mKhd0rOtrq6Qn24+nQkc/QuSM6V8evLwa0ASLYJndAdkD02KDLwPJItH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473450; c=relaxed/simple;
	bh=f1PQo4QBL2qwY2C9AqqCdBd1hAsdgl5lCvJysh0udQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIMORZxA/Tdy1KU0uSqlfkj50zjei74oYOOiX85nmkUvBZOtyz27WK7BsmIdRG6x8OYcoYZzAwpaw85De5WnIRGvgSCDsjga9nOpZi1lIGagfTDA8S0m8B9LLnlbrjfbXaRe7GNUgK5Cmoc/FscYl9TBplAk9zryInQpFdKO4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNJO0QdA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae77516so1877575e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 15:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473444; x=1763078244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48BoF8NaOlBn/uSGyBDir/rc+KJ4BqlhpDGaIy/7loQ=;
        b=UNJO0QdADtOJ25c/DA3IFypNdGK9mDuGhPMFdDJU6kIqK6XAn6eIezb1+P/sLTA2aH
         z698QmwuIe2sG09q5llsW+c7Ahcs+KVjoQfvNXHgbld3ntpIm+/bItnBaC8GZhA2Abu0
         kQ6iZbWGJGkvPgxt6sza13kgkS4R4k0GSpwujS4wdPSu8uuLHH0ifaNBvd9XXz6SHjmO
         jcs0+LFGKfuXUyBLP5/afBDtP+xhVcxWLQzDD7sijCopVjXrFzugp35nPoTdJAhpBRD9
         8Wl+c3UM54B74OogC9CD/X4veiW5FS9fGrjFUH0VxWNa8h8OlIDjoRFtnqYY3ILxoO8J
         KkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473444; x=1763078244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48BoF8NaOlBn/uSGyBDir/rc+KJ4BqlhpDGaIy/7loQ=;
        b=OC727XPdrgmhxX0hwdIwtWaJgKOxLfMMCfEDb6Tv7yeFwJVkEOOF3XzquZtYMoKEGw
         IfAIC7ou97JIi8oK96fD2m1cvPJ9pnOvk8js1yL5b2T6ZMi6xx6Fcvpm3eFu55rO83M0
         Uu2vfYVt06zQro/rLiOyMo4HFWsxtifQWsOZCVoGUpwVQmgfeisT/qptInjCdkOsEbxH
         ChVJZyQ0vJ06kZQc2gFd/T3TecFzL12mVzEOY86FvjkHR+iCii47h1BpKiWroqnsVzt2
         hgikIFt3JLh5eXPPR+dXZgSI0nJ8LgdSKD1LiF5CNImfCpt418iKBEWtXlBOqCMbxBzj
         B3Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV1KNEbLmi3VVlZFjIXh+0JR78agJ0QViLlpCXA7uoAaD3S+Pnti4mGKa9zDsKcUT8pm1hVC9yZUR0/@vger.kernel.org
X-Gm-Message-State: AOJu0YwmO/MYzZGxYgcQEdb5z2AUHxMVU4SbJm6QQt5v56a75oGnjvSQ
	uF1E7bxaiQ73tftBd7i1BDF7/V0pByE4errp/7ovEOeYIJZh+tn5cnYW
X-Gm-Gg: ASbGnct043eDc5CFl2U+JvpxeF2iuGOrYCLLRFbONvCO4mfs5fFILjXKkItKbQu+5UW
	0luET5QmHdYT6snJYfm6cK7GMOdqQoGJKwFA8PTeW47rH3ZT6iUNN+luM1H+X8sluO23eZLy6sw
	2cAlSyynjkCC77kRYD0zeHp+zEtzZr+18KVPl9YOpO6JBe9wKSC4VgowpzbGOQiPyJ4CzroEUIl
	S244M8Gx5S/BoN+aWT5FAiBoZ7hQIg4f+jHnDP6hvCssUNPFeWuUnFb1qlCObccIj0MdugbhRuW
	86mRqnA9kVEQChzYL3adAzVPxkDyZo3nZ6zxmGnR8uqjQX8+v9QIn6BBfiHTxbZYC+tOeXQo3/V
	OY6dqF2fMBC2QFmBrSMXwNR0XmceYAZLDp4hHU3mgquU7FLoHhv8a8gnbnKV30ke6p0nVswrER7
	Pae7Ao5Yl0QH8tamcnT8oFu2CzH+1DBA==
X-Google-Smtp-Source: AGHT+IFzsedTnTbZ6Fd8WEjJ1Vj1aOJB4NwmHqodu5jtk2xl8WgbaEUCKzp6OPGFJllbzQLlnrKeXg==
X-Received: by 2002:a05:600c:c4ac:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-4776bc87df4mr8992405e9.1.1762473444216;
        Thu, 06 Nov 2025 15:57:24 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:23 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 3/5] pinctrl: airoha: convert PWM GPIO to macro
Date: Fri,  7 Nov 2025 00:57:06 +0100
Message-ID: <20251106235713.1794668-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PWM GPIO struct definition follow the same pattern for every GPIO
pin hence it can be converted to a macro.

Create 2 macro one for normal mux and one for ext mux and convert all
the entry to these new macro to reduce code size.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 465 ++++------------------
 1 file changed, 68 insertions(+), 397 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index cb0edc2a66a1..f3cf48bdd1f8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1073,404 +1073,75 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 };
 
 /* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_EXT_MUX,	\
+			REG_GPIO_FLASH_MODE_CFG_EXT,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
-	{
-		.name = "gpio0",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO0_FLASH_MODE_CFG,
-			GPIO0_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio1",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO1_FLASH_MODE_CFG,
-			GPIO1_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio2",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO2_FLASH_MODE_CFG,
-			GPIO2_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio3",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO3_FLASH_MODE_CFG,
-			GPIO3_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio4",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO4_FLASH_MODE_CFG,
-			GPIO4_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio5",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO5_FLASH_MODE_CFG,
-			GPIO5_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio6",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO6_FLASH_MODE_CFG,
-			GPIO6_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio7",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO7_FLASH_MODE_CFG,
-			GPIO7_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio8",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO8_FLASH_MODE_CFG,
-			GPIO8_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio9",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO9_FLASH_MODE_CFG,
-			GPIO9_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio10",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO10_FLASH_MODE_CFG,
-			GPIO10_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio11",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO11_FLASH_MODE_CFG,
-			GPIO11_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio12",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO12_FLASH_MODE_CFG,
-			GPIO12_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio13",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO13_FLASH_MODE_CFG,
-			GPIO13_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio14",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO14_FLASH_MODE_CFG,
-			GPIO14_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio15",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_MUX,
-			REG_GPIO_FLASH_MODE_CFG,
-			GPIO15_FLASH_MODE_CFG,
-			GPIO15_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio16",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO16_FLASH_MODE_CFG,
-			GPIO16_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio17",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO17_FLASH_MODE_CFG,
-			GPIO17_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio18",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO18_FLASH_MODE_CFG,
-			GPIO18_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio19",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO19_FLASH_MODE_CFG,
-			GPIO19_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio20",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO20_FLASH_MODE_CFG,
-			GPIO20_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio21",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO21_FLASH_MODE_CFG,
-			GPIO21_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio22",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO22_FLASH_MODE_CFG,
-			GPIO22_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio23",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO23_FLASH_MODE_CFG,
-			GPIO23_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio24",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO24_FLASH_MODE_CFG,
-			GPIO24_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio25",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO25_FLASH_MODE_CFG,
-			GPIO25_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio26",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO26_FLASH_MODE_CFG,
-			GPIO26_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio27",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO27_FLASH_MODE_CFG,
-			GPIO27_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio28",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO28_FLASH_MODE_CFG,
-			GPIO28_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio29",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO29_FLASH_MODE_CFG,
-			GPIO29_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio30",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO30_FLASH_MODE_CFG,
-			GPIO30_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio31",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO31_FLASH_MODE_CFG,
-			GPIO31_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio36",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO36_FLASH_MODE_CFG,
-			GPIO36_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio37",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO37_FLASH_MODE_CFG,
-			GPIO37_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio38",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO38_FLASH_MODE_CFG,
-			GPIO38_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio39",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO39_FLASH_MODE_CFG,
-			GPIO39_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio40",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO40_FLASH_MODE_CFG,
-			GPIO40_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio41",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO41_FLASH_MODE_CFG,
-			GPIO41_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio42",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO42_FLASH_MODE_CFG,
-			GPIO42_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio43",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO43_FLASH_MODE_CFG,
-			GPIO43_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio44",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO44_FLASH_MODE_CFG,
-			GPIO44_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio45",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO45_FLASH_MODE_CFG,
-			GPIO45_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio46",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO46_FLASH_MODE_CFG,
-			GPIO46_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	}, {
-		.name = "gpio47",
-		.regmap[0] = {
-			AIROHA_FUNC_PWM_EXT_MUX,
-			REG_GPIO_FLASH_MODE_CFG_EXT,
-			GPIO47_FLASH_MODE_CFG,
-			GPIO47_FLASH_MODE_CFG
-		},
-		.regmap_size = 1,
-	},
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
-- 
2.51.0


