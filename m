Return-Path: <linux-gpio+bounces-15574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57953A2CD76
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 936A816D8EC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3726B19EED2;
	Fri,  7 Feb 2025 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/TjhRub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10A19DFB4;
	Fri,  7 Feb 2025 20:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958580; cv=none; b=UtiTvDTwY9q+OcpZZvjlkCr6sSYdmfLk2VIDiI5oM94qOvajCQfbQ0LE1g8p8qK2Q2JugyHbfox/zd++Gi53GKUDxzNQDqhtuO3qYneyUOw2roVkzqkrH74zQVDaN5MWnvf1CjZNGkLgCR1HelvY89EmQsbh6TZSDTcjiBoU9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958580; c=relaxed/simple;
	bh=t4WJKuYSv1oMEsJ7RlciSJZ4HEcVQOyIRHg+V/Zq4f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpZIIUUCo1J48nEnSmMWtLVqqsQPZ5H2gCxppSc1F2bFIlaSFN9bjacSdTmD/gSqB4Ps6bmCDPwAW+ijzzGjOiMLqHJF4iLQe1FHlA+p2xdu6m1iABJS24jP/G0E30FAoiSAXNkzHvVL56yZH0ne0BjziwBs/BF16GlWxIpC3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/TjhRub; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dced61e5a3so4502781a12.0;
        Fri, 07 Feb 2025 12:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958576; x=1739563376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CxfvyWw3ugPIF6jfl9GCHsrh+F0mpqwnqDaUgSn14E=;
        b=S/TjhRubfPdZc+AukJChCX2KNrjbmqitdApticyjBfsYl0p4JUAQ3b8lyjfaKdjfw2
         aKvUietJDvJMgtezdc/LbAlEpu8Q6tBmDI3q5yZT9lkcIzKX8fhkfcTm9lsSTwd6+Wn6
         56xjacWYBozDYLBTC2AiRu4fE+9jklYb6v408WLUn3/n2RuUsbEydT2/18xLJGqfk2Of
         K/OfRZp6au230Zhfkk2d50RQO7wbFilOyjGW+H2H+K5e6z5LxammaJ8VVO0e3Q8HnWsa
         ZyRUk9EGuGRrsbo38O1UsB1eSu04DicYJQL4bnxJZUzbQXOyO1UPApzpn9X6YOYllmNc
         PFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958576; x=1739563376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CxfvyWw3ugPIF6jfl9GCHsrh+F0mpqwnqDaUgSn14E=;
        b=W7gQN5s8LveNAHWL2GPoBsRioyVqVbfHuYilrOiX8MXRrXVwMwPdSWKTVJC/VNgdCI
         jLUkEzAwP2qhJlDYaHZRUmCB8yOfg1Z/8195Ea+Cp2CfeqQ8ySUfvK6nPwwZ4GTc4ZcE
         AP3He2nRVKpmbzKzl2Q2R7wFYj3Mkhr7/3GAqlVh6/3aG2dovHCbMP0psyT7Ldq/7ejW
         LNSJSM1thdAfPLaYtvyHAWP8xl8O4K/siVnWGjkybZesBK/CtxMeiEwH4pPMy+EApfTd
         1blZOiYXN9Fvr9+pxNQg0gxQsWYJS4bGn14fMilhbyErh+w9gPv81aEzGuPJ8VXUcGhd
         ss7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwuzRfoxFFONi9FKYX+5mEqbxZKWnKNOjgypauYQTELMxH/1M/ebCE242Cy4LRYrWqlfyaA2x0t0L50nNk@vger.kernel.org, AJvYcCVxXOpbCsZrm60IbrXWawuJvJAirsCC7o1UcfEJ8Hx8GFCIyvFzwwQ+n2e5ojDzSW54MHGlOdgu8n5A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vxF0MT6NxxTUllZMb2bEQvEodDDtSwBRMzFSdoyxuhxIUkNs
	wa5fyYs4bBvT0tyIwULHjRbQGFN4S2vsQg7d3X2H84wCNZ0rOFn8OB7SmQ==
X-Gm-Gg: ASbGncu+IEQaRU+F2Y5a+Ocmk60pAKCSSHOq0GAz1OzJgIi5jN0v0Q3tO5wRrAwX3Lg
	MWxYGAsCMONEJ/2u8QOH4azFpIHJsuxOJhYa/gnNFYduwZclrOLc+qxemhDOhjVoytHDNn9fT6t
	Cl1k7zhlAzyYnsNsaf+Wt9joDP/f/wRK1KsOIpSooOSjeSFneAnQeVrlnSB4IsmkyYtZf50C8FO
	v1gBYKbw8k6FsylYhplXEUb3vfCKEaUnXKcxmZ4wDiPJQfRKO3+rw8W/xAppHP2WD+TvnfeOmES
	uYBCqJ7zbUGzKjF0REN9OMpPWlQRPvFqcAAYv6TlNNrWLQ/GlHodXoOC
