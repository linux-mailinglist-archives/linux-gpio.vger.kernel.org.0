Return-Path: <linux-gpio+bounces-17122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77436A504D5
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 17:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234543B15BE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194BC252907;
	Wed,  5 Mar 2025 16:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5D2z9Lw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8818A95E;
	Wed,  5 Mar 2025 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192050; cv=none; b=a/oJmGZ1Evf3/8LQAacGtj+tK9nhK1Wi/UpcndunW7KlyjJ5mavflWK79JzeKnz3KGs9Nf6Psk+xBMorTdNxn3W7ma3wVUYkM9+969GQtuW9Pm6jnEtPYIOEN08hsD84lYaR4BKgHKhNzUsZ4ZOJGb5Aw18hHjy/9FAszaxLbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192050; c=relaxed/simple;
	bh=bGRDGRFMQzRHd1CL7i1uKLog2VzAOFSif0V7FQ+SqpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWSX4NQX+Y/G7lzIxg9JQz2Rl97NRSGMhltaAA9bbSMDFitbFxUtQWncN900b0V0do/Af8ZLXNoyCOiFU2iCqVy8tgBwOAsPwcu+pUFbkCCG325MFP423ICmqjFHBSU77WJL+CvqV+IZdVvpWVV6iB3HUuw9PyhRHRcfNdOElVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5D2z9Lw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECF7C4CED1;
	Wed,  5 Mar 2025 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192050;
	bh=bGRDGRFMQzRHd1CL7i1uKLog2VzAOFSif0V7FQ+SqpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5D2z9Lw1hCeQXQtrrhz6FjEEq6Du60xFweZGdwpcxgsgX7GOUaqC73T4weKLwFpF
	 kITN2be0XodG7T5hW2dbx7Pd/BtNjX7X0a03FRnXA1eadbYHG0DUP27uMS2cq9szt6
	 uIm9IA4mVmR1PYI2mx5FAdgxxNnCGc1QMBlOSCAp8bF9ptzIELWL4NTqxDY/FTbKCy
	 CQPLRLjDGNTebnDXWjzEwHoy9fHY0dOltAXljzLnAqWO0+eEPYLXePmNUdO6ZLEO3z
	 HUSMIAXctjaE9gpCjwSSuYaC7m39C5hQxZbCV40kIw6QLGWU2tJF/d7qOKKAu1S651
	 t6kBDrm1kYEcw==
Date: Wed, 5 Mar 2025 16:27:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Subject: Re: [PATCH net-next v4 4/4] dt-bindings: ieee802154: ca8210: Update
 polarity of the reset pin
Message-ID: <20250305-primp-snowdrop-9af58ace1727@spud>
References: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
 <20250305105656.2133487-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HMd4nwnQLMa+4aQ7"
Content-Disposition: inline
In-Reply-To: <20250305105656.2133487-5-andriy.shevchenko@linux.intel.com>


--HMd4nwnQLMa+4aQ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 12:55:37PM +0200, Andy Shevchenko wrote:
> The code has been updated to follow what datasheet says about
> the polarity of the reset pin, which is active-low. Update
> the device tree bindings accordingly.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/net/ieee802154/ca8210.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt =
b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
> index a1046e636fa1..f1bd07a0097d 100644
> --- a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
> +++ b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
> @@ -20,7 +20,7 @@ Example:
>  		reg =3D <0>;
>  		spi-max-frequency =3D <3000000>;
>  		spi-cpol;
> -		reset-gpio =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +		reset-gpio =3D <&gpio1 1 GPIO_ACTIVE_LOW>;

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>  		irq-gpio =3D <&gpio1 2 GPIO_ACTIVE_HIGH>;
>  		extclock-enable;
>  		extclock-freq =3D 16000000;
> --=20
> 2.47.2
>=20

--HMd4nwnQLMa+4aQ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h7bAAKCRB4tDGHoIJi
0uP0AQDb+MXWjkA7voiyssiVTT6Ix0clY4wz8p9AJT5dGwZfNwEAk+Rrk9mYIqxG
2PQ7K9oWTBd9bBhuyeWnmwp/dUp1HgM=
=r10L
-----END PGP SIGNATURE-----

--HMd4nwnQLMa+4aQ7--

