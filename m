Return-Path: <linux-gpio+bounces-6980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A58D516D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104411C22EE0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACAA502BC;
	Thu, 30 May 2024 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAXPzksQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498BC57C84;
	Thu, 30 May 2024 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090977; cv=none; b=TNh9Pn8QS2TqFdjabc2DvXosim7kUAXGz6zqcFVaquOQcJFYkxBP0HJixZUnQuGZv6z5ltDN3pove52cDHyexCrdHTnP7OVEjapzgY20HHyjeW12QNSd8rNYJ/dASXNb00MdOxxDoQSqU0bvcKiVKMIY6vnQTDq9aDLawzjf5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090977; c=relaxed/simple;
	bh=gVWVZsKpT0nWbLoYbJXJJ/cV2iYVrLC6H8e/HXHIcb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i0Dih4xRqpqwAA6FpWtf80U0XeQP8TVriFe11ZIBWzzYC9gx9L48kLLDLxswYDC7Dw4E/LgkFYfrykLWiY2OPKGhBN3nPeUoTeFiPwxKYwAnnJgfH+swtawL4qFMOIkVs9bLT5VUUBI0y/PSNbpgIjFVQ4WqnzDrh+3J0ZcSoI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAXPzksQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f082d92864so9820895ad.1;
        Thu, 30 May 2024 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090974; x=1717695774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwVlV8lvjUVrmgldC6Ra3K9FRt5/wW/Kv6dJKvnIMwU=;
        b=OAXPzksQwDkDbR2AySp7Rz0vQc+dDR7yJ72Tn5Q1W74XxrzWUw/i7oWnn83ci6AnoQ
         8G86/UoZhfieB66xJ6WU0g6+OCKDEnlVb75INGG9JHtlUanTg29wOA2stNdLKjUl/lyi
         juUZj0FF3AzVi/mV8F3k1F2wpkf41obSoiaPLSxTtVJBxrKDNZjZsSbn1WJBywJyYttB
         pAYuE7jvbWefdKI6rgHyzCM6vPO/4ipEW2bVcT0os7OHEmZva1DkN8JFWUSyDiQ2b0Kd
         pj8n2tRwa4gTLIAR4laS994SpDdLBsWak+UNOtQh7uxuwn1aCWfi9jQ+bLs6M0Ta15ub
         qxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090974; x=1717695774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwVlV8lvjUVrmgldC6Ra3K9FRt5/wW/Kv6dJKvnIMwU=;
        b=SbHc9Ckr33+37VyXGP+8oGHz4RpCciLWeDUNafEtyscYX8EysvjgQp0c2yFRBil8hr
         8OsqPKpjIqgjKlRPkdchylSYyJZj+sy4qCFhUrsbjh5CR1NCgsmyDQWeRMGAo6w3O22u
         Rcp3N+GrRfVxr9Y5FjoR/Nmm9o/Qco35gi2BhRnUX+pzWi6w3SWYjWmZWDulqM43+Pr0
         gG2xV6+3Hnbeflz6Gf3Hut8CFf5E4rTpsjXS5hLS1YGbcobc4+J2Wt7uL0gFIe4PUAQw
         Bh0wum4MfpQCbND/Z1S3XN3ov0RT+bYHCIs7RqYUZRmiWEd6fGBQ4Kybmb6mYqqeBSbh
         VtAg==
X-Forwarded-Encrypted: i=1; AJvYcCVLU/TYjfGp6N4Qdi928pCa+ZbTfilLWtxuKOtns8bcatt716zYf8jc0ZljsBBE05q5KecXfhuQrg/U3zHlf9LNz95NFCwLFdLcgUdmtuyM8u+7UoqH2gmBpMgVwiGY08qm567AD6Ud3/0Rd456+2Ubamk3Uj/MTkaVUmyvl0KCSOBrXrs=
X-Gm-Message-State: AOJu0YwikhB5o948QkiH0Rj877sTZvKHbjYY3vQTI4UG+aLKudgeBd5N
	VfaEAB15nWYkPUoUS0vCmpomKOS9m/OrCGdSX9uolPJWpHnPqPcQ
