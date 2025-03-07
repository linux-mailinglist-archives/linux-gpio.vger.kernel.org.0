Return-Path: <linux-gpio+bounces-17272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09965A56CC8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 16:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3FDD7A3AC9
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 15:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0242A21E094;
	Fri,  7 Mar 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUh8kJyM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245A21B9EC;
	Fri,  7 Mar 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363047; cv=none; b=jvrMIvwhjfvNLc8l7OLfk5sYx4xAI/PKR3VqTNMqn7dH7Os03axx7MKGnnjF5kFZsZBMKtt11Wl11QalQA6Kz5ka2wmU4NOyfRWtG58VybmVaF6PaItLJT+NrmCmV8Wv3fRNGk2BPVxUaXbUXwWeFOtovTA4fECsj27ky3IopsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363047; c=relaxed/simple;
	bh=Ic5vB9Uu/K/pkNFQ6maZXf+CQuaqOYMtTPNTW8AjeWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhPCDyxTu66POdWhAhucuIrRFygoRELk62yewrrIFUPCwrIe+hmN0LsrBwKicqNsSnI4tF3NZZu/JOfXtw2cSWcaG+IepFUw6Gh9DtfR+TkUnEkgpk6AQm3R5AkgWD2H5C2K+XL+alOxIV6nwOdQKJB4ufV15zrI7b5ePeJRvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUh8kJyM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65458C4CED1;
	Fri,  7 Mar 2025 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741363046;
	bh=Ic5vB9Uu/K/pkNFQ6maZXf+CQuaqOYMtTPNTW8AjeWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUh8kJyM/dy1MrGz2OAq2//s/rOxXgpz+CWFfra5A1icQvFfCmIIWLFk2T6rnLC/b
	 Vk378YNCu2jfMbOK8g0pYIhDF9P5uKpsta2+aQK1UHdn2hgGhS2M6S4sFwM4Qg0Zz2
	 ViFKdbc+vQsvxydrazzpMw3gSVORMIfKXJ8xJBODEGLRZR7559sIEMgzGseGCL8lB0
	 kXM2eYSISP31kOyasGy5s0cQwde0B/ElP/gMGkCvbUa/PQm2Dlw4QXBAcm/UsANkgt
	 PxLVXIz4yR4PJghsfX1PHQHbb9y6Q9VlgkNnOE26RgZ5SsbM0G/o6joDUVLcpSRKZW
	 y2bv5cHXBr2lA==
Date: Fri, 7 Mar 2025 15:57:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpio: vf610: Add i.MX94 support
Message-ID: <20250307-seizing-safari-c56132a11b76@spud>
References: <20250306170921.241690-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wm3Zg//nlpBg/ltd"
Content-Disposition: inline
In-Reply-To: <20250306170921.241690-1-Frank.Li@nxp.com>


--wm3Zg//nlpBg/ltd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 12:09:21PM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-gpio" for the i.MX94 chip, which is
> backward compatible with i.MX8ULP. Set it to fall back to
> "fsl,imx8ulp-gpio".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index cabda2eab4a23..4fb32e9aec0a3 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -28,6 +28,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx93-gpio
> +              - fsl,imx94-gpio
>                - fsl,imx95-gpio
>            - const: fsl,imx8ulp-gpio
> =20
> --=20
> 2.34.1
>=20

--wm3Zg//nlpBg/ltd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sXYgAKCRB4tDGHoIJi
0leaAQDNu+bsdqnUmbWocpGU1nB64e+zSq/KuuvbbNiLjLiJrAD/chOF+FkjFJ8l
mPtACziZv1uZw9DZ7LdIrjiwmKP1hAI=
=ZDVJ
-----END PGP SIGNATURE-----

--wm3Zg//nlpBg/ltd--

