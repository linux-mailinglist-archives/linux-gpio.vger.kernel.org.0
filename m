Return-Path: <linux-gpio+bounces-8754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2059529DA
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 09:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED583283487
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 07:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7078B17B51A;
	Thu, 15 Aug 2024 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="eA2jhTkX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m12825.netease.com (mail-m12825.netease.com [103.209.128.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73717ADE3;
	Thu, 15 Aug 2024 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706839; cv=none; b=mo2aDL6GB42bzgCrJJj4eDMp9Xp3N5xHyDvle/Zmp9+Gzph6QKPks0IxyPpVKaHpe61/4VLPiQOFakaFw0KW61Dqk04+H+CMlYSsHZVBp6CAQSlsn7RfDkdytv+9x7DfeY8a9f0QEz7MWKClbAVJ0Tn52wAXa3iONhQfjr+MJVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706839; c=relaxed/simple;
	bh=VoRbN/s48AMBTkaFwXXMgL0E1Mh0+99AT0feOth3FNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=swqcdk6h30p2Y6cFCmQYHaYpzhPOx7WRWeVFgRCRCzNBf6kr2nxmf6KK+YNv5RYoUYuZd4YUhzDM9eYowTPb+5RaWn+RwJ2DH9mRKBcRIF5IokvRRgxOr2Zw6FeVmYx3NbcxubJ5GAPjkV7eGFYyzQml+6++M+aG7f8v3OHSpZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=eA2jhTkX; arc=none smtp.client-ip=103.209.128.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=eA2jhTkXEK2I35UrMAUN1eKbwUl4EfTpsKPp3eaqt0aRwm+PFk9lrlpdS1LdE2OdyEAtlumfYPvZT4V+1dfvDb1Iitka8nE/mYcNRGBjEHH269nJ+5tt1HKVQ1VACc506GzovN7q43anLpLxr925hhAy3DeopUsN987uf69gODw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/IZKyXbHMGPvjkG5x/AIclBs0OTUdOjwDmOWIhDPpKk=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id B983A7E04A3;
	Thu, 15 Aug 2024 15:17:24 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v1 5/5] rockchip: gpio: fix debounce config error
Date: Thu, 15 Aug 2024 15:16:51 +0800
Message-Id: <20240815071651.3645949-6-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhNGFZOTR5PQ04eSB1NThlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9154e600ff09cfkunmb983a7e04a3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6ESo*HjI2SEMrDigaKFYO
	KU8wCjpVSlVKTElITEtNSU9OQ09DVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTUhMTzcG

