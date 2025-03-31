Return-Path: <linux-gpio+bounces-18126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A198AA76B38
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 17:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBB361634F2
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 15:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B4921421C;
	Mon, 31 Mar 2025 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WD0e9dmb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2B211A0D;
	Mon, 31 Mar 2025 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436172; cv=none; b=IoOCDwQFhN/qnFLhsfHT8iimI2GzKbKZyyamElHst49SwEGkSKnuvW99gTWzRYGhYbjCtTKZIHw+gpBkLrIaX6K5eVQauyndH+d6dWLcaFJz/HyQezZxAn6O4ilPwNh8SLKe5qkaBtc3suKu6Aqq36mlJXrXCko9xseeEfvTW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436172; c=relaxed/simple;
	bh=yyrtB+12OtHz2HnEytqL1aGh3RIaHeYNbRFfi6cctOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdLzWuuAyjhstqfZkbtrZHYFopy7YsLt21pc0EIuroM/HWpH+1AiFXMXvzv7jDJXewxz7LVbqO9deObAcLIwTZBkrUXjD8oJFX8GwUt0BNhLODa0P5oYGdQzoTjKAN8b2xTW7kacxYnzgDqGpIg3/aWSF9b4HQJIp6rwuYJeWQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD0e9dmb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6430AC4CEE3;
	Mon, 31 Mar 2025 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743436171;
	bh=yyrtB+12OtHz2HnEytqL1aGh3RIaHeYNbRFfi6cctOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD0e9dmb6Oxwc2YSemQS7SeKSn3PFlsUJj8wzd9twHJuFhvsLZgzm+Jo+OgnN78wv
	 yIs39zQht5EuSgXDhYhv17R+IDeTgAPt9POFZyA0SwSpo5HnC2YAc9K+wyqNsQjaei
	 xVEk4IQ24ULool+d8qZ+RCe4az3IkWBE0bjYceyHxil3amVcuafx//6m9T0iiemDRS
	 8gp86czYhsQbWU24AeI3GE2YjI+ciuwOWQ0r7QsVuGf8spJRqh4LyS41+9Jl0nYVOC
	 pnwuNHDEBN52Dh6NxZj+Lg3SUlEYIOWnTK+Xmw3JKsm3+UbcexzjH6iTu9s6ImY1n9
	 tuvh9dZOyorvQ==
Date: Mon, 31 Mar 2025 16:49:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add Toradex ecgpiol16
Message-ID: <20250331-resonant-rind-6adb8ad85cf5@spud>
References: <20250331072644.17921-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t2fNUyzTJxXMm/r9"
Content-Disposition: inline
In-Reply-To: <20250331072644.17921-1-francesco@dolcini.it>


--t2fNUyzTJxXMm/r9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 09:26:44AM +0200, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>=20
> The Toradex ecgpiol16 is a 16-bit I2C I/O expander implemented using a
> small MCU.
> Its register interface and behavior are compatible with the PCAL6416.
>=20
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2: compatible changed from embedded-controller-io16 to ecgpiol16
> v1: https://lore.kernel.org/all/20250328122917.43273-1-francesco@dolcini.=
it/
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/D=
ocumentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 7b1eb08fa055..4d3f52f8d1b8 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -16,6 +16,9 @@ description: |+
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: toradex,ecgpiol16
> +          - const: nxp,pcal6416
>        - items:

>            - const: diodes,pi4ioe5v6534q

You could have made this into an enum, and added your new compatible
there. If there's a respin, can you do that please?
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>            - const: nxp,pcal6534
> @@ -132,6 +135,7 @@ allOf:
>                - maxim,max7325
>                - maxim,max7326
>                - maxim,max7327
> +              - toradex,ecgpiol16
>      then:
>        properties:
>          reset-gpios: false
> --=20
> 2.39.5
>=20

--t2fNUyzTJxXMm/r9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+q5hwAKCRB4tDGHoIJi
0pHQAQCYS96NB1KuROb85E7A1Ks5Yx6mqzhDxY4nmsBkwjlDewEAkGIapkPth2Og
EWy52HQcY/uy9ZBDYUpyAeeI1i5bLQY=
=9hXo
-----END PGP SIGNATURE-----

--t2fNUyzTJxXMm/r9--

