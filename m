Return-Path: <linux-gpio+bounces-30724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A480D3A1FF
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 09:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B9B8303C9C3
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE85A34D4D6;
	Mon, 19 Jan 2026 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrWU2mgm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953E34D4F5
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812389; cv=none; b=TKhMN9dAeVUwCnfa44Syk32vteylQgAWmhIsC+Q3T5pb4IaFpYrOAIrWsXH5SoGgYNJR/vuP0TLP/nmQyL5/ITKwTpqXmXPQjrq2Qi+HaggTfcXVlbGPhui5tgZM0RQhv+XqDdIgv+Ii6VqgqBDttQPiVuDlsaHyUwpHyyGT4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812389; c=relaxed/simple;
	bh=+BMUh8L0o+7ThP9nhOP4cDMkmocufhkTcZxIfL6Mjbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjDI3WXoaOrcRwIfvpIl70PsNaPphekOFFxb93y9HEfmGpfRDrbsCzbET1cyDF5ClHYoCHsSx3N52oR/VFs33B3p34qKIeFLLsic3EV/aU4mAS6ANomex7RXxDprLiKMSa2PVpoUrYCmnVFbRv6PL/nPQS2DXNZiz+9ZLdbv+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrWU2mgm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3104C2BC87
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768812388;
	bh=+BMUh8L0o+7ThP9nhOP4cDMkmocufhkTcZxIfL6Mjbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mrWU2mgmyW1Y5GB+oqR2exVR4vGfIl8NCZWIPcTND6IcA//vd8ihU+h7giz5KICzj
	 ZkZshzF61g/ucsRgulSreUK/cFmXkZVbkU3fZlb+l8juO9Gpng2wETgzT3RTCQH4Kv
	 i5HmeB0dcZvUrbFEtJZ/w5WLRRnwmE9cKaV1gYmpkt9nKp8lQGsKTqPU98Nq9iBvfr
	 4NwufRhqR2lkKZy6g4WRS7zRH58I3SdPyt+GMi1j1uA4QXyfC9ITeCFxYZCCJYSixT
	 FU8Fwi6RL3hdGPSN+vWa9cgwtiD0j5B2gCvNwsC/moRVtZUY5BjeGpJzPKRg9OkxP/
	 rjDROsGB6L3jg==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649295a4a5bso665389d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 00:46:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPjo9f4HVgE0u+kZgxtun2flDZq6LJ9p9XsiQ3br8acXjsFLEyUaOnZeBaQWOGPXHyXfwz2vvFFuNL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4EbExIqmNpQreL3sjl0KzxFTlbdHAvEut78wAAFfBEsNILI9A
	Da9yupszGnpGEIt0XmoUtHzC0HEtSPMxxrZW1+Gue6onYxc61lhXYkhAT3ZGJUUCfoZU6lceNhD
	doEPwKhlPX2ipI4alHnY4jVxEIoePjK4=
X-Received: by 2002:a05:690c:12:b0:789:2be7:ae80 with SMTP id
 00721157ae682-793c53dd8fbmr189522497b3.54.1768812388165; Mon, 19 Jan 2026
 00:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
 <1987899.tdWV9SEqCh@jeanmichel-ms7b89> <CAD++jLmBegkZyKoo2cgtgJt0-8Pn-H2XaAoqipgPp0hTmro+sQ@mail.gmail.com>
 <2818765.mvXUDI8C0e@jeanmichel-ms7b89>
In-Reply-To: <2818765.mvXUDI8C0e@jeanmichel-ms7b89>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 09:46:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLkmOHF8sPa2OMW9QF3+MHaFWtmpsZje0UU2q0EaN4OExA@mail.gmail.com>
X-Gm-Features: AZwV_QgDeyLEupibvPdMNnjxzOKw0sccMFeHAJvFJT88Sa8aqr0_KcU7Y0O9KBA
Message-ID: <CAD++jLkmOHF8sPa2OMW9QF3+MHaFWtmpsZje0UU2q0EaN4OExA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip example
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Lars Poeschel <poeschel@lemonage.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

paging in Lars Poeschel who might be able to shed some light on this!

On Mon, Jan 19, 2026 at 7:17=E2=80=AFAM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Le lundi 19 janvier 2026, 00:12:05 heure normale d=E2=80=99Europe central=
e Linus
> Walleij a =C3=A9crit :
> > On Wed, Jan 14, 2026 at 6:29=E2=80=AFPM Jean-Michel Hautbois

> > <jeanmichel.hautbois@yoseli.org> wrote:
> > > > Make some fancy - if: clauses to decide the maxItems from the
> > > > compatible.
> > > > Don't hesitate to ask for help if this gets complicated, I get a pa=
nic
> > > > every time I have to deal with it because of the whitespacing busin=
ess.
> > >
> > > Indeed, I was probably a bit optimistic :-).
> > >
> > > What about this:
> > >  allOf:
> > >    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - microchip,mcp23s08
> > > +              - microchip,mcp23008
> > > +    then:
> > > +      properties:
> > > +        gpio-line-names:
> > > +          maxItems: 32
> > > +        pinmux:
> > > +          properties:
> > > +            pins:
> > > +              maxItems: 32
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - microchip,mcp23s17
> > > +              - microchip,mcp23s18
> > > +              - microchip,mcp23017
> > > +              - microchip,mcp23018
> > > +    then:
> > > +      properties:
> > > +        gpio-line-names:
> > > +          maxItems: 128
> > > +        pinmux:
> > > +          properties:
> > > +            pins:
> > > +              maxItems: 128
> > > +
> > >
> > > This would allow up to 4 chips to be on the same CS.
> >
> > Hm I don't get it why everything is multiplied by 4 here?
> >
> > Doesn't each chip have its own instance? And the instance is
> > limited to 8 or 16 lines/pins?
> >
> > > But in the
> > > microchip,mcp23s17 datasheet, it says:
> > > "Three Hardware Address Pins to Allow Up to Eight Devices On the Bus"
> >
> > Doesn't each device have its own entry?
>
> As far as I get it, for I2C variants, each chip has its own device node,
> so gpio-line-names would be limited to 8/16 per node.
>
> However, for SPI variants (mcp23s08/s17/s18), multiple chips can share
> the same SPI chipselect via the 'microchip,spi-present-mask' property.
>
> In this case, a single DT node represents multiple physical chips,
> and gpio-line-names needs to cover all of them:
> - mcp23s08: up to 4 chips =C3=97 8 GPIOs =3D 32 lines
> - mcp23s17: up to 8 chips =C3=97 16 GPIOs =3D 128 lines
>
> Should I split the conditionals to apply different limits for I2C vs SPI?
>
> Or did I miss something which is totally possible too -_-' ?

Just that several chips share the same chip select does not
mean they should have the same device instance.

You can also confirm that Linux instantiates one regmap
and one gpio_chip per device node. The ngpio accumulated
in pinctrl-mcp23s08_spi.c  mcp23s08_probe() is not used for
anything, in fact it is garbage AFAICT and should be deleted.

Further, we apparently have no in-kernel device tree actually
using this property. Just grep for microchip,spi-present-mask
and mcp,spi-present-mask: no-one is using this property.
No-one on the entire internet either. So I seriously wonder
about this thing.

Given that the code bails out for the SPI device if this property
isn't present and we still have a bunch of SPI-based
MCP23S08 in the tree I wonder what is going on. Are all of
these broken?? They clearly never use more than 8/16
lines/GPIOs anyway.

I think you can safely assume 8/16 lines for any device
here.

I'd like to hear from someone using the MCP23S* devices
over SPI if their device is actually working :/

Yours,
Linus Walleij

