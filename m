Return-Path: <linux-gpio+bounces-20618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74265AC5CE6
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2831890D57
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C4B218EB1;
	Tue, 27 May 2025 22:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d38JxXl7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5B2163B2;
	Tue, 27 May 2025 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384479; cv=none; b=oGITA4z/C8qlpu7z2gT3oXL1KFimssEjUhtaK+z+jhDvMkjgyByXb2Fi7cbfc5s3pvaMA1Id61wiw06Xfs6TCRYa20kdDFUtKk86wHxUr4cDbo7GPDLqZa19G6lkx2TasL3eHxIrC+Bu+hce/+7jC1D4AmKITPKlk4tg8HJB1G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384479; c=relaxed/simple;
	bh=EF3jI3tp9N+AVRtVLX58rOI9iiyg/gVktT/skEj+HE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee6z2d+oqPxvxycRhmsM6kzBw3sz0/mEVe+oHKw0+r3/+tz8dRjLu/FCr/CLu30Zz6u/L4OLoQ14ycHXD3FaTLc6qAjJB/3MptTEJlP2lFF67b+4c1cDDKGpj2MTC0pU/Uw63ZNNrfI8i25elROGvtGqM+U+5S4RYBQtKu2B1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d38JxXl7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so2504765f8f.1;
        Tue, 27 May 2025 15:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384473; x=1748989273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtL25+x2x7tW+LP+uVFdYVOdezBzc1auuPCpudqddks=;
        b=d38JxXl7y/dZAyIcG5y7jgCocygR4B+JGumNA19pl/wy68yVSUTrJSpKxK2r4gYfqL
         iNMZZ1JV9s27tHnChHVu8X8YtejwG5omk/xpPDpbKNXMpvUhXxj9N+PLLz471+tRq1Md
         04vwcLMXzoWV8Ijm8TA8Gr3VknnH9r3WzTXpSYZmx0qOe/Uj+SZ7KFay7WkP+KgwLwAl
         NOpZDahxubz71JgOpmVurJCjgpXKf3mX9fohzZ5uuctBU3n8mKaGmzVosbGVGS+jglpm
         U3KyV7sAJNwZG0DSq6jnaVwxRwcZqs2lxwPVALiAxxbg4WOZky/hGYYfk5TrlR0nd5Ic
         xtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384473; x=1748989273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtL25+x2x7tW+LP+uVFdYVOdezBzc1auuPCpudqddks=;
        b=KjeoScof7n4gsrbtuD+hrNc7mafg7KDfqJE90BC+JbPuPhCL6WhWZyTNgOSYQ2mt0Y
         54b+xSEFXDe6vj9wHVBAaNFVS7WGbwLNQFcZXxhRBpw0XBfAdDm0s7/PlnxmG8FdfqqS
         FHNK2ArV/uMSrEVvQQAfiQRyfw95Yq2024TnfPKprVFMYu8P1wNYgDKCYF9gg5NS758z
         HebmXFOx08zqFNoZJMjR876yTcZ7LPvkxzY869EQHpnBG1glw6djhXOGiPkhki1lCQJH
         QL3Xf664m3RNTDVk+ZG1anR0DxduOIYPwe9GC+9KiSNwEJmzBeNGvgarf/CZI1F1dpJE
         Ah+w==
X-Forwarded-Encrypted: i=1; AJvYcCVQZmF9UNufISOlR96TdllD7qzYiGgYxuzyaVeut/08HSXbEkzBXbdegIDugmPjVqIVJvm4wGqiWQEOnA==@vger.kernel.org, AJvYcCX5RYRPD04GfPznugqPDiIi/mLqt64ZIHHaCm6HkTnNJ6PY1q82S49gVesKJYQYGuKgrvmngOFR6ySx@vger.kernel.org, AJvYcCXChstSTrFXj6UcJLcd5dVf7ib2UGde52mZKd0S1dhPu4PuUs2MIkjZKLG3cx/5y9T4oABBh7Hs3ep27yMr@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJzC9PrEK7ziBXNwmodj1lRoxHAzsgcEy2xCMlpNAqsJiPdcb
	Qs6HCMevSGfh+I4/J1BjdbwqxGaa/PN5nbOj2A20poleWk/P2Z+6aalr
X-Gm-Gg: ASbGncsxKa0nR7zWwrEFOhrJeyDfgJfvho2+VRezFQM+ibXttP/eagBujtXWE7BLitF
	J2N+E4X/u91fR9jFT4ezA+O215DQ4IGeA4kF8+XVzPAmHCgs2lZc2Of+BPbQ4cWxMYGcI5FQyZi
	LYqhGLc/3Sw1T63a2ThEq6VvXFN6Ecb85BwPOhtwhjAJgEiNPVCd4QMUIsxI1UbMxVs2Z+xKgjE
	XE+MPUg4B9Ao7bptcyA4lEVj6Ko4kxlR+szdXZpoopBbyYqcbtw/EXzFUmKJfHOLaJ8td334yxI
	osEJmtAGpXWB8OY4eaDIK0h2xfqa4ELvM+Egfz+huTBTgy2SuHGT40Gflz3K56RCY3pIWKt2tdo
	KlnOS0L1acWiz9z3ihaz9
X-Google-Smtp-Source: AGHT+IFXrLC/3TDzlVpVBCT5kPNh9gS4EkdPFS5QcaYLS+WN965lf7LRn2Ai/4ECmdf0cRui3enRJg==
X-Received: by 2002:a05:6000:248a:b0:3a4:dd16:a26d with SMTP id ffacd0b85a97d-3a4dd16a2e9mr7513089f8f.38.1748384473183;
        Tue, 27 May 2025 15:21:13 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:12 -0700 (PDT)
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
Subject: [PATCH 4/6] pinctrl: airoha: convert PWM GPIO to macro
Date: Wed, 28 May 2025 00:20:36 +0200
Message-ID: <20250527222040.32000-5-ansuelsmth@gmail.com>
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

The PWM GPIO struct definition follow the same pattern for every GPIO
pin hence it can be converted to a macro.

Create 2 macro one for normal mux and one for ext mux and convert all
the entry to these new macro to reduce code size.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 465 ++++------------------
 1 file changed, 68 insertions(+), 397 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 2b532334d759..8c8d5b598f4f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1075,404 +1075,75 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
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
 
 #define AIROHA_PINCTRL_PHY_LED(gpio, mux_val, map_mask, map_val)	\
-- 
2.48.1


