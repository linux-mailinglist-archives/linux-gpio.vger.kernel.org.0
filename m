Return-Path: <linux-gpio+bounces-24691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDA4B2E997
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3BA1CC2B2B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BEA1E5B70;
	Thu, 21 Aug 2025 00:45:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC48B1F3B8A;
	Thu, 21 Aug 2025 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737156; cv=none; b=Hz9F5NWbCh7Lt1O6N1nPVtDOijomzHLLXTqJTFqFtGQZBesm8aMb2DpGIKeFIleKkAiKpIfqr+IoLtdghKocX7Tf8MIv3wqaR61l/PLIRTC67BXvOMQurRt20rj6Q9ihhFenGT81J63eYMMjt3Ol/HdzjvOMH7gIu3mMgkOqDMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737156; c=relaxed/simple;
	bh=hodFWYqXl/t11tpB2Zq69ofJ1fmBA3XOnXCDo2FDxFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=go2TkGbFEXkIznqCSn9t3233Rkt2ih+OqNtW21TR+Fi50uD/EIy/mhYdSH+7m/kNpNFhB13M8vHmTT2Lxbx2Gf4leRkb3sOwiGjmxW5hR5ySF7vPUX2si82F1jYgpda0dVcAOTO2NQBNeE2AD3QxQU3QlbXp86RZKDoQchTvbJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E75812FC;
	Wed, 20 Aug 2025 17:45:46 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AF953F63F;
	Wed, 20 Aug 2025 17:45:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 6/9] pinctrl: sunxi: add support for set/clear regs
Date: Thu, 21 Aug 2025 01:42:29 +0100
Message-ID: <20250821004232.8134-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner pinctrl/GPIO IP so far features just a single GPIO data
register, which holds the logic level for every output pin on each port.
To set or clear the level of a single pin, we need to do a
read/modify/write operation, which needs to be protected by a lock.

The new pinctrl IP introduced with the Allwinner A733 now supports two
extra registers, the value of which will be ORed in respectively NANDed
out from the current value when being written. This allows for lockless
single writes to set or clear GPIO pins.

Add support for this feature to the sunxi pinctrl code, by adding a quirk
bit and checking this when writing to the data register. If the new
registers are available, skip the lock and read/modify/write operation,
and just write the mask directly to the respective register.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 27 +++++++++++++++------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  3 +++
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index ff7c5439a458e..0d08c48b57b65 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -971,18 +971,21 @@ static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
 
-	raw_spin_lock_irqsave(&pctl->lock, flags);
-
-	val = readl(pctl->membase + reg);
-
-	if (value)
-		val |= mask;
-	else
-		val &= ~mask;
-
-	writel(val, pctl->membase + reg);
-
-	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+	if (pctl->flags & SUNXI_PINCTRL_HAS_SET_CLEAR_REGS) {
+		if (value)
+			writel(mask, pctl->membase + reg + DATA_SET_OFFSET);
+		else
+			writel(mask, pctl->membase + reg + DATA_CLR_OFFSET);
+	} else {
+		raw_spin_lock_irqsave(&pctl->lock, flags);
+		val = readl(pctl->membase + reg);
+		if (value)
+			val |= mask;
+		else
+			val &= ~mask;
+		writel(val, pctl->membase + reg);
+		raw_spin_unlock_irqrestore(&pctl->lock, flags);
+	}
 
 	return 0;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 2b9e93972a5d3..96f1cb9d6c89c 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -43,6 +43,8 @@
 #define MUX_REGS_OFFSET		0x0
 #define MUX_FIELD_WIDTH		4
 #define DATA_REGS_OFFSET	0x10
+#define DATA_SET_OFFSET			0x04
+#define DATA_CLR_OFFSET			0x08
 #define DATA_FIELD_WIDTH	1
 #define DLEVEL_REGS_OFFSET	0x14
 #define DLEVEL_FIELD_WIDTH	2
@@ -99,6 +101,7 @@
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 #define SUNXI_PINCTRL_NCAT3_REG_LAYOUT	BIT(11)
+#define SUNXI_PINCTRL_HAS_SET_CLEAR_REGS	BIT(12)
 
 #define PIO_NCAT3_POW_MOD_SEL_REG	0x040
 #define PIO_POW_MOD_SEL_REG		0x340
-- 
2.46.3


