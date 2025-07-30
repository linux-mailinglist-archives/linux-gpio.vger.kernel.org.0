Return-Path: <linux-gpio+bounces-23893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1158B15CA5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 11:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91C517AE48C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 09:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5E1298CB6;
	Wed, 30 Jul 2025 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UYbAL5Yh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CEC29898D;
	Wed, 30 Jul 2025 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868634; cv=none; b=OwQ5RSew9Ponz/xXerWuVCk6SDOVhvXIB/YDThPvvfMyId21UHXBemJ4yXpEXi8Cchrr6QnVGzQtEYt/dRXXHCT9vzLNGlBdhG5VaN7jQUU3H/evnyfFX93FI1u1KZueZmZp56YJXLroMBVVM0JisQGhqCBJQsWCRxngeO9ocBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868634; c=relaxed/simple;
	bh=VSlyVo5JTB/7qsOZT9eCXgxrivREUt9tojqeOFew7Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgtSe8/NVkbjFicPW6P/CXVabUAMPrAAVq+wtrw3eUu7dkIZi1sOqv3iaoiTEQ4MN8SwdYzjxvyKvHsO1IlOkgne25WMXlFMjfKfSB2Za2BbfLDkttD1YHBKz4IZAioVimHqkx9O9i5eyjK/kokbJbV8rYk6OaVyDVUp+iAxBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UYbAL5Yh; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C7FE431EB;
	Wed, 30 Jul 2025 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753868624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXkCt9Xi9kaqAlu8KprEleigTQ1n1irz2e6TeOGPieU=;
	b=UYbAL5Yhd5UQEByyp/V5JN+GgiEH44H6w6Dq299pDXcuXPo2Yu/Dy7vPDxbp7g4vDyevYP
	klEkbsWL+SnR8sTml2Yqytw/dYSTwz7JZFuERlhQz0Fu+/aqSOjdnD5UgSSZRk6xrHwTEV
	Gwv6w7i5qSb7UNH3WD3QVJdTPrLgnbaf5+BIQm+MOGDTdfeCMfkhWwjdRXHW7J1OoceQds
	l4JCZV1rKYscFnP2iEyGuQAWqHe+OB2kritcWDeckRYvupFjmOh+WlF0rDM428j515Yfyn
	s07c5fSeLHXzsRZDKCpgpFHovWvg2bL1kU8t/dErFeI0YtTnFC7ZXXQ7hDEmQQ==
Date: Wed, 30 Jul 2025 11:43:42 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/6] of/irq: Introduce of_irq_foreach_imap
Message-ID: <20250730114342.665ec546@bootlin.com>
In-Reply-To: <20250729195151.GB658914-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
	<20250725152618.32886-5-herve.codina@bootlin.com>
	<20250729195151.GB658914-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhohgrnhesohhsrdgrmhhpvghrvggtohhmphhuthhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgut
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Tue, 29 Jul 2025 14:51:51 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jul 25, 2025 at 05:26:13PM +0200, Herve Codina wrote:
> > of_irq_foreach_imap is an iterator designed to help a driver to parse
> > an interrupt-map property.
> > 
> > Indeed some drivers need to know details about the interrupt mapping
> > described in the device-tree in order to set internal registers
> > accordingly.  
> 
> I would like to see some existing user converted to make sure it works 
> for other cases.

I will see what I can do for the next iteration.
Maybe I will propose a unit test for this new API.

> 
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/of_irq.h | 11 +++++++
> >  2 files changed, 81 insertions(+)
> > 
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index f8ad79b9b1c9..863b31eb3c1a 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -157,6 +157,76 @@ const __be32 *of_irq_parse_imap_parent(const __be32 *imap, int len, struct of_ph
> >  	return imap;
> >  }
> >  
> > +/**
> > + * of_irq_foreach_imap - Iterate through interrupt-map items
> > + * @np: device node where interrupt-map is available
> > + * @func: function called on each interrupt-map items
> > + * @data: data passe to @func
> > + *
> > + * This function iterates through interrupt-map items and calls @func on each
> > + * item. The parent interrupt described in the interrupt-map item is parsed
> > + * and passed to @func using a pointer to a struct of_phandle_args.
> > + * Also the imap raw value is passed in order to allow @func to look at other
> > + * values of the interrupt-map (child unit address and child interrupt
> > + * specificer)
> > + *
> > + * If @func returns an error, the iteration stops and this error is returned.
> > + */
> > +int of_irq_foreach_imap(struct device_node *np,
> > +			int (*func)(void *data,
> > +				    const __be32 *imap,
> > +				    const struct of_phandle_args *parent_args),
> > +			void *data)  
> 
> The func callback is a departure from other DT iterators. Look at the 
> 'ranges' iterator which keeps the state on each iteration.
> 

I see, I will propose a reworked version in the next iteration to have
something similar to ranges:
  - of_irq_imap_parser_init()
  - for_each_of_range() with something like
       for (; of_irq_imap_parser_one(parser, imap);)
  - of_irq_imap_parser_one()
  - of_irq_imap_parser_exit(): Not sure, will see if I need to release something

Best regards,
Hervé

