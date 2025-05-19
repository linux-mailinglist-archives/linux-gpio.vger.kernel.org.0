Return-Path: <linux-gpio+bounces-20296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9EABC38B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 18:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C74162CAB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 16:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441A6286D50;
	Mon, 19 May 2025 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnpeEQF9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC443286896;
	Mon, 19 May 2025 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670646; cv=none; b=n1+DSWXg7OhgF1mQnFsEaJNfRTpq27gkZ34V7MR4VYFwQm5JijurZnbaWIC4PIwkDVA+ls1xAeQ8HhGmu+2RvqTS3acLhWorseljH2qG+EARoaCMsqtho1KED2ate17nPztqQ10TPru8Gsd+auMagTqfzEfah8afYcFAckhEyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670646; c=relaxed/simple;
	bh=YiciytpzBKZU6jliaO65tJGGDGQootlSrvvGG35Ktdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jatNJ5DW432GUOsKJdQh/zedBxSoE2dd6s23+yzskJ7+Vw1uNyPUAaXTQXZIsdq6hjr4B1Camc64mOuOEDnYNiNB+oIKRUZdKEiNW499w/kCuTYIio/ZkTnmHkA/GwuYEme5HbZvMXAvb/OepYY3m/uhgGSXls6VdlX0yV9Uoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnpeEQF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1739C4CEE4;
	Mon, 19 May 2025 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747670645;
	bh=YiciytpzBKZU6jliaO65tJGGDGQootlSrvvGG35Ktdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnpeEQF9AXAlhGeeYGGwNM4vuPj26g+dg4Nt2tEQBNl1/zoUhsV8N1BECbhcTHrLb
	 d1dePDbkxEQTbZ7zgcDvRdOFdzyCu8xJogzBh7JYRBEy2W/+vY1D0/rIHP28LcXuZ/
	 r6H87jLQl8kAo/VND+R6hsCxqLQAW9OdFt6eqtmDd+AYGwWhhzPYpBL0OFmP8jtxQp
	 fP8NgT9rQGdTOPxyo2qfRfqDJzbzHhbe/fihZESj2dT2RLZh4Eybspg/KsLUHLQ2UP
	 Pi0xJ+rE1RDQc4aqzslBxTEH6wppS3apYCaNuS5LSVrp7yf4KuwE+QUo1KyIIgmn6/
	 CZQGHysnqEe7A==
Date: Mon, 19 May 2025 17:04:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Message-ID: <20250519-bucked-revolt-2b93a9a31422@spud>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2cAhBHrdr3ZQFzJw"
Content-Disposition: inline
In-Reply-To: <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>


--2cAhBHrdr3ZQFzJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 02:03:43PM +0800, Haibo Chen wrote:
> Add optional ngpios and gpio-reserved-ranges property
>=20
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index 4fb32e9aec0a341a50088f3e4352ed4d36f649d3..5b98228466c6414be681c4941=
7bbdd82f2c45756 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -70,6 +70,12 @@ properties:
>      minItems: 1
>      maxItems: 4
> =20
> +  gpio-reserved-ranges: true
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32

Do these platforms have a default? I'd expect one to be added that
contains the default value from what the driver does now.

> +
>  patternProperties:
>    "^.+-hog(-[0-9]+)?$":
>      type: object
>=20
> --=20
> 2.34.1
>=20

--2cAhBHrdr3ZQFzJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtWcAAKCRB4tDGHoIJi
0t2uAQC9WN2OYYXOrp610MPdWdT0m5i4i1tZeyTZdr3aD+wm0wD/fSCYfaimi/PV
1bDpFQcFtXElQhb4Wvjp3cwIUlEZNQs=
=IjWH
-----END PGP SIGNATURE-----

--2cAhBHrdr3ZQFzJw--