X-Google-Smtp-Source: AGHT+IFf5j5/h7Teu1WqGsalLXHcK2EOUg0QatA7vbeht3sLp5FQYPSGDov5l63F9ygd3cVM5kMmeQ==
X-Received: by 2002:a17:902:ec87:b0:1f4:466f:8ca4 with SMTP id d9443c01a7336-1f619209d85mr33001615ad.0.1717090974386;
        Thu, 30 May 2024 10:42:54 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 15/15] pinctrl: renesas: pinctrl-rzg2l: Add support for RZ/V2H SoC
Date: Thu, 30 May 2024 18:38:57 +0100
Message-Id: <20240530173857.164073-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pinctrl driver support for RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Renamed PIN_CFG_OPEN_DRAIN->PIN_CFG_NOD
- Renamed PIN_CFG_SCHMIT_CTRL->PIN_CFG_SMT
- Introduced PWPR_REGWE_A instead of using PWPR_PFCWE
- Dropped using pwpr_lock
- Optimized rzv2h_pin_to_oen_bit()

RFC->v2
- Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
- Dropped IOLH groups
- Fixed dedicated pin configs
- Updated r9a09g057_variable_pin_cfg
- Added support OEN
- Added support for bias settings
- Added function pointers for pwpr (un)lock
- Added support for slew-rate
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 374 +++++++++++++++++++++++-
 1 file changed, 371 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2be088bbbd9f..46acdc3ffed9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -59,6 +59,10 @@
 #define PIN_CFG_OEN			BIT(15)
 #define PIN_CFG_VARIABLE		BIT(16)
 #define PIN_CFG_NOGPIO_INT		BIT(17)
+#define PIN_CFG_NOD			BIT(18)	/* N-ch Open Drain */
+#define PIN_CFG_SMT			BIT(19)	/* Schmitt-trigger input control */
+#define PIN_CFG_ELC			BIT(20)
+#define PIN_CFG_IOLH_RZV2H		BIT(21)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -73,6 +77,11 @@
 #define RZG3S_MPXED_PIN_FUNCS(group)	(RZG2L_MPXED_COMMON_PIN_FUNCS(group) | \
 					 PIN_CFG_SOFT_PS)
 
+#define RZV2H_MPXED_PIN_FUNCS		(RZG2L_MPXED_COMMON_PIN_FUNCS(RZV2H) | \
+					 PIN_CFG_NOD | \
+					 PIN_CFG_SR | \
+					 PIN_CFG_SMT)
+
 #define RZG2L_MPXED_ETH_PIN_FUNCS(x)	((x) | \
 					 PIN_CFG_FILONOFF | \
 					 PIN_CFG_FILNUM | \
@@ -135,6 +144,7 @@
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
 #define ETH_MODE		(0x3018)
+#define PFC_OEN			(0x3C40) /* known on RZ/V2H(P) only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -142,6 +152,8 @@
 
 #define PWPR_BOWI		BIT(7)	/* Bit Write Disable */
 #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
+#define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
+#define PWPR_REGWE_B		BIT(5)	/* OEN Register Write Enable, known only in RZ/V2H(P) */
 
 #define PM_MASK			0x03
 #define PFC_MASK		0x07
@@ -160,6 +172,19 @@
 #define RZG2L_TINT_IRQ_START_INDEX	9
 #define RZG2L_PACK_HWIRQ(t, i)		(((t) << 16) | (i))
 
