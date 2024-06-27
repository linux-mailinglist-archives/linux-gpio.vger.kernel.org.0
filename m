Return-Path: <linux-gpio+bounces-7769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79691ABB8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9554B1F21B87
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E1F1991BE;
	Thu, 27 Jun 2024 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RON9hzvc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EB14EC40;
	Thu, 27 Jun 2024 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719503099; cv=none; b=VGy4Q3Q1p/srH6L3RZX7MR90hYfufzpkJJT1vgklEsDzAbl0n6aoVt633EdDgOvIl6AX0Ly/btO93RDI6jOmmv6hO0Y7vdWncOPo0hDMEnI3oZYMhzcrjF2QvhcZk0PsjiiCG229BUMb2d9Ke4K79ryYZphRF88viHTXHDR4xgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719503099; c=relaxed/simple;
	bh=t9RDTqcnY5vGFNoxkmThHGvrq09KQuDh0EnptxEQZ6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWVZR5SSRzf1K4NwCbknUgms94aSeZtIl6v3muKwYCL22MtwrXlx2SimbbJK9i2jSfiICknnlXXxo8SRbLe5S5O7caJwR6muRE8LOhU6EVOmrqlzgtO61h8cYy55xNkW5FCZreHtTi0nFq/nSPMkv+ny/Mghg8UfUuZcMoix214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RON9hzvc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B95FC2BBFC;
	Thu, 27 Jun 2024 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719503099;
	bh=t9RDTqcnY5vGFNoxkmThHGvrq09KQuDh0EnptxEQZ6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RON9hzvcadQQBER5cjIGLISL96po8BKIAuEeuoq816vKtfbrJsAH7t3ERXPot+caG
	 GUB8fJuaeALa7rYJSlhAadsxoiNAdTpNTe02q4ITePGDwL1HqP59lF697e0aNrANFD
	 8qo2x+xKgR3pLL6i35TO8H/kxRLBRK4PPzcFz6uC1Ddtq33IGpDEIMrfSLWOXg+S0t
	 41faZLx77Qpc4/j2uAZk1bxI1hNEQgVZOfR5RvTUoq2Od0vnccJFfOBiMrGT3IGPw9
	 jB8jP/atn1jd16kXmVM28WiFhw3mGc840WDrp0suWrDT0Cobl+21osutOzlQbwSXjm
	 K6M/7ye/YXbnQ==
Date: Thu, 27 Jun 2024 16:44:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan.M@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de,
	Durai.ManickamKR@microchip.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Message-ID: <20240627-share-dry-edfd5d86051e@spud>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-5-manikandan.m@microchip.com>
 <20240625-clerical-manicure-ebc8a1d1b16b@spud>
 <96898000-1ef4-40c7-83de-3759d48c9ace@microchip.com>
 <20240626-fondly-batboy-e99846fd6c45@spud>
 <cb42c36c-6496-441a-a6c5-e4fdb512292e@microchip.com>
 <20240627-imminent-unmovable-8c3b743c94ca@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uVSIurMqFrDKnH/"
Content-Disposition: inline
In-Reply-To: <20240627-imminent-unmovable-8c3b743c94ca@spud>


--3uVSIurMqFrDKnH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 04:42:24PM +0100, Conor Dooley wrote:
> > >>>> +properties:
> > >>>> +  compatible:
> > >>>> +    oneOf:
> > >>>> +      - items:
> > >>>> +          - enum:
> > >>>> +              - atmel,at91sam9x5-gpio
> > >>>> +              - microchip,sam9x60-gpio
> > >>>> +          - const: atmel,at91rm9200-gpio
> > >>>> +      - items:
> > >>>> +          - enum:
> > >>>> +              - microchip,sam9x7-gpio
> > >>>> +          - const: microchip,sam9x60-gpio
> > >>>> +          - const: atmel,at91rm9200-gpio
> > >>> It's worth pointing out that this is required, because the driver
> > >>> implements a different set of ops for the sam9x60. There's not just=
 more
> > >>> of them, they're different too.
> > >>> Are the sam9x60 and at91rm9200 are actually compatible, or is the
> > >>> fallback here some mistake that originated in the dts?
> > >>>
> > >> The PIO3 pinctrl driver uses the compatible "atmel,at91rm9200-gpio" =
to
> > >> find the number of active GPIO banks and also to differentiate them =
=66rom
> > >> the pinmux child nodes.The driver probe fails if the at91rm9200 is n=
ot
> > >> present in the GPIO bank compatible property list.
> > >> For sam9x7, "microchip,sam9x60-gpio" is used as the fallback compati=
ble
> > >> and "atmel,at91rm9200-gpio" is added by default to avoid probe issues
> > >> and help find the number of GPIO banks by the driver.
> > > That's unfortunately not what I asked. Forget about
> > > at91_pinctrl_child_count() for a minute and answer the question again:
> > > Are the sam9x60 and at91rm9200 actually compatible?
> > >=20
> > > Hints:
> > > - Do the registers that are in the at91rm9200 have the same behaviour=
 in
> > >    the sam9x60?
> > The registers in at91rm9200 have the same behavior as sam9x60 expect=20
> > that the former supports only 2 Peripheral function per pin while=20
> > sam9x60 supports 4.
> > > - Are the new registers in sam9x60 optional, so that if all sam9x60 c=
ode
> > >    was deleted from the driver, the driver would still work for the s=
ubset
> > >    of features that the at91rm9200 already supports?
> > at91rm9200 function will work for sam9x60 but not up-to its full=20
> > potential.The new registers in sam9x60 for drive-strength, slew-rate,=
=20
> > debounce, pull-down will help drive the the current pinmux configs for=
=20
> > sam9x60/9x7 board DT.
>=20
> Right. The compatible setup makes sense then, just an explanation for
> why should go into your commit message.

Gah, I forgot to say, with that:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--3uVSIurMqFrDKnH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2I9gAKCRB4tDGHoIJi
0guUAQCBs7A9g0UHPdDI+bwue3lPWbQbqE2EHT1YyfSulcKekwEA/LL+2N1Rx62b
muhAOLUh2mn3/jt5goUkBX7NXJi9wwo=
=Fs49
-----END PGP SIGNATURE-----

--3uVSIurMqFrDKnH/--

