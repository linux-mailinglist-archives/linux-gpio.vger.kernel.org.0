Return-Path: <linux-gpio+bounces-27133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3164BDAE8A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 20:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720473AC07A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 18:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80408307AD8;
	Tue, 14 Oct 2025 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKKRJ/OU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379983074BD;
	Tue, 14 Oct 2025 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760465433; cv=none; b=ePu+A7O8bDBweLB8sFohGvAJbY8Q0GftXfFLALGimnNZzQuhmhzMMdhtCEFKYSJi1z+JL5VSsoxpmY8KT9EY1llt/g4GwkXLgH77HB+gfWRqoc2BrcGuMOCzqzCQcQYhfNlQEai49eWi/vx14UxO86apnZU8zCaT4dmVuv6F8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760465433; c=relaxed/simple;
	bh=BSoSmYgtZ9AesO3u1tMwafkyE42czTGEgpGza7+Fu6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv8P3Q0sK5DAMfq9HZSa7Z+gbwnPlpriSm5/1GcSq1IvXWwrJhJgZY3QPW8TF8SzaQtdR9MjyzsKn4Qc2BiWToXZIpwmvr5c9U/1JeSA5SlnpT5yoAuW7u29DFaqfaCCfsIJ2W76sk5K/FCwLkYtDI+faQEqo+CHSOywfs91S64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKKRJ/OU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC1C4CEE7;
	Tue, 14 Oct 2025 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760465432;
	bh=BSoSmYgtZ9AesO3u1tMwafkyE42czTGEgpGza7+Fu6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKKRJ/OUsXrUymQ+jPoIkuuywzRbnANEGOkO+8SUH2NBHJhdK3DIWqvEJh7B/xlYh
	 c9dbXKOmi07TLXV1prDdV+tJYlBPwcpnpsnNDmd6PRakAOQepQGh8gMqOdeFr6U9UJ
	 jGEjNCeEHQRWHynn2za/1jqV3NS5yVqNDnJdSqpqzRKKh2s/Yrk5EkV2NBy2rHPAbB
	 3JYHSvpHYnYSOqEP6s3ztEWE5wGCTuSUlOiXjHwn+xZCCvBQ81SZEBMGZ9e26vNUKW
	 C+dEmmRQ3OF95jC25AhTpbO0J1c8/E+YmAkqkZSN+fyUVV5iIaIevxdSYh+hYZRgm9
	 8pvR8xuTKQXzw==
Date: Tue, 14 Oct 2025 19:10:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
Message-ID: <20251014-affection-voltage-8b1764273a06@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WUAPWDm9VxqWJrOr"
Content-Disposition: inline
In-Reply-To: <20251014140451.1009969-10-antonio.borneo@foss.st.com>


--WUAPWDm9VxqWJrOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 04:04:50PM +0200, Antonio Borneo wrote:
> Document the support of the I/O synchronization parameters:
> - skew-delay-input;
> - skew-delay-output;
> - st,io-sync.
>=20
> Forbid 'skew-delay-input' and 'skew-delay-output' to be both
> present on the same pin.
> Allow the new properties only with compatibles that support them.
> Add an example that uses the new properties.
>=20
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 2df141ed7222d..0010762127c05 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -220,12 +220,89 @@ patternProperties:
>              minimum: 0
>              maximum: 3
> =20
> +          skew-delay-input:
> +            description: |
> +              IO synchronization skew rate applied to the input path
> +              0: No delay
> +              1: Delay 0.30 ns
> +              2: Delay 0.50 ns
> +              3: Delay 0.75 ns
> +              4: Delay 1.00 ns
> +              5: Delay 1.25 ns
> +              6: Delay 1.50 ns
> +              7: Delay 1.75 ns
> +              8: Delay 2.00 ns
> +              9: Delay 2.25 ns
> +              10: Delay 2.50 ns
> +              11: Delay 2.75 ns
> +              12: Delay 3.00 ns
> +              13: Delay 3.25 ns
> +            minimum: 0
> +            maximum: 13
> +
> +          skew-delay-output:
> +            description: |
> +              IO synchronization latch delay applied to the output path
> +              0: No delay
> +              1: Delay 0.30 ns
> +              2: Delay 0.50 ns
> +              3: Delay 0.75 ns
> +              4: Delay 1.00 ns
> +              5: Delay 1.25 ns
> +              6: Delay 1.50 ns
> +              7: Delay 1.75 ns
> +              8: Delay 2.00 ns
> +              9: Delay 2.25 ns
> +              10: Delay 2.50 ns
> +              11: Delay 2.75 ns
> +              12: Delay 3.00 ns
> +              13: Delay 3.25 ns
> +            minimum: 0
> +            maximum: 13

Same comments here as on the earlier patch. I would like to see times
used natively.
pw-bot: changes-requested

> +
> +          st,io-sync:
> +            description: |
> +              IO synchronization through re-sampling or inversion
> +              0: data or clock GPIO pass-through
> +              1: clock GPIO inverted
> +              2: data GPIO re-sampled on clock rising edge
> +              3: data GPIO re-sampled on clock falling edge
> +              4: data GPIO re-sampled on both clock edges
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4]

I really don't like this kinds of properties that lead to "random"
numbers in devicetree. I'd much rather see a string list here.

> +
>          required:
>            - pinmux
> =20
> +        # Not allowed both skew-delay-input and skew-delay-output
> +        if:
> +          required:
> +            - skew-delay-input
> +        then:
> +          properties:
> +            skew-delay-output: false
> +
>  allOf:
>    - $ref: pinctrl.yaml#
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - st,stm32mp257-pinctrl
> +                - st,stm32mp257-z-pinctrl
> +    then:
> +      patternProperties:
> +        '-[0-9]*$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                skew-delay-input: false
> +                skew-delay-output: false
> +                st,io-sync: false
> +
>  required:
>    - compatible
>    - '#address-cells'
> @@ -306,4 +383,25 @@ examples:
>                  pinctrl-names =3D "default";
>      };
> =20
> +  - |
> +    #include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +    //Example 4 skew-delay and st,io-sync
> +      pinctrl: pinctrl@44240000 {
> +              compatible =3D "st,stm32mp257-pinctrl";
> +              #address-cells =3D <1>;
> +              #size-cells =3D <1>;
> +              ranges =3D <0 0x44240000 0xa0400>;
> +
> +              eth3_rgmii_pins_a: eth3-rgmii-0 {
> +                      pins1 {
> +                              pinmux =3D <STM32_PINMUX('A', 6, AF14)>;
> +                              st,io-sync =3D <4>;
> +                      };
> +                      pins2 {
> +                              pinmux =3D <STM32_PINMUX('H', 2, AF14)>;
> +                              skew-delay-output =3D <2>;
> +                      };
> +              };
> +      };
> +
>  ...
> --=20
> 2.34.1
>=20

--WUAPWDm9VxqWJrOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6SEwAKCRB4tDGHoIJi
0jCsAPwLkMNVF458mbc2zWVRT6LxatpnJfRRuZJlEdA05pbWEAEAz4z8RejXvyPP
ECXLoXPiLCdURtPzFPKuEqQ4nRt+HQw=
=CNDr
-----END PGP SIGNATURE-----

--WUAPWDm9VxqWJrOr--

