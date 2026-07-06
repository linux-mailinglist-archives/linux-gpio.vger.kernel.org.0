Return-Path: <linux-gpio+bounces-39545-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VPUOB8U4TGqXhwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39545-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 01:22:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE47164A8
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 01:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z+EMqEdu;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39545-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39545-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 710B43032F55
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 23:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F2B3E92B5;
	Mon,  6 Jul 2026 23:22:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45E3DD874
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 23:22:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380147; cv=none; b=rdjaHgQ54Op3OiYoCwcaWGUfhR+DBt7y5BPs3Kqdan/2C6yNjrsWHCxF0OyuQc3m4VO4my0N/HpVx4DFWSLNY0a4dtmuvuGFnPBS556ns6aXmDJ138Watr9mO0GFvFDCYE/bJD55g6x7WZU1MI/D9HQotn8uJydengaRynfDiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380147; c=relaxed/simple;
	bh=GstWAS9uUqU28IR79vW8q+7sgJRmPJ9gzV2HjjFOIVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OG1vMdHKxIcng0rXYV233op+rHrOKLXvuXwCCq9jnxurkHKgseRZSlCNCW2lH5Q++Sj6IuE0YSYGpvPv2Nc5PrgM7lIGA1EwfxczlA7Mn/5JNnl2OcEwsFqZpRq7+VlHM7xzERNzH0qbRA+hGHKk/jvH/4zjqDs8Pr0Ulj/8geM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+EMqEdu; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cace7da66eso33452845ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 16:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783380146; x=1783984946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HaoGqAArhfyoE1akQuRdmTkHXWVdhEZ6+mjxws6eIpw=;
        b=Z+EMqEduowmtE4xjoDpyUCM67HjvyO6che7Cn4uZsB70cuI3LQq2tco2is/sJzyQWY
         HriAuUsB/Bag12IaC97IDarLf7zdhW4X8lDgNNS+docAQGSkGvbVt4neU6MR+dP64ewy
         DNHTB7J4vYVQbUn/325VcqIwjQKftriJuKIBGPaxjx2iBvFruw7lZ6uhv3a4HK+5Zjk+
         /K2S9LXA05qLI7BZxgZ6BapUElEhITrdiuDP1QePYcv7xkLaIgzYE5Ap/Nv02fmBtqbD
         sIWG771WPAV3UfOSsG3U1E+BG+utocX5eQVz8pYVrkxyqSkliCinGVE8uYw/wXMBVHG4
         IMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783380146; x=1783984946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaoGqAArhfyoE1akQuRdmTkHXWVdhEZ6+mjxws6eIpw=;
        b=E+zWuVW/McPqwyu5Ax2rhPvhgQXrKyHUz3N3RzSF93RzpkUri3zTBgTj4GE2Y5Gy0X
         rrFETCZG5X5W72i21yhIBej4Xgf3ZIJQhdL/W4PW7KQw5bkEu51z3/yxPVsZjVmQIz6O
         mXUr3UmNegW4JbSmJXmGatwYeYZ/R//LYhaQfozl2HOfBbXu4ibvzD33hRDMp9Umr49V
         QhMSnMwEkiAN7NZRfu9iEa1MyR9o8OSmxggcBYL0BTHgiVT2ufXtN56ADzl7Gz/N0b2g
         DaAZ4rhXX2PkRsIEysqRVy+sHGyP1zPeM4EbyL/jhyrZTSkLGDHNeSuScGW8dR3gwgvl
         4Y7Q==
X-Gm-Message-State: AOJu0YyxLBqsXvWUErJQZTa6FFhKMXWMpXNp6o32kiG/wr/e9yXCFdSK
	5EkosY+OXm4GzSKO6TcduMZVllIeIqNKETF1hQdXXwS21cgcESCuBTvYS1xpkg==
