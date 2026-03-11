Return-Path: <linux-gpio+bounces-33140-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOUfIwJysWlVvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33140-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:45:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA0264C7E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 724593018E23
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2507231E845;
	Wed, 11 Mar 2026 13:40:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF13148B4
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236440; cv=none; b=Q9IhJD5tEoNqUmW1q7AUfuzU7LK8qUrMx5h3Kn6+I/VFyyB0RlkGYEZcOgiKksiCAGzBh2mGb1+YrfyiGT+HjLth/3dAaeghK3xEBysDK544jU/lk/ipYV5pIsfeXXxZFOBkyEhiPedeDFnDNX99T3E+DDALo8RtudKq1NgeScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236440; c=relaxed/simple;
	bh=P8/F88WI/ZbIkPfS0vzqYssdeRxxEz5wUC4N+aKwM30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOSOM34P6OY7tnSvXFn7TixXV2hom8e9WLtxtnduWNa6qjbqrVkiLWPVOnLRbQgBY5Q2+ZQBwOSk0tx2ZZU6Kz/lK0E4d1DXWcIdTQ+MkxhiTJ3mFwlZ0f5kvJU1TkyiXfpKx33IUkxGzmt4ZPRlsMR4Lwvh8qOPZFInfdlKkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w0JnT-0005WA-Vo; Wed, 11 Mar 2026 14:40:23 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w0JnQ-004rpJ-2d;
	Wed, 11 Mar 2026 14:40:22 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w0JnS-0000000DNSb-0Bq1;
	Wed, 11 Mar 2026 14:40:22 +0100
Date: Wed, 11 Mar 2026 14:40:22 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
Message-ID: <abFwxtDWvkXHx9KS@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de>
 <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
 <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
 <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Queue-Id: 89CA0264C7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33140-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 02:18:05AM -0700, Bartosz Golaszewski wrote:
> On Tue, 10 Mar 2026 10:14:59 +0100, Bartosz Golaszewski <brgl@kernel.org> said:
> > On Tue, Mar 10, 2026 at 10:05 AM Linus Walleij <linusw@kernel.org> wrote:
> >>
> >> On Mon, Mar 9, 2026 at 2:49 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> >>
> >> > In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
> >> > before irq_domain_alloc_irqs_parent() causes a NULL pointer dereference
> >> > for slow-bus (SPI/I2C) IRQ chips.
> >> >
> >> > irq_domain_set_info() locks the child descriptor, triggering .irq_bus_lock.
> >> > If the child proxies this lock to the parent, it crashes because
> >> > parent->chip is not yet allocated.
> >> >
> >> > Fix this by allocating the parent IRQs first, ensuring parent->chip is
> >> > populated before the child's .irq_bus_lock is invoked.
> >> >
> >> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> >> > ---
> >> > changes v3
> >> > - new patch
> >>
> >> Bartosz, tglx: is this something we should apply for fixes?
> >>
> >> I think it needs to go into gpiolib for next at minimum, unless
> >> there is some semantic problem with the patch.
> >>
> >
> > Looks good to me. I can take it into v7.0-rc4 via the GPIO tree and
> > tglx can pull the tag once it's out as a base for the rest of the
> > series?
> >
> > Bart
> >
> 
> Oleksij: it doesn't look like there are any dependencies for this patch, is
> it ok if I queue it for the next RC?

ACK, there are no dependencies.

> Could you add the Fixes tag as well?

Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")

Should add it in the next round? There are some pending comments for
this patch set.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

