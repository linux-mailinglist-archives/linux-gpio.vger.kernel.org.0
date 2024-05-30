Return-Path: <linux-gpio+bounces-6945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930ED8D4AEE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06ADD1F23566
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9827915D5A3;
	Thu, 30 May 2024 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Mh8kymAp";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rQgiANPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD32183989;
	Thu, 30 May 2024 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068982; cv=none; b=Aas5X84I6xBjfOzPSFoO/DMcTUZVOTdELS1F0OPoZOEkRS2LfYCUhISUQPfXrFUQ4FB6j5gssiGreOyvlS3Z5ecr5Ev0sWirQtrvuSmgfLYu4Q6Oze24HFVMGJPs6oOyc0ZmjBFAzHAGvya+DWXEF6sPlgQh2HmIC4D68/dAA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068982; c=relaxed/simple;
	bh=PyZkWSvOYxntP+vybS7PiSYNC97LojTdNGixkEx7as0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nMG+I4E/csxPEY5UF7nRae3Y0mpfeTUuG3hXjJdluq4Z5znImNP8hSjxLZ6WsVOk3SdoDPRUS2rXyZ+KoRukfRaU13c5dBZ0kwa7nucSNWX9JrMFBTanw+WOMQpu1ccZo7BONYoF8UwNopTpHW+/VEqyzoyyltOc2rbc7fyhzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Mh8kymAp; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rQgiANPF reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717068978; x=1748604978;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=rZCTxMdK6MZjjpQW3uDf8zn3t6KnbdfVhR/xoMax9cY=;
  b=Mh8kymApd0YspXD/EJ88D/anKMwSwIetKzA5hvv1vKwneiM9AO/5uEr6
   8EncghO0+zEkl7GjyQI9PNWhVU0KzlhUGaiLmzVVmIuevR43++ChrzWK8
   5EXUm+0S0kAqmdRZMiGiEcGdfcoNslS5WEdjcPEBh9hTE7OpDGM0p3kGR
   kP0aRCnaekmW1YdpZ1lIVk1PpW/WdFS/vVOIT5mrq2J+Ch5R8XQBStHvN
   unbF85Nk0oTflsS00UckC8kZPrbWVTMhYWpC2kn/LCwIyf570BaOqFjZ+
   AETng3SdjmWkgnnaXy2H3H7OzgOzLbs7u//DomZHrKZVPEuGMu99ATdJY
   Q==;
X-CSE-ConnectionGUID: V12xdO4iREeHjZSvkPYvIQ==
X-CSE-MsgGUID: klZk0XvERU+ANt6YON9MwQ==
X-IronPort-AV: E=Sophos;i="6.08,201,1712613600"; 
   d="scan'208";a="37143700"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2024 13:36:15 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 450BE166314;
	Thu, 30 May 2024 13:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717068971;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rZCTxMdK6MZjjpQW3uDf8zn3t6KnbdfVhR/xoMax9cY=;
	b=rQgiANPF7tbt23kQzGSgR3ZJcprOX8jC1tT64aPC4T06VmuSb6lhKLmtHfNU8Hd/j4xluZ
	0icNYtF0K6zCj+Q49qY+A6mxidyieT8rMutQEcQcYckVhjelUCEwLXuBYn8z6XA2vsMMj4
	cnV8m+YKDykzNMbBJz1ltv4eZ3GuCCOUzS2o0K1ncvhhKN0YPK9gQtQNbh0iqqBQQnhpxw
	qfuT9kIKg6iLGSqWlsf21/9jTT6IES29uxfbKaUEB3ZviSmzuABK1tAmadfsf1abXSXEBc
	dwlK2Lg9LkuoRdION47fU1BdmzKPH6zj2aWQEiz9GdlylMKdUYjR686Gp0IIMA==
Message-ID: <aef9b748935eb6d30597cab4faf911c72a45c6e6.camel@ew.tq-group.com>
Subject: Re: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH
 interrupt type
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregor Herburger
 <gregor.herburger@tq-group.com>,  linux@ew.tq-group.com
Date: Thu, 30 May 2024 13:36:10 +0200
In-Reply-To: <c76e17c950aae6083b9a75b2080d5e87b8145d14.camel@ew.tq-group.com>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <8689fbcd-3fa3-410b-8fc9-7a699bf163b8@moroto.mountain>
	 <0e971f0b885bd360e33ef472d96e3d9e0ab56405.camel@ew.tq-group.com>
	 <876eb824-2898-4ffe-9d0e-69dd0781729f@moroto.mountain>
	 <c76e17c950aae6083b9a75b2080d5e87b8145d14.camel@ew.tq-group.com>
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

