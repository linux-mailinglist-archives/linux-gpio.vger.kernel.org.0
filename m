Return-Path: <linux-gpio+bounces-18018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E13A71911
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D10917838C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9791FC7C5;
	Wed, 26 Mar 2025 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OP/gs54w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80CD1FBC89;
	Wed, 26 Mar 2025 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000017; cv=none; b=hwrb+Itr1r4l2f4slfIeJQ5GAMDCZVSFFCnGUn5eQFw0tfaF9J/ctUod8ScpT5FvP8wYLmwRD/INaOCovYDI0RuY3avbAJMlESTfYJ0iT5rdhHhCJDHH5uxskwAD/ec7dZT48amsc1B3ZQ0Uq1Mogfzz4OhtReOZmnvnlBwndQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000017; c=relaxed/simple;
	bh=o5hgzM4VQ5OJeGEXkCVX1VygAU/9FrnkB/FemZCGrts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtrCEzQE65i6gFvseZ9Ls0IsgKbpAyDBrW8iGahqVCHNH+8HJokQ+mm1PIgq8uHnTRG+fVhgzg8LBPRZDYUDMd3TNzyuZb9DJQmFA20I8zTQm7O4nrC86uwJXMmSg7HLxhixLUglayjGX/my3VnXAmD/jTNqlswGqeX5ivMbcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OP/gs54w; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac56756f6so2712934f8f.2;
        Wed, 26 Mar 2025 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000013; x=1743604813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6hfLsSuXXkQW+oQprMpqK3KHzdpSf8DxnzIWa6RWKI=;
        b=OP/gs54w5Z1Z+soZcS12XJrcEM2ELQGu9DScYlalcvnIIlyeEfGDycOsi+SY0JLPNB
         YBuJo5q583QX/GSzCwH25hqtF7YBO2CQMiYMmkGWr0lRFeGBbiYmCae4qR032R3MI/m+
         VDsZRY2X9OCP7HjUPuXxKZRJ9TRw1atH+NkcLVZNms1TjqFbizVzWc1hU67tmocJrHTD
         bdxtsnCooijKIOUIUk29fl3Vn6DJpecdMKka8esIjRYcuiONS2hcgF9cJlvvKeMD03lz
         i6rh71+e1xBJXdt5kph21eSVxb4X+NJPhEUun53eUtUUc0RKL+x4TZS+/kyhYRKFXatj
         HwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000013; x=1743604813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6hfLsSuXXkQW+oQprMpqK3KHzdpSf8DxnzIWa6RWKI=;
        b=F7isUU8tjSUpF7dk3HSblhCjJAzq9SRlBhOvcckb4UNJYNpjcvNTTg4CGD+1SPvTp7
         LLX1imvFi07saTld5u7rQXQwY67dVGXL6WPOp3tq6Mfd6INDenzMbOq+rNkS0QuMyRfA
         NU7UUQuLSihWq6rV+pb67GTbirChdmktAl9PFjB+Yw0Wl2GWnSv3/BX/A+9YesU7hCSY
         qLToi+f3a5Qi6vbNwGZbtc5sJGybUpn2O13LYpBj59ym0tme+kmP1HWFCd5kPzXQ1Ln3
         WZH//96uUi9nbwSsghxj976WDqxa7U97He+Eb859Cm2KQwSR7rF7c481kBJd/CIcd5RO
         +CRw==
X-Forwarded-Encrypted: i=1; AJvYcCUFKatmHLXoL6rEA6LaJ02qkHNU3aiM/QWfIw5lKVL/5MluEMGqNnsU8+8iuwRm2MQjkkYc+k5xtr7yV2FX@vger.kernel.org, AJvYcCV1nhF/1s03PozkmImGgzN6HTZYGAv74McNUVhCYGAkdRtCm3ciCVQ1OKDMIMt+D7TA6A9GHA9fn5MA@vger.kernel.org, AJvYcCVVS4RI7++P55el0xyOewPdlUrOeTLP6phZI9F4cEMlynNVtBtCtCfoOE0O5S9yzzsAiuwnbkqBgwMe@vger.kernel.org, AJvYcCVkKuEsLrYLW7LM5b492kta3ix8CK+KsSjlNU/BWaxn4u7DUHfdpOYhY3F9T8UpA/qLtP62b6nHJBfijQ==@vger.kernel.org, AJvYcCWXTZWYPUOdq0pdURqDH75HLwsOi++RtnstSwnbUNm7Ekf3GSqBXhvv6Tt4OSa01+3Av5zzF55HXnbF@vger.kernel.org, AJvYcCXzIMsMVMwD7p7kEOH7Lg6OlHHrgWL6b+YIsxe5j2ViLDB8eeNOYI/cS1JN/KCdWcYj3qjgmZewrJ7yfbJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxzueyocH0Vs/sAnK6B+vQIUYRZwPfxjaa7NwM+U6v6PoYqsFTe
	OrxeDh71SBIdm32Yw3A4RuzYQvcnaoWvTkV4joULxUJLC4ZcDAi7
X-Gm-Gg: ASbGncvKp9eS9Pz4/GEsKZrzaAoj3U3Fm4LmFOLEK7r56TOTPpRUquR4Mw0nSclqrqX
	BC5fqyUcoyRf/rqYxcgzPMeHTuB26DThwtYNrxrkIStb3tUS1ScZ7tIziumuMdzjLw7BHy7IYqn
	xwT7cB+ngNbRMt6ea1bb6ncG57hia60xxpPH5xOlnrB7KSbcyz2TNALDHN2RwiKsyTvztqSJlw9
	lAD0MDf97h6l0b+8dafT7Z9KjCwQilxMA6TxOm9iQvXsAyMs++Q9uTzGKbku/qgbBnAdoOifH1C
	bqhxoxd3aEWzzYJzemvthVnf7uQxGBG+0BE9cjh+MlfYuJmMxHJT2WmcFhfsjsrJhIuY
X-Google-Smtp-Source: AGHT+IE4qtcNDA9+68gnJpQW7sH+JjJZJUZhlD6D7jXeTF/bWc027ggNQ2cK9NDwA9P5cuQE+xB1mA==
X-Received: by 2002:a05:6000:2cd:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-3997f940ec2mr19210115f8f.53.1743000012657;
        Wed, 26 Mar 2025 07:40:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/15] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:42 +0000
Message-ID: <20250326143945.82142-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