+/* Custom pinconf parameters */
+#define RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE	(PIN_CONFIG_END + 1)
+
+static const struct pinconf_generic_params renesas_rzv2h_custom_bindings[] = {
+	{ "renesas,output-impedance", RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE, 1 },
+};
+
+#ifdef CONFIG_DEBUG_FS
+static const struct pin_config_item renesas_rzv2h_conf_items[] = {
+	PCONFDUMP(RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE, "output-impedance", "x", true),
+};
+#endif
+
 /* Read/write 8 bits register */
 #define RZG2L_PCTRL_REG_ACCESS8(_read, _addr, _val)	\
 	do {						\
@@ -352,6 +377,15 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+static const u64 r9a09g057_variable_pin_cfg[] = {
+	RZG2L_VARIABLE_PIN_CFG_PACK(11, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(11, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(11, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(11, 3, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(11, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(11, 5, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+};
+
 #ifdef CONFIG_RISCV
 static const u64 r9a07g043f_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(20, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
@@ -402,6 +436,17 @@ static void rzg2l_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset)
 	writeb(val, pctrl->base + offset);
 }
 
+static void rzv2h_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset)
+{
+	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
+	u8 pwpr;
+
+	pwpr = readb(pctrl->base + regs->pwpr);
+	writeb(pwpr | PWPR_REGWE_A, pctrl->base + regs->pwpr);
+	writeb(val, pctrl->base + offset);
+	writeb(pwpr & ~PWPR_REGWE_A, pctrl->base + regs->pwpr);
+}
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -1041,14 +1086,104 @@ static int rzg2l_bias_param_to_hw(enum pin_config_param param)
 	return -EINVAL;
 }
 
+static int rzv2h_hw_to_bias_param(unsigned int bias)
+{
+	switch (bias) {
+	case 0:
+	case 1:
+		return PIN_CONFIG_BIAS_DISABLE;
+	case 2:
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+	case 3:
+		return PIN_CONFIG_BIAS_PULL_UP;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int rzv2h_bias_param_to_hw(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		return 2;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		return 3;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, u32 offset)
+{
+	static const char * const pin_names[] = { "ET0_TXC_TXCLK", "ET1_TXC_TXCLK",
+						  "XSPI0_RESET0N", "XSPI0_CS0N",
+						  "XSPI0_CKN", "XSPI0_CKP" };
+	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pin_names); i++) {
+		if (!strcmp(pin_desc->name, pin_names[i]))
+			return i;
+	}
+
+	/* Should not happen. */
+	return 0;
+}
+
+static u32 rzv2h_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+{
+	u8 bit;
+
+	if (!(caps & PIN_CFG_OEN))
+		return 0;
+
+	bit = rzv2h_pin_to_oen_bit(pctrl, offset);
+
+	return !(readb(pctrl->base + PFC_OEN) & BIT(bit));
+}
+
+static int rzv2h_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+{
+	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
+	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
+	unsigned long flags;
+	u8 val, bit;
+	u8 pwpr;
+
+	if (!(caps & PIN_CFG_OEN))
+		return -EINVAL;
+
+	bit = rzv2h_pin_to_oen_bit(pctrl, offset);
+	spin_lock_irqsave(&pctrl->lock, flags);
+	val = readb(pctrl->base + PFC_OEN);
+	if (oen)
+		val &= ~BIT(bit);
+	else
+		val |= BIT(bit);
+
+	pwpr = readb(pctrl->base + regs->pwpr);
+	writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	writeb(val, pctrl->base + PFC_OEN);
+	writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
 {
 	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
+	u32 param = pinconf_to_config_param(*config);
 	u64 *pin_data = pin->drv_data;
 	unsigned int arg = 0;
 	u32 off;
@@ -1159,6 +1294,13 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 
+	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
+		if (!(cfg & PIN_CFG_IOLH_RZV2H))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, IOLH(off), bit, IOLH_MASK);
+		break;
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -1178,9 +1320,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	struct rzg2l_pinctrl_pin_settings settings = pctrl->settings[_pin];
 	u64 *pin_data = pin->drv_data;
-	enum pin_config_param param;
 	unsigned int i, arg, index;
-	u32 off;
+	u32 off, param;
 	u64 cfg;
 	int ret;
 	u8 bit;
@@ -1285,6 +1426,16 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, index);
 			break;
 
+		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
+			if (!(cfg & PIN_CFG_IOLH_RZV2H))
+				return -EINVAL;
+
+			arg = pinconf_to_config_argument(_configs[i]);
+			if (arg > 3)
+				return -EINVAL;
+			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, arg);
+			break;
+
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -1732,6 +1883,39 @@ static const u64 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(6, 0x2a, RZG3S_MPXED_PIN_FUNCS(A)),			/* P18 */
 };
 
+static const char * const rzv2h_gpio_names[] = {
+	"P00", "P01", "P02", "P03", "P04", "P05", "P06", "P07",
+	"P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17",
+	"P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27",
+	"P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37",
+	"P40", "P41", "P42", "P43", "P44", "P45", "P46", "P47",
+	"P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57",
+	"P60", "P61", "P62", "P63", "P64", "P65", "P66", "P67",
+	"P70", "P71", "P72", "P73", "P74", "P75", "P76", "P77",
+	"P80", "P81", "P82", "P83", "P84", "P85", "P86", "P87",
+	"P90", "P91", "P92", "P93", "P94", "P95", "P96", "P97",
+	"PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7",
+	"PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7",
+};
+
+static const u64 r9a09g057_gpio_configs[] = {
+	RZG2L_GPIO_PORT_PACK(8, 0x20, RZV2H_MPXED_PIN_FUNCS),	/* P0 */
+	RZG2L_GPIO_PORT_PACK(6, 0x21, RZV2H_MPXED_PIN_FUNCS),	/* P1 */
+	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_COMMON_PIN_FUNCS(RZV2H) |
+				      PIN_CFG_NOD),		/* P2 */
+	RZG2L_GPIO_PORT_PACK(8, 0x23, RZV2H_MPXED_PIN_FUNCS),	/* P3 */
+	RZG2L_GPIO_PORT_PACK(8, 0x24, RZV2H_MPXED_PIN_FUNCS),	/* P4 */
+	RZG2L_GPIO_PORT_PACK(8, 0x25, RZV2H_MPXED_PIN_FUNCS),	/* P5 */
+	RZG2L_GPIO_PORT_PACK(8, 0x26, RZV2H_MPXED_PIN_FUNCS |
+				      PIN_CFG_ELC),		/* P6 */
+	RZG2L_GPIO_PORT_PACK(8, 0x27, RZV2H_MPXED_PIN_FUNCS),	/* P7 */
+	RZG2L_GPIO_PORT_PACK(8, 0x28, RZV2H_MPXED_PIN_FUNCS |
+				      PIN_CFG_ELC),		/* P8 */
+	RZG2L_GPIO_PORT_PACK(8, 0x29, RZV2H_MPXED_PIN_FUNCS),	/* P9 */
+	RZG2L_GPIO_PORT_PACK(8, 0x2a, RZV2H_MPXED_PIN_FUNCS),	/* PA */
+	RZG2L_GPIO_PORT_PACK(6, 0x2b, PIN_CFG_VARIABLE),	/* PB */
+};
+
 static const struct {
 	struct rzg2l_dedicated_configs common[35];
 	struct rzg2l_dedicated_configs rzg2l_pins[7];
@@ -1858,6 +2042,138 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						       PIN_CFG_IO_VMC_SD1)) },
 };
 
