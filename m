Return-Path: <linux-gpio+bounces-425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E911D7F65A8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 18:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C84F1C20FBA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 17:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E297D405FD;
	Thu, 23 Nov 2023 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdLGsha9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B95405F3;
	Thu, 23 Nov 2023 17:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9AFC433C8;
	Thu, 23 Nov 2023 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700761343;
	bh=mnNDN6CYqckEVI/ixOmZ/CDaSGqUiwp2ZxM10WlAlTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdLGsha9Z3ZYeiXs3nNe1pXNrngi9T51dttbfioVnWqXhZ0wCnD7lMr2Kr5+JdKPq
	 v8Pm+dpyadazac8WxzdDQLqjEjwEBduOTyD5G/+OVFiJau8Yde78785cojbRtP4Ubi
	 TG3ulvTP6VP6CzgHki9hFAZNPSVELzO08XEFFGv2YuL6gOtCeAJnXYjUrSSsnDqakM
	 z1GurtZnkWZSx3leWQOZSxudwEivBQxW3R9QvGuRv/JSIdEtksyQ3KJap37AR6XYdP
	 TTUPhwHvziKRz5/4DwUq/XUkOhf31WTZPDCDCK/qiDQ1jQauQEQGhfHGSsLNjzeB5y
	 cvoiNiFvdCRKw==
Date: Thu, 23 Nov 2023 17:42:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	semen.protsenko@linaro.org, Jaewon Kim <jaewon02.kim@samsung.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: samsung: use Exynos7 fallbacks
 for newer wake-up controllers
Message-ID: <20231123-matador-purifier-282af21fa605@spud>
References: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82fCaaroElEuq5wK"
Content-Disposition: inline
In-Reply-To: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>


--82fCaaroElEuq5wK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 09:04:05PM +0100, Krzysztof Kozlowski wrote:
> Older ARM8 SoCs like Exynos5433, Exynos7 and Exynos7885 have the pin
> controller with wake-up interrupts muxed, thus the wake-up interrupt
> controller device node has interrupts property, while its pin banks
> might not (because they are muxed by the wake-up controller).
>=20
> Newer SoCs like Exynos850 and ExynosAutov9 do not used muxed wake-up
> interrupts:
> 1. Wake-up interrupt controller device node has no interrupts,
> 2. Its pin banks have interrupts (since there is no muxing).
>=20
> Their programming interface is however still compatible with Exynos7,
> thus change the bindings to express this: retain compatibility with
> Exynos7 and add new compatibility fallback of Exynos850 in newer
> designs.
>=20
> No driver changes are needed.  This is necessary only to properly
> describe DTS.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--82fCaaroElEuq5wK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+O+gAKCRB4tDGHoIJi
0sYPAP9S2c9HnHdR7ZzPqfIZ5CHHzWUQV1qnq1mzNcTcecSR0AD/QMDe/sPPOH49
h8Cm2Kf0XSlSjwBeb59N0W7HWXxi+AM=
=QhNP
-----END PGP SIGNATURE-----

--82fCaaroElEuq5wK--

