Return-Path: <linux-gpio+bounces-7768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A391ABAD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37541C20C78
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260361991A9;
	Thu, 27 Jun 2024 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgUkw025"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096614EC40;
	Thu, 27 Jun 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502949; cv=none; b=PAZJcGmbQD9osWNFhUlRhs2joOYHWYS9W0JLQ5WQOjLtWm7/OkMK2N2ja4uyXOgThFwsVqoc8jc/47AEeqvKETaot0uKn/Hhp0YOvVYDD3nLH4bxv8woJNg7BW1ROIBsT+ZADnglLx47rBjaG79cvXcyNkUxdJeGXxWZolslBfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502949; c=relaxed/simple;
	bh=sTU7oI+gMpTNNu21oQX4HLxujKN3nGksQiuqkfOHuQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFbJHtSm3A4BiWSQEtkcGaR6unWdiBXpmDDX7vTWg3JdABSlf5tQGptDMOpk3xChRJUZPj7XOpmSE5PFHYEzvbQHCCpN9v+lxxHyHyHt/ijdvjvp5Yvn0TNLcVPfO9IhCrh9ZEQ35DEwAiq4FKMD0UvCAVuCPc5qrRBGIsvY92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgUkw025; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7912EC2BBFC;
	Thu, 27 Jun 2024 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719502949;
	bh=sTU7oI+gMpTNNu21oQX4HLxujKN3nGksQiuqkfOHuQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgUkw025jkhSlX8dfvr1QCYXh2smkOLCeyKeC6ksSI5GAQ4b9SZ014chZw0SoZ94e
	 qUh650PwVg6L8+RmIUD+R2K251YAWxaeHhsTSzoGjIKVnhi1x1KV6pyg5no3B9mBQ4
	 6okYtxeHpY02Xr2/18v6vMF2DDxkfgo7ijrpoO/x6+qTRIwWcfuV8jzRjmfBmT3zbS
	 TRhgqj0izIodz51K+gPldkZIRU/952kePaFv5EEys4hgdrn1jjaEbh0D+EERyjn3ek
	 2EmV6AfmvG2KlRjeDcU3tFKIj1GagWsXKQu86RB3qf7LqfRyMdnbhaeH/l1Ypz0D9g
	 8JlqF1VUZaSYA==
Date: Thu, 27 Jun 2024 16:42:24 +0100
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
Message-ID: <20240627-imminent-unmovable-8c3b743c94ca@spud>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-5-manikandan.m@microchip.com>
 <20240625-clerical-manicure-ebc8a1d1b16b@spud>
 <96898000-1ef4-40c7-83de-3759d48c9ace@microchip.com>
 <20240626-fondly-batboy-e99846fd6c45@spud>
 <cb42c36c-6496-441a-a6c5-e4fdb512292e@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8GnDDvMkoLj2EDLV"
Content-Disposition: inline
In-Reply-To: <cb42c36c-6496-441a-a6c5-e4fdb512292e@microchip.com>


--8GnDDvMkoLj2EDLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 06:08:15AM +0000, Manikandan.M@microchip.com wrote:
> Hi Conor,
>=20
> On 26/06/24 2:29 pm, Conor Dooley wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> >=20
> > ForwardedMessage.eml
> >=20
> > Subject:
> > Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
> > From:
> > Conor Dooley <conor@kernel.org>
> > Date:
> > 26/06/24, 2:29 pm
> >=20
> > To:
> > Manikandan.M@microchip.com
> > CC:
> > linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,=20
> > krzk+dt@kernel.org, conor+dt@kernel.org, Nicolas.Ferre@microchip.com,=
=20
> > alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, arnd@arndb.de,=
=20
> > Durai.ManickamKR@microchip.com, linux-gpio@vger.kernel.org,=20
> > devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,=20
> > linux-kernel@vger.kernel.org
> >=20
> >=20
> > On Wed, Jun 26, 2024 at 08:32:41AM +0000,Manikandan.M@microchip.com  wr=
ote:
> >> On 25/06/24 10:04 pm, Conor Dooley wrote:
> >>> Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to json-sche=
ma
> >>> From: Conor Dooley<conor@kernel.org>
> >>> On Tue, Jun 25, 2024 at 10:05:24AM +0530, Manikandan Muralidharan wro=
te:
> >>>> Convert the Atmel GPIO controller binding document to DT schema form=
at
> >>>> using json-schema.
> >>>> The compatible string "microchip,sam9x7-gpio" is added as well.
> >>>>
> >>>> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> >>>> ---
> >>>> changes in v2:
> >>>> - Fix bot errors with 'make dt_binding_check', missed to add
> >>>> "atmel,at91rm9200-gpio" as separate compatible for devices that uses=
 it