X-Gm-Gg: AfdE7ck4+yqgmP+HBmePgQu3nBUzkOJUXw2PD6MCfRypMwuHHmVYAJh8y8IuUyRgbUz
	kB5tC9a+LN/owr/UphQYWIAtpc0nUB1z/XUuhbPjty7Fr0oE3O7UbzZMRg0CmrZrVd/vWdMz1QJ
	DD3pjRSOueTbrDNkSNfb0CIgV/IjALOvxP6nGhdBqYdiRRLw002m+iYM1Vs+Dsi2tTzaJG6T4dh
	UA5oNXRZT+SuFmutdS0GYp3lDxG+ujZo0DJ5Z6tVpqH8R4BSyom8ibamS0/t6S4KZ6JFmYkQTI8
	IVOcq4/7mOEilKWbpVUodLivSnDqNL0ss9F3r7cfVkAyLvX0VH42AjyY2mnVbr9FRoi0uWE3Aqu
	p1aMmD2j2ZmuSK9WQ0JSUWf3+PjJ85dEPqcArXqzFXWQfEHcAhXCj6tZsA+PcZogZce2tWME95R
	I8y+zHYhoXiDlLBdEJDkodsiUnq4zJUEv219o4kmdTcnqY+fbF+N1udqWrLUCl/z5dR64VjS28t
	cr7VFbciw==
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr31406515ad.29.1783380145676;
        Mon, 06 Jul 2026 16:22:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d474sm1582725ad.70.2026.07.06.16.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 16:22:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO chip and IRQ domain
Date: Mon,  6 Jul 2026 16:22:23 -0700
Message-ID: <20260706232223.774895-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39545-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:u.kleine-koenig@pengutronix.de,m:andy.shevchenko@gmail.com,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6BE47164A8

During driver removal, devres cleans up in LIFO order. The IRQ domain
was created and its devm cleanup action registered after
devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
chip was deregistered. If gpiod_to_irq() is called on a pin during
this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
irq_create_mapping().

Fix by moving the IRQ domain creation, devm cleanup action registration,
generic chip allocation, and chip type setup before
devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
first (preventing new IRQ mappings), then the IRQ domain is removed,
and finally mvchip is freed.

Fixes: 644ee70267a9 ("gpio: mvebu: fix irq domain leak")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: added Fixes tag
 drivers/gpio/gpio-mvebu.c | 133 +++++++++++++++++++-------------------
 1 file changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 5b4408fcc10b..d8105a05d261 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1250,6 +1250,59 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		BUG();
 	}
 
+	/* Some gpio controllers do not provide irq support */
+	if (have_irqs) {
+		mvchip->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
+							  ngpios,
+							  &irq_generic_chip_ops,
+							  NULL);
+		if (!mvchip->domain)
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "couldn't allocate irq domain %s (DT).\n",
+					     mvchip->chip.label);
+
+		err = devm_add_action_or_reset(&pdev->dev,
+					       mvebu_gpio_remove_irq_domain,
+					       mvchip->domain);
+		if (err)
+			return err;
+
+		err = irq_alloc_domain_generic_chips(
+		    mvchip->domain, ngpios, 2, np->name, handle_level_irq,
+		    IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0,
+		    IRQ_GC_INIT_NESTED_LOCK);
+		if (err)
+			return dev_err_probe(&pdev->dev, err,
+					     "couldn't allocate irq chips %s (DT).\n",
+					     mvchip->chip.label);
+
+		/*
+		 * NOTE: The common accessors cannot be used because of the
+		 * percpu access to the mask registers
+		 */
+		gc = irq_get_domain_generic_chip(mvchip->domain, 0);
+		gc->private = mvchip;
+		ct = &gc->chip_types[0];
+		ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+		ct->chip.irq_mask = mvebu_gpio_level_irq_mask;
+		ct->chip.irq_unmask = mvebu_gpio_level_irq_unmask;
+		ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
+		ct->chip.irq_set_wake = mvebu_gpio_set_wake_irq;
+		ct->chip.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+		ct->chip.name = mvchip->chip.label;
+
+		ct = &gc->chip_types[1];
+		ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		ct->chip.irq_ack = mvebu_gpio_irq_ack;
+		ct->chip.irq_mask = mvebu_gpio_edge_irq_mask;
+		ct->chip.irq_unmask = mvebu_gpio_edge_irq_unmask;
+		ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
+		ct->chip.irq_set_wake = mvebu_gpio_set_wake_irq;
+		ct->chip.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+		ct->handler = handle_edge_irq;
+		ct->chip.name = mvchip->chip.label;
+	}
+
 	err = devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
