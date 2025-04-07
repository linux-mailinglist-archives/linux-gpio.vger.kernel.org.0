Return-Path: <linux-gpio+bounces-18394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807AA7ED54
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3371E1884356
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D25F258CEE;
	Mon,  7 Apr 2025 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETnoPFhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0F2580FA;
	Mon,  7 Apr 2025 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053416; cv=none; b=NgIYKhxgfAnjF2TB2EpDdsgR8f1sz1am3+ABWj1qXHqEaIrfREIByJiQsDcf1BjPK0tN/ZyJPIyZsz/U1I7bjMKop/HS6vlKWZaongAT72ksydtaJaNTDqQAqiEUZgvYwjCpZkQQtE7OVUOIqGdL1tei8y6Nb4xCceA8LnunzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053416; c=relaxed/simple;
	bh=YUgtdkCswpmcmSLt8cbM6c9IsNrvF/hy6GF1DInSUvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5JZZ5VxMektLtIVKNWf5CarstOqprGineLpAGYbHcIK7d+h6P/6Xhq81ucnbPliYyusT1z9ZMarerdLGw/4cVlBUhbT1NeJ1LFZeR53raHUvu+ash3wkq8aJk5z+XC1qTYLlXmce82yhDiPop+Y1QnZxnsWTghYLqw9jKg91mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETnoPFhC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so2938073f8f.0;
        Mon, 07 Apr 2025 12:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053413; x=1744658213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HVqosNrSIW/pKBI7Ggnwy8rlAyo8lRrabHAPvILChA=;
        b=ETnoPFhCEGrMwlqG0gA8MTkQbH/C7TP4Qunfs3jRLBkIMJtXDZ9tIRuU2C2Pe6q8R4
         vvQlrUEa9uzWL2jha8mlxHXgN/KZxLuIN0KYEF7vNFr/L/qf9/ljIkDGuz9vNKNM22MY
         ws7YAtQvbkDaSC9HQ9cQYhGOj24iWY95iOYHubWz0HdA74yqHFp45YCEPBES8ca80qOS
         fEv2unbFVttpZ39XhF4JU4nAihAj2muGzn+yLvi/bIswhRcvnHN90wWzAbUlnkTRzK8A
         e1b8niE4IM93gFwmXx+/9113LkteOycTTDTQd5OlekW2kBDsmU7O/exyhtuaq9UAaAZD
         j5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053413; x=1744658213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HVqosNrSIW/pKBI7Ggnwy8rlAyo8lRrabHAPvILChA=;
        b=gXz3kcvtroKqRhA7Yptb4pFin88aWmV3/eWFHJOLyxcI0n4M2zOWwwKmCy+9j1ifZE
         o3I/kr+4otmSqCQVjBQYA17ZazJ2TpxB8wS7FpcLaKLtUzn/6LRgpcTfC7tCGn2yRIh8
         wCFI2BqBnhUo0naPDnHNGriQUy+he1eAu/9fXwfgEpkhUERBJavaZ+Ac/kkk5TbS5yKm
         eeE43ZRzDQ3x0h8OsesrWI6Zb4RYXDRaIQ/mF6VxK5VbgzOTPxZwOl7u7tOadvmfOb4P
         Xl61TDFFdleBiAMydGDQajbXmRF9/12WXbcngcOpySqzMD2Pco6bSZZMXoMFgy/hzmB2
         K29g==
X-Forwarded-Encrypted: i=1; AJvYcCUrwpibANHs+ScCW4p9KRXKtzD+XiuB0owc1UuEBDMP93XTw8IVdMeYtxg8ZOg+s3N/1lss2kpqRgQHnkJp@vger.kernel.org, AJvYcCVDf/84qhAnho+7za5WFZga4PxZremsunlS64Q/tBGl9u+lrh8zLNtUzaRyNVQgw/s/AjlsjOII4SanjCYy@vger.kernel.org, AJvYcCW+JaEGZpFiPLeI2EuURgIj4uCjvLeuZ1Wk0jnQQZoyRxGW+hGaCvMyvxrJgHan5bsrHKdKFizC0HhZvg==@vger.kernel.org, AJvYcCW7zd0DozqeXdSlIz46W7wI2pzo8oliIN1UXChyCUDXA0nNuaDmpcBwV0Cczgtptgcf9kJctkaQWCab@vger.kernel.org, AJvYcCXuvrq5x9IkMi3EjF1hI2sPRicFSY7uKXTMAWOooMbdI7JpZsXQxGHmbcURt37wS7TNYGWgUnUMIqhN@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYmSIURIhK7qxj0261NaAeLgYaZltyu8rcshVtlIo6V4ptO2O
	IPgHc5gQcf68R2xtHJjmwG303fjGgJ9AlUphdWTXb1SCZ4gaj8cN
