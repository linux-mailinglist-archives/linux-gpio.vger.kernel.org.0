Return-Path: <linux-gpio+bounces-12324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B4C9B701B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 23:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8921F21AD0
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 22:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03548217456;
	Wed, 30 Oct 2024 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GCA9x10E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4551CF5E0;
	Wed, 30 Oct 2024 22:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730329155; cv=none; b=IpRaMUeeJ4UYyX61Az0mQzYAZyumjz8Wt/N4lcim4zynwJiGFOT3oI48YsQ8TZ1wQ9S5+ymM2bS9GAXX7ifdqKmgW7Y8yPfdCgigklsxy32dzRej4rqiDoD0USPNPG2htY3Yh33F0d6NrNh0ApUeZNErNMw3qLmfF1v9QIHcU5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730329155; c=relaxed/simple;
	bh=1MzvB5yUlO0rY30H+j8fLPLIINPuVbLXh4qjNidexYs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TL+C9h/zLYF/tbvD6B7axLhIo0f56HrBW363PK1uEEbL5ZWVCkxy12d+bLR6jSOsShJN7rZ/H18E6qRfU00mq2PxB+bwtJ/Dt4r5wyih5nqNiOh0l/wuT2mMdtfabdNKiicgOHN1DQMZifvrukD/u7QW408HGNrkTN2HDROk86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GCA9x10E; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49UMx1dt107945;
	Wed, 30 Oct 2024 17:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730329141;
	bh=4ytvWiOQvLWl7zLeqbP754meWrgcjcPi8srBZ8kvprk=;
	h=From:To:CC:Subject:Date;
	b=GCA9x10Ea5z3bDwdxpF9sgrSAs063qNYL/SG4WodEtGHrwieCQOhBxaZP1z3/o5/T
	 KLT3pMUXCA5iGJr+R6jTzU6wSXZrpuQnB4oPMus6yv9k/4AY2yr0FKDVCxSEAQqryB
	 J7VBfxM/hMOGGIt8tifJYz9vWNDo3jmsRZPAYiQI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UMx0t9084597;
	Wed, 30 Oct 2024 17:59:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Oct 2024 17:59:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Oct 2024 17:59:00 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UMx0j2053988;
	Wed, 30 Oct 2024 17:59:00 -0500
From: Judith Mendez <jm@ti.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bin Liu <b-liu@ti.com>, Judith Mendez
	<jm@ti.com>
Subject: [PATCH v2] gpio: omap: Add omap_gpio_disable/enable_irq calls
Date: Wed, 30 Oct 2024 17:59:00 -0500
Message-ID: <20241030225900.59844-1-jm@ti.com>
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

Add omap_gpio_disable_irq and omap_gpio_enable_irq
calls in gpio-omap.

Currently, kernel cannot disable gpio interrupts in
case of a irq storm, so add omap_gpio_disable/enable_irq
so that interrupts can be disabled/enabled.

Signed-off-by: Bin Liu <b-liu@ti.com>
[Judith: Add commit message]
Signed-off-by: Judith Mendez <jm@ti.com>
---
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


