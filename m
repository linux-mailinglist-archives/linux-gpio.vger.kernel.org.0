Return-Path: <linux-gpio+bounces-11152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54D9991C0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61795B2C524
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7BE1F9415;
	Thu, 10 Oct 2024 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CClMj6B2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344CA1CCEF0;
	Thu, 10 Oct 2024 18:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586092; cv=none; b=UwjUmRO7/FCm/OejJLqvEPGvSffdoq1wLIeG3a6mWzdEalam8I+4HH7U/+7LPw9nd95ku0RxdeMdzW9if79omXAvYuBP7vgW6P+A7QCUThruhB9+8k2+xrshCkg8PzfmEpEGowRGcP4mc3bMNCnXrPRKUqLlSwalwF21FJpVJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586092; c=relaxed/simple;
	bh=rVs/x1nW5y5E02eDKW19widwQMyZidPFRKO5xxCOYXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kry9A5b1tUejUXeGs66cHeUAv7pwHtzwRg5HCA3uNC62XnB0kdozjMnYSId+bAXsXF2aam22WKLpcVEuE3whHfKiK8o1qxbDkJ3vnp6O2cRxYhou4Uxm40J3G7kBOSpfo6mjSZKyzQfZISQpuUXapOdVCOQu4SF+IlbGaWaCX24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CClMj6B2; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm5Z9043204;
	Thu, 10 Oct 2024 13:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728586085;
	bh=zreHdl0cfG0rVv3V60tqUKsMzXSQgflZP2SfbVfAAOU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CClMj6B26IPXaQwedE4pwwYrVRDMSEVx9F2uLpU7R1eqxGBAwLLIikUs9nfHzjGZb
	 gbtk+PVn3+jd642bnhFr9MWyu2rKAbPjJVXRWEO9d9c7kotja/sypEJA1vdUDlrV4a
	 muD7ug0z55LZjO0SFxuJY6lsZ5qQkzB6XtXaT3HU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49AIm5A0118459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2024 13:48:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 13:48:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 13:48:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm3V9011182;
	Thu, 10 Oct 2024 13:48:05 -0500
From: Judith Mendez <jm@ti.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        Judith Mendez
	<jm@ti.com>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 1/2] gpio: omap: Add omap_gpio_disable/enable_irq calls
Date: Thu, 10 Oct 2024 13:48:01 -0500
Message-ID: <20241010184802.203441-2-jm@ti.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241010184802.203441-1-jm@ti.com>
References: <20241010184802.203441-1-jm@ti.com>
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
case of a irq storm, so add omap_gpio_disable_irq
so that interrupts can be disabled/enabled.

Signed-off-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/gpio/gpio-omap.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 76d5d87e9681..913e6ece1238 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -711,6 +711,31 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 }
 
+static void omap_gpio_set_irq(struct irq_data *d, bool enable)
+{
+	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	unsigned int offset = d->hwirq;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&bank->lock, flags);
+	omap_set_gpio_irqenable(bank, offset, enable);
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+}
+
+static void omap_gpio_disable_irq(struct irq_data *d)
+{
+	bool enable = 1;
+
+	omap_gpio_set_irq(d, !enable);
+}
+
+static void omap_gpio_enable_irq(struct irq_data *d)
+{
+	bool enable = 1;
+
+	omap_gpio_set_irq(d, enable);
+}
+
 static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
@@ -723,6 +748,8 @@ static const struct irq_chip omap_gpio_irq_chip = {
 	.irq_shutdown = omap_gpio_irq_shutdown,
 	.irq_mask = omap_gpio_mask_irq,
 	.irq_unmask = omap_gpio_unmask_irq,
+	.irq_disable = omap_gpio_disable_irq,
+	.irq_enable = omap_gpio_enable_irq,
 	.irq_set_type = omap_gpio_irq_type,
 	.irq_set_wake = omap_gpio_wake_enable,
 	.irq_bus_lock = omap_gpio_irq_bus_lock,
@@ -737,6 +764,8 @@ static const struct irq_chip omap_gpio_irq_chip_nowake = {
 	.irq_shutdown = omap_gpio_irq_shutdown,
 	.irq_mask = omap_gpio_mask_irq,
 	.irq_unmask = omap_gpio_unmask_irq,
+	.irq_disable = omap_gpio_disable_irq,
+	.irq_enable = omap_gpio_enable_irq,
 	.irq_set_type = omap_gpio_irq_type,
 	.irq_bus_lock = omap_gpio_irq_bus_lock,
 	.irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,
-- 
2.46.2


