Return-Path: <linux-gpio+bounces-10312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3597D5B4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 14:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869621C21D15
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 12:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6644214F9F8;
	Fri, 20 Sep 2024 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/Yoki89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E89413D50B;
	Fri, 20 Sep 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836375; cv=none; b=faKmjIeVhRAEG7UXN++DM4Fnf35HM2YzqVL59Edd11Wr7IeEks3cinMuj16SkKVcVcAIKZARmrnCwYicnbaF5yEXsmdoGwgfOztyxFBPNStHtq1xrA3S/khMVE6rU/GLh0VrmrYeGMn9SKwrL7kQvwPLBzUIPKZQwbQwXn3Jl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836375; c=relaxed/simple;
	bh=6Vk2/pCNOQK4SJYWsUPOpQuCrskz4KKSil1ZpH+JcZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObWziyghp/KQDuokNFqAvT1uULJPn1fwpzqy57tNnTsqT+T1TGNU/ajDFBe7zxW3EKW9bm2N3fzAyUCLnayZMWXF30zTyK5Xb5JyX2QsKIKn0qN4fNBXySrcp4VVZYG3wykY7FpEbj5u/hftK5yf5ivMtAhpHqYGPrnrsRHaEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/Yoki89; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984C5C4CEC3;
	Fri, 20 Sep 2024 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726836374;
	bh=6Vk2/pCNOQK4SJYWsUPOpQuCrskz4KKSil1ZpH+JcZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/Yoki89OCEYmOi1HfSYWOjIP/QgeqyGRSPcZu4X/FGHOKValSW3uuMR1JUf7eri7
	 +LkTqcqf71ChbS/KEkZqwerbYTgz+EHCo2i5qIara5fW5GwvmIm+f14eSB0eJAj95W
	 97BH8xX6FKjesLvc/zxOam8wexSRW/C0QPVhjyQIMu1eaxVg3CzwSlff6KZCyuHx5T
	 4Ta00wCS70Dv00Vvej9XENI2O7XbZD0mOoDc6GxnUr7V2/R+MI0jN+FLe1PWhX4zjj
	 7c64PNQN2q8B8ebKtXPdlf8dLItEo10Y3UlMmJOqe7BiIJGLkbdE+Vxz3jcVuNZ4mv
	 sRVmGhbyV747w==
Date: Fri, 20 Sep 2024 13:46:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20240920-reapply-amusement-a37cf13fd910@squawk>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JIfcTOkCH42WEvVp"
Content-Disposition: inline
In-Reply-To: <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>


--JIfcTOkCH42WEvVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>=20
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul=
2-gpio.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> new file mode 100644
> index 000000000000..0548028e6745
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2 SIUL2 GPIO controller
> +
> +maintainers:
> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> +  - Larisa Grigore <larisa.grigore@nxp.com>
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description:
> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
> +  chips. It includes an IRQ controller for all pins which have
> +  an EIRQ associated.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nxp,s32g2-siul2-gpio

Commit message and binding description say s32g2 and s32g3, but there's
only a compatible here for g2.

--JIfcTOkCH42WEvVp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZu1ulgAKCRB4tDGHoIJi
0vVlAP4yvjhZovY4mlXj8+ZUTlXXD4MtYxxGZhYUdN9iHVgQDwD9Gts7H9wuEIti
sXaY3MGD9OF38hp9yVQhDo2xrE+NkAA=
=v2Bc
-----END PGP SIGNATURE-----

--JIfcTOkCH42WEvVp--