X-Google-Smtp-Source: AGHT+IGHq7ZREsIO9qnKZWLsorVm6sYBcubIuYtXV7IcXwiJayYga1MA6XrC+/TlZtIB3W7StBflGw==
X-Received: by 2002:a05:6402:40d5:b0:5dc:db1e:ab4e with SMTP id 4fb4d7f45d1cf-5de45072163mr5888305a12.19.1738958575132;
        Fri, 07 Feb 2025 12:02:55 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:54 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:44 +0100
Subject: [PATCH 5/7] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-5-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=27427;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=t4WJKuYSv1oMEsJ7RlciSJZ4HEcVQOyIRHg+V/Zq4f0=;
 b=iIfY/hP4KcdcmYkt/l8D34/6agmI6kZuFru58MZ7DONJ2Cd6kLELCQMfFH7xX4i7yeYwNSZUC
 ZRJFaz2hWhqCxcAujYkce37NFx/MZVdKTWhbNSPnM582B4h+2g3c3Db
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

BCM21664 is another chip from the Kona line of Broadcom SoCs, and
its pinmux shares a lot of similarities with the BCM281xx pinmux.

Add support for the BCM21664 pinmux controller to the BCM281xx driver.

This also enables pinmux support for the BCM23550, which has an
identical pinmux config to the BCM21664 (hence they can share a
single compatible, brcm,bcm21664-pinctrl).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 689 ++++++++++++++++++++++++++++++++-
 1 file changed, 687 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 6ed9bbed71f2d660a2c38d28788c1b0ca8f052c3..e0bee0322919de8d8604f9e2e96276f07e69b54a 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -52,6 +52,12 @@
 #define BCM281XX_HDMI_PIN_REG_MODE_MASK		0x0010
 #define BCM281XX_HDMI_PIN_REG_MODE_SHIFT	4
 
+/* BCM21664 access lock registers */
+#define BCM21664_WR_ACCESS_OFFSET		0x07F0
+#define BCM21664_WR_ACCESS_PASSWORD		0xA5A501
+#define BCM21664_ACCESS_LOCK_OFFSET(lock)	(0x0780 + (lock * 4))
+#define BCM21664_ACCESS_LOCK_COUNT		5
+
 /*
  * bcm281xx_pin_type - types of pin register
  */
