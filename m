Return-Path: <linux-gpio+bounces-32820-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPnBNv3RrmlhJAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32820-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 14:58:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A323A2BF
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 14:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B65123265FB5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 13:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F193BED23;
	Mon,  9 Mar 2026 13:49:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A03C3BF1
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064189; cv=none; b=lt09ka+CLwIf3Ppf6n4E0PjxmedJ5ibZX+55wkGDYE6nx/tDegrcVinS+Z9k8uuOhWYjx6wIUpxuSvV0bBDvaw1OFx8zh8JhIgkRxJ2FZbFDHQyjTRQrGueMenqdnflLE3WxBX75gVETtYF4R/ITCGwaGa4vg4pjqNHHOwGZF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064189; c=relaxed/simple;
	bh=edic6BPHPs4rzzaANWW2/y9R7HvSKfZcrDg1tvRbWn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8oHvvMfM2SAz+hiBFYQ6s/tDDKVBbUc6J7glqtyjopxPw4cgzTno+amDdmHStYotAeLHJ2ECG5nD4igc0DinOdEAnugxwUlKE3/uNvFnntnlTa9OF5vu0VT6WMU0sFNPgSeLvpwn/J+ybCIzKQY/avLi0B+HFz9Cjh7X3nVev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz5-0006fi-Ed; Mon, 09 Mar 2026 14:49:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz2-004XYg-1u;
	Mon, 09 Mar 2026 14:49:21 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz3-0000000834A-3Ubt;
	Mon, 09 Mar 2026 14:49:21 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in hierarchical IRQ domains
Date: Mon,  9 Mar 2026 14:49:15 +0100
Message-ID: <20260309134920.1918294-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309134920.1918294-1-o.rempel@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Queue-Id: 5D3A323A2BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32820-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.615];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Action: no action

In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
before irq_domain_alloc_irqs_parent() causes a NULL pointer dereference
for slow-bus (SPI/I2C) IRQ chips.

irq_domain_set_info() locks the child descriptor, triggering .irq_bus_lock.
If the child proxies this lock to the parent, it crashes because
parent->chip is not yet allocated.

Fix this by allocating the parent IRQs first, ensuring parent->chip is
populated before the child's .irq_bus_lock is invoked.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v3
- new patch
---
 drivers/gpio/gpiolib.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ada572aaebd6..1ea9531934cc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1628,19 +1628,6 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	}
 	gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
 
-	/*
-	 * We set handle_bad_irq because the .set_type() should
-	 * always be invoked and set the right type of handler.
-	 */
-	irq_domain_set_info(d,
-			    irq,
-			    hwirq,
-			    gc->irq.chip,
-			    gc,
-			    girq->handler,
-			    NULL, NULL);
-	irq_set_probe(irq);
-
 	/* This parent only handles asserted level IRQs */
 	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
 					      parent_hwirq, parent_type);
@@ -1657,12 +1644,27 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	 */
 	if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
 		ret = 0;
-	if (ret)
+	if (ret) {
 		gpiochip_err(gc,
 			     "failed to allocate parent hwirq %d for hwirq %lu\n",
 			     parent_hwirq, hwirq);
+		return ret;
+	}
 
-	return ret;
+	/*
+	 * We set handle_bad_irq because the .set_type() should
+	 * always be invoked and set the right type of handler.
+	 */
+	irq_domain_set_info(d,
+			    irq,
+			    hwirq,
+			    gc->irq.chip,
+			    gc,
+			    girq->handler,
+			    NULL, NULL);
+	irq_set_probe(irq);
+
+	return 0;
 }
 
 static unsigned int gpiochip_child_offset_to_irq_noop(struct gpio_chip *gc,
-- 
2.47.3


