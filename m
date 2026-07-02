Return-Path: <linux-gpio+bounces-39378-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wlBwKhHyRmolfwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39378-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 01:19:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C206FD5E8
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 01:19:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FVfxc4NO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39378-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39378-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8362B300E70F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 23:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E5B3B8BC6;
	Thu,  2 Jul 2026 23:18:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D1385D82
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 23:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783034322; cv=none; b=fvZtBbObtVEbyHCHVMz1Y1eHIj5lJv7orv3HlBcVpRn12uV4ti9WkasYqVXLGW9TVIQhpBttTU1Hc0S7FjXL+Rw0FSmYvxgr9D/PpcNSJQyJQ/bR8WrPfoFREuoTUenkmgOBOsTeUQwljNMTS4J9do8DQmlwbow1rKZ6QVWaV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783034322; c=relaxed/simple;
	bh=xtFIo4UWDvBdcVqdap3nApUe5KOXrR0Jj6H+BPoKVqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhhW+EITQKRpjkdusTKxh9lBUD0I6PmCErwkRk6Fg6A8uzT+2Izj24NKB3v43KvjOXJzhlAQUp6LlAok1v405rAHhJo+1KksNasybxRQVeqenIxn8bRPTavHferehGTgt1b1pVQcDZTtgSXLsxbtIeN4OpWceQ0pAFIqrHJheig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVfxc4NO; arc=none smtp.client-ip=209.85.210.172
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845e47133c9so657981b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783034320; x=1783639120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OijygblRN/wkosTrqLtek9RIECYD5CDSzwKzHMYiJRU=;
        b=FVfxc4NO1RHjfWiZHq/VacFRFRweDBFQHQphFyY04h/fta9LdDdEB+ywnbgK1ZuU5w
         s9pFUPNV3aPuFQfUjftdmW+PEW6tiEAJaINtzraOLvNjo8gi8tKh1QnDCx3Y5jVUW8jF
         K45kN3AJ/lewnc846ev/R7IWaKDMp7MQYr9unL3RXSExo527IxXLEuhQH5s9Gepm2qiL
         oBHvRlbmFiiK4c3g/rI1sB1Hg5Hx3cw6ju9W0H0gQZoqEUINDjwlPGbJpjW1YhM/hnCP
         ArxelfGWA56aPYOXGOLDbzNUSkQ7LSFjWQZj2rNfMXGPSJYKM/IT3ETwj2OtdHiBy1IQ
         mx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783034320; x=1783639120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OijygblRN/wkosTrqLtek9RIECYD5CDSzwKzHMYiJRU=;
        b=EEGfSeAIjRInidNAPDYrYSi/aSZ38BXA3NB/P00o2xncxrSiKwlbBA8Zzv0MYEQIDC
         WB3qWt5y8zbPmjp6qXQnnnZXCliGfVkQDNdVQKAw9XIIg8p8CpCiytbAqX3zT9oKC3Cn
         DjE9F+kODRZxd/E71dQLknbYqHhMjphGWqKYZ8yTBJ9AXTC0Pg56pBxX+qXfzB8fNMGQ
         3D8jka4ywrzOVcqkO6Yhwz3IEIc3YBNFZ9SHisYH3Lkx2xjxwnuIauy53fKHMVmwAGYk
         sfLwnvGYL0r/hyXqFHfilDmTK5flOzEU3chYtbwLgMdDc0DkuvyUJ7YJNXosU5hu+SSj
         3Bog==
X-Gm-Message-State: AOJu0YzBeZ1hjcMsljXdgcMMilUhgH8IAbrYghEUn9Zs86g89He2565G
	Thm0nFmJ/VtbUH2gMM3YwgDyRzzPgeiJhjnI9qPxYOiEla+ZUUk5aG+9Q1XAiA==
X-Gm-Gg: AfdE7ckvnvos0WtgRAXDcRA5BVxcNmN/h2CgoHPZ8k23quLjRWFvrFol8/2l0Z7n+Qc
	vAsOfTXBZ9NurXdgSB2wq7AbZ+Qny2ivQsBMsebgbyQpWeBO3kCNfrfggvMjWKX5wenAWvRjzaq
	QpZNb97mjCB2DThemw04WEbkfwtch+MHNKNXk8VzgkbyhfEIwXn1YzUF0018qxpVKBd+CrD3n9R
	m25/i9Lqwpmxuv+KpCRMbycCtXeuCysaHwPfgZWspALoQ3VXyx6hHHlMGBRYVoBwrEZvB98IUdt
	bQuEHFEYS/eyFlU57pvhTaKPylfo/dZ9WEhjStx/WTezEj+MiCU7mFucTYiTFFaxPk/hudEWiV8
	a0pCcbVAKAtU240RXfZU411vZX9RIlUIDkgUsdjDuZ77ihCtfnuvE9Lug3FjRPUrAFS0nRKPJ/p
	qmD4fBWx6PekUmAtUMJQRQ8AZB8dY7aNTSwKfdAQvEbzID/oXnJ7e655fYK5sjl8Aby9c5aj0Iv
	sHbEvi04w==
X-Received: by 2002:a05:6a20:5483:b0:3bf:6763:f0d0 with SMTP id adf61e73a8af0-3c01c5e99femr2249735637.4.1783034319977;
        Thu, 02 Jul 2026 16:18:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b0a2c4sm1729340a12.19.2026.07.02.16.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:18:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: fix devres LIFO ordering between GPIO chip and IRQ domain
Date: Thu,  2 Jul 2026 16:18:38 -0700
Message-ID: <20260702231838.1175485-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39378-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14C206FD5E8

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
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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


