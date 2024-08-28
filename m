Return-Path: <linux-gpio+bounces-9245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46674961B55
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 03:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F4528507F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 01:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB37C1CA94;
	Wed, 28 Aug 2024 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="kzJ4Lns4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C2224D7;
	Wed, 28 Aug 2024 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724807901; cv=none; b=aPcGVNn7d0dQNlkB6aaiHJRTUAth60eqBV0sZEwNNPQ304xZ/BxUBkBjxxWdyEFSl8b4uGVnBNemwvQseTzcgEoWTeiCL9+aW3SomOfUUhGgYVtZiXRLOXhgpETsexWqo3EVhAykivywKbbpoIEy1yxsNyJ9MeVwtgPNOFhZC5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724807901; c=relaxed/simple;
	bh=NM/lwsS3G+GKJXhXb83ew0o1y2LlFi31QJtJmSZZeaI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m+1OMwN64OsMjR631GcOYRfGO8oHiDZYAOIjfpF5Wn0Ml/bhe21vrR+WZOKYYKche2ecIHbBB6wbrvX/5A6CTXbClNisy84/21rF7RXusV673qiZgLRlqA/db2JE8qKaO0kmd1eRbzCoJsxVv0l3AV9icsbnsGTCZ55WW6i6kM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=kzJ4Lns4; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724807895;
	bh=bSE2OAY6iKksQlsyS8uTUxZkQGdxPR2/GAYLJ2SIUjY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=kzJ4Lns4D9k57LouPc/ML5CJP0WhGPBVqYuF+dpxMKLT5NJWLFIWCbArZVWkUv7Dr
	 rhU/ZjoYbN0bOG7EImSeetjmM/eaOn0ymvzkub9Y4CMkLJ6I/EkeCzZ26P5/zfUrH0
	 Pt8qEn+5i8uRsFe87NACLcOEXh+nGUCmEdpMr+wK9PxnyT2Dl154GimlC0p9NSflTw
	 9b6T65PqWDACMy0vdxF49OENa6kLD7c3u22M8AEHLL1hgCDAbBLBOrkKF224YIdHTV
	 va0gKzZ/sfuZpwaMDRH2SKLgACJw/LIb7LZ+RcvHJwV9wtne0Uf+oKRQaXfLi/Zwz7
	 /aO25LvIqFCwQ==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4A16A6506F;
	Wed, 28 Aug 2024 09:18:12 +0800 (AWST)
Message-ID: <e629752d8c97a2d14641a7fbc0cbdb1cd01a8ac5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,  "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 28 Aug 2024 10:48:10 +0930
In-Reply-To: <OSQPR06MB7252CBAEBF1DBE2C613F24748B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
	 <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
	 <cf92b3ab4b171e7c7c07cada066dad6323c5dace.camel@codeconstruct.com.au>
	 <OSQPR06MB7252CBAEBF1DBE2C613F24748B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-08-27 at 02:45 +0000, Billy Tsai wrote:
> Hi Andrew,
>=20
> Thanks for your suggestion. As I understand it, you=E2=80=99re suggesting=
 that this driver should share the
> common parts with aspeed-gpio.c, correct?
> However, I don=E2=80=99t think that=E2=80=99s necessary. You can treat it=
 as a new GPIO controller because the
> register layout is quite different from aspeed-gpio.c.

Well, we could, but both share a lot of the same capabilities. aspeed-
gpio.c already has to abstract over the register layout because it's so
haphazard. What I was suggesting was to formalise this a bit more by
converting some of the inline functions and macros to callbacks that
can be implemented for each controller.

I haven't tried it myself, but it feels feasible?

> If I try to make it common, the driver could become too complex, potentia=
lly requiring a separate
> gpio-aspeed-common.c and necessitating changes to the existing aspeed-gpi=
o.c

I felt the trade-off between the volume of copy/paste and the
complexity of adding a few callbacks weighed in favour of the latter.

Also, given the volume of copy/paste, I think it would be best to
retain the copyright information from aspeed-gpio.c if the outcome is
these must be separate drivers.

Many of the changes seemed to be dealing with the difference between
`struct aspeed_gpio` and `struct aspeed_gpio_g7`, which might be
addressed by some careful struct design and use of container_of().

> Maybe the discussion of merging aspeed-gpio.c and this driver can be post=
poned until after this one
> is accepted?

Yeah, but I suspect the discussion just won't happen if this is merged.
Now's the time to get consensus on a way forward, while the driver is
yet to be merged.

> > > +
> > > +static const int debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };
>=20
> > This is all largely copy/pasted from gpio-aspeed.c. Can we split it out
> > and share the definitions?
>=20
> Do you mean moving them into the common header file?=20
> The structure is fine, but I=E2=80=99m unsure about the debounce_timers.=
=20
> It=E2=80=99s a static array, so I don=E2=80=99t think it needs to be shar=
ed with gpio-aspeed.c.

That can be changed though? An appropriate pointer can be point into
the driver struct.

> > > +static int aspeed_gpio_g7_get(struct gpio_chip *gc, unsigned int off=
set)
> > > +{
> > > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> > > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(off=
set);
> > > +
> > > +     return !!(field_get(GPIO_G7_IN_DATA, ioread32(addr)));
> > > +}
> > > +
> > > +static void __aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int =
offset, int val)
> > > +{
> > > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> > > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(off=
set);
>=20
> > The rest of the implementation of this function is broadly the same as
> > in gpio-aspeed.c. The main difference is accounting for the address to
> > access and the bit to whack. If we define some callbacks that replace
> > GPIO_BANK()/to_bank() and GPIO_BIT() that can account for the
> > differences in register layout, perhaps this could be common?
>=20
> > The trade-off is some complexity vs copy-paste, but there does seem to
> > be an awful lot of the latter with only minor changes so far.
>=20
> Do you mean I need to create a gpio-aspeed-common.c, define the necessary=
 common APIs,
> and have gpio-aspeed.c and this driver hook into those APIs?

Well, you may not have to do that if we can put it all in gpio-
aspeed.c?

My suspicion is the g7 support could largely become some well-chosen
callbacks.

Andrew

