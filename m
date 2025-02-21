Return-Path: <linux-gpio+bounces-16399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25311A3FC54
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5234A3A2D8E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 16:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5107212D6E;
	Fri, 21 Feb 2025 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+mezyth"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DE207A2E;
	Fri, 21 Feb 2025 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156749; cv=none; b=aAa4tg9oJQ334HIxgFeSKD2PBfJ9ySKGmpw0xhA6kUG3c5R7JRmIPqIbkoOP81d+cw9vOaM4T1By6Dx93ZqWOkCp3wUHWuGWxVz74UWLPgJ47UTBscJji5U+dY0DRhYrelRwEJbk+gq4GRrwT7FUHok5JZ4MRFtbZGJ4mF3hhtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156749; c=relaxed/simple;
	bh=lL/MvTZeP9yBIOaMchub2lXV69E2rqGAnYMQrOKZXRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJWw26dSOLpCzeX6hq7LMNAUB/NxuTqGzI086WTrICKhgmyzYWfxHnhJFau70joLKxQwlrBl9XQrsDLwxvrcs2Um4cyhNh0njCAzDSU/f16AtYzrA+yBz75AjzmL655+sguO28DeIM6hUI38foc8pwAsg7XJ9KwP42Q5MUF8cGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+mezyth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B72C4CED6;
	Fri, 21 Feb 2025 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740156749;
	bh=lL/MvTZeP9yBIOaMchub2lXV69E2rqGAnYMQrOKZXRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+mezythexuErDLP3PWc770FEtoUXJNzMfTarekyooZJpaC+pCCrL/ebHbaRgn6iC
	 F/vtDW3RhRvc9Mh3Pxhi5OFuZeERBOwcgLzz97ANMaT+JtI37UCiG1+iNPCyHyDBz0
	 3vVnuIVyCJ2bFxkqAFB37plgwiIVMcm/ZzzeFuyARIolKPMq5Vux1s0a5VzqIyk+5K
	 ccc/LNpGKoUCPoMmLk4agfPGIANbJ090FPs7l0WCIlGBK2g4gG2BQQH+yvdW1H/rvm
	 tZMKgulsbwfYZuPUxAu8yXRIRiXsNs67H4KWQNoP4aNLxZ0e5JrcyyHvZemDxo9AT9
	 I7M/eObZb1K9g==
Date: Fri, 21 Feb 2025 16:52:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: nxp,pcf8575: add reset GPIO
Message-ID: <20250221-grazing-blooming-d21874a59096@spud>
References: <20250221-pca976x-reset-driver-v2-0-a2bcb9fdc256@cherry.de>
 <20250221-pca976x-reset-driver-v2-1-a2bcb9fdc256@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GiYkKQYTh3xozX1M"
Content-Disposition: inline
In-Reply-To: <20250221-pca976x-reset-driver-v2-1-a2bcb9fdc256@cherry.de>


--GiYkKQYTh3xozX1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 11:14:26AM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> A few of the I2C GPIO expander chips supported by this binding have a
> RESETN pin to be able to reset the chip. The chip is held in reset while
> the pin is low, therefore the polarity of reset-gpios is expected to
> reflect that, i.e. a GPIO_ACTIVE_HIGH means the GPIO will be driven high
> for reset and then driven low, GPIO_ACTIVE_LOW means the GPIO will be
> driven low for reset and then driven high. If a GPIO is directly routed
> to RESETN pin on the IC without any inverter, GPIO_ACTIVE_LOW is thus
> expected.
>=20
> Out of the supported chips, only PCA9670, PCA9671, PCA9672 and PCA9673
> show a RESETN pin in their datasheets. They all share the same reset
> timings, that is 4+us reset pulse[0] and 100+us reset time[0].
>=20
> When performing a reset, "The PCA9670 registers and I2C-bus state
> machine will be held in their default state until the RESET input is
> once again HIGH."[1] meaning we now know the state of each line
> controlled by the GPIO expander. Therefore, setting lines-initial-states
> and reset-gpios both does not make sense and their presence is XOR'ed.
>=20
> [0] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf Fig 22.
> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5
>=20
> Tested-by: Heiko Stuebner <heiko@sntech.de> # exclusion logic
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml      | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Do=
cumentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> index 3718103e966a13e1d77f73335ff73c18a3199469..633ac5cfa04a10bcbb748b658=
0938cddae9e5596 100644
> --- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> @@ -73,6 +73,44 @@ properties:
> =20
>    wakeup-source: true
> =20
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO controlling the (reset active LOW) RESET# pin.
> +
> +      The active polarity of the GPIO must translate to the low state
> +      of the RESET# pin on the IC, i.e. if a GPIO is directly routed
> +      to the RESET# pin without any inverter, GPIO_ACTIVE_LOW is
> +      expected.
> +
> +      Performing a reset makes all lines initialized to their input (pul=
led-up)
> +      state.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - nxp,pca9670
> +                - nxp,pca9671
> +                - nxp,pca9672
> +                - nxp,pca9673
> +    then:
> +      properties:
> +        reset-gpios: false
> +
> +  # lines-initial-states XOR reset-gpios
> +  # Performing a reset reinitializes all lines to a known state which
> +  # may not match passed lines-initial-states
> +  - if:
> +      required:
> +        - lines-initial-states
> +    then:
> +      properties:
> +        reset-gpios: false
> +

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>  patternProperties:
>    "^(.+-hog(-[0-9]+)?)$":
>      type: object
>=20
> --=20
> 2.48.1
>=20

--GiYkKQYTh3xozX1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7ivSAAKCRB4tDGHoIJi
0i4uAQCOotpFqkxjesyA4pzx8vBjHsoaP4kjzuwTp6HUZPpbowD/T/5gmpO+ZEtu
bcpjC1AoutvVhB2/ora78T73faYGJQA=
=QQ8C
-----END PGP SIGNATURE-----

--GiYkKQYTh3xozX1M--

