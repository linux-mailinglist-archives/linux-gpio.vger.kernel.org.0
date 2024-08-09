Return-Path: <linux-gpio+bounces-8690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B665F94D2C3
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 16:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73453281AA2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 14:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0993F197A68;
	Fri,  9 Aug 2024 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVNxW0H1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ACC1922CD;
	Fri,  9 Aug 2024 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215523; cv=none; b=Rj9JQz78Js8iauUDqrDJgEhurHxGEZzZJA4FTK9FK0mUGjy2+biCDa+5u7co5UHbboEbg3P+VnAZBDu965TEviJce0Ws85pysM9Q55srA+Ehsvr+NZKuEsVzGRDlq5o3rb+5BvU52JJ5PGK4YgAXsP/bY1+FlOMaTTP964a57bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215523; c=relaxed/simple;
	bh=W+v4wrSUeGDlZUZEjMy11Jb5n3u1Du3XmL5UwfrGBRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHiuwd/e8C3ar0jLuagY4ySvTVrHW0zEGFj+wc6SWqB9r3+hfNr30o/ARub+ioAf8BaFuLFgVql4LrI7fq9lsAQYzllZRDxFLMYKl95+HwraaleQu60iMFmLRZWp1kbMy5me4HiSPPzsxEhg3cJ1ep+EtPU9RrX90hCgJwftF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVNxW0H1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDA9C32782;
	Fri,  9 Aug 2024 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723215523;
	bh=W+v4wrSUeGDlZUZEjMy11Jb5n3u1Du3XmL5UwfrGBRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVNxW0H1xtRfIhdI8UdBCcFYaGM/XaDwi+wc3nyxx2J1u15ASXU8GJbwYSHcqVMG7
	 YRDQmTrZtjOVgzn1aoAzoqrgZdbcT3YJr9hwiaGVNy1McfyrUkLNtbTVUgp38QW5Xj
	 WTUDRWd9zMx2rJAAgTu8tKbtsNbJxFd2kb4cVALqil/nhlS2XqUifN3JiuPUgBn1DK
	 xXbQfSYAK4TmsEWVd91paTLR7cqAV0A6k6YXqA9mSImfUTDFyvxd3DwC/5WloNga0L
	 /tYOo0R7YO+vVQUi+BKY8vJopZzbjTDMU83UUqdCJyCqA57USI0K1hMzswkFORi10M
	 ak5ix1zApADNg==
Date: Fri, 9 Aug 2024 15:58:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Message-ID: <20240809-dexterity-attention-8376b3b16d59@spud>
References: <20240808164132.81306-1-detlev.casanova@collabora.com>
 <20240808164132.81306-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NTIMqCo6A5o+i6Gx"
Content-Disposition: inline
In-Reply-To: <20240808164132.81306-2-detlev.casanova@collabora.com>


--NTIMqCo6A5o+i6Gx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2024 at 12:39:55PM -0400, Detlev Casanova wrote:
> Add the compatible string as well as the optional rockchip,sys-grf field.

Optional for all rockchip devices supported by this binding, or just the
one you're adding?

>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 20e806dce1ecb..cd527ccc9e6bf 100644
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
> @@ -54,6 +55,12 @@ properties:
>      description:
>        The phandle of the syscon node for the GRF registers.
> =20
> +  rockchip,sys-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the SYS GRF registers.
> +      It is used for i3c software controlled weak pull-up.
> +
>    rockchip,pmu:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> --=20
> 2.46.0
>=20

--NTIMqCo6A5o+i6Gx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrYungAKCRB4tDGHoIJi
0nHaAP97YtyynX04rf7zjtP4R+W6GITXm4Z/bA+EUh7qE0LelAD/XAhb9Evq/dMo
JaxOvTgiuv4ijt9tTIRbnqisL776IQ4=
=FkCm
-----END PGP SIGNATURE-----

--NTIMqCo6A5o+i6Gx--

