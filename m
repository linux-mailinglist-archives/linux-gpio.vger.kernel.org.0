Return-Path: <linux-gpio+bounces-12381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8439B7D62
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 15:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A541C1C21990
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 14:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976FF1A262D;
	Thu, 31 Oct 2024 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gKb5sIjT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333B1A0BF3;
	Thu, 31 Oct 2024 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386631; cv=none; b=L1niVH0zDPyL/1JbxbXnbjc9l3CbahY2pWbEB2iQPCUyrkHz9wxajh9LlWZg6qDcKfHYGISyzMmy65ezQrbwXAV5+b7OlqwFB5muRpZfcuMQ2Andp59ZUVtAgQsWrlWsOMAOq4mqt3DjMNH6J/1VkBHrcPsWT09W8KtLsQ45Vjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386631; c=relaxed/simple;
	bh=Oy6TeBLIApre0Gsk9dKin2tfvWjYsksY1xGSRBNghAM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L2AM8J/RqveB63PLVI9wJMA/7U5UvYTNgb5Z8wqnuvsUuObSetMpivYGuuoSZlWu2aGNqDE2zPGqR/QGGshoktC1LH9ERCafNMJMk8/OMzXxmBgbGE4EUIfT7HNIXIxhXll5ZHiHFfl0NTsjtDP5LqFT/ttXjm/ppvNsTsyq6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gKb5sIjT; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49VEurke128209;
	Thu, 31 Oct 2024 09:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730386613;
	bh=BKjhwn4Gv97R5OwiT9w7pG03w1Yp30seDCZWiI44ed4=;
	h=From:To:CC:Subject:Date;
	b=gKb5sIjTfDpiNQLsTYW7e5nI/RRRe6C/J4qZQFZtKhQwnccE1ACWDEs2vFdOPwtEG
	 tfiuZ8tHUgVBdfNRqvb7XmqwBilcSTYS1i5BqrDGYQZ1plmZiYsdUHwkCfwMk8k5r/
	 sZsx3Jedx0DX9wlyZypMS8y9dkzBMrMoxrTv3Pfs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49VEur1o032678
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Oct 2024 09:56:53 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Oct 2024 09:56:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Oct 2024 09:56:52 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49VEuqc7045558;
	Thu, 31 Oct 2024 09:56:52 -0500
From: Judith Mendez <jm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bin Liu <b-liu@ti.com>, Judith Mendez
	<jm@ti.com>
Subject: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq calls
Date: Thu, 31 Oct 2024 09:56:52 -0500
Message-ID: <20241031145652.342696-1-jm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Bin Liu <b-liu@ti.com>

Add omap_gpio_disable_irq and omap_gpio_enable_irq
calls in gpio-omap.

Currently, kernel cannot disable gpio interrupts in
case of a irq storm, so add omap_gpio_disable/enable_irq
so that interrupts can be disabled/enabled.

Signed-off-by: Bin Liu <b-liu@ti.com>
[Judith: Add commit message]
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- Fix email header and commit message
Changes since v1 RESEND:
- split patch from series [0]
- Add disable/enable calls without wrapper functions
[0] https://lore.kernel.org/linux-omap/20241011173356.870883-1-jm@ti.com/

Tested on am335x BeagleBone Black
---
 drivers/gpio/gpio-omap.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 76d5d87e9681e..137aabada26f9 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -711,6 +711,28 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 }
 
+static void omap_gpio_disable_irq(struct irq_data *d)
+{
+	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	unsigned int offset = d->hwirq;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&bank->lock, flags);
+	omap_set_gpio_irqenable(bank, offset, 0);
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+}
+
+static void omap_gpio_enable_irq(struct irq_data *d)
+{
+	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	unsigned int offset = d->hwirq;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&bank->lock, flags);
+	omap_set_gpio_irqenable(bank, offset, 1);
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+}
+
 static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
@@ -723,6 +745,8 @@ static const struct irq_chip omap_gpio_irq_chip = {
 	.irq_shutdown = omap_gpio_irq_shutdown,
 	.irq_mask = omap_gpio_mask_irq,
 	.irq_unmask = omap_gpio_unmask_irq,
+	.irq_disable = omap_gpio_disable_irq,
+	.irq_enable = omap_gpio_enable_irq,
 	.irq_set_type = omap_gpio_irq_type,
 	.irq_set_wake = omap_gpio_wake_enable,
 	.irq_bus_lock = omap_gpio_irq_bus_lock,
@@ -737,6 +761,8 @@ static const struct irq_chip omap_gpio_irq_chip_nowake = {
 	.irq_shutdown = omap_gpio_irq_shutdown,
 	.irq_mask = omap_gpio_mask_irq,
 	.irq_unmask = omap_gpio_unmask_irq,
+	.irq_disable = omap_gpio_disable_irq,
+	.irq_enable = omap_gpio_enable_irq,
 	.irq_set_type = omap_gpio_irq_type,
 	.irq_bus_lock = omap_gpio_irq_bus_lock,
 	.irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,
-- 
2.47.0


