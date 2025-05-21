Return-Path: <linux-gpio+bounces-20448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C024DABF905
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 17:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09273B9B2A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 15:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFA21DE896;
	Wed, 21 May 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKYwt/eT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4EF194C75;
	Wed, 21 May 2025 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840689; cv=none; b=q5Fw0uIZOJ6Xb1ik5MaN8TOST/cvPiCtbzEN336pbusAJ5xPsdfTsTNoos6cAeH4mKYg0948XN5Op3OUE3jfBdHAhffd6oVa7I0sR8/eG1BlonmBWqH2RzQi5nZhSjJa3wzJnutiFux4ljc0Sv3Xz53lj+7aNzumS5Dj3kjLkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840689; c=relaxed/simple;
	bh=KwDd2EMlZr9hfaN3cZIU/a2g/xgt/yNMRfTpdvkoNFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwS1FYoXItG3qna1D4G+tkU6a+gdPz6kUlmSbYFCktpz3GPTmOJ7H+dMwhEjO+y9PtEeHk+3KQERsuBXfCxq3uu6mKjSgnqtqDYb/HMuoMnuI0ih5J6A22L8MuwhwziP43GyPUwILpabL4GyE8DTkt7vHaYCNauCVEg7usrSmXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKYwt/eT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EC4C4CEE4;
	Wed, 21 May 2025 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840688;
	bh=KwDd2EMlZr9hfaN3cZIU/a2g/xgt/yNMRfTpdvkoNFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKYwt/eTjs7jcUmygYh73NgjqTryFfhuIcg4HAKdZOIqrbxom5z4j4CrQfDMdMWft
	 HIsFoBLJnjWp7FPctJZvgVBlkYx1++dvYYJWnz5nRu39NsRJ4l0vQ/GQGnmc62L3i1
	 NcaCwCzj+++0fTq3iAenS6rI4dU+POgxpb6L7pJI10YTZnZgL6vM/4eKIt5EcpN+Px
	 9kTtF+mpbSdjGfyGU8ijsXaQpj8sEWy8FZUMfSN0q0LlffhaKJwLIacSBBKAnST6OX
	 1ATG/6DX0ExKwvxuN8F9jva2nmcTzz+q+lh2GT65rdVNbw4S5sdNVhLvIW2J+Q7mvv
	 EGJRoMxDU4Pcw==
Date: Wed, 21 May 2025 16:18:02 +0100
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
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	peng.fan@nxp.com, wahrenst@gmx.net, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Message-ID: <20250521-monetize-variety-0f5860c56c11@spud>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-1-04771c6cf325@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yNwNt4S7GEmEqYEF"
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-1-04771c6cf325@nxp.com>


--yNwNt4S7GEmEqYEF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:46:12AM +0800, Haibo Chen wrote:
> Add optional ngpios and gpio-reserved-ranges property.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--yNwNt4S7GEmEqYEF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3uqgAKCRB4tDGHoIJi
0jGlAP9TnTdse6ZU06tanpS6TQTiGGVwpZ8Bh6rNtLQi10BkkQEAinMkR1LeNCP0
wO5kSg63BuWyDoTNoR4N0z+zJSsZ5gE=
=jwcd
-----END PGP SIGNATURE-----

--yNwNt4S7GEmEqYEF--