1. Prevent data from crossing boundaries
2. Support GPIO_TYPE_V2_2 debounce config
3. fix rockchip_gpio_set_config

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 42 ++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 03e949b0a344..186d8c750fce 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -84,7 +84,7 @@ static inline void rockchip_gpio_writel(struct rockchip_pin_bank *bank,
 {
 	void __iomem *reg = bank->reg_base + offset;
 
-	if (bank->gpio_type == GPIO_TYPE_V2)
+	if (bank->gpio_type >= GPIO_TYPE_V2)
 		gpio_writel_v2(value, reg);
 	else
 		writel(value, reg);
@@ -96,7 +96,7 @@ static inline u32 rockchip_gpio_readl(struct rockchip_pin_bank *bank,
 	void __iomem *reg = bank->reg_base + offset;
 	u32 value;
 
-	if (bank->gpio_type == GPIO_TYPE_V2)
+	if (bank->gpio_type >= GPIO_TYPE_V2)
 		value = gpio_readl_v2(reg);
 	else
 		value = readl(reg);
@@ -111,7 +111,7 @@ static inline void rockchip_gpio_writel_bit(struct rockchip_pin_bank *bank,
 	void __iomem *reg = bank->reg_base + offset;
 	u32 data;
 
-	if (bank->gpio_type == GPIO_TYPE_V2) {
+	if (bank->gpio_type >= GPIO_TYPE_V2) {
 		if (value)
 			data = BIT(bit % 16) | BIT(bit % 16 + 16);
 		else
@@ -132,7 +132,7 @@ static inline u32 rockchip_gpio_readl_bit(struct rockchip_pin_bank *bank,
 	void __iomem *reg = bank->reg_base + offset;
 	u32 data;
 
-	if (bank->gpio_type == GPIO_TYPE_V2) {
+	if (bank->gpio_type >= GPIO_TYPE_V2) {
 		data = readl(bit >= 16 ? reg + 0x4 : reg);
 		data >>= bit % 16;
 	} else {
@@ -209,19 +209,25 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	unsigned int cur_div_reg;
 	u64 div;
 
-	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
-		div_debounce_support = true;
+	div_debounce_support = (bank->gpio_type >= GPIO_TYPE_V2) && !IS_ERR(bank->db_clk);
+	if (debounce && div_debounce_support) {
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
-		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
+
+		div = (u64)(GENMASK(23, 0) + 1) * 1000000;
+		if (bank->gpio_type == GPIO_TYPE_V2)
+			max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
+		else
+			max_debounce = DIV_ROUND_CLOSEST_ULL(div, 2 * freq);
 		if ((unsigned long)debounce > max_debounce)
 			return -EINVAL;
 
-		div = debounce * freq;
-		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
-	} else {
-		div_debounce_support = false;
+		div = (u64)debounce * freq;
+		if (bank->gpio_type == GPIO_TYPE_V2)
+			div_reg = DIV_ROUND_CLOSEST_ULL(div, USEC_PER_SEC) - 1;
+		else
+			div_reg = DIV_ROUND_CLOSEST_ULL(div, USEC_PER_SEC / 2) - 1;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
@@ -284,10 +290,11 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				  unsigned long config)
 {
 	enum pin_config_param param = pinconf_to_config_param(config);
+	unsigned int debounce = pinconf_to_config_argument(config);
 
 	switch (param) {
 	case PIN_CONFIG_INPUT_DEBOUNCE:
-		rockchip_gpio_set_debounce(gc, offset, true);
+		rockchip_gpio_set_debounce(gc, offset, debounce);
 		/*
 		 * Rockchip's gpio could only support up to one period
 		 * of the debounce clock(pclk), which is far away from
@@ -416,7 +423,7 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	polarity = rockchip_gpio_readl(bank, bank->gpio_regs->int_polarity);
 
 	if (type == IRQ_TYPE_EDGE_BOTH) {
-		if (bank->gpio_type == GPIO_TYPE_V2) {
+		if (bank->gpio_type >= GPIO_TYPE_V2) {
 			rockchip_gpio_writel_bit(bank, d->hwirq, 1,
 						 bank->gpio_regs->int_bothedge);
 			goto out;
@@ -435,7 +442,7 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 				polarity |= mask;
 		}
 	} else {
-		if (bank->gpio_type == GPIO_TYPE_V2) {
+		if (bank->gpio_type >= GPIO_TYPE_V2) {
 			rockchip_gpio_writel_bit(bank, d->hwirq, 0,
 						 bank->gpio_regs->int_bothedge);
 		} else {
@@ -543,7 +550,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	}
 
 	gc = irq_get_domain_generic_chip(bank->domain, 0);
-	if (bank->gpio_type == GPIO_TYPE_V2) {
+	if (bank->gpio_type >= GPIO_TYPE_V2) {
 		gc->reg_writel = gpio_writel_v2;
 		gc->reg_readl = gpio_readl_v2;
 	}
@@ -632,10 +639,13 @@ static void rockchip_gpio_get_ver(struct rockchip_pin_bank *bank)
 	switch (id) {
 	case GPIO_TYPE_V2:
 	case GPIO_TYPE_V2_1:
-	case GPIO_TYPE_V2_2:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		break;
+	case GPIO_TYPE_V2_2:
+		bank->gpio_regs = &gpio_regs_v2;
+		bank->gpio_type = GPIO_TYPE_V2_2;
+		break;
 	default:
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
-- 
2.34.1


