Return-Path: <linux-gpio+bounces-28303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F49C48F33
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F27E4F184C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A032E32B9BE;
	Mon, 10 Nov 2025 19:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axiNCIN9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273C318146;
	Mon, 10 Nov 2025 19:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802199; cv=none; b=ZfJNwdNyh2Ul8Nd3DObzip0/+lYBwJAGBRP7s1PI8S1MwtMsyqEqg2pjPKQievLCyZEv1QFY77E9pAB77+kxMlJOcjL8+r9IDtkNgxU+XlMlv7HjU/omYibMFvSH6rYlNAD2wFCkCOYXlryhwdsbDqsCZYoEz7NMeWVXFxjbD8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802199; c=relaxed/simple;
	bh=8hLisCWcIdr4W/1DxJDtFle668vTwKxjL6u0oM1CsAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSC5mhB/qol6JlSHiMCvDK2GqP4B2JE4vRj7aRtuMMKmX3TkJtbQsz/sqom/6y7iek/MHZma/uduyuQMB+4FiBj3ROJqCMU3DRbX430PLh8i8tZ2Ip6lMi/rKTHr64b0NpdyTXohB5FKYWLcyXM9RL4yjeTBmg0UDGaZoFdv3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axiNCIN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE28FC116B1;
	Mon, 10 Nov 2025 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762802198;
	bh=8hLisCWcIdr4W/1DxJDtFle668vTwKxjL6u0oM1CsAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axiNCIN9kogv/ob6obGVEAiZIqowYPilARpvP9BSUbpkWncx2J8slj1PSy7f9FFpw
	 jRTx92QnlGdRIVDGnhIB5/9nbcIEYoNLdNemMuBAXISLCN7zfU/QV5LyU7sqNKjdNb
	 mo/uBkaIvU3AUhu4RUz9eO2DBGRTxb/gy55ew0DECTEsqH7OP+Zsvgc5fTHP3rKVcQ
	 A9POsicXehhyKD2iCsF/jFJNzUtoG418/ouxn3DCe0YHv9HZKoBA+RdvMK3mHwzfun
	 rrd/zQPQGsMzmUDgRls2CTnDUWxAETvnk4og7WKNrsGMzwj/BifVtuZY5sPyyVmxTs
	 gAFDgPXRCH1Ig==
Date: Mon, 10 Nov 2025 19:16:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: adg1712: add adg1712 support
Message-ID: <20251110-preseason-vanquish-b6d0413123cc@spud>
References: <20251108174055.3665-1-antoniu.miclaus@analog.com>
 <20251108174055.3665-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SIb6/MyEOVjLQePv"
Content-Disposition: inline
In-Reply-To: <20251108174055.3665-2-antoniu.miclaus@analog.com>


--SIb6/MyEOVjLQePv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 05:40:28PM +0000, Antoniu Miclaus wrote:
> Add devicetree bindings for adg1712 SPST quad switch.
>=20
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> Changes in v2:
> - Replace individual GPIO properties (switch1-gpios, switch2-gpios, etc.)
>   with a single GPIO array property (switch-gpios)

As implemented, does this not prevent only populating some of the
inputs?
e.g. 1-3 and 0 is empty.

> - Update required properties list accordingly
> - Simplify device tree example to use array notation
> ---
>  .../devicetree/bindings/gpio/adi,adg1712.yaml | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg1712.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml b/Do=
cumentation/devicetree/bindings/gpio/adi,adg1712.yaml
> new file mode 100644
> index 000000000000..d6000a788d6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/adi,adg1712.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADG1712 quad SPST switch GPIO controller
> +
> +maintainers:
> +  - Antoniu Miclaus <antoniu.miclaus@analog.com>
> +
> +description: |
> +  Bindings for Analog Devices ADG1712 quad single-pole, single-throw (SP=
ST)
> +  switch controlled by GPIOs. The device features four independent switc=
hes,
> +  each controlled by a dedicated GPIO input pin.
> +
> +  Each GPIO line exposed by this controller corresponds to one of the fo=
ur
> +  switches (SW1-SW4) on the ADG1712. Setting a GPIO line high enables the
> +  corresponding switch, while setting it low disables the switch.
> +
> +properties:
> +  compatible:
> +    const: adi,adg1712
> +
> +  switch-gpios:
> +    description: |
> +      Array of GPIOs connected to the IN1-IN4 control pins.
> +      Index 0 corresponds to IN1 (controls SW1),
> +      Index 1 corresponds to IN2 (controls SW2),
> +      Index 2 corresponds to IN3 (controls SW3),
> +      Index 3 corresponds to IN4 (controls SW4).
> +    minItems: 4
> +    maxItems: 4
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      The first cell is the GPIO number (0-3 corresponding to SW1-SW4).
> +      The second cell specifies GPIO flags.
> +
> +required:
> +  - compatible
> +  - switch-gpios
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    adg1712: gpio-expander {
> +        compatible =3D "adi,adg1712";
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +
> +        switch-gpios =3D <&gpio 10 GPIO_ACTIVE_HIGH>,
> +                       <&gpio 11 GPIO_ACTIVE_HIGH>,
> +                       <&gpio 12 GPIO_ACTIVE_HIGH>,
> +                       <&gpio 13 GPIO_ACTIVE_HIGH>;
> +    };
> +...
> --=20
> 2.43.0
>=20

--SIb6/MyEOVjLQePv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRI6EgAKCRB4tDGHoIJi
0sIPAP97ItkLgvoutbwZT2QBdIVMpGj00vb0SsrUDAd9S96BSAD/SFnvyhpdWfow
nY+IutMzhFL1lAWd4IqIVzEUqnrY1AQ=
=TFRc
-----END PGP SIGNATURE-----

--SIb6/MyEOVjLQePv--