@@ -81,6 +87,7 @@ struct bcm281xx_pin_function {
  */
 enum bcm281xx_pinctrl_type {
 	BCM281XX_PINCTRL_TYPE,
+	BCM21664_PINCTRL_TYPE,
 };
 
 /*
@@ -971,6 +978,571 @@ static const struct bcm281xx_pinctrl_info bcm281xx_pinctrl = {
 	.regmap_config = bcm281xx_pinctrl_regmap_config,
 };
 
+/* BCM21664 data */
+#define BCM21664_PIN_ADCSYN		0
+#define BCM21664_PIN_BATRM		1
+#define BCM21664_PIN_BSC1CLK		2
+#define BCM21664_PIN_BSC1DAT		3
+#define BCM21664_PIN_CAMCS0		4
+#define BCM21664_PIN_CAMCS1		5
+#define BCM21664_PIN_CLK32K		6
+#define BCM21664_PIN_CLK_CX8		7
+#define BCM21664_PIN_DCLK1		8
+#define BCM21664_PIN_DCLK4		9
+#define BCM21664_PIN_DCLKREQ1		10
+#define BCM21664_PIN_DCLKREQ4		11
+#define BCM21664_PIN_DMIC0CLK		12
+#define BCM21664_PIN_DMIC0DQ		13
+#define BCM21664_PIN_DSI0TE		14
+#define BCM21664_PIN_GPIO00		15
+#define BCM21664_PIN_GPIO01		16
+#define BCM21664_PIN_GPIO02		17
+#define BCM21664_PIN_GPIO03		18
+#define BCM21664_PIN_GPIO04		19
+#define BCM21664_PIN_GPIO05		20
+#define BCM21664_PIN_GPIO06		21
+#define BCM21664_PIN_GPIO07		22
+#define BCM21664_PIN_GPIO08		23
+#define BCM21664_PIN_GPIO09		24
+#define BCM21664_PIN_GPIO10		25
+#define BCM21664_PIN_GPIO11		26
+#define BCM21664_PIN_GPIO12		27
+#define BCM21664_PIN_GPIO13		28
+#define BCM21664_PIN_GPIO14		29
+#define BCM21664_PIN_GPIO15		30
+#define BCM21664_PIN_GPIO16		31
+#define BCM21664_PIN_GPIO17		32
+#define BCM21664_PIN_GPIO18		33
+#define BCM21664_PIN_GPIO19		34
+#define BCM21664_PIN_GPIO20		35
+#define BCM21664_PIN_GPIO21		36
+#define BCM21664_PIN_GPIO22		37
+#define BCM21664_PIN_GPIO23		38
+#define BCM21664_PIN_GPIO24		39
+#define BCM21664_PIN_GPIO25		40
+#define BCM21664_PIN_GPIO26		41
+#define BCM21664_PIN_GPIO27		42
+#define BCM21664_PIN_GPIO28		43
+#define BCM21664_PIN_GPIO32		44
+#define BCM21664_PIN_GPIO33		45
+#define BCM21664_PIN_GPIO34		46
+#define BCM21664_PIN_GPS_CALREQ		47
+#define BCM21664_PIN_GPS_HOSTREQ	48
+#define BCM21664_PIN_GPS_PABLANK	49
+#define BCM21664_PIN_GPS_TMARK		50
+#define BCM21664_PIN_ICUSBDM		51
+#define BCM21664_PIN_ICUSBDP		52
+#define BCM21664_PIN_LCDCS0		53
+#define BCM21664_PIN_LCDRES		54
+#define BCM21664_PIN_LCDSCL		55
+#define BCM21664_PIN_LCDSDA		56
+#define BCM21664_PIN_LCDTE		57
+#define BCM21664_PIN_MDMGPIO00		58
+#define BCM21664_PIN_MDMGPIO01		59
+#define BCM21664_PIN_MDMGPIO02		60
+#define BCM21664_PIN_MDMGPIO03		61
+#define BCM21664_PIN_MDMGPIO04		62
+#define BCM21664_PIN_MDMGPIO05		63
+#define BCM21664_PIN_MDMGPIO06		64
+#define BCM21664_PIN_MDMGPIO07		65
+#define BCM21664_PIN_MDMGPIO08		66
+#define BCM21664_PIN_MMC0CK		67
+#define BCM21664_PIN_MMC0CMD		68
+#define BCM21664_PIN_MMC0DAT0		69
+#define BCM21664_PIN_MMC0DAT1		70
+#define BCM21664_PIN_MMC0DAT2		71
+#define BCM21664_PIN_MMC0DAT3		72
+#define BCM21664_PIN_MMC0DAT4		73
+#define BCM21664_PIN_MMC0DAT5		74
+#define BCM21664_PIN_MMC0DAT6		75
+#define BCM21664_PIN_MMC0DAT7		76
+#define BCM21664_PIN_MMC0RST		77
+#define BCM21664_PIN_MMC1CK		78
+#define BCM21664_PIN_MMC1CMD		79
+#define BCM21664_PIN_MMC1DAT0		80
+#define BCM21664_PIN_MMC1DAT1		81
+#define BCM21664_PIN_MMC1DAT2		82
+#define BCM21664_PIN_MMC1DAT3		83
+#define BCM21664_PIN_MMC1DAT4		84
+#define BCM21664_PIN_MMC1DAT5		85
+#define BCM21664_PIN_MMC1DAT6		86
+#define BCM21664_PIN_MMC1DAT7		87
+#define BCM21664_PIN_MMC1RST		88
+#define BCM21664_PIN_PC1		89
+#define BCM21664_PIN_PC2		90
+#define BCM21664_PIN_PMBSCCLK		91
+#define BCM21664_PIN_PMBSCDAT		92
+#define BCM21664_PIN_PMUINT		93
+#define BCM21664_PIN_RESETN		94
+#define BCM21664_PIN_RFST2G_MTSLOTEN3G	95
+#define BCM21664_PIN_RTXDATA2G_TXDATA3G1	96
+#define BCM21664_PIN_RTXEN2G_TXDATA3G2	97
+#define BCM21664_PIN_RXDATA3G0		98
+#define BCM21664_PIN_RXDATA3G1		99
+#define BCM21664_PIN_RXDATA3G2		100
+#define BCM21664_PIN_SDCK		101
+#define BCM21664_PIN_SDCMD		102
+#define BCM21664_PIN_SDDAT0		103
+#define BCM21664_PIN_SDDAT1		104
+#define BCM21664_PIN_SDDAT2		105
+#define BCM21664_PIN_SDDAT3		106
+#define BCM21664_PIN_SIMCLK		107
+#define BCM21664_PIN_SIMDAT		108
+#define BCM21664_PIN_SIMDET		109
+#define BCM21664_PIN_SIMRST		110
+#define BCM21664_PIN_GPIO93		111
+#define BCM21664_PIN_GPIO94		112
+#define BCM21664_PIN_SPI0CLK		113
+#define BCM21664_PIN_SPI0FSS		114
+#define BCM21664_PIN_SPI0RXD		115
+#define BCM21664_PIN_SPI0TXD		116
+#define BCM21664_PIN_SRI_C		117
+#define BCM21664_PIN_SRI_D		118
+#define BCM21664_PIN_SRI_E		119
+#define BCM21664_PIN_SSPCK		120
+#define BCM21664_PIN_SSPDI		121
+#define BCM21664_PIN_SSPDO		122
+#define BCM21664_PIN_SSPSYN		123
+#define BCM21664_PIN_STAT1		124
+#define BCM21664_PIN_STAT2		125
+#define BCM21664_PIN_SWCLKTCK		126
+#define BCM21664_PIN_SWDIOTMS		127
+#define BCM21664_PIN_SYSCLKEN		128
+#define BCM21664_PIN_TDI		129
+#define BCM21664_PIN_TDO		130
+#define BCM21664_PIN_TESTMODE		131
+#define BCM21664_PIN_TRACECLK		132
+#define BCM21664_PIN_TRACEDT00		133
+#define BCM21664_PIN_TRACEDT01		134
+#define BCM21664_PIN_TRACEDT02		135
+#define BCM21664_PIN_TRACEDT03		136
+#define BCM21664_PIN_TRACEDT04		137
+#define BCM21664_PIN_TRACEDT05		138
+#define BCM21664_PIN_TRACEDT06		139
+#define BCM21664_PIN_TRACEDT07		140
+#define BCM21664_PIN_TRSTB		141
+#define BCM21664_PIN_TXDATA3G0		142
+#define BCM21664_PIN_UBCTSN		143
+#define BCM21664_PIN_UBRTSN		144
+#define BCM21664_PIN_UBRX		145
+#define BCM21664_PIN_UBTX		146
+#define BCM21664_PIN_TRACEDT08		147
+#define BCM21664_PIN_TRACEDT09		148
+#define BCM21664_PIN_TRACEDT10		149
+#define BCM21664_PIN_TRACEDT11		150
+#define BCM21664_PIN_TRACEDT12		151
+#define BCM21664_PIN_TRACEDT13		152
+#define BCM21664_PIN_TRACEDT14		153
+#define BCM21664_PIN_TRACEDT15		154
+
+static const struct pinctrl_pin_desc bcm21664_pinctrl_pins[] = {
+	BCM281XX_PIN_DESC(BCM21664_PIN_ADCSYN, "adcsyn", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_BATRM, "batrm", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_BSC1CLK, "bsc1clk", i2c),
+	BCM281XX_PIN_DESC(BCM21664_PIN_BSC1DAT, "bsc1dat", i2c),
+	BCM281XX_PIN_DESC(BCM21664_PIN_CAMCS0, "camcs0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_CAMCS1, "camcs1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_CLK32K, "clk32k", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_CLK_CX8, "clk_cx8", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DCLK1, "dclk1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DCLK4, "dclk4", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DCLKREQ1, "dclkreq1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DCLKREQ4, "dclkreq4", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DMIC0CLK, "dmic0clk", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DMIC0DQ, "dmic0dq", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_DSI0TE, "dsi0te", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO00, "gpio00", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO01, "gpio01", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO02, "gpio02", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO03, "gpio03", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO04, "gpio04", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO05, "gpio05", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO06, "gpio06", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO07, "gpio07", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO08, "gpio08", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO09, "gpio09", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO10, "gpio10", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO11, "gpio11", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO12, "gpio12", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO13, "gpio13", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO14, "gpio14", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO15, "gpio15", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO16, "gpio16", i2c),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO17, "gpio17", i2c),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO18, "gpio18", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO19, "gpio19", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO20, "gpio20", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO21, "gpio21", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO22, "gpio22", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO23, "gpio23", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO24, "gpio24", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO25, "gpio25", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO26, "gpio26", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO27, "gpio27", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO28, "gpio28", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO32, "gpio32", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO33, "gpio33", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO34, "gpio34", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPS_CALREQ, "gps_calreq", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPS_HOSTREQ, "gps_hostreq", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPS_PABLANK, "gps_pablank", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPS_TMARK, "gps_tmark", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_ICUSBDM, "icusbdm", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_ICUSBDP, "icusbdp", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_LCDCS0, "lcdcs0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_LCDRES, "lcdres", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_LCDSCL, "lcdscl", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_LCDSDA, "lcdsda", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_LCDTE, "lcdte", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO00, "mdmgpio00", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO01, "mdmgpio01", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO02, "mdmgpio02", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO03, "mdmgpio03", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO04, "mdmgpio04", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO05, "mdmgpio05", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO06, "mdmgpio06", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO07, "mdmgpio07", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MDMGPIO08, "mdmgpio08", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0CK, "mmc0ck", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0CMD, "mmc0cmd", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT0, "mmc0dat0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT1, "mmc0dat1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT2, "mmc0dat2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT3, "mmc0dat3", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT4, "mmc0dat4", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT5, "mmc0dat5", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT6, "mmc0dat6", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0DAT7, "mmc0dat7", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC0RST, "mmc0rst", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1CK, "mmc1ck", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1CMD, "mmc1cmd", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT0, "mmc1dat0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT1, "mmc1dat1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT2, "mmc1dat2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT3, "mmc1dat3", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT4, "mmc1dat4", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT5, "mmc1dat5", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT6, "mmc1dat6", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1DAT7, "mmc1dat7", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_MMC1RST, "mmc1rst", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_PC1, "pc1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_PC2, "pc2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_PMBSCCLK, "pmbscclk", i2c),
+	BCM281XX_PIN_DESC(BCM21664_PIN_PMBSCDAT, "pmbscdat", i2c),
+	BCM281XX_PIN_DESC(BCM21664_PIN_PMUINT, "pmuint", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RESETN, "resetn", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RFST2G_MTSLOTEN3G, "rfst2g_mtsloten3g", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RTXDATA2G_TXDATA3G1, "rtxdata2g_txdata3g1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RTXEN2G_TXDATA3G2, "rtxen2g_txdata3g2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RXDATA3G0, "rxdata3g0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RXDATA3G1, "rxdata3g1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_RXDATA3G2, "rxdata3g2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SDCK, "sdck", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SDCMD, "sdcmd", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SDDAT0, "sddat0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SDDAT1, "sddat1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SDDAT2, "sddat2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SDDAT3, "sddat3", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SIMCLK, "simclk", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SIMDAT, "simdat", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SIMDET, "simdet", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SIMRST, "simrst", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO93, "gpio93", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_GPIO94, "gpio94", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SPI0CLK, "spi0clk", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SPI0FSS, "spi0fss", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SPI0RXD, "spi0rxd", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SPI0TXD, "spi0txd", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SRI_C, "sri_c", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SRI_D, "sri_d", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SRI_E, "sri_e", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SSPCK, "sspck", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SSPDI, "sspdi", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SSPDO, "sspdo", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SSPSYN, "sspsyn", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_STAT1, "stat1", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_STAT2, "stat2", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SWCLKTCK, "swclktck", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SWDIOTMS, "swdiotms", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_SYSCLKEN, "sysclken", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TDI, "tdi", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TDO, "tdo", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TESTMODE, "testmode", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACECLK, "traceclk", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT00, "tracedt00", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT01, "tracedt01", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT02, "tracedt02", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT03, "tracedt03", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT04, "tracedt04", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT05, "tracedt05", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT06, "tracedt06", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT07, "tracedt07", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRSTB, "trstb", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TXDATA3G0, "txdata3g0", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_UBCTSN, "ubctsn", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_UBRTSN, "ubrtsn", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_UBRX, "ubrx", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_UBTX, "ubtx", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT08, "tracedt08", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT09, "tracedt09", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT10, "tracedt10", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT11, "tracedt11", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT12, "tracedt12", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT13, "tracedt13", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT14, "tracedt14", std),
+	BCM281XX_PIN_DESC(BCM21664_PIN_TRACEDT15, "tracedt15", std),
+};
+
+static const char * const bcm21664_alt_groups[] = {
+	"adcsyn",
+	"batrm",
+	"bsc1clk",
+	"bsc1dat",
+	"camcs0",
+	"camcs1",
+	"clk32k",
+	"clk_cx8",
+	"dclk1",
+	"dclk4",
+	"dclkreq1",
+	"dclkreq4",
+	"dmic0clk",
+	"dmic0dq",
+	"dsi0te",
+	"gpio00",
+	"gpio01",
+	"gpio02",
+	"gpio03",
+	"gpio04",
+	"gpio05",
+	"gpio06",
+	"gpio07",
+	"gpio08",
+	"gpio09",
+	"gpio10",
+	"gpio11",
+	"gpio12",
+	"gpio13",
+	"gpio14",
+	"gpio15",
+	"gpio16",
+	"gpio17",
+	"gpio18",
+	"gpio19",
+	"gpio20",
+	"gpio21",
+	"gpio22",
+	"gpio23",
+	"gpio24",
+	"gpio25",
+	"gpio26",
+	"gpio27",
+	"gpio28",
+	"gpio32",
+	"gpio33",
+	"gpio34",
+	"gps_calreq",
+	"gps_hostreq",
+	"gps_pablank",
+	"gps_tmark",
+	"icusbdm",
+	"icusbdp",
+	"lcdcs0",
+	"lcdres",
+	"lcdscl",
+	"lcdsda",
+	"lcdte",
+	"mdmgpio00",
+	"mdmgpio01",
+	"mdmgpio02",
+	"mdmgpio03",
+	"mdmgpio04",
+	"mdmgpio05",
+	"mdmgpio06",
+	"mdmgpio07",
+	"mdmgpio08",
+	"mmc0ck",
+	"mmc0cmd",
+	"mmc0dat0",
+	"mmc0dat1",
+	"mmc0dat2",
+	"mmc0dat3",
+	"mmc0dat4",
+	"mmc0dat5",
+	"mmc0dat6",
+	"mmc0dat7",
+	"mmc0rst",
+	"mmc1ck",
+	"mmc1cmd",
+	"mmc1dat0",
+	"mmc1dat1",
+	"mmc1dat2",
+	"mmc1dat3",
+	"mmc1dat4",
+	"mmc1dat5",
+	"mmc1dat6",
+	"mmc1dat7",
+	"mmc1rst",
+	"pc1",
+	"pc2",
+	"pmbscclk",
+	"pmbscdat",
+	"pmuint",
+	"resetn",
+	"rfst2g_mtsloten3g",
+	"rtxdata2g_txdata3g1",
+	"rtxen2g_txdata3g2",
+	"rxdata3g0",
+	"rxdata3g1",
+	"rxdata3g2",
+	"sdck",
+	"sdcmd",
+	"sddat0",
+	"sddat1",
+	"sddat2",
+	"sddat3",
+	"simclk",
+	"simdat",
+	"simdet",
+	"simrst",
+	"gpio93",
+	"gpio94",
+	"spi0clk",
+	"spi0fss",
+	"spi0rxd",
+	"spi0txd",
+	"sri_c",
+	"sri_d",
+	"sri_e",
+	"sspck",
+	"sspdi",
+	"sspdo",
+	"sspsyn",
+	"stat1",
+	"stat2",
+	"swclktck",
+	"swdiotms",
+	"sysclken",
+	"tdi",
+	"tdo",
+	"testmode",
+	"traceclk",
+	"tracedt00",
+	"tracedt01",
+	"tracedt02",
+	"tracedt03",
+	"tracedt04",
+	"tracedt05",
+	"tracedt06",
+	"tracedt07",
+	"trstb",
+	"txdata3g0",
+	"ubctsn",
+	"ubrtsn",
+	"ubrx",
+	"ubtx",
+	"tracedt08",
+	"tracedt09",
+	"tracedt10",
+	"tracedt11",
+	"tracedt12",
+	"tracedt13",
+	"tracedt14",
+	"tracedt15",
+};
+
+#define BCM21664_PIN_FUNCTION(fcn_name)			\
+{							\
+	.name = #fcn_name,				\
+	.groups = bcm21664_alt_groups,			\
+	.ngroups = ARRAY_SIZE(bcm21664_alt_groups),	\
+}
+
+static const struct bcm281xx_pin_function bcm21664_functions[] = {
+	BCM21664_PIN_FUNCTION(alt1),
+	BCM21664_PIN_FUNCTION(alt2),
+	BCM21664_PIN_FUNCTION(alt3),
+	BCM21664_PIN_FUNCTION(alt4),
+	BCM21664_PIN_FUNCTION(alt5),
+	BCM21664_PIN_FUNCTION(alt6),
+};
+
+static const struct regmap_config bcm21664_pinctrl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = BCM21664_WR_ACCESS_OFFSET,
+};
+
+static const struct bcm281xx_pinctrl_info bcm21664_pinctrl = {
+	.device_type = BCM21664_PINCTRL_TYPE,
+
+	.pins = bcm21664_pinctrl_pins,
+	.npins = ARRAY_SIZE(bcm21664_pinctrl_pins),
+	.functions = bcm21664_functions,
+	.nfunctions = ARRAY_SIZE(bcm21664_functions),
+
+	.regmap_config = bcm21664_pinctrl_regmap_config,
+};
+
+/* BCM21664 pinctrl access lock handlers */
+static int bcm21664_pinctrl_lock_all(struct bcm281xx_pinctrl_data *pdata)
+{
+	int i, rc;
+
+	for (i = 0; i < BCM21664_ACCESS_LOCK_COUNT; i++) {
+		rc = regmap_write(pdata->regmap, BCM21664_WR_ACCESS_OFFSET,
+				   BCM21664_WR_ACCESS_PASSWORD);
+		if (rc) {
+			dev_err(pdata->dev, "Failed to enable write access: %d\n",
+				rc);
+			return rc;
+		}
+		regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
+			     0xffffffff);
+		if (rc) {
+			dev_err(pdata->dev, "Failed to write access lock: %d\n",
+				rc);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int bcm21664_pinctrl_set_pin_lock(struct bcm281xx_pinctrl_data *pdata,
+					 unsigned int pin, bool lock)
+{
+	unsigned int access_lock = pin / 32;
+	int rc;
+
+	dev_dbg(pdata->dev,
+		"%s(): %s pin %s (%d)\n",
+		__func__, lock ? "Lock" : "Unlock", pdata->info->pins[pin].name,
+		pin);
+
+	rc = regmap_write(pdata->regmap, BCM21664_WR_ACCESS_OFFSET,
+			   BCM21664_WR_ACCESS_PASSWORD);
+	if (rc) {
+		dev_err(pdata->dev, "Failed to enable write access: %d\n",
+			rc);
+		return rc;
+	}
+
+	rc = regmap_update_bits(pdata->regmap,
+				BCM21664_ACCESS_LOCK_OFFSET(access_lock),
+				BIT(pin % 32),
+				(int)lock << (pin % 32));
+
+	if (rc) {
+		dev_err(pdata->dev, "Failed to %s pin: %d\n",
+			lock ? "lock" : "unlock", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
 						  unsigned int pin)
 {
@@ -1079,6 +1651,7 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	const struct bcm281xx_pin_function *f = &pdata->info->functions[function];
+	enum bcm281xx_pinctrl_type device_type = pdata->info->device_type;
 	unsigned int pin = pdata->info->pins[group].number;
 	u32 offset = 4 * pin;
 	int rc = 0;
@@ -1088,6 +1661,14 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 		__func__, f->name, function, pdata->info->pins[group].name,
 		pin, offset);
 
+	if (device_type == BCM21664_PINCTRL_TYPE) {
+		rc = bcm21664_pinctrl_set_pin_lock(pdata, pin, false);
+		if (rc) {
+			/* Error is printed in bcm21664_pinctrl_set_pin_lock */
+			return rc;
+		}
+	}
+
 	rc = regmap_update_bits(pdata->regmap, offset,
 		BCM281XX_PIN_REG_F_SEL_MASK,
 		function << BCM281XX_PIN_REG_F_SEL_SHIFT);
@@ -1096,6 +1677,14 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 			"Error updating register for pin %s (%d).\n",
 			pdata->info->pins[group].name, pin);
 
+	if (device_type == BCM21664_PINCTRL_TYPE) {
+		rc = bcm21664_pinctrl_set_pin_lock(pdata, pin, true);
+		if (rc) {
+			/* Error is printed in bcm21664_pinctrl_set_pin_lock */
+			return rc;
+		}
+	}
+
 	return rc;
 }
 
@@ -1300,6 +1889,68 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+/* Goes through the configs and update register val/mask */
+static int bcm21664_i2c_pin_update(struct pinctrl_dev *pctldev,
+				   unsigned int pin,
+				   unsigned long *configs,
+				   unsigned int num_configs,
+				   u32 *val,
+				   u32 *mask)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	int i;
+	enum pin_config_param param;
+	u32 arg;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		/*
+		 * BCM21664 I2C pins use the same config bits as standard pins,
+		 * but only pull up/none, slew rate and input enable/disable
+		 * options are supported.
+		 */
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			bcm281xx_pin_update(val, mask, 1,
+				BCM281XX_PIN_SHIFT(STD, PULL_UP),
+				BCM281XX_PIN_MASK(STD, PULL_UP));
+		break;
+
+		case PIN_CONFIG_BIAS_DISABLE:
+			bcm281xx_pin_update(val, mask, 0,
+				BCM281XX_PIN_SHIFT(STD, PULL_UP),
+				BCM281XX_PIN_MASK(STD, PULL_UP));
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			arg = (arg >= 1 ? 1 : 0);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(STD, SLEW),
+				BCM281XX_PIN_MASK(STD, SLEW));
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			/* inversed since register is for input _disable_ */
+			arg = (arg >= 1 ? 0 : 1);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(STD, INPUT_DIS),
+				BCM281XX_PIN_MASK(STD, INPUT_DIS));
+			break;
+
+		default:
+			dev_err(pctldev->dev,
+				"Unrecognized pin config %d for pin %s (%d).\n",
+				param, pdata->info->pins[pin].name, pin);
+			return -EINVAL;
+
+		} /* switch config */
+	} /* for each config */
+
+	return 0;
+}
+
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 				    unsigned int pin,
@@ -1351,6 +2002,7 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 					   unsigned int num_configs)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	enum bcm281xx_pinctrl_type device_type = pdata->info->device_type;
 	enum bcm281xx_pin_type pin_type;
 	u32 offset = 4 * pin;
 	u32 cfg_val, cfg_mask;
