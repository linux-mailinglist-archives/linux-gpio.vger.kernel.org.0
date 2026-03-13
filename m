Return-Path: <linux-gpio+bounces-33351-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHRNKbQMtGlvfwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33351-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:10:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF72837A4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFFC5308B9AD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1584A39185C;
	Fri, 13 Mar 2026 13:08:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB7C37DEB7
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407331; cv=none; b=qZtNu5Hbw9tbGQ4nAXjSUrN2v+MJA4VFDXQQaVxZh2rLFkaS/floYXwUne9IjY3A8sfqh3zW8k8rsxMekh0Msxh709cbB1eO6JmWaSYt1r5LH5hB+ty9rjoqPxfxRR9//r2Db86pMAPqi6WrB5AJGoiWnQSxlHanekKdversWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407331; c=relaxed/simple;
	bh=u6fNhVctrPACDy4XOiqVlTIlf9qL+scNI2RcrzDPK/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/Zo5TVq0Wwy8hgkLu3hp7oBu+WMZrxbtN11NFx5BXkSVRQo8jVP2KUmuPFWR1Z9E5Sh65D5u657FodwcIm+b5sH22J/I7pwVajtICayB2ArZYk718yICS6ztefnaH1NOo08y5NfiVpxK7xo57E2HXvBs0UBkDOtTLj/Br+K6wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w12FW-0000Yb-A6; Fri, 13 Mar 2026 14:08:18 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w12FU-0005E9-2r;
	Fri, 13 Mar 2026 14:08:16 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w12FU-0000000HESI-3Dew;
	Fri, 13 Mar 2026 14:08:16 +0100
Date: Fri, 13 Mar 2026 14:08:16 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
Message-ID: <abQMQAbbvV60bV2j@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de>
 <abPqGvy5FqJ0a0ug@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abPqGvy5FqJ0a0ug@tom-desktop>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,axentia.se,pengutronix.de,vger.kernel.org,protonic.nl,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33351-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d:email,pengutronix.de:mid,pengutronix.de:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35CF72837A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

On Fri, Mar 13, 2026 at 11:42:34AM +0100, Tommaso Merciai wrote:
> Hi Oleksij,
> Thanks for your patch.
> 
> I'm working on DSI support for RZ/G3E
> 
> from this morning rebasing on top of next-20260312 I'm seeing
> the following:
> I found out the the issue is related to the interrupt of the adv7535
> bridge:
> 
>         adv7535: hdmi1@3d {
>                 compatible = "adi,adv7535";
>                 ...
>                 ...
>                 interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
> 
> RZ/G3E is using:
>  - drivers/pinctrl/renesas/pinctrl-rzg2l.c
> 
> Reverting this patch fix the issue.
> (git revert a23463beb3d5)

Thank you for the feedback! If I understand the problem correctly, the
adv7535 is asserting its IRQ line early during probe, which creates an
irq storm due to a missing handler.

My patch moved irq_domain_set_info() after the parent allocation. When
the parent allocates the IRQ, the pending hardware interrupt fires
immediately. Because the child descriptor isn't fully configured yet, it
routes to handle_bad_irq. This fails to acknowledge the hardware
interrupt, locking up the CPU and causing the RCU stall.

I hope splitting the irq_domain_set_info() should fix the regression.
Can you please test if this change resolve the RCU stalls on your setup:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 13dd97344b26..376daeddbbbb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1628,6 +1628,9 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	}
 	gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
 
+	irq_set_handler(irq, girq->handler);
+	irq_set_handler_data(irq, gc);
+
 	/* This parent only handles asserted level IRQs */
 	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
 					      parent_hwirq, parent_type);
@@ -1655,13 +1658,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
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
+	irq_domain_set_hwirq_and_chip(d, irq, hwirq, gc->irq.chip, gc);
 	irq_set_probe(irq);
 
 	return 0;
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

