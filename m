Return-Path: <linux-gpio+bounces-18069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D66A736F4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 17:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6913D3BC9CF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 16:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745CB1A315D;
	Thu, 27 Mar 2025 16:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5Coy4zz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAFC165F16;
	Thu, 27 Mar 2025 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093432; cv=none; b=fjt3IZ5GdOKJnYJW8AxEVTLFMn1YI9t8NSbQkIxUGGW8R6Hj0P5kjTQylRZxLs7VW/+t51uBkP7569B0s+ryVQK/2nm4xyFTnYBHBMdFokYqzlDricofzCprW8Dn+SOicJVAfE9p8d9PNUwY4RWeazmtQ4gMv3EOUgTGHWRoH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093432; c=relaxed/simple;
	bh=7ZK9arp7BfLf5qjglWhRdpg667PLJGkQX32ma3/m/Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCVr8Wp5XQul4p26gru10cnSh3mZnBQHbURj4bWr10PpOtTj9r09QVhGc/0QLz7uuM40zKQhqi7lrH86cGxpbdSWUTnhA8KAr4KZBYiFnQ4gIf9XnO2R3Ewm6kXp+2G5630BUyMPE8M1595yJWbvf8fCTkXgPZevYBj02/KZ38c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5Coy4zz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60CAC4CEDD;
	Thu, 27 Mar 2025 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093430;
	bh=7ZK9arp7BfLf5qjglWhRdpg667PLJGkQX32ma3/m/Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5Coy4zzx92cLI+R/jdLE8fnj0SVv07G2XFhp35wDT+wYpLKiLuB/Op9Jn9ZYHyPO
	 WEqoOA7lJI2qvfk/0k1UT6NmV1YP+BDOyau6AlfPnDZpZiiO8hG3D/Jrgva6Pl6kQc
	 Y8nOgmW7lsutCwkYmePzrUGBedMM0rs4HpKwCaUXs52znXzyFfg5E22vh6mimMKPvR
	 XfRRV7Qjedk2Y285OOn+xx7w/6o2lYy4pW86RrD8ObYeytJTgz3pX0KNUr9uM1swH7
	 cHeU3lC9jtCtuHritB7qEGjhYa/uDnUsdHNxIbh9IVpzn/uSPnK1aK3i08/iB/hTgD
	 7nweqKtiM5l1A==
Date: Thu, 27 Mar 2025 16:37:05 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Message-ID: <20250327-juicy-relieve-a9c5f89cb4e0@spud>
References: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
 <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fAwn1XnIQAAgXUg9"
Content-Disposition: inline
In-Reply-To: <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>


--fAwn1XnIQAAgXUg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 05:26:35PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 +++=
++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> index 8eb50cad61d5..a94f4dfb9a7f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -14,8 +14,13 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: amlogic,pinctrl-a4
> -
> +    oneOf:

> +      - enum:
> +          - amlogic,pinctrl-a4

This one here only has a single entry, so could just be
- const: amlogic,pinctrl-a4.

With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +      - items:
> +          - enum:
> +              - amlogic,pinctrl-a5
> +          - const: amlogic,pinctrl-a4
>    "#address-cells":
>      const: 2
> =20
>=20
> --=20
> 2.37.1
>=20
>=20

--fAwn1XnIQAAgXUg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+V+sQAKCRB4tDGHoIJi
0lebAP9IKStu0S+/c9r0UyNUXENvJGtGJQJUfYxnwEVlRQIKgwD/Zb+0TeVHBQ36
m/oSQf6LHtuk/wQRhnkpFZgEpYTnpAc=
=KQTF
-----END PGP SIGNATURE-----

--fAwn1XnIQAAgXUg9--

