Return-Path: <linux-gpio+bounces-2229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B282D982
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 14:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1FB41C213B6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 13:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791C317559;
	Mon, 15 Jan 2024 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X15Egc+Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A58171B4;
	Mon, 15 Jan 2024 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-337984681bcso2402301f8f.1;
        Mon, 15 Jan 2024 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324105; x=1705928905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9V7UZnqkue/kYImmNIRkOX5Wuc2HyDkHG/tYBjmhPD0=;
        b=X15Egc+YobLumjDsZLj0/2aLtvtFercw8aPkTqvKmg6Ceu5HZppZEJC7LDy5SG4y80
         qjOjm6nOPnGr/KCjkQQ9CjhXr5hPi2nQSQSw5nEvfeeKwXb4sPcvwo7itLLEvbhTR8At
         zIPwARaY9TzSZIdM/Fp4yoeVSyjydz9MAQqg9NQN9J/gNKk7fpc1bEiLRVbhApD+S+YA
         U5uW+HCtDFAjsKsq8PGOum7LZOt+2VffuW0WBhYhpa0N0aLBHVMzLUrwmfNIENBukRDD
         AoEuoT4y1ep87w8muccmPelYayuxRtAJKFGkMx1Zuin9xbBruTAvytOgxfxPQKN1/V/6
         HY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324105; x=1705928905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V7UZnqkue/kYImmNIRkOX5Wuc2HyDkHG/tYBjmhPD0=;
        b=F1LGtM+lkp33wqUkEhVpVTQ4ReE1B/PkmfZh65ZSC0K3kg4CxZwblMm9vGNyoBfqnr
         gpot0N4vLToTWm28HjvcRYKEXV9KmCjuz6/3fNq294ZvDBeoGKgQK2N5Q4A4YEORrSlE
         E8jbcDKLsWd/nFlSYAe8ewMAaXcZRhEwf64ztFTPnOOcT3ZwLm/46KbNxibSFqNzWQL3
         OhfKrsbPJp7Y9uUK4n26vd8JOREydM9B2G0x4QIAjWDajdk25LEAKbiOQgdfkCHq7arV
         5XE9SHvOL+fP8NbR2RfgtLTGWYVp2vWAEClq5xTTiFV+no4IJEqAHJTYzsic21f3SRq3
         eDDA==
X-Gm-Message-State: AOJu0YwPh36ZhKYCeT1+MQDLWLC9uBrMCOxDy0+RF46vR/Lh0gJQ40FX
	niX0/lt98bEGb1N5fJFO5KI=
X-Google-Smtp-Source: AGHT+IEZpIBgfF+rRBEjwe+RKi18IbWgoRBn7/KAotQQJA4PhDwn0WYKubxQIbypm90gRl4l4gWnuQ==
X-Received: by 2002:a5d:550c:0:b0:337:3a10:675 with SMTP id b12-20020a5d550c000000b003373a100675mr3298721wrv.30.1705324104504;
        Mon, 15 Jan 2024 05:08:24 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3d67:232:2eec:2430])
        by smtp.gmail.com with ESMTPSA id d13-20020adfef8d000000b0033739c1da1dsm11843620wro.67.2024.01.15.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:08:24 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
Date: Mon, 15 Jan 2024 13:08:16 +0000
Message-Id: <20240115130817.88456-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the missing port pins P19 to P28 for RZ/Five SoC. These additional
pins provide expanded capabilities and are exclusive to the RZ/Five SoC.

Couple of port pins have different configuration and are not identical for
the complete port so introduce struct rzg2l_variable_pin_cfg to handle
such cases and introduce the PIN_CFG_VARIABLE macro. The actual pin config
is then assigned in rzg2l_pinctrl_get_variable_pin_cfg().

Add an additional check in rzg2l_gpio_get_gpioint() to only allow GPIO pins
which support interrupt facility.

While at define RZG2L_GPIO_PORT_PACK() using RZG2L_GPIO_PORT_SPARSE_PACK().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 213 +++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 066fcc515335..384d2ed12747 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -57,6 +57,8 @@
 #define PIN_CFG_IOLH_C			BIT(13)
 #define PIN_CFG_SOFT_PS			BIT(14)
 #define PIN_CFG_OEN			BIT(15)
+#define PIN_CFG_VARIABLE		BIT(16)
+#define PIN_CFG_NOGPIO_INT		BIT(17)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -76,17 +78,23 @@
 					 PIN_CFG_FILNUM | \
 					 PIN_CFG_FILCLKSEL)
 
-/*
- * n indicates number of pins in the port, a is the register index
- * and f is pin configuration capabilities supported.
- */
 #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(35, 28)
 #define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
 #define PIN_CFG_MASK			GENMASK(19, 0)
 
