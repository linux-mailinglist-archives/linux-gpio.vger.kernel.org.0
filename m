Return-Path: <linux-gpio+bounces-11205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533199AA69
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 268821C2110C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 17:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8FC1C5798;
	Fri, 11 Oct 2024 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nzxG0d12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA541C32FE;
	Fri, 11 Oct 2024 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728668061; cv=none; b=LV8Jd2KKP12ramUWl2rK8NSwEyypi5FeWtJE5slIOOD/lcJ40JOgs+bsIq+vFKDJsiD5xVidi4VINIwZPPeOg1s9sMTzBqSm+qSmQgy2TIJgkVseZEdyyzuOyo5zb1l3uKveezJ0dGWiY9UEeyeyitsBeivlqZKvmlWXnmZYIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728668061; c=relaxed/simple;
	bh=KF6ZBghKX8r2+NHC4vx6iWGhrwimqzgmR2uLaghyfH4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W19JnW/2D847tgDNcZ2Dvf6jhs3MGJMPYMsFg/tPrB40BtL0cXQQ4ZQPu9IhrNErvcGVsS8FpnwHg92rUf08iVQit5prOc+xG5+nwDofsZysLifYQjvPtySUog6VdUhtAJLtLi5+xjm5KggrViqaEYwquWP9t2VR5JTSY6TZoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nzxG0d12; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BHYCSh067649;
	Fri, 11 Oct 2024 12:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728668052;
	bh=V6VP1ZzsW7RRkGy/B/5eBX9/lIviBXV4MVOevoK+6Qk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nzxG0d12U15LODfkroevrFRKxaag1mA9XcRZgepFNHdT6EzDQ60aEi/eKxUpdOaXN
	 B2PqU1S2zJlYgfyFwXH4xqlsj99iyqxMksx8RqiCJ8zfZnY6Xc81ehagMeB6bTBt2/
	 Bw0M+nIyKXTNR1gHtCVuIaSlba9PXi1W0Uv3d5KY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BHYCEA026887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 12:34:12 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 12:34:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 12:34:12 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BHY47D025973;
	Fri, 11 Oct 2024 12:34:12 -0500
From: Judith Mendez <jm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman
	<khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        <linux-serial@vger.kernel.org>, Judith Mendez <jm@ti.com>
Subject: [PATCH RESEND 1/2] gpio: omap: Add omap_gpio_disable/enable_irq calls
Date: Fri, 11 Oct 2024 12:33:55 -0500
Message-ID: <20241011173356.870883-2-jm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011173356.870883-1-jm@ti.com>
References: <20241011173356.870883-1-jm@ti.com>
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
2.47.0


