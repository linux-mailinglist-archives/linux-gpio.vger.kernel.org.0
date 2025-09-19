Return-Path: <linux-gpio+bounces-26405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C561CB8AB69
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 19:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7388C3AB642
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 17:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0A6322523;
	Fri, 19 Sep 2025 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJXDwZan"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4C3164D0;
	Fri, 19 Sep 2025 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302055; cv=none; b=np8zEbzoZWUeDBE76ifImX7HhTYz/JAtRjxXhuxqTb+9rqheYOsZ5pG9wrpXZiH1YoU23kGZd9VKuuQKec/tGCbi83hBefaRpocGGLd2HrcYo+7OELrlyblydXql3BPaRp7Lwg4k8CWtB7HOtg41BWiveu3BBXgZzGuTZM4wsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302055; c=relaxed/simple;
	bh=c0gay8liZZpMxu1wbo/3pb8Be4pbY2davSvmv8BnEJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFyldCesqVDM5uY+elyBTvffFHKo/X4gVE5+qFV3VyVZciPkCaRHWzvyBjPfE3DYVIsoqG+g7/7UnbJDklezlnCsG0Q3dra5I5Lje/KiHaon0BSYNZAVrfFNZCBiNolSI4clBwDWjtN0WZcs5xev7p8wUKTbJwDZ9esTRsVW3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJXDwZan; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C52AC4CEF0;
	Fri, 19 Sep 2025 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758302054;
	bh=c0gay8liZZpMxu1wbo/3pb8Be4pbY2davSvmv8BnEJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJXDwZanWpXWP5Do08/3QVhVXL89GUZA1HPkV51OYg377z0Fe/444cGrHCuTR10ps
	 636xFSIKiAgDkhPcrOHt4v0y8xhioVCW3f0tX9YKs9B1N1eXJlK9HUeqoGmrIvJeI4
	 HujOfz5pAJXJoHujLadevvUFi0MpMNtOTaYiozH/FBMyhbIySWZYClQRhGFvtOS5YN
	 ZTMXIGjIKRjQjJftN2dCsvpwSsrMIjx76x5SlR95ooFUDC77sYxatB0vdG3qmEY9zJ
	 fiVREZvmXEBpZeXcFVd+wHrI6W+p37119nsB27BZd7fl8MadCEG/WqqpaTzwx5i8UW
	 vZau7bct/kD1A==
Date: Fri, 19 Sep 2025 18:14:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com,
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra410 support
Message-ID: <20250919-undusted-distrust-ff5e2f25cdd5@spud>
References: <20250919093627.605059-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kGXcB5rXmwo+NFQF"
Content-Disposition: inline
In-Reply-To: <20250919093627.605059-1-kkartik@nvidia.com>


--kGXcB5rXmwo+NFQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 03:06:26PM +0530, Kartik Rajput wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
>=20
> Add the port definitions for the main GPIO controller found on
> Tegra410.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---

Why are you modifying a binding header for devicetree when the driver
only appear to grow acpi support?

>  include/dt-bindings/gpio/tegra410-gpio.h | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/tegra410-gpio.h
>=20
> diff --git a/include/dt-bindings/gpio/tegra410-gpio.h b/include/dt-bindin=
gs/gpio/tegra410-gpio.h
> new file mode 100644
> index 000000000000..e4d042fbacb2
> --- /dev/null
> +++ b/include/dt-bindings/gpio/tegra410-gpio.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
> +
> +/*
> + * This header provides constants for the nvidia,tegra410-gpio DT bindin=
g.
> + *
> + * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros b=
elow
> + * provide names for this.
> + *
> + * The second cell contains standard flag values specified in gpio.h.
> + */
> +
> +#ifndef _DT_BINDINGS_GPIO_TEGRA410_GPIO_H
> +#define _DT_BINDINGS_GPIO_TEGRA410_GPIO_H
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/* GPIOs implemented by main GPIO controller */
> +#define TEGRA410_MAIN_GPIO_PORT_A	0
> +#define TEGRA410_MAIN_GPIO_PORT_B	1
> +#define TEGRA410_MAIN_GPIO_PORT_C	2
> +#define TEGRA410_MAIN_GPIO_PORT_D	3
> +#define TEGRA410_MAIN_GPIO_PORT_E	4
> +#define TEGRA410_MAIN_GPIO_PORT_I	5
> +#define TEGRA410_MAIN_GPIO_PORT_J	6
> +#define TEGRA410_MAIN_GPIO_PORT_K	7
> +#define TEGRA410_MAIN_GPIO_PORT_L	8
> +#define TEGRA410_MAIN_GPIO_PORT_M	9
> +#define TEGRA410_MAIN_GPIO_PORT_N	10
> +#define TEGRA410_MAIN_GPIO_PORT_P	11
> +#define TEGRA410_MAIN_GPIO_PORT_Q	12
> +#define TEGRA410_MAIN_GPIO_PORT_R	13
> +
> +#define TEGRA410_MAIN_GPIO(port, offset) \
> +	((TEGRA410_MAIN_GPIO_PORT_##port * 8) + (offset))
> +
> +#endif
> --=20
> 2.43.0
>=20

--kGXcB5rXmwo+NFQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaM2PYQAKCRB4tDGHoIJi
0trLAP9bcGoUEpo7TdiJs3G3/B2yydrsGsY4grCq2LDCik57HQD/dNmzzLduEroE
XE97oc5867oQXWzTv5RrnFMADaPRVQs=
=e47o
-----END PGP SIGNATURE-----

--kGXcB5rXmwo+NFQF--

