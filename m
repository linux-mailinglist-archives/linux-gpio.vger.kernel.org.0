Return-Path: <linux-gpio+bounces-28835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D0C708B4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7B2BD29120
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597F030E0E7;
	Wed, 19 Nov 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0HsXYfd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB22D2E8B8A;
	Wed, 19 Nov 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575010; cv=none; b=l4CukacA54u0u2D61dNV2zYRxYF90fO0AwAq596m0hnA+G0XpFw2UR9bLyqJLyJXaNTy7kYlXqcMrKHb8VLZTo7DFNNzY8PzOoJEHoY4DoJxfvZlNDuzZka6Ozd1uXiCqvRy2lfxJD933rKwSZH1+N+DBzRZeMN/+uhZAXU05qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575010; c=relaxed/simple;
	bh=v2r3BcboFk8zl12ZOYSzJXyMd+p1yn1XwnXeJ/43eh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq6ne+KFz9XBjag0zWO4AEs4pG+DyUONS86ghLVZf8KsgzoXDX/+b9ygldGl1CY+9kFLwNFywDoDEVsuD40j8bg86W24+l/+jKS3Y2HcADwGjDZ9opTrz9ycbCC4MAXIgD9Wze9qIjBceHq0nBmpGmNOo+8qNOGcFGpHD1ziyaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0HsXYfd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB64CC116C6;
	Wed, 19 Nov 2025 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575009;
	bh=v2r3BcboFk8zl12ZOYSzJXyMd+p1yn1XwnXeJ/43eh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0HsXYfdHfV+4cITqhEiCYb+gulW/Psrb2HBz8/Quh9fmgdnsTS6Cke680OWYF3Vx
	 D/MqFFU8/jBjQY9H59ulAneVTo9yUq+k7nMXfr6vb6iK+T63e6jG2dNPnJzkWhYB97
	 OHHWtnZYVhKxQH3+ky7H4ztaKXNc4TwTkAW+oVOLyWjEUaZpaYQ6rKFD8aorXaPkgV
	 l1Fctz9hXxeDOnbPOKSm/DxsEs5XF70B4bmWdxt9+3L2Qsv/+EuGQ+5q4lp4Qrmse9
	 3qaORYGqX8G+yqOUoh3S/1aBxWTRWThf9nNY/0y/8CYwsT6KSvKlKTFa9zUR/UyfUX
	 7wno4JxsWOUZA==
Date: Wed, 19 Nov 2025 17:56:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: switch: adg1712: add adg1712 support
Message-ID: <20251119-violation-enforcer-1362d3eecb69@spud>
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
 <20251117091427.3624-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xi7GRuMShnwJZ/su"
Content-Disposition: inline
In-Reply-To: <20251117091427.3624-2-antoniu.miclaus@analog.com>


--xi7GRuMShnwJZ/su
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 09:13:22AM +0000, Antoniu Miclaus wrote:
> Add devicetree bindings for adg1712 SPST quad switch.
>=20
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> Changes in v3:
> - Move bindings from gpio/ to switch/ subsystem
> - Remove gpio-controller interface
> - Add 'switch-states' property for initial configuration
> - Update description and example
> ---
>  .../bindings/switch/adi,adg1712.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/switch/adi,adg1712.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/switch/adi,adg1712.yaml b/=
Documentation/devicetree/bindings/switch/adi,adg1712.yaml
> new file mode 100644
> index 000000000000..eed142eb5b05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/switch/adi,adg1712.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/switch/adi,adg1712.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADG1712 quad SPST switch controller
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
> +  The switches are configured at probe time based on device tree propert=
ies
> +  and cannot be changed from userspace after initialization.
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

Did I miss a reply about my comment on this switch-gpios? I was asking
if a binding like this, which doesn't permit any of these not being
provided is a good idea.

> +    minItems: 4
> +    maxItems: 4
> +
> +  switch-states:
> +    description: |
> +      Initial states for the four switches (SW1-SW4).

Missing an adi prefix? Also, probably should say initial if it is
initial states.

Linus commented on the commit mesage, so you're gonna at least need to
change that.
pw-bot: changes-requested

> +      Each element corresponds to the desired state of the respective sw=
itch:
> +      0 =3D switch disabled (open), 1 =3D switch enabled (closed).
> +      If not specified, all switches default to disabled (0).
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      minimum: 0
> +      maximum: 1
> +    minItems: 4
> +    maxItems: 4
> +
> +required:
> +  - compatible
> +  - switch-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    adg1712: switch-controller {
> +        compatible =3D "adi,adg1712";
> +
> +        switch-gpios =3D <&gpio 10 GPIO_ACTIVE_HIGH>,
> +                       <&gpio 11 GPIO_ACTIVE_HIGH>,
> +                       <&gpio 12 GPIO_ACTIVE_HIGH>,
> +                       <&gpio 13 GPIO_ACTIVE_HIGH>;
> +
> +        /* Enable SW1 and SW3, disable SW2 and SW4 */
> +        switch-states =3D <1 0 1 0>;
> +    };
> +...
> --=20
> 2.43.0
>=20
>=20

--xi7GRuMShnwJZ/su
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4E3QAKCRB4tDGHoIJi
0m6AAP9Yfs6jEGtF/w7jKSWKbNLo5Wy7sQ5vwu989GZsSGWUZAEAzMiLj2vha1E8
wykCqw+VzGXSlTpXqo7lELVFHtuzcQI=
=M+7e
-----END PGP SIGNATURE-----

--xi7GRuMShnwJZ/su--

