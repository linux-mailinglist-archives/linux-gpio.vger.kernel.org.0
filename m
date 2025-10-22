Return-Path: <linux-gpio+bounces-27486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF166BFD82A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 586A14F87C8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B491D279DCF;
	Wed, 22 Oct 2025 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGZjjQ//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41F1B7F4;
	Wed, 22 Oct 2025 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153165; cv=none; b=iZA/p9cvUiEQKvK6MUGffcWq308l4ZUz4nDVnPSxzyF3ovfpud3zcVO/IZYM7SYsCA4gaTOTzprBhzzmXCNZE5QgvkgzdpWECFp1q3SN5itModM08AzYHicsCxOzAXsux4ilvd2GOTT798OIUzuHhxj5EGE+T7Xt0hhc2pupDHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153165; c=relaxed/simple;
	bh=kV93iWt+DDAAlj8i+1RIQV38zSUMXGmhWwln7N9NRhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMk0PaPHSOak0jdjdboRwgepUuuuJYJ1TcfFu0mZlJXqqUJFFv+8RQBQ2p1ARKfXkGjdlWoG2u66nn2eyQFg0FpLFLtlwEPGSpSNEE5o/zAbjYxKVOaXDv3Zc/P256GQ/RV73a/6ijM99A8mw6i3ZNnX2LBwIre/hcE7J3wIj4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGZjjQ//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7EFC4CEE7;
	Wed, 22 Oct 2025 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761153165;
	bh=kV93iWt+DDAAlj8i+1RIQV38zSUMXGmhWwln7N9NRhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGZjjQ//tUzcCTyW3xTNrk9aYtAhMtovMPyV+FXRJIs0bnupllk31bYYxzYxcMZK5
	 HuagVv/8RjdlQMQCVoJDkCWy5iFXK53HyMPD2ogjOQBg0mjK3/sVDbQMKzoD+dEvsS
	 /FYoLiWQukk4N9gmm/T23JWFIE6C2B0KconqcjNhjmC2kvDqxF+fY6UJRhsIhnUXDU
	 I+m4D3HRK5Alkv4rEPQByLuK3FTB3VTK8TzVeAJrxYV/oqQ3UclhbaHS3iOfgqvf9h
	 EFj9wK5mSEpOJxSNa6w7N1SV+Hmx/JHmmGPtnWx8s2Im3AhhOwX0hVU0iwQ84ZjwDf
	 D/taOyU4cNK0w==
Date: Wed, 22 Oct 2025 18:12:41 +0100
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v3 3/5] dt-bindings: pinctrl: document polarfire soc
 iomux0 pinmux
Message-ID: <20251022-segment-subfloor-9594ee438da8@spud>
References: <20251022-dash-refinance-ac3387657ae4@spud>
 <20251022-caregiver-scrubber-3ad2bc328aea@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzW239Zt5u3ZCdGd"
Content-Disposition: inline
In-Reply-To: <20251022-caregiver-scrubber-3ad2bc328aea@spud>


--wzW239Zt5u3ZCdGd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 11:09:11AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> On Polarfire SoC, iomux0 is responsible for routing functions to either
> Multiprocessor Subsystem (MSS) IOs or to the FPGA fabric, where they
> can either interface with custom RTL or be routed to the FPGA fabric's
> IOs. Document it.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> +patternProperties:
> +  '^mux-':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        description:
> +          A string containing the name of the function to mux to the gro=
up.
> +        enum: [ spi0, spi1, i2c0, i2c1, can0, can1, qspi, uart0, uart1, =
uart2,
> +                uart3, uart4, mdio0, mdio1 ]
> +
> +      groups:
> +        description:
> +          An array of strings. Each string contains the name of a group.
> +        items:
> +          enum: [ spi0_fabric, spi0_mssio, spi1_fabric, spi1_mssio, i2c0=
_fabric,
> +                  i2c0_mssio, i2c1_fabric, i2c1_mssio, can0_fabric, can0=
_mssio,
> +                  can1_fabric, can1_mssio, qspi_fabric, qspi_mssio,
> +                  uart0_fabric, uart0_mssio, uart1_fabric, uart1_mssio,
> +                  uart2_fabric, uart2_mssio, uart3_fabric, uart3_mssio,
> +                  uart4_fabric, uart4_mssio, mdio0_fabric, mdio0_mssio,
> +                  mdio1_fabric, mdio1_mssio ]
> +
> +    required:
> +      - function
> +      - groups

I realised a few minutes ago that, despite Rob's review, there's a
mistake here. This, and the gpio2 binding, are both missing a
pinmux-node reference in these child nodes, since that's where the
types for function/groups come from.
I guess I'll send another version tomorrow Linus.

--wzW239Zt5u3ZCdGd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkQiAAKCRB4tDGHoIJi
0k2yAQCmieQUvFfZKHjkmuzX5xFE4UR9a1MQ0fDxzSrxRPDX+QEAhFBijftyltRf
r6OcItxAoBxNfs42+c409PkLcjlj7w0=
=O72u
-----END PGP SIGNATURE-----

--wzW239Zt5u3ZCdGd--

