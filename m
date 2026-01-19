Return-Path: <linux-gpio+bounces-30722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EACD39E46
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 07:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89F5B30094AC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 06:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C94F26B2D2;
	Mon, 19 Jan 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="h3Df8dIT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9182218E91;
	Mon, 19 Jan 2026 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768803428; cv=none; b=DUbNwkdY3ZGmIf/MozrtaQSVyCZkH8x8DMcvwog6L5SgMcRmQuvYKJhHRL1tvZvZv3vbk1hHk1rO4jKxOqTUIzrUyRFE8fAYZKhMkHedkk0gv2WcaESlk4+Xlc0VBnTcBs54gWCbulGlDYQDvNN7HWesd9E2gpOdM4U4IPoUQus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768803428; c=relaxed/simple;
	bh=4D09GowOStyWZ9vhcbXtEjUZYxlms2ruTnzxbqYBwvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkzbFHWiOZn3WWQa6lE4vFs+SE8BDx1bkB7oxfOiKEGwGtlntsuNK9O2dG3NNRFgHNGVcwwTklbY33LDDzO+ZVYasiIkEZz1QBVKNDeQDTZpxc1xDlM2yZVMZO1SDZFZ4fGfiTd/CZRkWhnNvZLwtyAEG2hGMwQJ2zOcTLDHGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=h3Df8dIT; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EC6743B89;
	Mon, 19 Jan 2026 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1768803418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jfIcGxB7sMVtCFfsM1/OYNfcCos7HQcfdsV2uBKqJU=;
	b=h3Df8dITZe4cPzIgjD0gmBqprkD3H2ZP8h1VPBetO7z5pkZ7c66KOyItBF/8Uwk7h4Z5H6
	EJmPp7kWYKlDbRVfJ+l765zwL7fJUBlkx8VrzozIeTMzYlRM5Mr+zXB6kl3WOqLnPonTjk
	PLeJ45JtPKJbkG74b0guLH52ScmWYwSRvqsaPa9YR16QcZyYj909INfil+tHtABUBp89pu
	x7VjJd0fUD7Y8qAqpibLrksvlJHdWqSyBG4KRaMgAfiHRyW5/BeAea/ThvikVxert7rMph
	PLdnXh+pva3nRmghPj/kFfaVVYEnsWAHJd++T6Pf/YApV7JE7RWrejZlWfuG3w==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject:
 Re: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip example
Date: Mon, 19 Jan 2026 07:15:54 +0100
Message-ID: <2818765.mvXUDI8C0e@jeanmichel-ms7b89>
In-Reply-To:
 <CAD++jLmBegkZyKoo2cgtgJt0-8Pn-H2XaAoqipgPp0hTmro+sQ@mail.gmail.com>
References:
 <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
 <1987899.tdWV9SEqCh@jeanmichel-ms7b89>
 <CAD++jLmBegkZyKoo2cgtgJt0-8Pn-H2XaAoqipgPp0hTmro+sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeikeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepffevhfduvdeludeugfdtleduuedvhfeuvdevgfeiieefieevteektdettdeifeetnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmedvrgegtdemfhefrggrmeejudejvgemudefsgdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemvdgrgedtmehffegrrgemjedujegvmedufegsvddphhgvlhhopehjvggrnhhmihgthhgvlhdqmhhsjegskeelrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpqhhiugepkefgveeijeegfeeukeelpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhimhgrnhhshhhurdgshhgrvhgrnhhisehsihhlihgtohhnshhighhnrghlshdrihhopdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: -100

Hi Linus,

Le lundi 19 janvier 2026, 00:12:05 heure normale d=E2=80=99Europe centrale =
Linus=20
Walleij a =C3=A9crit :
> On Wed, Jan 14, 2026 at 6:29=E2=80=AFPM Jean-Michel Hautbois
>=20
> <jeanmichel.hautbois@yoseli.org> wrote:
> > > Make some fancy - if: clauses to decide the maxItems from the
> > > compatible.
> > > Don't hesitate to ask for help if this gets complicated, I get a panic
> > > every time I have to deal with it because of the whitespacing busines=
s.
> >=20
> > Indeed, I was probably a bit optimistic :-).
> >=20
> > What about this:
> >  allOf:
> >    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >=20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - microchip,mcp23s08
> > +              - microchip,mcp23008
> > +    then:
> > +      properties:
> > +        gpio-line-names:
> > +          maxItems: 32
> > +        pinmux:
> > +          properties:
> > +            pins:
> > +              maxItems: 32
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - microchip,mcp23s17
> > +              - microchip,mcp23s18
> > +              - microchip,mcp23017
> > +              - microchip,mcp23018
> > +    then:
> > +      properties:
> > +        gpio-line-names:
> > +          maxItems: 128
> > +        pinmux:
> > +          properties:
> > +            pins:
> > +              maxItems: 128
> > +
> >=20
> > This would allow up to 4 chips to be on the same CS.
>=20
> Hm I don't get it why everything is multiplied by 4 here?
>=20
> Doesn't each chip have its own instance? And the instance is
> limited to 8 or 16 lines/pins?
>=20
> > But in the
> > microchip,mcp23s17 datasheet, it says:
> > "Three Hardware Address Pins to Allow Up to Eight Devices On the Bus"
>=20
> Doesn't each device have its own entry?

As far as I get it, for I2C variants, each chip has its own device node,
so gpio-line-names would be limited to 8/16 per node.

However, for SPI variants (mcp23s08/s17/s18), multiple chips can share
the same SPI chipselect via the 'microchip,spi-present-mask' property.

In this case, a single DT node represents multiple physical chips,
and gpio-line-names needs to cover all of them:
=2D mcp23s08: up to 4 chips =C3=97 8 GPIOs =3D 32 lines
=2D mcp23s17: up to 8 chips =C3=97 16 GPIOs =3D 128 lines

Should I split the conditionals to apply different limits for I2C vs SPI?

Or did I miss something which is totally possible too -_-' ?

Thanks,
JM

> Yours,
> Linus Walleij