@@ -1368,8 +2020,12 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 		break;
 
 	case BCM281XX_PIN_TYPE_I2C:
-		rc = bcm281xx_i2c_pin_update(pctldev, pin, configs,
-			num_configs, &cfg_val, &cfg_mask);
+		if (device_type == BCM21664_PINCTRL_TYPE)
+			rc = bcm21664_i2c_pin_update(pctldev, pin, configs,
+				num_configs, &cfg_val, &cfg_mask);
+		else
+			rc = bcm281xx_i2c_pin_update(pctldev, pin, configs,
+				num_configs, &cfg_val, &cfg_mask);
 		break;
 
 	case BCM281XX_PIN_TYPE_HDMI:
@@ -1391,6 +2047,14 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 		"%s(): Set pin %s (%d) with config 0x%x, mask 0x%x\n",
 		__func__, pdata->info->pins[pin].name, pin, cfg_val, cfg_mask);
 
+	if (device_type == BCM21664_PINCTRL_TYPE) {
+		rc = bcm21664_pinctrl_set_pin_lock(pdata, pin, false);
+		if (rc) {
+			/* Error is printed in bcm21664_pinctrl_set_pin_lock */
+			return rc;
+		}
+	}
+
 	rc = regmap_update_bits(pdata->regmap, offset, cfg_mask, cfg_val);
 	if (rc) {
 		dev_err(pctldev->dev,
@@ -1399,6 +2063,14 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 		return rc;
 	}
 
+	if (device_type == BCM21664_PINCTRL_TYPE) {
+		rc = bcm21664_pinctrl_set_pin_lock(pdata, pin, true);
+		if (rc) {
+			/* Error is printed in bcm21664_pinctrl_set_pin_lock */
+			return rc;
+		}
+	}
+
 	return 0;
 }
 
@@ -1452,6 +2124,18 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 	bcm281xx_pinctrl_desc.pins = pdata->info->pins;
 	bcm281xx_pinctrl_desc.npins = pdata->info->npins;
 
+	/*
+	 * For BCM21664, lock all pins by default; they will be unlocked
+	 * as needed
+	 */
+	if (pdata->info->device_type == BCM21664_PINCTRL_TYPE) {
+		rc = bcm21664_pinctrl_lock_all(pdata);
+		if (rc) {
+			dev_err(&pdev->dev, "Failed to lock all pins\n");
+			return rc;
+		}
+	}
+
 	pctl = devm_pinctrl_register(&pdev->dev, &bcm281xx_pinctrl_desc, pdata);
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
@@ -1465,6 +2149,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id bcm281xx_pinctrl_of_match[] = {
 	{ .compatible = "brcm,bcm11351-pinctrl", .data = &bcm281xx_pinctrl },
+	{ .compatible = "brcm,bcm21664-pinctrl", .data = &bcm21664_pinctrl },
 	{ },
 };
 

-- 
2.48.1