@@ -1262,71 +1315,21 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	/* Some gpio controllers do not provide irq support */
-	if (!have_irqs)
-		return 0;
-
-	mvchip->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), ngpios,
-						  &irq_generic_chip_ops, NULL);
-	if (!mvchip->domain) {
-		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
-			mvchip->chip.label);
-		return -ENODEV;
-	}
-
-	err = devm_add_action_or_reset(&pdev->dev, mvebu_gpio_remove_irq_domain,
-				       mvchip->domain);
-	if (err)
-		return err;
-
-	err = irq_alloc_domain_generic_chips(
-	    mvchip->domain, ngpios, 2, np->name, handle_level_irq,
-	    IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0, IRQ_GC_INIT_NESTED_LOCK);
-	if (err) {
-		dev_err(&pdev->dev, "couldn't allocate irq chips %s (DT).\n",
-			mvchip->chip.label);
-		return err;
-	}
-
-	/*
-	 * NOTE: The common accessors cannot be used because of the percpu
-	 * access to the mask registers
-	 */
-	gc = irq_get_domain_generic_chip(mvchip->domain, 0);
-	gc->private = mvchip;
-	ct = &gc->chip_types[0];
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
-	ct->chip.irq_mask = mvebu_gpio_level_irq_mask;
-	ct->chip.irq_unmask = mvebu_gpio_level_irq_unmask;
-	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
-	ct->chip.irq_set_wake = mvebu_gpio_set_wake_irq;
-	ct->chip.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
-	ct->chip.name = mvchip->chip.label;
-
-	ct = &gc->chip_types[1];
-	ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
-	ct->chip.irq_ack = mvebu_gpio_irq_ack;
-	ct->chip.irq_mask = mvebu_gpio_edge_irq_mask;
-	ct->chip.irq_unmask = mvebu_gpio_edge_irq_unmask;
-	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
-	ct->chip.irq_set_wake = mvebu_gpio_set_wake_irq;
-	ct->chip.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
-	ct->handler = handle_edge_irq;
-	ct->chip.name = mvchip->chip.label;
-
-	/*
-	 * Setup the interrupt handlers. Each chip can have up to 4
-	 * interrupt handlers, with each handler dealing with 8 GPIO
-	 * pins.
-	 */
-	for (i = 0; i < ARRAY_SIZE(mvchip->bank_irq); i++) {
-		int irq = platform_get_irq_optional(pdev, i);
-
-		if (irq < 0)
-			continue;
-		irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_handler,
-						 mvchip);
-		mvchip->bank_irq[i] = irq;
+	if (have_irqs) {
+		/*
+		 * Setup the interrupt handlers. Each chip can have up to 4
+		 * interrupt handlers, with each handler dealing with 8 GPIO
+		 * pins.
+		 */
+		for (i = 0; i < ARRAY_SIZE(mvchip->bank_irq); i++) {
+			int irq = platform_get_irq_optional(pdev, i);
+
+			if (irq < 0)
+				continue;
+			irq_set_chained_handler_and_data(irq,
+					mvebu_gpio_irq_handler, mvchip);
+			mvchip->bank_irq[i] = irq;
+		}
 	}
 
 	return 0;
-- 
2.55.0


