Return-Path: <linux-gpio+bounces-9456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B168196639B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 16:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2706EB23B80
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 14:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975861ACDE8;
	Fri, 30 Aug 2024 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwVr6Fhb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C5C16C84C;
	Fri, 30 Aug 2024 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026649; cv=none; b=ufIL8l02tFTP02oNLO6aZFIAGtJMDN+QMiTgd1Zet8IjUufYwH35KDnQVqpcFf2ns7iNNXSy+hvk4y5ElRwc976RnrLm0CN4Tqz6QYaBUrM0Chck2KW24YrFsXjCM6q8M8B8UGkqvy9yH2WgP1bJgiXqbZLluaVSwaGO/mLW8Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026649; c=relaxed/simple;
	bh=cUtegsdQGft/33fvng7kM3QvVXPpZ8tTkRiGBNE+zUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyIDNlzXnTcxqktKS8uSWlqfZ08G3K3j/pRq10B0SH4NlGv/5Z12NuAaX1SqomiCij4X0u6CChxLP7Zl86oj9JCcoKn7ncpOInt5oTwz3f9qHVxbhWzy13qST0308FM7enpoqxKmzSKPRcLkjhP30OjjDaacExzMwPfzuNUCy8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwVr6Fhb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDD6C4CEC7;
	Fri, 30 Aug 2024 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725026648;
	bh=cUtegsdQGft/33fvng7kM3QvVXPpZ8tTkRiGBNE+zUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwVr6Fhbu0HJyBQUEE/PYUHtHEHAjHlzPqeEJWv3PgtxGBbXmxsEmJ7CtWrUw32af
	 T8X4E9xmQpZKVaPU3/FqHPn8BcXq6DsLqISWOun0l/O6Tn0TQISkWDOsla3pC4MnBj
	 9nOtPFr3/vCtszYttV5ejjUY7Rni77fXf/3URqlpCcZ+RyLq08NUR+kDipQjpkpHtL
	 55vHfDNPhOuCrB9aADukxJWh43pLgB0+RsQ3Qz/Gs9Oc79X3NYaYlzbLPYo5Al2Nji
	 D79RoCmeElWQFw9D7KPiVWQOjiRINESDCm0xoX+qpBESDVErOfIwq2jsvuOp1jTSUZ
	 eBX+RRhdMbkJw==
Date: Fri, 30 Aug 2024 15:04:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Message-ID: <20240830-untangled-charting-48503e510ea7@spud>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
 <20240830034047.2251482-2-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gPClO003GyM59AhI"
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-2-billy_tsai@aspeedtech.com>


--gPClO003GyM59AhI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 11:40:44AM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
> controllers: one with 12 GPIO pins and another with 216 GPIO pins.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> index cf11aa7ec8c7..4d439972c14b 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -15,6 +15,7 @@ properties:
>        - aspeed,ast2400-gpio
>        - aspeed,ast2500-gpio
>        - aspeed,ast2600-gpio
> +      - aspeed,ast2700-gpio
> =20
>    reg:
>      maxItems: 1
> @@ -42,7 +43,7 @@ properties:
>      const: 2
> =20
>    ngpios:
> -    minimum: 36
> +    minimum: 12
>      maximum: 232

Aren't you missing a corresponding update to gpio-line-names, which has
a minimum of 36?

--gPClO003GyM59AhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHRUwAKCRB4tDGHoIJi
0qUNAPkB52NMtklicYstcjTeGcpQkkGuzLTEMofpB2ZohjYAaQD/TjytJlaCvEJi
pT2l9A8yH2bXdPPSVl+JQxnmZmrnJAc=
=Q1AY
-----END PGP SIGNATURE-----

--gPClO003GyM59AhI--