X-Gm-Gg: ASbGncvcZq8WkuKLj3MchOxXZj842XDDswKMl43dvC56winik2cYO7cf1qZNwQEfGwU
	Ebo3yeU7CIM4bgmd+acrhdK73UAWNFpJOCfRPO2XkeGsZs66rCT39e+bV27fcqGRTC2pnDuF5OF
	7uJ+oiEGXE6XCIwEAdzfV+hOL79dDtAqem2epamGU4zoc9wbwzdEQ/FAlqicYSfSBTQ013uWfFa
	dBSYoXqtV4gRKTfEKLoFOztFUw3PpXmr9z470XDc9ah9+SNlTtZ4yYtFE4H+aBVcHnFxzZNG+AA
	YczIvYOzU2BgwBqR5RASzvkNrFrDGrcT+IEcLnYj6+doMxYNhejwZddM2EhH/29ia0OxC2xFeqh
	0NGLz
X-Google-Smtp-Source: AGHT+IFKNaCP2JI5kKFbN2JYH16oEkn3RK5Xzyr/BQwUoLUTh0SYG5lOksCxM8yv2vJ3Sp9JEUUPHw==
X-Received: by 2002:a05:6000:2489:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39cb35aaaeamr11111784f8f.32.1744053413103;
        Mon, 07 Apr 2025 12:16:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 10/12] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
Date: Mon,  7 Apr 2025 20:16:26 +0100
Message-ID: <20250407191628.323613-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pinctrl support for the Renesas RZ/V2N SoC by reusing the existing
RZ/V2H(P) pin configuration data. The PFC block is nearly identical, with
the only difference being the absence of `PCIE1_RSTOUTB` on RZ/V2N.

To accommodate this, move the `PCIE1_RSTOUTB` entry to the end of the
`rzv2h_dedicated_pins` array and set `.n_dedicated_pins` to
`ARRAY_SIZE(rzv2h_dedicated_pins) - 1` in the RZ/V2N OF data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes in the code.
---
 drivers/pinctrl/renesas/Kconfig         |  1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 36 ++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 3c18d908b21e..e16034fc1bbf 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -42,6 +42,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_RZG2L if ARCH_RZG2L
 	select PINCTRL_RZV2M if ARCH_R9A09G011
 	select PINCTRL_RZG2L if ARCH_R9A09G047
+	select PINCTRL_RZG2L if ARCH_R9A09G056
 	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c72e250f4a15..ae5e040f3276 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2304,7 +2304,6 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
 	{ "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
 						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
 	{ "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
 	{ "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
 						     PIN_CFG_IEN | PIN_CFG_PUPD)) },
 	{ "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
@@ -2359,6 +2358,14 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
 	{ "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
 	{ "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
 	{ "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
+
+	/*
+	 * This pin is only available on the RZ/V2H(P) SoC and not on the RZ/V2N.
+	 * Since this array is shared with the RZ/V2N SoC, this entry should be placed
+	 * at the end. This ensures that on the RZ/V2N, we can set
+	 * `.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins) - 1,`.
+	 */
+	{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
 };
 
 static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
@@ -3349,6 +3356,29 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a09g056_data = {
+	.port_pins = rzv2h_gpio_names,
+	.port_pin_configs = r9a09g057_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g057_gpio_configs),
+	.dedicated_pins = rzv2h_dedicated_pins,
+	.n_port_pins = ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins) - 1,
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
 static struct rzg2l_pinctrl_data r9a09g057_data = {
 	.port_pins = rzv2h_gpio_names,
 	.port_pin_configs = r9a09g057_gpio_configs,
@@ -3389,6 +3419,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a09g047-pinctrl",
 		.data = &r9a09g047_data,
 	},
+	{
+		.compatible = "renesas,r9a09g056-pinctrl",
+		.data = &r9a09g056_data,
+	},
 	{
 		.compatible = "renesas,r9a09g057-pinctrl",
 		.data = &r9a09g057_data,
-- 
2.49.0


