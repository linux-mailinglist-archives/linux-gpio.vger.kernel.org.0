Return-Path: <linux-gpio+bounces-34019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L0eOTogwWmTQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:12:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 461522F0F6A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19936312E83C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676C4397E93;
	Mon, 23 Mar 2026 11:02:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0F338838A;
	Mon, 23 Mar 2026 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263737; cv=none; b=RN6q2m5yB0xUDOfMKi1viU/cXc+5amvQfwFbyJ+N6hznSmTLdsdc5BDBH01fN8ZPYRF/449nOvhAZLPUJtxnYPwPxCszpN3M5sOO1laBsT2aU7LrZGtuIUVWAhXm9GHViJJAtPEruip4Ay9bp3+6dlZuwKgONSgxKIziox7BU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263737; c=relaxed/simple;
	bh=BdcEra9FbAB3SE5ZyznxdSUBQYhHbt1CSIJp0DdTRCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MON7eXG8tG0y33k4kINdSplsr1mHYy0SiSBpnMZLEVvKTT38bf9fwYX28jHWHqcnrmw2bcgea9M0ePLMe7rVSOE5WGd+XDV57LRgmSi6nRajwef/NCk1NSQyAWEDTLbeYZu/XvbmfiXNJAltrzsYNpv3pwBv5uEhbEehJVd+gJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37F6169E;
	Mon, 23 Mar 2026 04:02:08 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4FD23F73B;
	Mon, 23 Mar 2026 04:02:11 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] pinctrl: sunxi: a523: add missing IRQ bank (plus old DT workaround)
Date: Mon, 23 Mar 2026 12:01:51 +0100
Message-ID: <20260323110151.2352832-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323110151.2352832-1-andre.przywara@arm.com>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,csie.org,gmail.com,sholland.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34019-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 461522F0F6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Allwinner A532 SoC implements 10 GPIO banks, each of which is
interrupt capable. However the first bank (PortA) is skipped, so the
indicies of those banks range from 1 to 10, not 0 to 9.
We described the skipped bank correctly, but missed that for the IRQ
banks, where we rely on the IRQ bank index to be aligned with the MMIO
register offset, starting at 0x200.

Correct that by increasing the number of IRQ banks to 11, to cover both
the first skipped one, but also the last one (PortK). This fixes a bug
where the interrupt numbers would be off-by-one, due to that
mis-enumeration.
The big caveat is that now old DTs break the kernel, since they only
provide 10 interrupts, and the driver bails out entirely due to the last
missing one. So add a workaround for this particular case, where we
detect the requirement for 11 banks, but only 10 interrupts provided,
and continue with 10 IRQs, albeit emitting a warning about a DT update.
This would still be broken in terms of interrupt assignment, but it was
broken the whole time before, so it's not a regression.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 22 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index b6f78f1f30ac..a1d157de53d2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 6a86b7989b25..ffee79397590 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -19,6 +19,7 @@
 #include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -1582,6 +1583,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	struct sunxi_pinctrl *pctl;
 	struct pinmux_ops *pmxops;
 	int i, ret, last_pin, pin_idx;
+	int num_irq_banks;
 	struct clk *clk;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
@@ -1715,16 +1717,20 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		goto gpiochip_error;
 	}
 
-	pctl->irq = devm_kcalloc(&pdev->dev,
-				 pctl->desc->irq_banks,
-				 sizeof(*pctl->irq),
-				 GFP_KERNEL);
+	num_irq_banks = pctl->desc->irq_banks;
+	/* Workaround for old A523 DT, exposing one less interrupt. */
+	if (num_irq_banks == 11 && of_irq_count(node) < 11) {
+		num_irq_banks = 10;
+		pr_warn("Not enough PIO interrupts, please update your DT!\n");
+	}
+	pctl->irq = devm_kcalloc(&pdev->dev, num_irq_banks,
+				 sizeof(*pctl->irq), GFP_KERNEL);
 	if (!pctl->irq) {
 		ret = -ENOMEM;
 		goto gpiochip_error;
 	}
 
-	for (i = 0; i < pctl->desc->irq_banks; i++) {
+	for (i = 0; i < num_irq_banks; i++) {
 		pctl->irq[i] = platform_get_irq(pdev, i);
 		if (pctl->irq[i] < 0) {
 			ret = pctl->irq[i];
@@ -1733,7 +1739,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	}
 
 	pctl->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
-						pctl->desc->irq_banks * IRQ_PER_BANK,
+						num_irq_banks * IRQ_PER_BANK,
 						&sunxi_pinctrl_irq_domain_ops, pctl);
 	if (!pctl->domain) {
 		dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
@@ -1741,7 +1747,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		goto gpiochip_error;
 	}
 
-	for (i = 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
+	for (i = 0; i < (num_irq_banks * IRQ_PER_BANK); i++) {
 		int irqno = irq_create_mapping(pctl->domain, i);
 
 		irq_set_lockdep_class(irqno, &sunxi_pinctrl_irq_lock_class,
@@ -1751,7 +1757,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		irq_set_chip_data(irqno, pctl);
 	}
 
-	for (i = 0; i < pctl->desc->irq_banks; i++) {
+	for (i = 0; i < num_irq_banks; i++) {
 		/* Mask and clear all IRQs before registering a handler */
 		writel(0, pctl->membase +
 			  sunxi_irq_ctrl_reg_from_bank(pctl->desc, i));
-- 
2.43.0


