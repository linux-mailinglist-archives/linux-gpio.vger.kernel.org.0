Return-Path: <linux-gpio+bounces-29585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDDCBF1A7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 18:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6642D302A3BD
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98554331230;
	Mon, 15 Dec 2025 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om7Amasb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D4C314A79;
	Mon, 15 Dec 2025 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765817870; cv=none; b=eosZwefXz4FSHXKta9Q4tOJ3e0mJzQsvWBfzJmIvoVCebWWnvBC16ihrVCjX541875DLPhYEzVP6XdUVzL59XD2+YY72VmzYF8N/gtQXPb/yEyZ4X4hqFyRCI9APgwmyXrYFZH/R0qfVhB72Ihk3UAIBnmPUMQB1J2JTvphGAzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765817870; c=relaxed/simple;
	bh=SgLS/ANrRVlpnUEOwB1p5hcDPAOgfBmKArBaS7U2zyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4DjrX/JodgqYPpbmWVetrlrFL0KJwgnfl4T1k0TJYuzoyz8bxNjep04z5Y31uVLm4E24RzQ/1cFZAU+x82IlQDivgNae4LI+NlEvGT7+E/OZ14kzyoanGm/WyZ6Zt6evRb5JFDt2VGSeUkouEIfFBrpc9V7E0rnvw5PpclG2YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om7Amasb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D045CC4CEF5;
	Mon, 15 Dec 2025 16:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765817869;
	bh=SgLS/ANrRVlpnUEOwB1p5hcDPAOgfBmKArBaS7U2zyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=om7AmasbxAaw0I5/gGKkCdAuXEIeDEUAe8b17Fx3QHqdFO3v4Y0fliNorW0Bhp2CF
	 Djj13oVRiWwoQR5/Qzm4OjrLt8ZXAkpSkA58EM+IHRuUdL9kVm2c9fd636Tw+0v/lY
	 RXVR5zGRVbW0RtYxd5UFlZj9Gu5nnJbanjM2HwkapRtR8GNUCQHl19Izpti1oXlTNy
	 F9zsbmbo5b9r0hImPQpg80dyiUFZY1LjJ5qoJ6rbasr8kMkkb9ii39tLa680VitLEm
	 Ncy4Hd60z1ej4wPj0fWEbtH1AKHS5Ai/FQat9zP6xirOELTXWlqDpBGmq7qlo4Jt3T
	 UZ8VOmrF//1jg==
Date: Mon, 15 Dec 2025 16:57:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: Add compatible string opencores,gpio to
 gpio-mmio
Message-ID: <20251215-skillet-perceive-2b564a29ed71@spud>
References: <20251214180158.3955285-1-shorne@gmail.com>
 <20251214180158.3955285-2-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hCJub4guA5h1GUdJ"
Content-Disposition: inline
In-Reply-To: <20251214180158.3955285-2-shorne@gmail.com>


--hCJub4guA5h1GUdJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 06:01:41PM +0000, Stafford Horne wrote:
> In FPGA Development boards with GPIOs we use the opencores gpio verilog
> rtl.  This is compatible with the gpio-mmio.  Add the compatible string
> to allow as below.
>=20
> Example:
>=20
>         gpio0: gpio@91000000 {
>                 compatible =3D "opencores,gpio", "brcm,bcm6345-gpio";

What you have done below does not permit this, it only permits
opencores,gpio in isolation.
pw-bot: changes-requested

>                 reg =3D <0x91000000 0x1>, <0x91000001 0x1>;
>                 reg-names =3D "dat", "dirout";
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 status =3D "okay";
>         };
>=20
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-mmio.yaml
> index b4d55bf6a285..0490580df19e 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -23,6 +23,7 @@ properties:
>        - ni,169445-nand-gpio
>        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO con=
troller
>        - intel,ixp4xx-expansion-bus-mmio-gpio
> +      - opencores,gpio
> =20
>    big-endian: true
> =20
> --=20
> 2.51.0
>=20

--hCJub4guA5h1GUdJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUA9/QAKCRB4tDGHoIJi
0t/TAQDBFZJqiD8sF0fIRoGIM15mzcD4JOHWG2CkFfH3s11/XgEAiXh2/9JDMpcA
yuyf/eZw+zXGHSep5v7xawMQr0Gt+AY=
=JiOe
-----END PGP SIGNATURE-----

--hCJub4guA5h1GUdJ--

