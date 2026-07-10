Return-Path: <linux-gpio+bounces-39838-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zywrK4cOUWoa+wIAu9opvQ
	(envelope-from <linux-gpio+bounces-39838-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:23:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E073C338
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:23:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pqrs.dk header.s=key1 header.b=1ie5J2yh;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39838-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39838-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53B8230430C2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6762FD69E;
	Fri, 10 Jul 2026 15:22:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22203362152
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 15:22:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696977; cv=none; b=sG4U2+uzisZQN6qz6KMHYoMj0Uuk0t5YdK3GEWlH0m5sJPslzgexqsC5iM0zQRDMYYnXEdBSCiwsA1gzhK2ImKAlwCM5cAbDmGKJrLDe0q/iUw5komypgxlyE9n6UYDwnRoy+n1guD/B6vJ6+O7nu81QPtshwZlFocQgMDMpewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696977; c=relaxed/simple;
	bh=HcRdaAu+YXh+oqiaQgcC0oWhTIqjAakazYG64v+Dyn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucvwc6ndF9/uqozdwlJfQiyTcmXDiclKrs8K6Iq2F2dB2I2d4jrY0dR95NY9MaO0MYrPCsMR7hXD3Ge98pyIpW0TG9FQeFilKGCynqEAKU5n2bWO4a+h5wC5qX5VsH1vJ6z5j3l9T3XqQiMWRI3MqXNdFkJPmlEnPLGKvMnqI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=1ie5J2yh; arc=none smtp.client-ip=91.218.175.184
Date: Fri, 10 Jul 2026 17:22:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1783696965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9R8U/eYnNbuglVICT64v2YDxI3a9qvevZ58PLGIGQS8=;
	b=1ie5J2yhF6zMiCjIvCyjHYnHhKxyU2OKxL10tXyU/4+dcu9n/fCMfO9V5I3j0E7Ka/NflJ
	nR8E3J5dsCF691kKdRnwil3ZaM14Czwxh2gMqZqTqxSXMyZDJynSyub0Aluw0OClcUdVwf
	zYd5xuKOqEB4kFTgrPFKlVFoZTENdswasSqT8VmA9KfZ25NCQPLfGygHzA1CEAvWhcRJSo
	ydQqv2RbhJoBOLy28wXKJzfBi/KzrLlXaYF+SDX0U/umFZCCS1PfR0oTC55L9rpi5VsXBk
	F4GBgu6Kdj+8wimc6DdAQF353fHa6P54X/+zM9FQfXhIe36VL613FpbihmjWTQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v15 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Message-ID: <alEKklx_X4cP3Ire@pqrs.dk>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-5-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710101358.2606941-5-o.rempel@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[pqrs.dk:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:o.rempel@pengutronix.de,m:linux@roeck-us.net,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:david@protonic.nl,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alvin@pqrs.dk,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39838-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[pqrs.dk];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin@pqrs.dk,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[pqrs.dk:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pqrs.dk:from_mime,pqrs.dk:dkim,pqrs.dk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B44E073C338

Hi Oleksij,

On Fri, Jul 10, 2026 at 12:13:53PM +0200, Oleksij Rempel wrote:
> +/*
> + * Defensive wrappers for hierarchical IRQ proxying.
> + *
> + * gpiolib's hierarchical allocation exposes a lifecycle gap: the child
> + * descriptor is registered before irq_domain_alloc_irqs_parent() fully
> + * instantiates the parent chip.
> + *
> + * During consumer probe (e.g., gpiod_to_irq()), irq_create_fwspec_mapping()
> + * allocates the hierarchy. As part of this, irq_domain_set_info() initializes
> + * the top-level irq_desc and calls __irq_set_handler(). If the irq_desc
> + * requires locking, __irq_get_desc_lock() will invoke the child's
> + * .irq_bus_lock before the parent allocation is complete.
> + *
> + * Upstream generic helpers (e.g., irq_chip_mask_parent) blindly dereference
> + * data->parent_data->chip, causing an immediate NULL pointer panic during
> + * this gap. These wrappers check for a valid parent chip to safely drop
> + * premature locking or masking events while the legacy subsystem hierarchy
> + * is still assembling itself.
> + */

I encountered the same problem while working on a pinctrl/GPIO driver
this week. While searching lore to see if I'm doing it wrong, I found
this series. Such wrappers fix the problem for me too (although in my
case, it's not a slow bus, so it crashes in .irq_mask instead of
.irq_bus_lock).

But I see that in a previous version, you were reordering things in
gpiochip_hierarchy_irq_domain_alloc(). Why did you abandon this
approach?

Just wondering if we can find a more generic solution which doesn't
require such drivers to add this defensive boilerplate. Another option
might be to move such checks into the generic helpers.


> +static void mc33978_gpio_irq_mask(struct irq_data *data)
> +{
> +	struct irq_data *parent = data->parent_data;
> +
> +	if (parent && parent->chip && parent->chip->irq_mask)
> +		parent->chip->irq_mask(parent);
> +}

Kind regards,
Alvin

