Return-Path: <linux-gpio+bounces-2884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA86845FA7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 19:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E6A41F2C766
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 18:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFFB7C6E6;
	Thu,  1 Feb 2024 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOX6dULC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29AD74281;
	Thu,  1 Feb 2024 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706811211; cv=none; b=Q8lBIGSpmPc5gWpw+nY2jaQG3ERVZ62E+obxRLJv81B1vd58nsEgF7AraTXNa6sSyrCDEap+PnFjjODFrxuRFDRYZMUQ1UmFh+XeGHXBus7qAY9m6hUmZqORtKo0EIU0cmvpUpbtdNx8tqC1A0VXy8WVpPxofRnWQG7xuvNKWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706811211; c=relaxed/simple;
	bh=DIvVA7Y1qv9I31Mtzl3bdvI3w9k60qDKC26dLLuvmhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+5rEkkRnmIDc83wlUjgBQhRIma5uCdl+EIzVeNzS9Ted3u0DX1FwTBIlzZdna7MQNW1Bdm/pJuWl6iiwJiPAmIG2E47gJxTHwY+XpmwL3YSrbXFIDykADfNwukq4rTd07gu9pwsOmpVj7TQ8PZyCMKTuEPIkeFcj94ECMSiDV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOX6dULC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26098C433F1;
	Thu,  1 Feb 2024 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706811211;
	bh=DIvVA7Y1qv9I31Mtzl3bdvI3w9k60qDKC26dLLuvmhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOX6dULC/321IeZkeKWHpTv26SktGyKgBdfz3FOKqOenD0pMfechaHOuMMRXkncW+
	 wgH5rgBgeUsjoF+9/ZZ8KB2/1KtRFbZb5+j/3mLJ2b9dSEWM7lMqea5EB09O1sLsLt
	 V3OpjvQVhddvkKLqW/FaIaVkE7eBN///7FEg91SzUSQgwhCkKY29zvsrcfkjkUlXy1
	 YXv3ZiBbyB4207vPcy/QQlnvURKD4/aWVVmPaLHs8TCmSvObYzhqrTDItjK54HjpFd
	 UlzvuOBr+cuWYmZCv5wMEWhkIBEc7Xfz8FS/ZHkWs3XkwQ/zbbHBg8Y5QoH1Nwry+R
	 WNQbUNJDE0VOw==
Date: Thu, 1 Feb 2024 18:13:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779h0
 support
Message-ID: <20240201-skipper-qualifier-0b762fe5a67e@spud>
References: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zY7GGhXCbwC8GTGb"
Content-Disposition: inline
In-Reply-To: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>


--zY7GGhXCbwC8GTGb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:16:33PM +0100, Geert Uytterhoeven wrote:
> Document support for GPIO controller blocks in the Renesas R-Car V4M
> (R8A779H0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> index aa424e2b95f87a51..cc7a950a6030999e 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> @@ -53,6 +53,7 @@ properties:
>                - renesas,gpio-r8a779a0     # R-Car V3U
>                - renesas,gpio-r8a779f0     # R-Car S4-8
>                - renesas,gpio-r8a779g0     # R-Car V4H
> +              - renesas,gpio-r8a779h0     # R-Car V4M
>            - const: renesas,rcar-gen4-gpio # R-Car Gen4
> =20
>    reg:
> --=20
> 2.34.1
>=20

--zY7GGhXCbwC8GTGb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbvfRgAKCRB4tDGHoIJi
0pAcAP9zmpNoMGsGcjl1mI2zWkMiwNlXgq1k6ptNlpUf6OXN0AD/WtNFo8wEZCLV
Hz+rm1GXaD7BESv/IE1qUqluSAxN5wg=
=ewOu
-----END PGP SIGNATURE-----

--zY7GGhXCbwC8GTGb--

