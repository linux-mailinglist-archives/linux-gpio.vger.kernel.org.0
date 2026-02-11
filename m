Return-Path: <linux-gpio+bounces-31608-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGRBBxthjGmWlwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31608-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:59:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF2123B0E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6BD2305AAA7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D03436AB5F;
	Wed, 11 Feb 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rXZ2glk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA336A03F;
	Wed, 11 Feb 2026 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807531; cv=none; b=mZ14lAVXZDLGmCqYID/Iar2sq/29Hbg2VKIpfmZ0GBSXSPZHgDB8NAge6i0m1he7dgf39yk++AyOHh325rml9kfKO37zrPS2SWZep7KmHEzqiCrGWPFxWcvjOEYN9iKmnWUQ9K4iJ/6T+7QgttYgC21I2twZ54oEz+PM5HxA0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807531; c=relaxed/simple;
	bh=wiBnKzGmkKejPRVzA4JzkrvhZirsvgKktO17sAb5qjI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTfw1POPqhoIb5oo8HRHCV1s01SxmNiSLpm8BW53qHnFieWgEynW+rgiKnL/UdICEBfJMZhhwBEJGgK36oKOLI8ZGOQeVqqOl426rTQOxJ9jYiZcFzeVLBJLFK+gShHpp0hgvvNBRGvAowLpjJB8BalNs7MlnKrtk0ViJy4n0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rXZ2glk4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D125D1A0DDF;
	Wed, 11 Feb 2026 10:58:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 948BD606BE;
	Wed, 11 Feb 2026 10:58:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B041711948CDE;
	Wed, 11 Feb 2026 11:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770807521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sUiIQ8yvJ1tDaH4jiMQ9ZLLPcRdaOjCdIjoUMLb16/o=;
	b=rXZ2glk4DGqvdeb0MLGVtFABZtah+qWCKK6xMHbZ5pdfLqL7ImtKtcGCAJx36Y08x8WUDJ
	ZqV4g8z5dUBTtAB+/B4FAbutN8t02/v7P+ch6f2OUnwUr+fzcAEzHEhxGWriw6/n2GDSvi
	pgRtOC+WuOmFwrx9OmGvXjR/mN+Y+TXAqr1Lwgt4yepqTZ2Dehhq3yBhNb7GQrXC5ocUB6
	UWr36P0kffTsvOArU1bCSLgTFECZ8ZahS/rzZmZgaWlQrIcoO79n68VjGVy3klzr9jQJUS
	5R7mJfT/EK+qbEHku92XAbeYNKcuhJyVcq9nTfuKML84jKa2QbwQQGagBzHl3g==
Date: Wed, 11 Feb 2026 11:58:37 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexander Stein
 <linux@ew.tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
Message-ID: <20260211115837.265c46cd@bootlin.com>
In-Reply-To: <CAMuHMdXUG3fMdVk3CVVJpacnZE=j7feke9Nb+Mq6obsCdCr7Dg@mail.gmail.com>
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
	<CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
	<CADvTj4oetrsLwB0q=tA+9KZ7XTXd5asZjhZf=kekbSpnBFHA-w@mail.gmail.com>
	<CAMuHMdWTp8VsbBq0y9MKQJdkQnDADCbLbKW--gosoBt92PhAmg@mail.gmail.com>
	<20260211105735.0e8e65b4@bootlin.com>
	<CAMuHMdXUG3fMdVk3CVVJpacnZE=j7feke9Nb+Mq6obsCdCr7Dg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31608-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,ew.tq-group.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:url,bootlin.com:email,linux-m68k.org:email,tq-group.com:email]
X-Rspamd-Queue-Id: 70BF2123B0E
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 11:01:24 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Wed, 11 Feb 2026 at 10:57, Herve Codina <herve.codina@bootlin.com> wrote:
> > On Wed, 11 Feb 2026 10:47:53 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > On Wed, 11 Feb 2026 at 09:35, James Hilliard <james.hilliard1@gmail.com> wrote:  
> > > > On Wed, Feb 11, 2026 at 1:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > > > On Wed, 11 Feb 2026 at 09:14, James Hilliard <james.hilliard1@gmail.com> wrote:  
> > > > > > Document the gpio-aggregator virtual GPIO controller with a dedicated
> > > > > > schema and compatible string.
> > > > > >
> > > > > > Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> > > > > > binding file.
> > > > > >
> > > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>  
> > > > >  
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> > > > > > @@ -0,0 +1,54 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: GPIO aggregator controller
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Alexander Stein <linux@ew.tq-group.com>
> > > > > > +
> > > > > > +description:
> > > > > > +  GPIO aggregator forwards selected GPIO lines from one or more GPIO
> > > > > > +  controllers and exposes them as a virtual GPIO controller.  
> > > > >  
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > > +
> > > > > > +    gpio_agg: gpio-aggregator {
> > > > > > +        compatible = "gpio-aggregator";
> > > > > > +        #gpio-cells = <2>;
> > > > > > +        gpio-controller;
> > > > > > +        gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
> > > > > > +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> > > > > > +        gpio-line-names = "modem-reset", "modem-enable";
> > > > > > +    };  
> > > > >
> > > > > Looking at the example, it seems you intend to use the gpio-aggregator
> > > > > as a "Generic GPIO Driver", like in the example in the documentation[1].
> > > > > Hence I think you should not introduce and abuse the "gpio-aggregator"
> > > > > compatible value for this, but instead:
> > > > >   1. Use a proper compatible value that matches your device,
> > > > >   2. Write proper DT bindings for the device,
> > > > >   3. Add the proper device's compatible value to the gpio-aggregator
> > > > >      driver's match table.
> > > > > The above is very similar to how spidev is handled, which also forbids
> > > > > using the spidev compatible value in DTS.  
> > > >
> > > > Isn't this gpio-aggregator driver supposed to be non-hardware
> > > > specific?
> > > >
> > > > I'm trying to use it as described here, I noticed the compatible
> > > > in the blog post was missing and just needed adding to the
> > > > driver: https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/  
> > >
> > > Let's kick Hervé to fix that ;-)  
> >
> > Where is it missing ?  
> 
> In the driver ;-)
> 
> DTS must never use 'compatible = "gpio-aggregator"'.

Why?

gpio-aggregator can be used as a virtual device to aggregate GPIOs for
user-space.

I think we should have 'compatible = "gpio-aggregator"' in dts.

Best regards,
Hervé

