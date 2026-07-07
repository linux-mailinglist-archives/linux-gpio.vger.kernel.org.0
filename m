Return-Path: <linux-gpio+bounces-39614-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sehLG4SKTWp91wEAu9opvQ
	(envelope-from <linux-gpio+bounces-39614-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:23:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B072061D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dxCOQQ3+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39614-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39614-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B1D6302D5FE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E8F146D53;
	Tue,  7 Jul 2026 23:23:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5F22F6560
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:23:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466595; cv=none; b=EL+/3XSMTGjuH2wQ4tiqXdoXRs8HDy2Nm/5glbpFd4pBuesWVPsGSSy6MUKyzkC//sBhxi2YVKuYFl+YRHQelct49S+PA/Xj/ga2lBO4Y9PdPpIqTtN1pdU5ucfP3JwK1kBAFtON0NAM92HguUhX842ybEAjStJkUgrPPtrNbBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466595; c=relaxed/simple;
	bh=HbDlfrGVy+2w9b0vth4dhVuSM9xNfuktxsarWi91YjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6C0/tXyfucFQVjr2gJfpDSp1z+rNvSpG6KoYaDp28nzigmJGQOPJrYwRQFczZJfReWcxIr2ejS55ZTDMUqgXovoH9Sn8XWTaIdvaW30h0Oizd9AthYW5d4jvpK1EN4XI2byL2J5v/lCfdWQFYS8KlvvG2YngFRMiRrPz/UkxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxCOQQ3+; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so1078295ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783466594; x=1784071394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8Qw4mxoTbJi0Q4AgjV81iHJobrXgqLEILZFuhQl7cI=;
        b=dxCOQQ3+cvZpT05NDhUq9L731HD90BaVjECTgID5sslSSkxkdayArqM5nsOmAfOE3L
         y4oLhMbxCVYrFoWSECz+yJa1rjR7DFhPTd3sVUSMgMawi7bGWZzzHZuUXfFd/o4GQ5Qx
         PICF9EbaqP7Fj/ahbjaXqOo3OREy6S22tNIkGLf26umQSQY+WJE7Xrp1aOKFp4VMzFCw
         N9XQvWDypRaOlYhz+9nFFnxLEezQMOfqrEeob5XywzUdITHy+Aw3suuq7U/am8ckfaE3
         8486BcT3rEnGhgQnH8U+kJzHGP/z3J20z7RIwxgriZtSJ9N3glf5uj3zJxyn/IH825kI
         Odkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466594; x=1784071394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8Qw4mxoTbJi0Q4AgjV81iHJobrXgqLEILZFuhQl7cI=;
        b=qvobAWAZWFvazTBsowgN7QUDA9pinNDchKAel6PEz6N9BWR6lNQttpCWPBPDRCLK6R
         oqNes7ECrZbWNLBKBxKn+Ytpi5r24hyYhyuKeQtx2doidv4B2nHhoGcQnwMuIt+j08pl
         R21YnnnWYZdaC0+7jOK23QqrWvdyGAufXp6Xolbq9smzdienuFvbMxRtkrfbXdnKYdXy
         2Gu9ULNUao+I78wzTndlwQgljn6iwVNgw2YvDoLhRTAEMX4X3OyqA1s3a8BpqcouEBpw
         hBGZZ3Un94NfikQLJr5nKieV8g1++fE7qeOg9Ux33pPt373rQ74TOhshAE3xbNyy3CAh
         ndWQ==
X-Gm-Message-State: AOJu0Yy1zJarItJg+NSN7ZIMZPnCXU8Oy24z8RY7KEvapLb4uC2pFDW0
	/VP9jIigxracwMBEGHy3AJi/Ooa0Jplrh/RBTJFQjvd7BzAUw1JxL5ki3FEpHL5j
X-Gm-Gg: AfdE7cmMhdjvNDB2Vceei+h00I+bl6XAhagfmvzJGhKa9BI7QU8ybVlAup0aQGCju4J
	kqCIwyOfOexiLLPvNCszt7e5ueTcxDiOHkIr/jxBB1yedqmS0GM8CPMMfMyW4hiwYQ7FoKw/e6N
	YYD8PdmLLMjWvJBeeQRYSshGpEu3Wnl7xYbwxoJ+ZBVJUTTnv9fzLGzZv+StLu4Q7W1YdLEKnBk
	GFCC6DVHQAAH0wSbt2ppIWPdZyU/NM4OtAIGMOiFrFc+uU65J/rEvvgeU5/0HHoWpB8cZdJ0Scp
	Ct0+YwK6CgtXsBEdYfwlWwcMUz8D1gQg9C9BVdseSjEii6yhnim3TagDYSalhwyDWmXDGoEsSmE
	uGgwrhFjoAmYy+r/5fsfp7ZReiiSz/crO2n26lG22xhnHqDJLbFao9lmqS28nztsBUy9gQjNLwh
	F9etYazAM7y8ujXO49RCjOqvoqRAU4Kj7lK5cBHPZmLWFiOnSRj+xXVNmhVpnED+NHSM6oh7NtG
	7GOR2S2XA==
X-Received: by 2002:a17:903:1447:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2ccea262fe8mr1208765ad.0.1783466593609;
        Tue, 07 Jul 2026 16:23:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb75fsm18678285ad.8.2026.07.07.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:23:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio/mvebu: Use irq_domain_add_linear
Date: Tue,  7 Jul 2026 16:23:11 -0700
Message-ID: <20260707232311.1214660-1-rosenp@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39614-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,obsidianresearch.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C00B072061D

From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

This fixes the irq allocation in this driver to not print:
 irq: Cannot allocate irq_descs @ IRQ34, assuming pre-allocated
 irq: Cannot allocate irq_descs @ IRQ66, assuming pre-allocated

Which happens because the driver already called irq_alloc_descs()
and so the change to use irq_domain_add_simple resulted in calling
irq_alloc_descs() twice.

Modernize the irq allocation in this driver to use the
irq_domain_add_linear flow directly and eliminate the use of
irq_domain_add_simple/legacy

Fixes: ce931f571b6d ("gpio/mvebu: convert to use irq_domain_add_simple()")
Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 92 ++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index cd5dc27320a2..1ed6132b993c 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -293,10 +293,10 @@ static void mvebu_gpio_irq_ack(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mvebu_gpio_chip *mvchip = gc->private;
-	u32 mask = ~(1 << (d->irq - gc->irq_base));
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
-	writel_relaxed(mask, mvebu_gpioreg_edge_cause(mvchip));
+	writel_relaxed(~mask, mvebu_gpioreg_edge_cause(mvchip));
 	irq_gc_unlock(gc);
 }
 
@@ -305,7 +305,7 @@ static void mvebu_gpio_edge_irq_mask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mvebu_gpio_chip *mvchip = gc->private;
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	ct->mask_cache_priv &= ~mask;
@@ -319,8 +319,7 @@ static void mvebu_gpio_edge_irq_unmask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mvebu_gpio_chip *mvchip = gc->private;
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	ct->mask_cache_priv |= mask;
@@ -333,8 +332,7 @@ static void mvebu_gpio_level_irq_mask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mvebu_gpio_chip *mvchip = gc->private;
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	ct->mask_cache_priv &= ~mask;
@@ -347,8 +345,7 @@ static void mvebu_gpio_level_irq_unmask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mvebu_gpio_chip *mvchip = gc->private;
 	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-
-	u32 mask = 1 << (d->irq - gc->irq_base);
+	u32 mask = d->mask;
 
 	irq_gc_lock(gc);
 	ct->mask_cache_priv |= mask;
@@ -462,7 +459,7 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 	for (i = 0; i < mvchip->chip.ngpio; i++) {
 		int irq;
 
-		irq = mvchip->irqbase + i;
+		irq = irq_find_mapping(mvchip->domain, i);
 
 		if (!(cause & (1 << i)))
 			continue;
@@ -655,6 +652,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	struct irq_chip_type *ct;
 	struct clk *clk;
 	unsigned int ngpios;
+	bool have_irqs;
 	int soc_variant;
 	int i, cpu, id;
 	int err;
@@ -665,6 +663,9 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	else
 		soc_variant = MVEBU_GPIO_SOC_VARIANT_ORION;
 
+	/* Some gpio controllers do not provide irq support */
+	have_irqs = of_irq_count(np) != 0;
+
 	mvchip = devm_kzalloc(&pdev->dev, sizeof(struct mvebu_gpio_chip),
 			      GFP_KERNEL);
 	if (!mvchip)
@@ -697,7 +698,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->chip.get = mvebu_gpio_get;
 	mvchip->chip.direction_output = mvebu_gpio_direction_output;
 	mvchip->chip.set = mvebu_gpio_set;
-	mvchip->chip.to_irq = mvebu_gpio_to_irq;
+	if (have_irqs)
+		mvchip->chip.to_irq = mvebu_gpio_to_irq;
 	mvchip->chip.base = id * MVEBU_MAX_GPIO_PER_BANK;
 	mvchip->chip.ngpio = ngpios;
 	mvchip->chip.can_sleep = false;
@@ -758,34 +760,30 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
 
 	/* Some gpio controllers do not provide irq support */
-	if (!of_irq_count(np))
+	if (!have_irqs)
 		return 0;
 
-	/* Setup the interrupt handlers. Each chip can have up to 4
-	 * interrupt handlers, with each handler dealing with 8 GPIO
-	 * pins. */
-	for (i = 0; i < 4; i++) {
-		int irq = platform_get_irq(pdev, i);
-
-		if (irq < 0)
-			continue;
-		irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_handler,
-						 mvchip);
-	}
-
-	mvchip->irqbase = irq_alloc_descs(-1, 0, ngpios, -1);
-	if (mvchip->irqbase < 0) {
-		dev_err(&pdev->dev, "no irqs\n");
-		return mvchip->irqbase;
+	mvchip->domain =
+	    irq_domain_add_linear(np, ngpios, &irq_generic_chip_ops, NULL);
+	if (!mvchip->domain) {
+		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
+			mvchip->chip.label);
+		return -ENODEV;
 	}
 
-	gc = irq_alloc_generic_chip("mvebu_gpio_irq", 2, mvchip->irqbase,
-				    mvchip->membase, handle_level_irq);
-	if (!gc) {
-		dev_err(&pdev->dev, "Cannot allocate generic irq_chip\n");
-		return -ENOMEM;
+	err = irq_alloc_domain_generic_chips(
+	    mvchip->domain, ngpios, 2, np->name, handle_level_irq,
+	    IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0, 0);
+	if (err) {
+		dev_err(&pdev->dev, "couldn't allocate irq chips %s (DT).\n",
+			mvchip->chip.label);
+		goto err_domain;
 	}
 
+	/* NOTE: The common accessors cannot be used because of the percpu
+	 * access to the mask registers
+	 */
+	gc = irq_get_domain_generic_chip(mvchip->domain, 0);
 	gc->private = mvchip;
 	ct = &gc->chip_types[0];
 	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
@@ -803,27 +801,23 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	ct->handler = handle_edge_irq;
 	ct->chip.name = mvchip->chip.label;
 
-	irq_setup_generic_chip(gc, IRQ_MSK(ngpios), 0,
-			       IRQ_NOREQUEST, IRQ_LEVEL | IRQ_NOPROBE);
+	/* Setup the interrupt handlers. Each chip can have up to 4
+	 * interrupt handlers, with each handler dealing with 8 GPIO
+	 * pins.
+	 */
+	for (i = 0; i < 4; i++) {
+		int irq = platform_get_irq(pdev, i);
 
-	/* Setup irq domain on top of the generic chip. */
-	mvchip->domain = irq_domain_add_simple(np, mvchip->chip.ngpio,
-					       mvchip->irqbase,
-					       &irq_domain_simple_ops,
-					       mvchip);
-	if (!mvchip->domain) {
-		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
-			mvchip->chip.label);
-		err = -ENODEV;
-		goto err_generic_chip;
+		if (irq < 0)
+			continue;
+		irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_handler,
+						 mvchip);
 	}
 
 	return 0;
 
-err_generic_chip:
-	irq_remove_generic_chip(gc, IRQ_MSK(ngpios), IRQ_NOREQUEST,
-				IRQ_LEVEL | IRQ_NOPROBE);
-	kfree(gc);
+err_domain:
+	irq_domain_remove(mvchip->domain);
 
 	return err;
 }
-- 
2.55.0


