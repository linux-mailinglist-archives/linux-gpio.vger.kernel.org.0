Return-Path: <linux-gpio+bounces-10469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516E09877EB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 18:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA0C286C1B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F5915A85B;
	Thu, 26 Sep 2024 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+MgrdC8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E03F9D5;
	Thu, 26 Sep 2024 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727369751; cv=none; b=m0zxF6vEHzwtzpcgpuL3MVOTkbEwldG8nk5kLZkEiq9gokszcTu/+jTv06KSl+i4/9eyKRgik5olwf0HILqcXRs8UlALqjEYAaUZ0FZmy3Qm2xOlPHkNDMnbIhGEGCkQD/VgMjmnPHxSVP1yMDVAWa8ks7Smq0l1FRvoqXOzU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727369751; c=relaxed/simple;
	bh=TuRzthjJAJe5b78rHwQvVXzKOnJPbcmiHPj/ozdzd+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzNYydaz3JPaNzb5vhCW/36Bj4FCG4+YpT7+l8jDhZPUv/EdbriILE4G3vLpzLKR+NVO+8R+zfTIqrGOONEoupkakToaRNq/sWYbxv/w5HXzCEOHcSTwm68uJbm5cjnKQWGSzupMCXd5GN5JiCJiGGwtS3hk5OnIHgB1FnxI6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+MgrdC8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58F6C4CEC5;
	Thu, 26 Sep 2024 16:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727369750;
	bh=TuRzthjJAJe5b78rHwQvVXzKOnJPbcmiHPj/ozdzd+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+MgrdC8vHP5vAFPEssZatG83M/5x9peh/vsPzKEdZJKNDMTVeaaMajHsk3G4Rifr
	 QPvE9noAbNBd8vmRA20l5x3HLVx9hAn5beLvu61Z8kEodwNWhSm3j+V7W8qW9Uy+yf
	 wchD4owHRpQHCdcP8swtR+b/MCs0ALgCIBjRAcWfQyHkARTpw12IGdX4wRcDEMiSoD
	 w7xuSZOwrWHe7531YYQqo1biW4kkpBfndXtD1xLrovopAsYLXgPkHaBCjy6lCp5HBn
	 cQTL4gIz09ivXa1BySRgSsn1tdSp83u61IcJ8Ptns0oAfCa36rqTxWOXpRMuqDZlZy
	 Tx9ot9t5lMOKg==
Date: Thu, 26 Sep 2024 17:55:46 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: ep9301: Add missing
 "#interrupt-cells" to examples
Message-ID: <20240926-skintight-certified-298afaf44981@spud>
References: <20240925173510.1907048-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VGFxwMLLRxQ7lqEr"
Content-Disposition: inline
In-Reply-To: <20240925173510.1907048-1-robh@kernel.org>


--VGFxwMLLRxQ7lqEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 12:35:10PM -0500, Rob Herring (Arm) wrote:
> From: Rob Herring <robh@kernel.org>
>=20
> Enabling dtc interrupt_provider check reveals the examples are missing
> the "#interrupt-cells" property as it is a dependency of
> "interrupt-controller".
>=20
> Some of the indentation is off, so fix that too.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml b/Do=
cumentation/devicetree/bindings/gpio/gpio-ep9301.yaml
> index daadfb4926c3..3a1079d6ee20 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml
> @@ -73,9 +73,10 @@ examples:
>        reg-names =3D "data", "dir", "intr";
>        gpio-controller;
>        #gpio-cells =3D <2>;
> -        interrupt-controller;
> -        interrupt-parent =3D <&vic1>;
> -        interrupts =3D <27>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +      interrupt-parent =3D <&vic1>;
> +      interrupts =3D <27>;
>      };
> =20
>      gpio@80840004 {
> @@ -87,6 +88,7 @@ examples:
>        gpio-controller;
>        #gpio-cells =3D <2>;
>        interrupt-controller;
> +      #interrupt-cells =3D <2>;
>        interrupt-parent =3D <&vic1>;
>        interrupts =3D <27>;
>      };
> @@ -127,6 +129,7 @@ examples:
>        gpio-controller;
>        #gpio-cells =3D <2>;
>        interrupt-controller;
> +      #interrupt-cells =3D <2>;
>        interrupts-extended =3D <&vic0 19>, <&vic0 20>,
>                              <&vic0 21>, <&vic0 22>,
>                              <&vic1 15>, <&vic1 16>,
> --=20
> 2.45.2
>=20

--VGFxwMLLRxQ7lqEr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWSEgAKCRB4tDGHoIJi
0gC8AP4yAYHOUSPz3IMWLYmoMKgPqmcAhxSezw41fdpWPh+HNwEA0Cmv5yUD+llO
QTdeEd/4488p0rmDeA9563q7CRa3qAo=
=P+x+
-----END PGP SIGNATURE-----

--VGFxwMLLRxQ7lqEr--