> >>>> - Remove label from example
> >>>> - Add default entry for #gpio-lines property
> >>>> - Add new compatible string details in commit message
> >>>> ---
> >>>>    .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 81 ++++++++++++++=
+++++
> >>>>    .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 -------
> >>>>    2 files changed, 81 insertions(+), 31 deletions(-)
> >>>>    create mode 100644 Documentation/devicetree/bindings/gpio/atmel,a=
t91rm9200-gpio.yaml
> >>>>    delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_at=
mel.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200=
-gpio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.y=
aml
> >>>> new file mode 100644
> >>>> index 000000000000..3dd70933ed8e
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.y=
aml
> >>>> @@ -0,0 +1,81 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id:http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
> >>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Microchip GPIO controller (PIO)
> >>>> +
> >>>> +maintainers:
> >>>> +  - Manikandan Muralidharan<manikandan.m@microchip.com>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    oneOf:
> >>>> +      - items:
> >>>> +          - enum:
> >>>> +              - atmel,at91sam9x5-gpio
> >>>> +              - microchip,sam9x60-gpio
> >>>> +          - const: atmel,at91rm9200-gpio
> >>>> +      - items:
> >>>> +          - enum:
> >>>> +              - microchip,sam9x7-gpio
> >>>> +          - const: microchip,sam9x60-gpio
> >>>> +          - const: atmel,at91rm9200-gpio
> >>> It's worth pointing out that this is required, because the driver
> >>> implements a different set of ops for the sam9x60. There's not just m=
ore
> >>> of them, they're different too.
> >>> Are the sam9x60 and at91rm9200 are actually compatible, or is the
> >>> fallback here some mistake that originated in the dts?
> >>>
> >> The PIO3 pinctrl driver uses the compatible "atmel,at91rm9200-gpio" to
> >> find the number of active GPIO banks and also to differentiate them fr=
om
> >> the pinmux child nodes.The driver probe fails if the at91rm9200 is not
> >> present in the GPIO bank compatible property list.
> >> For sam9x7, "microchip,sam9x60-gpio" is used as the fallback compatible
> >> and "atmel,at91rm9200-gpio" is added by default to avoid probe issues
> >> and help find the number of GPIO banks by the driver.
> > That's unfortunately not what I asked. Forget about
> > at91_pinctrl_child_count() for a minute and answer the question again:
> > Are the sam9x60 and at91rm9200 actually compatible?
> >=20
> > Hints:
> > - Do the registers that are in the at91rm9200 have the same behaviour in
> >    the sam9x60?
> The registers in at91rm9200 have the same behavior as sam9x60 expect=20
> that the former supports only 2 Peripheral function per pin while=20
> sam9x60 supports 4.
> > - Are the new registers in sam9x60 optional, so that if all sam9x60 code
> >    was deleted from the driver, the driver would still work for the sub=
set
> >    of features that the at91rm9200 already supports?
> at91rm9200 function will work for sam9x60 but not up-to its full=20
> potential.The new registers in sam9x60 for drive-strength, slew-rate,=20
> debounce, pull-down will help drive the the current pinmux configs for=20
> sam9x60/9x7 board DT.

Right. The compatible setup makes sense then, just an explanation for
why should go into your commit message.

Thanks,
Conor.

--8GnDDvMkoLj2EDLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2IYAAKCRB4tDGHoIJi
0k3oAP4g9Emg/RMcs9ydTvcShRGDGohSrg+VWCNeV9br7iSBwgD/RE3Y6Ym8fdNJ
AaA46U5Nbuv0w4Bnv/uCEkRAM6R0Cww=
=Q/IB
-----END PGP SIGNATURE-----

--8GnDDvMkoLj2EDLV--