On Thu, 2024-05-30 at 13:15 +0200, Matthias Schiffer wrote:
> On Thu, 2024-05-30 at 13:22 +0300, Dan Carpenter wrote:
> >=20
> > On Thu, May 30, 2024 at 10:39:25AM +0200, Matthias Schiffer wrote:
> > > On Wed, 2024-05-29 at 17:38 +0300, Dan Carpenter wrote:
> > > >=20
> > > > On Wed, May 29, 2024 at 09:45:20AM +0200, Matthias Schiffer wrote:
> > > > > diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx8=
6.c
> > > > > index c957be3341774..400415676ad5d 100644
> > > > > --- a/drivers/gpio/gpio-tqmx86.c
> > > > > +++ b/drivers/gpio/gpio-tqmx86.c
> > > > > @@ -126,9 +126,15 @@ static void _tqmx86_gpio_irq_config(struct t=
qmx86_gpio_data *gpio, int hwirq)
> > > > >  	unsigned int offset =3D hwirq - TQMX86_NGPO;
> > > > >  	u8 type =3D TQMX86_INT_TRIG_NONE, mask, val;
> > > > > =20
> > > > > -	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED)
> > > > > +	if (gpio->irq_type[hwirq] & TQMX86_INT_UNMASKED) {
> > > > >  		type =3D gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK;
> > > > > =20
> > > > > +		if (type =3D=3D TQMX86_INT_TRIG_BOTH)
> > > > > +			type =3D tqmx86_gpio_get(&gpio->chip, hwirq)
> > > >                                                             ^^^^^
> > > >=20
> > > > > +				? TQMX86_INT_TRIG_FALLING
> > > > > +				: TQMX86_INT_TRIG_RISING;
> > > > > +	}
> > > > > +
> > > > >  	mask =3D TQMX86_GPII_MASK(offset);
> > > >                                 ^^^^^^
> > > > >  	val =3D TQMX86_GPII_CONFIG(offset, type);
> > > >                                  ^^^^^^
> > > > >  	_tqmx86_gpio_update_bits(gpio, TQMX86_GPIIC, mask, val);
> > > >=20
> > > > The offset stuff wasn't beautiful and I'm glad you are deleting it.=
  My
> > > > understanding is that a hwirq is 0-3 for output or 4-7 input.  An o=
ffset
> > > > is "hwirq % 4"?
> > > >=20
> > > > There are a bunch of places which are still marked as taking an off=
set
> > > > but they all actually take a hwirq.  For example, tqmx86_gpio_get()
> > > > above.  The only things which still actually take an offset are the
> > > > TQMX86_GPII_MASK() and TQMX86_GPII_CONFIG() macros.
> > > >=20
> > > > Could you:
> > > > 1) Modify TQMX86_GPII_MASK() and TQMX86_GPII_CONFIG() to take a hwi=
rq?
> > > > 2) Rename all the "offset" variables to "hwirq"?
> > >=20
> > > Unfortunately, the TQMx86 GPIO is a huge mess, and the mapping betwee=
n GPIO numbers and IRQ numbers
> > > depends on the hardware generation/variant. I don't think it is possi=
ble to have GPIO numbers and
> > > hwirq numbers differ, is it?
> > >=20
> > > Currently, the driver only supports COM Express modules, where IRQs 0=
-3 correspond to GPIOs 4-7,
> > > while GPIOs 0-3 don't have interrupt support.
> >=20
> > I'm so confused.
> >=20
> > So "offset" is the GPIO number and "hwirq" is the IRQ number?  If the
> > IRQ numbers are 0-3 then why do we subtract 4 to get the GPIO number in
>=20
> The current naming in the driver is confusing and I'll fix that in the ne=
xt round of refactoring
> patches.
>=20
> Generally, hwirq =3D=3D GPIO number (I have not found a way to change thi=
s mapping - if there is one,
> I'd be interested to try if it makes the code less confusing). "offset" c=
urrently always refers to
> some shift in a hardware register. In tqmx86_gpio_get and tqmx86_gpio_set=
, offset is a GPIO number.
> In all functions dealing with IRQs, offset is an IRQ number (which is dif=
ferent from the hwirq
> number).
>=20
> Matthias

Ah, I just noticed the "to_irq" function in struct gpio_chip, I guess I sim=
ply didn't look in the
right place before. Will have a closer look when I rebase the refactoring p=
atches.

Matthias



>=20
>=20
> > _tqmx86_gpio_irq_config()?
> >=20
> > 	unsigned int offset =3D hwirq - TQMX86_NGPO;
> >=20
> > And again, it's just weird to call:
> >=20
> > 		type =3D tqmx86_gpio_get(&gpio->chip, hwirq);
> >=20
> > where we're passing "hwirq" when tqmx86_gpio_get() takes an "offset" as
> > an argument.
> >=20
> > regards,
> > dan carpenter
> >=20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

