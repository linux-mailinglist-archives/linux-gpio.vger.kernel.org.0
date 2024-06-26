Return-Path: <linux-gpio+bounces-7711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF6917B92
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 11:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBCF31F26F7F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 09:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7CE16630E;
	Wed, 26 Jun 2024 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amgAXdYh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC531684B9;
	Wed, 26 Jun 2024 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719392396; cv=none; b=q14vvpm8LVgGFTUuaF9Ixzkl5lOZTX/Lsv02lXF6m2XVS/NiB3hezB8ma+swdrUXHQ3e3SUCNtSwy6KM5tTsn1TMaPy+6gjIyIoj6Rc7506bWcErTLdF/mIJWFoAV5+cpZA5dFJTsIAgJ/TNLc9YBiCfgP7uaIEw1z75WM+sHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719392396; c=relaxed/simple;
	bh=uoef4xR150WG+JCSrIubghaULCeTQM1RRAxszK/UVJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcK/iLhBUUV9hUv/VjXHUdga7Kzgbv/Mo5hXOS1FDkJoizikZXgNXkf3/0IlDtbvvqgVb/wkLFqaQCJoF0nW90xnlzG1t1mG6zsOdcgZr+aeNeWx92DnnbOHP22PUAuRojd5qPE2SsDQ/IxZ6KeiDfZdMcVbhFc8mMkvw02GkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amgAXdYh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1C5C4AF0C;
	Wed, 26 Jun 2024 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719392395;
	bh=uoef4xR150WG+JCSrIubghaULCeTQM1RRAxszK/UVJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amgAXdYh5FFfBrRxTsEkwdn0psPhYCAPkVHe/GyzDzirE8odO+iVIgekTg/VKbpg8
	 fXUA/k+jGgkPcXU0YOI0nURpYgIOH8aAxHjXkZbUUQdodWixl52L90jI20DeywWqJc
	 SJIFW0RwMCrJ9/ki2GGqvsc07BKhIAxxAGgo1XaZDLarUo0LOZ0Hq4Bok3kge1mhGw
	 M4H/J1RJwpI9KUWKQXKWa/N9KgUghhMHVbWikMkoi+kHYOC+QJ7PsnhpuFVJkfHed4
	 MQ0AOn/hy8qZLypOrN3FzU9SvSuC4iyhD2Ic1K8mOPuspQ0bGQHGKZh6DpU03DppFb
	 00TqDq/VpFzbw==
Date: Wed, 26 Jun 2024 09:59:50 +0100
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
Message-ID: <20240626-fondly-batboy-e99846fd6c45@spud>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-5-manikandan.m@microchip.com>
 <20240625-clerical-manicure-ebc8a1d1b16b@spud>
 <96898000-1ef4-40c7-83de-3759d48c9ace@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="htBluDkPT/WNhxo8"
Content-Disposition: inline
In-Reply-To: <96898000-1ef4-40c7-83de-3759d48c9ace@microchip.com>


--htBluDkPT/WNhxo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 08:32:41AM +0000, Manikandan.M@microchip.com wrote:
> On 25/06/24 10:04 pm, Conor Dooley wrote:
> > Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
> > From: Conor Dooley <conor@kernel.org>
> > On Tue, Jun 25, 2024 at 10:05:24AM +0530, Manikandan Muralidharan wrote:
> >> Convert the Atmel GPIO controller binding document to DT schema format
> >> using json-schema.
> >> The compatible string "microchip,sam9x7-gpio" is added as well.
> >>
> >> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> >> ---
> >> changes in v2:
> >> - Fix bot errors with 'make dt_binding_check', missed to add
> >> "atmel,at91rm9200-gpio" as separate compatible for devices that uses it
> >> - Remove label from example
> >> - Add default entry for #gpio-lines property
> >> - Add new compatible string details in commit message
> >> ---
> >>   .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 81 +++++++++++++++++=
++
> >>   .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 -------
> >>   2 files changed, 81 insertions(+), 31 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91=
rm9200-gpio.yaml
> >>   delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel=
=2Etxt
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-g=
pio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> >> new file mode 100644
> >> index 000000000000..3dd70933ed8e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> >> @@ -0,0 +1,81 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id:http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
> >> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip GPIO controller (PIO)
> >> +
> >> +maintainers:
> >> +  - Manikandan Muralidharan<manikandan.m@microchip.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - atmel,at91sam9x5-gpio
> >> +              - microchip,sam9x60-gpio
> >> +          - const: atmel,at91rm9200-gpio
> >> +      - items:
> >> +          - enum:
> >> +              - microchip,sam9x7-gpio
> >> +          - const: microchip,sam9x60-gpio
> >> +          - const: atmel,at91rm9200-gpio
> > It's worth pointing out that this is required, because the driver
> > implements a different set of ops for the sam9x60. There's not just more
> > of them, they're different too.
> > Are the sam9x60 and at91rm9200 are actually compatible, or is the
> > fallback here some mistake that originated in the dts?
> >=20
> The PIO3 pinctrl driver uses the compatible "atmel,at91rm9200-gpio" to=20
> find the number of active GPIO banks and also to differentiate them from=
=20
> the pinmux child nodes.The driver probe fails if the at91rm9200 is not=20
> present in the GPIO bank compatible property list.
> For sam9x7, "microchip,sam9x60-gpio" is used as the fallback compatible=
=20
> and "atmel,at91rm9200-gpio" is added by default to avoid probe issues=20
> and help find the number of GPIO banks by the driver.

That's unfortunately not what I asked. Forget about
at91_pinctrl_child_count() for a minute and answer the question again:
Are the sam9x60 and at91rm9200 actually compatible?

Hints:
- Do the registers that are in the at91rm9200 have the same behaviour in
  the sam9x60?
- Are the new registers in sam9x60 optional, so that if all sam9x60 code
  was deleted from the driver, the driver would still work for the subset
  of features that the at91rm9200 already supports?

Thanks,
Conor.

--htBluDkPT/WNhxo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnvYggAKCRB4tDGHoIJi
0stIAP4r0BMt/ii9XgqDScUCMAthAqWPZlVmFwNfU1gg0oFwHgD8DKPjQ7phDIf7
miwlRN09TaMiKBRnmHP7IcinUtkNhAw=
=qyjk
-----END PGP SIGNATURE-----

--htBluDkPT/WNhxo8--

