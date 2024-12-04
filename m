Return-Path: <linux-gpio+bounces-13475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B249E33C7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612BD28489B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F6518A93F;
	Wed,  4 Dec 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1IMraVx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05D1E522
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295864; cv=none; b=coQRwOlT9OxvV1jOJJPCUeh8C81Umadu14lmUq9b23GMTzCo35B6zFdOeykrRVgl8SGpzT8USqQ9TV8qRMQ8cWx9kFBg2sAyaeDqBUfEW8KwUeNLU9OVXfYSLmE+6IzsZispzg1Q4KucU8pq5K0qKqNLgRB5Nm4yWH1i4DK7wiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295864; c=relaxed/simple;
	bh=oTm28+wJLGhZSbSWuuy1bWvXp3xSKNQYAdzo2iohfR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHQoJQzXMCAIsRLv4b9usE0s5+7LnfI5n5Oh7QtB4m/W5Wtzjty/PjxmD4W0MgH1CbpHs8+ByzxH7XHL1ImdhP3cHIUQCwpreOpZi62+Plg0rfFV4Aq18fVzR5M+CSpmr3ySCAyoxdG+eljZi4Qp7ozkh4Im1tglU1Dgwyk8r74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1IMraVx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295863; x=1764831863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTm28+wJLGhZSbSWuuy1bWvXp3xSKNQYAdzo2iohfR8=;
  b=W1IMraVxYtHHIDJOsaEc1Ifef0m4cq+g1ppwROdvSWffYp3g+UAJLNmh
   7GssFmXn0FYx5oOY8G67IYNRdFeoQ5wbzEhks7pZPZpwkqkbehNLe70ru
   LgllOqy6ldPY2GOdhSrsVx3GwkP0CrurGs9Ti1rRU1Zd2YjvmXLhETOoF
   XvB+KQHF1Aeto4zo2T6NfVbZ8fmssLOgRqJsJeTntIyvUo0remRqrTKFh
   R9I/P12p9PRLA/DVqXGEHGI9da4oj01ZFaY+4wTt6nM3fJlLwncqHU0Hs
   707RiI74guRTmvDU0mAxOroxb0acYZuIVZdPkf8dwrpJ+tI7DAmqmuBIp
   w==;
X-CSE-ConnectionGUID: rtahRGQUTqmbnQi5MeXnGg==
X-CSE-MsgGUID: U1Hm8yNJTGiUOFvxffkkqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44022835"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44022835"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:21 -0800
X-CSE-ConnectionGUID: dnrwxPEBSdmiagRNY1+sPw==
X-CSE-MsgGUID: 5OYsGU4uTvOnJWm1YL28sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94104185"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 23:04:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2E6F31EC; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/7] gpio: graniterapids: Fix incorrect BAR assignment
Date: Wed,  4 Dec 2024 09:04:10 +0200
Message-ID: <20241204070415.1034449-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Base Address of vGPIO MMIO register is provided directly by the BIOS
instead of using offsets. Update address assignment to reflect this
change in driver.

Cc: stable@vger.kernel.org
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 9da2999dc30f..d2b542b536b6 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -32,7 +32,7 @@
 #define GNR_PINS_PER_REG 32
 #define GNR_NUM_REGS DIV_ROUND_UP(GNR_NUM_PINS, GNR_PINS_PER_REG)
 
-#define GNR_CFG_BAR		0x00
+#define GNR_CFG_PADBAR		0x00
 #define GNR_CFG_LOCK_OFFSET	0x04
 #define GNR_GPI_STATUS_OFFSET	0x20
 #define GNR_GPI_ENABLE_OFFSET	0x24
@@ -50,6 +50,7 @@
  * struct gnr_gpio - Intel Granite Rapids-D vGPIO driver state
  * @gc: GPIO controller interface
  * @reg_base: base address of the GPIO registers
+ * @pad_base: base address of the vGPIO pad configuration registers
  * @ro_bitmap: bitmap of read-only pins
  * @lock: guard the registers
  * @pad_backup: backup of the register state for suspend
@@ -57,6 +58,7 @@
 struct gnr_gpio {
 	struct gpio_chip gc;
 	void __iomem *reg_base;
+	void __iomem *pad_base;
 	DECLARE_BITMAP(ro_bitmap, GNR_NUM_PINS);
 	raw_spinlock_t lock;
 	u32 pad_backup[];
@@ -65,7 +67,7 @@ struct gnr_gpio {
 static void __iomem *gnr_gpio_get_padcfg_addr(const struct gnr_gpio *priv,
 					      unsigned int gpio)
 {
-	return priv->reg_base + gpio * sizeof(u32);
+	return priv->pad_base + gpio * sizeof(u32);
 }
 
 static int gnr_gpio_configure_line(struct gpio_chip *gc, unsigned int gpio,
@@ -292,6 +294,7 @@ static int gnr_gpio_probe(struct platform_device *pdev)
 	struct gnr_gpio *priv;
 	void __iomem *regs;
 	int irq, ret;
+	u32 offset;
 
 	priv = devm_kzalloc(dev, struct_size(priv, pad_backup, num_backup_pins), GFP_KERNEL);
 	if (!priv)
@@ -303,6 +306,10 @@ static int gnr_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
+	priv->reg_base = regs;
+	offset = readl(priv->reg_base + GNR_CFG_PADBAR);
+	priv->pad_base = priv->reg_base + offset;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -312,8 +319,6 @@ static int gnr_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request interrupt\n");
 
-	priv->reg_base = regs + readl(regs + GNR_CFG_BAR);
-
 	gnr_gpio_init_pin_ro_bits(dev, priv->reg_base + GNR_CFG_LOCK_OFFSET,
 				  priv->ro_bitmap);
 
-- 
2.45.2