+static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
+	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0, (PIN_CFG_FILONOFF | PIN_CFG_FILNUM |
+						PIN_CFG_FILCLKSEL)) },
+	{ "TMS_SWDIO", RZG2L_SINGLE_PIN_PACK(0x3, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_IEN)) },
+	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "WDTUDFCA", RZG2L_SINGLE_PIN_PACK(0x5, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_PUPD | PIN_CFG_NOD)) },
+	{ "WDTUDFCM", RZG2L_SINGLE_PIN_PACK(0x5, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_PUPD | PIN_CFG_NOD)) },
+	{ "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_PUPD)) },
+	{ "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_PUPD)) },
+	{ "XSPI0_CKP", RZG2L_SINGLE_PIN_PACK(0x7, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD | PIN_CFG_OEN)) },
+	{ "XSPI0_CKN", RZG2L_SINGLE_PIN_PACK(0x7, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD | PIN_CFG_OEN)) },
+	{ "XSPI0_CS0N", RZG2L_SINGLE_PIN_PACK(0x7, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						       PIN_CFG_PUPD | PIN_CFG_OEN)) },
+	{ "XSPI0_DS", RZG2L_SINGLE_PIN_PACK(0x7, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_PUPD)) },
+	{ "XSPI0_RESET0N", RZG2L_SINGLE_PIN_PACK(0x7, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							  PIN_CFG_PUPD | PIN_CFG_OEN)) },
+	{ "XSPI0_RSTO0N", RZG2L_SINGLE_PIN_PACK(0x7, 5, (PIN_CFG_PUPD)) },
+	{ "XSPI0_INT0N", RZG2L_SINGLE_PIN_PACK(0x7, 6, (PIN_CFG_PUPD)) },
+	{ "XSPI0_ECS0N", RZG2L_SINGLE_PIN_PACK(0x7, 7, (PIN_CFG_PUPD)) },
+	{ "XSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0x8, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0x8, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0x8, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0x8, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO4", RZG2L_SINGLE_PIN_PACK(0x8, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO5", RZG2L_SINGLE_PIN_PACK(0x8, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO6", RZG2L_SINGLE_PIN_PACK(0x8, 6, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "XSPI0_IO7", RZG2L_SINGLE_PIN_PACK(0x8, 7, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "SD0CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD0CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						   PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0RSTN", RZG2L_SINGLE_PIN_PACK(0x9, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD0DAT0", RZG2L_SINGLE_PIN_PACK(0xa, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT1", RZG2L_SINGLE_PIN_PACK(0xa, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT2", RZG2L_SINGLE_PIN_PACK(0xa, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT3", RZG2L_SINGLE_PIN_PACK(0xa, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT4", RZG2L_SINGLE_PIN_PACK(0xa, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT5", RZG2L_SINGLE_PIN_PACK(0xa, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT6", RZG2L_SINGLE_PIN_PACK(0xa, 6, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0DAT7", RZG2L_SINGLE_PIN_PACK(0xa, 7, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD1CLK", RZG2L_SINGLE_PIN_PACK(0xb, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "SD1CMD", RZG2L_SINGLE_PIN_PACK(0xb, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						   PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD1DAT0", RZG2L_SINGLE_PIN_PACK(0xc, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD1DAT1", RZG2L_SINGLE_PIN_PACK(0xc, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD1DAT2", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+	{ "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						    PIN_CFG_PUPD)) },
+	{ "ET0_RXCTL_RXDV", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_PUPD)) },
+	{ "ET0_TXCTL_TXEN", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_PUPD)) },
+	{ "ET0_TXER", RZG2L_SINGLE_PIN_PACK(0x10, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET0_RXER", RZG2L_SINGLE_PIN_PACK(0x10, 3, (PIN_CFG_PUPD)) },
+	{ "ET0_RXC_RXCLK", RZG2L_SINGLE_PIN_PACK(0x10, 4, (PIN_CFG_PUPD)) },
+	{ "ET0_TXC_TXCLK", RZG2L_SINGLE_PIN_PACK(0x10, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							   PIN_CFG_PUPD | PIN_CFG_OEN)) },
+	{ "ET0_CRS", RZG2L_SINGLE_PIN_PACK(0x10, 6, (PIN_CFG_PUPD)) },
+	{ "ET0_COL", RZG2L_SINGLE_PIN_PACK(0x10, 7, (PIN_CFG_PUPD)) },
+	{ "ET0_TXD0", RZG2L_SINGLE_PIN_PACK(0x11, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET0_TXD1", RZG2L_SINGLE_PIN_PACK(0x11, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET0_TXD2", RZG2L_SINGLE_PIN_PACK(0x11, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET0_TXD3", RZG2L_SINGLE_PIN_PACK(0x11, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET0_RXD0", RZG2L_SINGLE_PIN_PACK(0x11, 4, (PIN_CFG_PUPD)) },
+	{ "ET0_RXD1", RZG2L_SINGLE_PIN_PACK(0x11, 5, (PIN_CFG_PUPD)) },
+	{ "ET0_RXD2", RZG2L_SINGLE_PIN_PACK(0x11, 6, (PIN_CFG_PUPD)) },
+	{ "ET0_RXD3", RZG2L_SINGLE_PIN_PACK(0x11, 7, (PIN_CFG_PUPD)) },
+	{ "ET1_MDIO", RZG2L_SINGLE_PIN_PACK(0x12, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "ET1_MDC", RZG2L_SINGLE_PIN_PACK(0x12, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						     PIN_CFG_PUPD)) },
+	{ "ET1_RXCTL_RXDV", RZG2L_SINGLE_PIN_PACK(0x13, 0, (PIN_CFG_PUPD)) },
+	{ "ET1_TXCTL_TXEN", RZG2L_SINGLE_PIN_PACK(0x13, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_PUPD)) },
+	{ "ET1_TXER", RZG2L_SINGLE_PIN_PACK(0x13, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						       PIN_CFG_PUPD)) },
+	{ "ET1_RXER", RZG2L_SINGLE_PIN_PACK(0x13, 3, (PIN_CFG_PUPD)) },
+	{ "ET1_RXC_RXCLK", RZG2L_SINGLE_PIN_PACK(0x13, 4, (PIN_CFG_PUPD)) },
+	{ "ET1_TXC_TXCLK", RZG2L_SINGLE_PIN_PACK(0x13, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							   PIN_CFG_PUPD | PIN_CFG_OEN)) },
+	{ "ET1_CRS", RZG2L_SINGLE_PIN_PACK(0x13, 6, (PIN_CFG_PUPD)) },
+	{ "ET1_COL", RZG2L_SINGLE_PIN_PACK(0x13, 7, (PIN_CFG_PUPD)) },
+	{ "ET1_TXD0", RZG2L_SINGLE_PIN_PACK(0x14, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET1_TXD1", RZG2L_SINGLE_PIN_PACK(0x14, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET1_TXD2", RZG2L_SINGLE_PIN_PACK(0x14, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET1_TXD3", RZG2L_SINGLE_PIN_PACK(0x14, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+						      PIN_CFG_PUPD)) },
+	{ "ET1_RXD0", RZG2L_SINGLE_PIN_PACK(0x14, 4, (PIN_CFG_PUPD)) },
+	{ "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
+	{ "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
+	{ "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
+};
+
 static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
@@ -2394,6 +2710,9 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	BUILD_BUG_ON(ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzg2l_gpio_names));
 
+	BUILD_BUG_ON(ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT >
+		     ARRAY_SIZE(rzv2h_gpio_names));
+
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
@@ -2665,6 +2984,22 @@ static void rzg2l_pwpr_pfc_lock_unlock(struct rzg2l_pinctrl *pctrl, bool lock)
 	}
 }
 
+static void rzv2h_pwpr_pfc_lock_unlock(struct rzg2l_pinctrl *pctrl, bool lock)
+{
+	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
+	u8 pwpr;
+
+	if (lock) {
+		/* Set the PWPR register to be write-protected */
+		pwpr = readb(pctrl->base + regs->pwpr);
+		writeb(pwpr & ~PWPR_REGWE_A, pctrl->base + regs->pwpr);
+	} else {
+		/* Set the PWPR register to allow PFC and PMC register to write */
+		pwpr = readb(pctrl->base + regs->pwpr);
+		writeb(PWPR_REGWE_A | pwpr, pctrl->base + regs->pwpr);
+	}
+}
+
 static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
@@ -2710,6 +3045,12 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.oen_max_port = 7, /* P7_1 is the maximum OEN port. */
 };
 
+static const struct rzg2l_hwcfg rzv2h_hwcfg = {
+	.regs = {
+		.pwpr = 0x3c04,
+	},
+};
+
 static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.port_pins = rzg2l_gpio_names,
 	.port_pin_configs = r9a07g043_gpio_configs,
@@ -2763,6 +3104,29 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a09g057_data = {
+	.port_pins = rzv2h_gpio_names,
+	.port_pin_configs = r9a09g057_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g057_gpio_configs),
+	.dedicated_pins = rzv2h_dedicated_pins,
+	.n_port_pins = ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins),
+	.hwcfg = &rzv2h_hwcfg,
+	.variable_pin_cfg = r9a09g057_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a09g057_variable_pin_cfg),
+	.num_custom_params = ARRAY_SIZE(renesas_rzv2h_custom_bindings),
+	.custom_params = renesas_rzv2h_custom_bindings,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = renesas_rzv2h_conf_items,
+#endif
+	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzv2h_pmc_writeb,
+	.oen_read = &rzv2h_oen_read,
+	.oen_write = &rzv2h_oen_write,
+	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
+	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
+};
+
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 	{
 		.compatible = "renesas,r9a07g043-pinctrl",
@@ -2776,6 +3140,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a08g045-pinctrl",
 		.data = &r9a08g045_data,
 	},
+	{
+		.compatible = "renesas,r9a09g057-pinctrl",
+		.data = &r9a09g057_data,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.34.1