-#define RZG2L_GPIO_PORT_PACK(n, a, f)	((((1ULL << (n)) - 1) << 28) | \
-					 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
-					 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+/*
+ * m indicates the bitmap of supported pins, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)	(FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
+						 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
+						 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+
+/*
+ * n indicates number of pins in the port, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_PACK(n, a, f)	RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
 
 /*
  * BIT(63) indicates dedicated pin, p is the register index while
@@ -200,6 +208,18 @@ struct rzg2l_dedicated_configs {
 	u64 config;
 };
 
+/**
+ * struct rzg2l_variable_pin_cfg - pin data cfg
+ * @cfg: port pin configuration
+ * @port: port number
+ * @pin: port pin
+ */
+struct rzg2l_variable_pin_cfg {
+	u32 cfg:20;
+	u32 port:5;
+	u32 pin:3;
+};
+
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
 	const u64 *port_pin_configs;
@@ -208,6 +228,8 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
 	const struct rzg2l_hwcfg *hwcfg;
+	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
+	unsigned int n_variable_pin_cfg;
 };
 
 /**
@@ -243,6 +265,143 @@ struct rzg2l_pinctrl {
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
 
+#ifdef CONFIG_RISCV
+static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
+					      u64 pincfg,
+					      unsigned int port,
+					      u8 pin)
+{
+	unsigned int i;
+
+	for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
+		if (pctrl->data->variable_pin_cfg[i].port == port &&
+		    pctrl->data->variable_pin_cfg[i].pin == pin)
+			return (pincfg & ~PIN_CFG_VARIABLE) | pctrl->data->variable_pin_cfg[i].cfg;
+	}
+
+	return 0;
+}
+
+static const struct rzg2l_variable_pin_cfg r9a07g043f_variable_pin_cfg[] = {
+	{
+		.port = 20,
+		.pin = 0,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 6,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 7,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT
+	},
+	{
+		.port = 23,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 0,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_NOGPIO_INT,
+	},
+};
+#endif
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -1446,6 +1605,25 @@ static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(4, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(6, 0x22, RZG2L_MPXED_PIN_FUNCS),
+#ifdef CONFIG_RISCV
+	/* Below additional port pins (P19 - P28) are exclusively available on RZ/Five SoC only */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x06, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P19 */
+	RZG2L_GPIO_PORT_PACK(8, 0x07, PIN_CFG_VARIABLE),				/* P20 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x08, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P21 */
+	RZG2L_GPIO_PORT_PACK(4, 0x09, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+			     PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),				/* P22 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x3e, 0x0a, PIN_CFG_VARIABLE),			/* P23 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0b, PIN_CFG_VARIABLE),				/* P24 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_FILONOFF |
+				    PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_NOGPIO_INT),				/* P25 */
+	0x0,										/* P26 */
+	0x0,										/* P27 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0f, RZG2L_MPXED_PIN_FUNCS | PIN_CFG_NOGPIO_INT),	/* P28 */
+#endif
 };
 
 static const u64 r9a08g045_gpio_configs[] = {
@@ -1606,12 +1784,18 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						       PIN_CFG_IO_VMC_SD1)) },
 };
 
-static int rzg2l_gpio_get_gpioint(unsigned int virq, const struct rzg2l_pinctrl_data *data)
+static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
+	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
+	const struct rzg2l_pinctrl_data *data = pctrl->data;
+	u64 *pin_data = pin_desc->drv_data;
 	unsigned int gpioint;
 	unsigned int i;
 	u32 port, bit;
 
+	if (*pin_data & PIN_CFG_NOGPIO_INT)
+		return -EINVAL;
+
 	port = virq / 8;
 	bit = virq % 8;
 
@@ -1721,7 +1905,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	unsigned long flags;
 	int gpioint, irq;
 
-	gpioint = rzg2l_gpio_get_gpioint(child, pctrl->data);
+	gpioint = rzg2l_gpio_get_gpioint(child, pctrl);
 	if (gpioint < 0)
 		return gpioint;
 
@@ -1907,6 +2091,13 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 		if (i && !(i % RZG2L_PINS_PER_PORT))
 			j++;
 		pin_data[i] = pctrl->data->port_pin_configs[j];
+#ifdef CONFIG_RISCV
+		if (pin_data[i] & PIN_CFG_VARIABLE)
+			pin_data[i] = rzg2l_pinctrl_get_variable_pin_cfg(pctrl,
+									 pin_data[i],
+									 j,
+									 i % RZG2L_PINS_PER_PORT);
+#endif
 		pins[i].drv_data = &pin_data[i];
 	}
 
@@ -2058,6 +2249,10 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.n_port_pins = ARRAY_SIZE(r9a07g043_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common),
 	.hwcfg = &rzg2l_hwcfg,
+#ifdef CONFIG_RISCV
+	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
+#endif
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
-- 
2.34.1


