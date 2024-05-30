Return-Path: <linux-gpio+bounces-6906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3A8D474E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1B75B21181
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D05176194;
	Thu, 30 May 2024 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="mbC/a8pI";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KWohFM7s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1A6F2E3;
	Thu, 30 May 2024 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058377; cv=none; b=E3h6xqVhy+r69VJji/KzA75i9vaGiN3+0zCwAL5ngXzAF+fuLtOJ0mCHZM1M/JgwrG3tPFM7sF8vv/UVpzPOVbRiV/9Mt60YnD6c6LYKY6FC6yi4f96ItPUr1TzjtFdLMyE3copDrE2NK5qCxntRz0lEtwT84R6VrNU8oTFgtTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058377; c=relaxed/simple;
	bh=8lx3iwi2ZdzA7P9y37vTbfzubXE+VC87ZBbfGF1Ttng=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HIz/WOGRcnTn7Gp2h3rW1D+zNjArUfPyxBdDYjN4BIyxWWPsBi56xmr8ivo5ji5IyRIyoinMG4NPgcPHh75rUoS0yMGEaNlQYCtd4g2TqF/wUy0Q2oVjAuSSs99kyQHcidUTz7N8YWYSPzjWAoXOjd4kWgMTDgi9wJyp6p8IduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=mbC/a8pI; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KWohFM7s reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717058373; x=1748594373;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ds8q6ImbzOAZZkTodVkRMD3hpsgSJkBCC76qc2Z+5m8=;
  b=mbC/a8pIikvceqhU4XuxMOmgnmPsWiUoSPu6CQSIQT382kQilw3ZVhSs
   3L+ocy3Erv0mUNB8oq7omdC7dNYwGSAQFFDp+5yDUqBgh9gwr2ff72E9R
   M3RKqDeoEnvmXhq8wmSvv3mnGsiVWCWJnhGiabtJsz6JQWDPoPZ8o+C/G
   oT+DgGAOmKLEBl9ANR1MKUAArc0Fv+T5CBvRZTX1/lgdmJvL5CyU1vBoA
   3XhDh6wWWvLEtrrXOdJsl46GnW3R5K/voLhlGhrDs+kuhfKtzK2MzbMsP
   xKa1zFMVCOPlQTG1A/OfS3glRQXHqIV9I19DxpQBTy1FuaPheNLBBWxtF
   w==;
X-CSE-ConnectionGUID: ole4zRrkRFavvihEnDhujg==
X-CSE-MsgGUID: gJYRVWOqQfCt/xi6Ko08fA==
X-IronPort-AV: E=Sophos;i="6.08,199,1712613600"; 
   d="scan'208";a="37141848"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2024 10:39:30 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4F4B166106;
	Thu, 30 May 2024 10:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717058366;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ds8q6ImbzOAZZkTodVkRMD3hpsgSJkBCC76qc2Z+5m8=;
	b=KWohFM7sGESJ16IFS1fW65UQQLr2/K36mj13iOHWyjVgfnyPWIiGOYwUIbl7GEH13eysro
	v9YYW4V+nL5X1Adw63Vog1+93KsCnLpr2OKxW6suzCnnmCbhuKSM0shXY54IorNbUayQur
	1gaJqpE+/SntpPttc90Q4FLNFhA7uBFPxrWuW6kf2waexeyx4ACMP7tH9+a6QpxBKPIWji
	OfIFOtCo2u6309ddtiSiBDBreUSJ7tVurBbdWtz/51mF2gI7sdSAWtfCeT3pE0fgPARNOy
	nqvHGLx52dtaHxZwUGSWA26FVL+762BMiroKcv1P0UjWPC7H9tN3Knsq4t9Shw==
Message-ID: <0e971f0b885bd360e33ef472d96e3d9e0ab56405.camel@ew.tq-group.com>
Subject: Re: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH
 interrupt type
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregor Herburger
 <gregor.herburger@tq-group.com>,  linux@ew.tq-group.com
Date: Thu, 30 May 2024 10:39:25 +0200
In-Reply-To: <8689fbcd-3fa3-410b-8fc9-7a699bf163b8@moroto.mountain>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <8689fbcd-3fa3-410b-8fc9-7a699bf163b8@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 2024-05-29 at 17:38 +0300, Dan Carpenter wrote:
>=20
> On Wed, May 29, 2024 at 09:45:20AM +0200, Matthias Schiffer wrote:
> > diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> > index c957be3341774..400415676ad5d 100644
> > --- a/drivers/gpio/gpio-tqmx86.c
> > +++ b/drivers/gpio/gpio-tqmx86.c
> > @@ -126,9 +126,15 @@ static void _tqmx86_gpio_irq_config(struct tqmx86_=
gpio_data *gpio, int hwirq)
> >  	unsigned int offset =3D hwirq - TQMX86_NGPO;
> >  	u8 type =3D TQMX86_INT_TRIG_NONE, mask, val;
> > =20
> > -	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED)
> > +	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
> >  		type =3D gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK;
> > =20
> > +		if (type =3D=3D TQMX86_INT_TRIG_BOTH)
> > +			type =3D tqmx86_gpio_get(&gpio->chip, hwirq)
>                                                             ^^^^^
>=20
> > +				? TQMX86_INT_TRIG_FALLING
> > +				: TQMX86_INT_TRIG_RISING;
> > +	}
> > +
> >  	mask =3D TQMX86_GPII_MASK(offset);
>                                 ^^^^^^
> >  	val =3D TQMX86_GPII_CONFIG(offset, type);
>                                  ^^^^^^
> >  	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
>=20
> The offset stuff wasn't beautiful and I'm glad you are deleting it.  My
> understanding is that a hwirq is 0-3 for output or 4-7 input.  An offset
> is "hwirq % 4"?
>=20
> There are a bunch of places which are still marked as taking an offset
> but they all actually take a hwirq.  For example, tqmx86_gpio_get()
> above.  The only things which still actually take an offset are the
> TQMX86_GPII_MASK() and TQMX86_GPII_CONFIG() macros.
>=20
> Could you:
> 1) Modify TQMX86_GPII_MASK() and TQMX86_GPII_CONFIG() to take a hwirq?
> 2) Rename all the "offset" variables to "hwirq"?

Unfortunately, the TQMx86 GPIO is a huge mess, and the mapping between GPIO=
 numbers and IRQ numbers
depends on the hardware generation/variant. I don't think it is possible to=
 have GPIO numbers and
hwirq numbers differ, is it?

Currently, the driver only supports COM Express modules, where IRQs 0-3 cor=
respond to GPIOs 4-7,
while GPIOs 0-3 don't have interrupt support. We will soon be mainlining su=
pport for our SMARC
modules, which have up to 14 GPIOs, and (on some families) IRQ support for =
all GPIOs (IRQs 0-13
correspond to GPIOs 0-13).

New interrupt config and status registers have been introduced to support m=
ore IRQs - up to 4 config
registers (2 bits for each IRQ) and 3 status registers (IRQs 0-3 in the fir=
st one, 4-11 in the
second one, 12-13 in the third one... so this part is a bit more convoluted=
 than just "hwirq % 4")=20

As the mapping between GPIOs and IRQs will become dynamic with these change=
s, I'd rather keep
TQMX86_GPII_* using IRQ numbers instead of GPIO numbers. We will be introdu=
cing helpers for
accessing the interrupt registers; the macros deal with individual register=
 bits, and I think they
should be agnostic of the mapping to GPIO/hwirq numbers.

Matthias



>=20
> regards,
> dan carpenter
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

