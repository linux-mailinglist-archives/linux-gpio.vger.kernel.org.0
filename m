Return-Path: <linux-gpio+bounces-13477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238B9E33CD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA0BB22FDB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9972188A3B;
	Wed,  4 Dec 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NC1qZTxK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A21189BA2
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295864; cv=none; b=bwk92VxyTvlLCBUzTJ1dCIDpYsgyrNYjw1zN7CNzLsGNOtE5EtemrNybvdZomJTLkSDPyp8b3LYocMlhFe+MCtnsvwAfkX39+tfQl2T+mumuDM8rjMxWz4yYKLUjm3IvrDuaCeVtdc5qddQ9oL+FLN99FU3dSUhEwDUfvFoTZmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295864; c=relaxed/simple;
	bh=y9aesYZIu8+NN2JItIOQ6+EFpGFSHMAEz0wiJUTYDLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvGZaTShPz9NAJwju7B5A4I8qKwHtT/tb7OPkYCvMnjHnHB3PxruX4BeIxfO+23Jlekq75JOjcTW+IrKwkEG8nC0ANG6E1U73kJpBN5PrrJmbBckhbIxuDPimrmAJGiollmz118CyXJWEYO2sspV/yTllJ/qqE9VkcEqua9xA+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NC1qZTxK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295863; x=1764831863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y9aesYZIu8+NN2JItIOQ6+EFpGFSHMAEz0wiJUTYDLs=;
  b=NC1qZTxKJBU9Avi5+BEj8Am/OfKcMucs7l+szbOk8ir3hd43Gb7/BzSa
   hD+JLsop79g9UZ99o2GBaIH2VZaHEL+sMgiXTYTjlJnqae777ixd9fMaE
   3WN3RtI7YX6zKyVH2aKvZg2GpWUCqEHyc7+gSY3gXGYeqzqL6sjyFjdD4
   8EReQJYZHIPhNDpOE9Ibn8v9HdQT5T1JfPVwjKTksKCfK3PMeEv5pjmRC
   WJ5lDJGcHwFOozH5BO4cC1is0V9MwPpRNZ0rW5o83Dba7WyKwA6osvYHT
   bl4esVgaS3aT3rJbm4w9Iw2tZmtDUoKysWkXx9WkXShJzT7fd9p/JJWMa
   A==;
X-CSE-ConnectionGUID: 5hF1TBwiSw+9deosGoW48g==
X-CSE-MsgGUID: 5cIvgq1ORx+aFwMB+Fkapw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44573912"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44573912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:22 -0800
X-CSE-ConnectionGUID: GX292Ts3TTqX37yNsXPCdA==
X-CSE-MsgGUID: +FWf/uO4QBOEcYKnH8lYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93540788"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2024 23:04:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 57F83AAF; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/7] gpio: graniterapids: Check if GPIO line can be used for IRQs
Date: Wed,  4 Dec 2024 09:04:14 +0200
Message-ID: <20241204070415.1034449-7-mika.westerberg@linux.intel.com>
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

GPIO line can only be used as interrupt if its INTSEL register is
programmed by the BIOS.

Cc: stable@vger.kernel.org
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index b12abe77299c..3a972d460fe2 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -39,6 +39,7 @@
 
 #define GNR_CFG_DW_HOSTSW_MODE	BIT(27)
 #define GNR_CFG_DW_RX_MASK	GENMASK(23, 22)
+#define GNR_CFG_DW_INTSEL_MASK	GENMASK(21, 14)
 #define GNR_CFG_DW_RX_DISABLE	FIELD_PREP(GNR_CFG_DW_RX_MASK, 2)
 #define GNR_CFG_DW_RX_EDGE	FIELD_PREP(GNR_CFG_DW_RX_MASK, 1)
 #define GNR_CFG_DW_RX_LEVEL	FIELD_PREP(GNR_CFG_DW_RX_MASK, 0)
@@ -227,10 +228,18 @@ static void gnr_gpio_irq_unmask(struct irq_data *d)
 static int gnr_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	irq_hw_number_t pin = irqd_to_hwirq(d);
-	u32 mask = GNR_CFG_DW_RX_MASK;
+	struct gnr_gpio *priv = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 reg;
 	u32 set;
 
+	/* Allow interrupts only if Interrupt Select field is non-zero */
+	reg = readl(gnr_gpio_get_padcfg_addr(priv, hwirq));
+	if (!(reg & GNR_CFG_DW_INTSEL_MASK)) {
+		dev_dbg(gc->parent, "GPIO %lu cannot be used as IRQ", hwirq);
+		return -EPERM;
+	}
+
 	/* Falling edge and level low triggers not supported by the GPIO controller */
 	switch (type) {
 	case IRQ_TYPE_NONE:
@@ -248,7 +257,7 @@ static int gnr_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	return gnr_gpio_configure_line(gc, pin, mask, set);
+	return gnr_gpio_configure_line(gc, hwirq, GNR_CFG_DW_RX_MASK, set);
 }
 
 static const struct irq_chip gnr_gpio_irq_chip = {
-- 
2.45.2


