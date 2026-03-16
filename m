Return-Path: <linux-gpio+bounces-33532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH8fLVsOuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:06:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A000529AFE1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 838753027E10
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C5639C643;
	Mon, 16 Mar 2026 14:05:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6139C639
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669933; cv=none; b=cvapqJxvxX1haH+5Sglh/ydKaJD9hZe0i7wXOBNHmzem5z/dodnKPng8/pcfEgkRhGKFJGV25TsNLguV5NlBXilfZ1pE8BRJvy92Q5xCidAeparHTYlQUVtVJVw6206ShBV8aDwzZkGVgP9iH8uRTizRasABly2Kc90HqIfaKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669933; c=relaxed/simple;
	bh=n6FYSU5YmxHfeq9L0JOIO5Jxr1WLOHeof8/dRnRSpTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7qk6qHKcpGDNU1I2WcuHsJtw8Hs01Xti1QhldVEpfTXvTbNPahPXV9uwig7RC2NIqGA66WTGtbiaZqQSvulGokZu8oNYplOWntb6Ia68jnxprJKNVN6ytoyDDasOmIOhNTNRZOrAdWv2cZuxA7xpARUQ1xdKazVh4UFrwwcW7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZI-0002G7-U9; Mon, 16 Mar 2026 15:05:16 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZH-000a8N-2n;
	Mon, 16 Mar 2026 15:05:15 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZH-00000005twy-35wm;
	Mon, 16 Mar 2026 15:05:15 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v5 4/7] gpio: gpiolib: fix allocation order in hierarchical IRQ domains
Date: Mon, 16 Mar 2026 15:05:09 +0100
Message-ID: <20260316140514.1406588-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316140514.1406588-1-o.rempel@pengutronix.de>
References: <20260316140514.1406588-1-o.rempel@pengutronix.de>
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
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33532-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.883];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A000529AFE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allocate parent IRQs after setting the basic IRQ handler to avoid NULL
pointer dereferences and RCU stalls.

In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
before parent allocation causes a NULL pointer dereference for
slow-bus (SPI/I2C) IRQ chips because the child proxies .irq_bus_lock
to a parent->chip that is not yet populated.

Conversely, moving the entire configuration after parent allocation
causes RCU stalls if a hardware interrupt is pending; the unconfigured
descriptor defaults to handle_bad_irq and fails to acknowledge the
interrupt.

Fix this by splitting the initialization: set the handler and data
before parent allocation to handle pending events, but defer setting
the chip and hardware IRQ info until the parent is fully allocated.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
changes v5:
- move this patch back to this series
- split irq_domain_set_info(). Set the handler and data before parent
  allocatio and set the chip and hardware IRQ info after parent
  allocation.
- previous version:
  https://lore.kernel.org/all/20260309134920.1918294-5-o.rempel@pengutronix.de/
---
 drivers/gpio/gpiolib.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9550500e1690..3ee1a403ccf8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1632,14 +1632,8 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	 * We set handle_bad_irq because the .set_type() should
 	 * always be invoked and set the right type of handler.
 	 */
-	irq_domain_set_info(d,
-			    irq,
-			    hwirq,
-			    gc->irq.chip,
-			    gc,
-			    girq->handler,
-			    NULL, NULL);
-	irq_set_probe(irq);
+	irq_set_handler(irq, girq->handler);
+	irq_set_handler_data(irq, gc);
 
 	/* This parent only handles asserted level IRQs */
 	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
@@ -1657,12 +1651,17 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
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
+	irq_domain_set_hwirq_and_chip(d, irq, hwirq, gc->irq.chip, gc);
+	irq_set_probe(irq);
+
+	return 0;
 }
 
 static unsigned int gpiochip_child_offset_to_irq_noop(struct gpio_chip *gc,
-- 
2.47.3


