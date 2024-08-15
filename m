Return-Path: <linux-gpio+bounces-8761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0AB95369F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 17:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD531C25271
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 15:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D4D1A76B5;
	Thu, 15 Aug 2024 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRQLGVRy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87329CE6;
	Thu, 15 Aug 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734334; cv=none; b=ifBCJoSWtnZrbA1z9t0vdzvHVhwFj+Orzb/AcO4FadryrRKxrMXNFxcqxm8NiPp1BVphnQlOe1yle4s9Rep9RUftVyOhPMpmRBsAmhXwY5Mal/jMsR8mbrFPQmacfz0rjlx9d3Nt8pfDnleBaalHvEZb4vnxYPCD5wO9r+8NEqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734334; c=relaxed/simple;
	bh=kdxgDvnGpbEnejq1EW4eeTr+RENIvdMIcCBPIwX4bI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QojJDA0uervVmUVTS6Feh6eZGSojqxXPSc2Wu4a2tWTjlmEZhez6q7mQsXF2yt7pK5xmvajmUHu41Lk+rM9OJQYvX+xhxVUkXZ6HVv6Q0/0sQ9yX9YWvxGrhRpH6FCHmevnB1/e6k0Ie1L1aY/SLV3XyNjHJzX+n2m4dEUudDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRQLGVRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6247C32786;
	Thu, 15 Aug 2024 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723734334;
	bh=kdxgDvnGpbEnejq1EW4eeTr+RENIvdMIcCBPIwX4bI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRQLGVRyLyC1c1z5GLqUVa9YCf00/ebzx4QTigD/gD2vbSypInUg/um3rYJ3qfYV0
	 A/X0QbFT/b+YdyYbwx5EBRzkCf8xz2iH/I+oDhlkcG6RQPea1iSd1qVS1EWi+2Bdlh
	 w43sgZyS/xXGu34amPeqTjvy4ufWFYJ9hrFtHWbM8Nveku9wsEk+D2fXGnFRoCH0dW
	 f7E8D+b8S3UJTeCE/1abqF36h4mYst27N5GfTSw9E7wYSuZEHYmb3XmAg9FaT5cO41
	 V6+ZUXkxPeQmxbnI4tGxpmuQHocl7APtTQk4WrrHkJLMCMopRQhlyi1fFnM7u26A6r
	 ujGTIYfz6WvmA==
Date: Thu, 15 Aug 2024 16:05:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Message-ID: <20240815-illusive-pusher-43d3cced8bc9@spud>
References: <20240814223217.3498-1-detlev.casanova@collabora.com>
 <20240814223217.3498-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mv6KBtNoyPhwleR5"
Content-Disposition: inline
In-Reply-To: <20240814223217.3498-2-detlev.casanova@collabora.com>


--Mv6KBtNoyPhwleR5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 06:30:38PM -0400, Detlev Casanova wrote:
> Add the compatible string as well as the rockchip,sys-grf field which is
> only used on this SoC.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 20e806dce1ecb..28f8dc412cf92 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -45,6 +45,7 @@ properties:
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
>        - rockchip,rk3568-pinctrl
> +      - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
>        - rockchip,rv1108-pinctrl
>        - rockchip,rv1126-pinctrl
> @@ -62,6 +63,12 @@ properties:
>        Required for at least rk3188 and rk3288. On the rk3368 this should
>        point to the PMUGRF syscon.
> =20
> +  rockchip,sys-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the SYS GRF registers.
> +      It is used on rk3576 for i3c software controlled weak pull-up.
> +
>    "#address-cells":
>      enum: [1, 2]
> =20
> @@ -72,6 +79,17 @@ properties:
> =20
>  allOf:
>    - $ref: pinctrl.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-pinctrl
> +    then:
> +      required:
> +        - rockchip,sys-grf
> +    else:
> +      properties:
> +        rockchip,sys-grf: false
> =20
>  required:
>    - compatible
> --=20
> 2.46.0
>=20

--Mv6KBtNoyPhwleR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZr4ZOQAKCRB4tDGHoIJi
0hHcAQDcDJ7eazO1JD1SIrEmWbEm9+Cpz84MuOSCdvdLN4CGbQD9EHR30avD5+yC
/pRLZklFG9Gv+9PZLIPqsBZwms0DOg4=
=/Lx7
-----END PGP SIGNATURE-----

--Mv6KBtNoyPhwleR5--

