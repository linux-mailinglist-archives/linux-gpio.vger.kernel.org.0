Return-Path: <linux-gpio+bounces-8377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A5B93B57D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 19:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9711E1F24032
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 17:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D7A15FCEA;
	Wed, 24 Jul 2024 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuiAGIzF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256B15EFC6;
	Wed, 24 Jul 2024 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721840451; cv=none; b=gNmGuLTm2KQnHa7VR8FlgPR6Tf4UhCtzvGBJ0+1kzkBD6Sy6vPh30KLXnwVE5NIq0+rhts0LWv92a0CUUHus/DuqVK2sCn9DPgNvjnVfVTG1+J4RjgXAJvPhsdroEcu2u/Zp7jYYkIhKF0uezFGli2hggkzH6T18dOhVT8J9ZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721840451; c=relaxed/simple;
	bh=2Fp4P0nwOnEMoAXIjI4Y3vOGjyY6NokmL9megcF9vq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg4uD09xjBCJTiZQlFQhPvgy5M5HuZU/dNtng5VSoFiLVnSgcPSmBRDKzXDOSf8xxq3JJz1gQuIhgeRfaV1GaH03qQuPE8W9rzuYcvKWsUZKiE51mFvZmdKQN7mLLuEUjW+yr7bxdJmPDBUY7+GzaTuyOrIpTlO4HRWgUCJO+Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuiAGIzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C7C32781;
	Wed, 24 Jul 2024 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721840451;
	bh=2Fp4P0nwOnEMoAXIjI4Y3vOGjyY6NokmL9megcF9vq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuiAGIzF1Mk04XEIXWoBquP9gxq0hR7o3p8cRHVnkCkp1n/AWQN22x6+EKPARr+Gc
	 w4AwDNIP86ve2KTlPJgZAh51KxTdfV/UuvhZeliWcCLcaNDlQP/No7AhGGZZAyRxIC
	 mfE6P8ZzZzBPHPKl8HEmPhHOUJnc19nci2FNf8YkE7rXar+x8X3WDvGE9gV4teKQZK
	 84TzmXO3nFBloc51YZuZa4bQYjlyCwZQfPaoH6+XNXQ6XvD4GGzfzQTX/5a8i6VzFz
	 hV3RnG8cwoPi+aay6e/T2XK4OvOsB+my075lNLNQJTuaAFsb3t5aY4zOAPDauxDzqb
	 ySsKAtRKEvG+w==
Date: Wed, 24 Jul 2024 18:00:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: nxp,lpc32xx-gpio: Convert to dtschema
Message-ID: <20240724-sappiness-apprehend-b66630b94bcf@spud>
References: <20240724161235.130333-1-animeshagarwal28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RctCo8G3j4W6epQq"
Content-Disposition: inline
In-Reply-To: <20240724161235.130333-1-animeshagarwal28@gmail.com>


--RctCo8G3j4W6epQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Jul 24, 2024 at 09:42:28PM +0530, Animesh Agarwal wrote:
> Convert the NXP LPC32xx SoC GPIO controller bindings to DT schema format.
>=20
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> ---
>  .../devicetree/bindings/gpio/gpio_lpc32xx.txt | 43 ---------------
>  .../bindings/gpio/nxp,lpc32xx-gpio.yaml       | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_lpc32xx.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gp=
io.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
> deleted file mode 100644
> index 49819367a011..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -NXP LPC32xx SoC GPIO controller
> -
> -Required properties:
> -- compatible: must be "nxp,lpc3220-gpio"
> -- reg: Physical base address and length of the controller's registers.
> -- gpio-controller: Marks the device node as a GPIO controller.
> -- #gpio-cells: Should be 3:
> -   1) bank:
> -      0: GPIO P0
> -      1: GPIO P1
> -      2: GPIO P2
> -      3: GPIO P3
> -      4: GPI P3
> -      5: GPO P3
> -   2) pin number
> -   3) optional parameters:
> -      - bit 0 specifies polarity (0 for normal, 1 for inverted)
> -- reg: Index of the GPIO group

> diff --git a/Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml
> new file mode 100644
> index 000000000000..5974b2775d23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml

Can you make this filename the same as the compatible string please?

> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause

Hmm, the original author does not appear to be from one of the companies
where there's a carte blanche for binding relicensing.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nxp,lpc32xx-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC GPIO controller
> +
> +maintainers:
> +  - Animesh Agarwal <animeshagarwal28@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 3
> +    description: |
> +      1) bank:
> +        0: GPIO P0
> +        1: GPIO P1
> +        2: GPIO P2
> +        3: GPIO P3
> +        4: GPI P3
> +        5: GPO P3
> +      2) pin number
> +      3) optional parameters:

This isn't optional, since you've made the number of cells const: 3. The
original binding also says "should be 3", so I think that's reasonable.
Just drop the optional wording.

Otherwise, looks pretty okay to me.

Cheers,
Conor.

> +        - bit 0 specifies polarity (0 for normal, 1 for inverted)
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    gpio@40028000 {
> +        compatible =3D "nxp,lpc3220-gpio";
> +        reg =3D <0x40028000 0x1000>;
> +        gpio-controller;
> +        #gpio-cells =3D <3>; /* bank, pin, flags */
> +    };
> --=20
> 2.45.2
>=20

--RctCo8G3j4W6epQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqEzPgAKCRB4tDGHoIJi
0uqwAPiDBQOdQdHa0Bxn92ixhY01Vmy5r/40U7pAC9hnuB5WAQDdnCaQ7+BNsMKm
ufyZQGHMpLcUz3rSPoafZ5J6NzyXBA==
=m3mS
-----END PGP SIGNATURE-----

--RctCo8G3j4W6epQq--

