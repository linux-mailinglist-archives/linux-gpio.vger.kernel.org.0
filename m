Return-Path: <linux-gpio+bounces-39688-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H2wgDwjYTmooVQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39688-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 01:06:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AE72B0A4
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 01:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dSkZZ2Zc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39688-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39688-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C2ED3022631
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 23:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AE238C2BF;
	Wed,  8 Jul 2026 23:06:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705092E03E4
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 23:06:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552003; cv=none; b=FZVJMAcL9ICzTxpmPPKXFjnyqwQ4RQhUcsAr5tWVyMWOa64/NXiAXjRtCf4mY8/+zz+mmFDfPRo4Expx57go0ddXGPC/YKQqCyk3rmnP0ig9mc7hr6oISLMK54k1KqAZzwVkLXeNu+6uxddjfnIta9uSaGSxLMDE/cw7Op1nf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552003; c=relaxed/simple;
	bh=Dq/BEaPpyXse6YJIaE+9YOnQYwwmWFF8p5SG5RYILp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJzX6TpN2HlnVVwpHWMQeL4Ewv0iQzdvWjJaPkvGEvxzi+1N+TvuKVBAatdXTHQb6glFg4EjQj0oK5F++7vo3be0WsZGWToD86uA4KWN8gFMPz45EimKl7MJcEk6+YKC4wUoy7UPTqkAy6l52l2iSv53Hn7rzaBzK6GAzt6ce8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSkZZ2Zc; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so5067285ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783552001; x=1784156801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysjwdPoK1hGsRN+QdIaN5LhEExFCurOB30bhsm98yNU=;
        b=dSkZZ2ZcuedIrdE0WsBgbzl4ZeosHqI43DnQtIOBJstRLi/1zkoKBvOdOFoEKR+Zhu
         E9ae/zKAmS1CgLcs7oHHvbb2dadHba4DT60m0EsN5ai80cij8KtCaed5hEm+5Gy3eYfL
         +kC3/yl+T8Tj2FfFs51nkzpHD5UJPWF9jDhn/WAGlLpMkd88B/jU3zsxn3V72dOBSw1y
         hbdc1XeRXBMCPoOZIf5UYZ158+odwpwbol5NlVXXDYH43Xg4NKTN1fvDvQysatVyuRrx
         kCjF8ttad+oaVcYWnuYfgnMwy/rWTp24CrVn6hoMQ8GI2HJgAoq7VaR/IAzRhVw5ZzNo
         pR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783552001; x=1784156801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysjwdPoK1hGsRN+QdIaN5LhEExFCurOB30bhsm98yNU=;
        b=d23GHZvf+EXSQOlUKA4jffjpGaDs4Zb6ECFnFeE1xX56U5I2HogqYD0Gkjp0rG5db9
         6C5k0ngzLH6t4DC2mF2ol9nkZ105HQVsJumUsZ0NwiEQWomJVIjY2+UKX/MdDrNr2bzI
         0p6XbVrjWk1YYvHAT4QImVBn07N4tQrFXNg4MruVlEOcKV2Mqq9ZgMI225yTeUlo4gHU
         8xZ1gRE/N1ckdCU+GGLn4DsTgiXybVrcqO3I5O+QLFYg6Yf7gyRIK+csLZ4qW7Hz/THp
         KdDTldYTPUkYsL23byixKIaR9IvdmWYLjF3XiekZ6lv9NBtrD5Y1kfymUIGTuuQKFczC
         blRw==
X-Gm-Message-State: AOJu0Yy1u2aGmBgkfxGMTAR2qKWvFKd54D5aS/Cs6wxH2/SOBR81VQPk
	LhDv7VB48hRYJ1bQImZflZrr2MGQB98nNutkE/5P1sa+bKHRCCPDVadGgjtNJg==
X-Gm-Gg: AfdE7clWL4nWWAdBeglFIZVuy6TUyfQ2sG8FLDvOni0sCEbACaHVNIgH9YU6yGkwast
	lQvnRFCgUb38lg3BxFLECU+m8r1KNIXnIsBya28in0rQ9vG9j6h/KEg7rN2Ch6s1ba6pKnT7Rkd
	el14sygM+mth3Tc41QbxiNyS6+JE6qLUyoBWN5a6nKVlObM+/z6ZdNo/+2izFQni4zCdq2ClQxb
	9yg4O1+oCFE2yQf/7KbgtMzQeti8WQVlYUENI/1l3jpQIstxV1PqKEdllE8e70ega9ompa5lyqr
	fCb0dZrqxLJKCZmufJ8GMxhSyePyBd2bozXIE/CVoKos+nPKoDMDdyeVdeFSIMlV/5M8FvEO51x
	vA5ZzCop+zcClrb0WNlGHOS2OSxcgbrCm7Ocaks6Jqn9FJVo7B13HfWMkLgeEG4TDK6PtJmSwfk
	Ta+NIL2YFyyhGSDDjlWo7afDbQA4DugcsyJNKD2bHiFN3axA8a4CbAUNaQmHbH5xAvqNRuMz/4r
	yaxpe6IeB7/oLvKllbJM4V9XA4XBJ7LVqzf0rD4bgUXZ/fXNt5Isx1yZtGPeIRnWQ==
X-Received: by 2002:a17:903:2350:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2cdd8a7e8f0mr3176385ad.8.1783552000727;
        Wed, 08 Jul 2026 16:06:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea74sm34037815ad.41.2026.07.08.16.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:06:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO chip and IRQ domain
Date: Wed,  8 Jul 2026 16:06:38 -0700
Message-ID: <20260708230638.1041426-1-rosenp@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39688-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:thomas.petazzoni@free-electrons.com,m:arnd@arndb.de,m:jason@lakedaemon.net,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 849AE72B0A4

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

Assisted-by: opencode:big-pickle
Fixes: fefe7b092345 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix Fixes tag
 drivers/gpio/gpio-mvebu.c | 133 +++++++++++++++++++-------------------
 1 file changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 0464d3db8c94..e468505532ee 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1262,6 +1262,59 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
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
@@ -1274,71 +1327,21 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
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


