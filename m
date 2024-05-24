Return-Path: <linux-gpio+bounces-6600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15F8CE3CB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FC471C20BAD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5194986251;
	Fri, 24 May 2024 09:47:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC50885C62;
	Fri, 24 May 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544026; cv=none; b=bcRSIwtiXgP7aXHmwAHIekBMGJfMTV6twMlHd3YM+nIL88XvGY8uUxMKvRgBRtzWZV43E2YcgI5SsGKa/wdxpmxXA8yWafV0J50t5cql9ULv+RKEiW5q+QEMvFxhlQLqxDAp11fbOx0chPdOOUKA3q84v6Y2nbD/Ccy/LdgLjwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544026; c=relaxed/simple;
	bh=xi2Pre7oceyM5VEQFPwDht5MrgZJkgLhw/EXayxr/3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B11ZgfdFfqBBiFF7/jDIGRK1bJXtLmZOLAtI7791HATRVxYZZJJQksjCUzKQB/9pVqWiViZPAOz5mrQHEXfD8rjWiPYfY6JzQVrHeHJkGtcDVeo0aAyZ602X/mrYgddbK434cnhOp8QyGylS5T4x9JsVqix/QrR8V9FnC+SD/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="209538240"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 May 2024 18:46:58 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B181400720C;
	Fri, 24 May 2024 18:46:53 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
Date: Fri, 24 May 2024 10:45:57 +0100
Message-Id: <20240524094603.988-4-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the RZ/G2L SoC family, the direction of the Ethernet TXC/TX_CLK
signal is selectable to support an Ethernet PHY operating in either MII
or RGMII mode. By default, the signal is configured as an input and MII
mode is supported. The ETH_MODE register can be modified to configure
this signal as an output to support RGMII mode.

As this signal is by default an input, and can optionally be switched to
an output, it maps neatly onto an `output-enable` property in the device
tree.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 28 +++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 08c68b95e67f..2fc73c516024 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1016,6 +1016,23 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
+static int rzg2l_pin_to_oen_bit(const struct rzg2l_hwcfg *hwcfg, u32 caps, u32 port, u8 pin)
+{
+	if (!(caps & PIN_CFG_OEN) || pin > hwcfg->oen_max_pin)
+		return -EINVAL;
+
+	/*
+	 * We can determine which Ethernet interface we're dealing with from
+	 * the caps.
+	 */
+	if (caps & PIN_CFG_IO_VMC_ETH0)
+		return 0;
+	if (caps & PIN_CFG_IO_VMC_ETH1)
+		return 1;
+
+	return -EINVAL;
+}
+
 static int rzg3s_pin_to_oen_bit(const struct rzg2l_hwcfg *hwcfg, u32 caps, u32 port, u8 pin)
 {
 	u8 bit = pin * 2;
@@ -1608,7 +1625,7 @@ static const u64 r9a07g044_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(3, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x23, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(2, 0x25, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x26, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x27, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
@@ -1617,7 +1634,7 @@ static const u64 r9a07g044_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x2a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x2b, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(2, 0x2c, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
-	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(2, 0x2e, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(2, 0x2f, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(2, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
@@ -1641,13 +1658,13 @@ static const u64 r9a07g044_gpio_configs[] = {
 
 static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x10, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(5, 0x11, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
+	RZG2L_GPIO_PORT_PACK(5, 0x11, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(4, 0x12, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(4, 0x13, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(6, 0x14, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(5, 0x15, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(5, 0x16, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(5, 0x17, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
+	RZG2L_GPIO_PORT_PACK(5, 0x17, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1) | PIN_CFG_OEN),
 	RZG2L_GPIO_PORT_PACK(5, 0x18, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(4, 0x19, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
 	RZG2L_GPIO_PORT_PACK(5, 0x1a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
@@ -2633,6 +2650,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 		[RZG2L_IOLH_IDX_3V3] = 2000, 4000, 8000, 12000,
 	},
 	.iolh_groupb_oi = { 100, 66, 50, 33, },
+	.oen_max_pin = 0,
 };
 
 static const struct rzg2l_hwcfg rzg3s_hwcfg = {
@@ -2675,6 +2693,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.n_port_pins = ARRAY_SIZE(r9a07g043_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common),
 	.hwcfg = &rzg2l_hwcfg,
+	.pin_to_oen_bit = rzg2l_pin_to_oen_bit,
 #ifdef CONFIG_RISCV
 	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
 	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
@@ -2690,6 +2709,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common) +
 		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
 	.hwcfg = &rzg2l_hwcfg,
+	.pin_to_oen_bit = rzg2l_pin_to_oen_bit,
 };
 
 static struct rzg2l_pinctrl_data r9a08g045_data = {
-- 
2.39.2


