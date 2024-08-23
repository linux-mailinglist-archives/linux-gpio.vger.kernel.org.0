Return-Path: <linux-gpio+bounces-9040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF895C970
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B27E1F24193
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D90E14E2D6;
	Fri, 23 Aug 2024 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="U9MZIydU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m32112.qiye.163.com (mail-m32112.qiye.163.com [220.197.32.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524314C599;
	Fri, 23 Aug 2024 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406139; cv=none; b=q336pBS+t3HksK90jj1/jyuEsBegQWLtqihp6fSI8Op9rl67xQW7vUSFTkNuJG/9AxwWgc6vZZy/Gs0jiMpqrIYRFFLRjmokxSw8unlqghv6tH7CBEtt55evMkYOk+LyGfu0GqPS3Qf7Fa/oVMca4xjsvhV5AEhpG1VXH+CANPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406139; c=relaxed/simple;
	bh=GJh8uTmIZqGDAYcAhOsia98LpeOyGHuOpEaECHMKRCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GFaE2rAFKLB40aFVzteF5a3ra5GwMBFtkDLGoUHhYsojpIYd1hXtZQ0GmWBkIjHAZoY/fDjaCYfjjM8HAbmtzs+ad7TvOvhsGXnvhJxHYTtJyS4BxgcUEciiVbStBxjqiCAqnnRKTVR5PSgJ87G4I+a0HXPVqCgGoQtpsrLH8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=U9MZIydU; arc=none smtp.client-ip=220.197.32.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=U9MZIydUDcjO9xdJvBvlkI0qjkZordIUe5F8OiKfCHXK4rX6EDX6BnpGbE63FBVy9KckeE51U7OEyDt+7u5WiKeX06NJNeZDUxxkMritcWcUP/KqPoHUpDqv86Dl7mqHemop6eY39GJud+qeSFOBWGMhO0hTt5po8eki6cu7NJE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kmbOu81I/SivoswEU4k4vCo9LnH975Xko2P8NPDJNNA=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id D96197E03F1;
	Fri, 23 Aug 2024 11:45:07 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v2] gpio: rockchip: support new version gpio
Date: Fri, 23 Aug 2024 11:43:11 +0800
Message-Id: <20240823034314.62305-9-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9IHlZKGkwaShoZQ0xOTB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d5687fb09cfkunmd96197e03f1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6HTo*FDI2Hiw0NzYhTgII
	EjkaCzBVSlVKTElPSENPTEtCS0NKVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTU9JSzcG

The next version gpio controller on SoCs like rk3576 which support four
OS operation and four interrupts

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 40 ++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 25ddf6a82c09..5289c94d5c60 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -29,6 +29,7 @@
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
 #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
+#define GPIO_TYPE_V2_2		(0x010219C8)  /* GPIO Version ID 0x010219C8 */
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -78,7 +79,7 @@ static inline void rockchip_gpio_writel(struct rockchip_pin_bank *bank,
 {
 	void __iomem *reg = bank->reg_base + offset;
 
-	if (bank->gpio_type == GPIO_TYPE_V2)
+	if (bank->gpio_type >= GPIO_TYPE_V2)
 		gpio_writel_v2(value, reg);
 	else
 		writel(value, reg);
@@ -90,7 +91,7 @@ static inline u32 rockchip_gpio_readl(struct rockchip_pin_bank *bank,
 	void __iomem *reg = bank->reg_base + offset;
 	u32 value;
 
-	if (bank->gpio_type == GPIO_TYPE_V2)
+	if (bank->gpio_type >= GPIO_TYPE_V2)
 		value = gpio_readl_v2(reg);
 	else
 		value = readl(reg);
@@ -105,7 +106,7 @@ static inline void rockchip_gpio_writel_bit(struct rockchip_pin_bank *bank,
 	void __iomem *reg = bank->reg_base + offset;
 	u32 data;
 
-	if (bank->gpio_type == GPIO_TYPE_V2) {
+	if (bank->gpio_type >= GPIO_TYPE_V2) {
 		if (value)
 			data = BIT(bit % 16) | BIT(bit % 16 + 16);
 		else
@@ -126,7 +127,7 @@ static inline u32 rockchip_gpio_readl_bit(struct rockchip_pin_bank *bank,
 	void __iomem *reg = bank->reg_base + offset;
 	u32 data;
 
-	if (bank->gpio_type == GPIO_TYPE_V2) {
+	if (bank->gpio_type >= GPIO_TYPE_V2) {
 		data = readl(bit >= 16 ? reg + 0x4 : reg);
 		data >>= bit % 16;
 	} else {
@@ -204,18 +205,24 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	unsigned int cur_div_reg;
 	u64 div;
 
-	div_debounce_support = (bank->gpio_type == GPIO_TYPE_V2) && !IS_ERR(bank->db_clk);
+	div_debounce_support = (bank->gpio_type >= GPIO_TYPE_V2) && !IS_ERR(bank->db_clk);
 	if (debounce && div_debounce_support) {
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
 		div = (u64)(GENMASK(23, 0) + 1) * 1000000;
-		max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
+		if (bank->gpio_type == GPIO_TYPE_V2)
+			max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
+		else
+			max_debounce = DIV_ROUND_CLOSEST_ULL(div, 2 * freq);
 		if (debounce > max_debounce)
 			return -EINVAL;
 
 		div = (u64)debounce * freq;
-		div_reg = DIV_ROUND_CLOSEST_ULL(div, USEC_PER_SEC) - 1;
+		if (bank->gpio_type == GPIO_TYPE_V2)
+			div_reg = DIV_ROUND_CLOSEST_ULL(div, USEC_PER_SEC) - 1;
+		else
+			div_reg = DIV_ROUND_CLOSEST_ULL(div, USEC_PER_SEC / 2) - 1;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
@@ -401,7 +408,7 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	polarity = rockchip_gpio_readl(bank, bank->gpio_regs->int_polarity);
 
 	if (type == IRQ_TYPE_EDGE_BOTH) {
-		if (bank->gpio_type == GPIO_TYPE_V2) {
+		if (bank->gpio_type >= GPIO_TYPE_V2) {
 			rockchip_gpio_writel_bit(bank, d->hwirq, 1,
 						 bank->gpio_regs->int_bothedge);
 			goto out;
@@ -420,7 +427,7 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 				polarity |= mask;
 		}
 	} else {
-		if (bank->gpio_type == GPIO_TYPE_V2) {
+		if (bank->gpio_type >= GPIO_TYPE_V2) {
 			rockchip_gpio_writel_bit(bank, d->hwirq, 0,
 						 bank->gpio_regs->int_bothedge);
 		} else {
@@ -526,7 +533,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	}
 
 	gc = irq_get_domain_generic_chip(bank->domain, 0);
-	if (bank->gpio_type == GPIO_TYPE_V2) {
+	if (bank->gpio_type >= GPIO_TYPE_V2) {
 		gc->reg_writel = gpio_writel_v2;
 		gc->reg_readl = gpio_readl_v2;
 	}
@@ -648,13 +655,20 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
+	switch (id) {
+	case GPIO_TYPE_V2:
+	case GPIO_TYPE_V2_1:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
-	} else {
+		break;
+	case GPIO_TYPE_V2_2:
+		bank->gpio_regs = &gpio_regs_v2;
+		bank->gpio_type = GPIO_TYPE_V2_2;
+		break;
+	default:
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
+		pr_info("Note: Use default GPIO_TYPE_V1!\n");
 	}
 
 	return 0;
-- 
2.34.1


