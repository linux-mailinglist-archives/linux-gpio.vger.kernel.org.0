Return-Path: <linux-gpio+bounces-26914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E1BC6A82
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 23:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E6AE4EC003
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 21:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91D81EB36;
	Wed,  8 Oct 2025 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceK10NHV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC45224AF3;
	Wed,  8 Oct 2025 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958058; cv=none; b=FaipCfqKwEhgda6VuV7nlMZHt2+39MHxw4cpn8KpiUQrJedpye4YMnpQ42iNlnH5K92JpPvbP7Zo6iDAV6ClCIggCY+h9fC3AFgqMlSPGomnKXfl88pHE5xrd7zLqVFPFhRfpKrA0k8OaHArfH74QuJniKpsl3h5Lm6rCUyG+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958058; c=relaxed/simple;
	bh=39B89TgYoeDAnrK783gKdzfBrJbIvzbmWAJjVVApfII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQezoTECt52RwIXm9X6HxYSTj7qxIRwoO30aU9izpSy+l6Wh4c4MAnM/F2PZB4hR4owQh2xZqM7W0saTzTnZejSOxr2Wdfnr18Wm3SXrP4fyeduB3jq5ynTMrg1fpKgXc0mJwOhL105jSRP5WUnRoK7JPiVBaGBDbUqsnrX0GCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceK10NHV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB888C4CEE7;
	Wed,  8 Oct 2025 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759958057;
	bh=39B89TgYoeDAnrK783gKdzfBrJbIvzbmWAJjVVApfII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceK10NHVXa+RL9euVgbkDmln/76dAQkUWMLVrZzSVR4yRoFxml0LPd0b4mCCn9Hrd
	 zKC3bbZ+F7rkcwHxFziParI4mT+KR8gYkz+91Vfy3RzZk2h9WwPRn7TKzdSVWFiQrx
	 vUng9HGSM1pRjHokzqiQ2ki+cwAJqhZaiB0tah6Chn2TS/gW5kQmXrpzlh40qcUM6W
	 spzrctqKlw6BwBC/wdicJnBYJ6L15f+byMfYDNH2UJ3stAPBTO8lbIXZI1Qg67CZ3R
	 76O4vGN0us3u1ExdoELSZRmBEADrzXST0kVQxc0ElzgIOUCCQdlNe+2ZSbZOWNCdtJ
	 420Lt+6+Ba2uw==
Date: Wed, 8 Oct 2025 22:14:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132
 MIPI calibration device
Message-ID: <20251008-craving-composite-81aa70b6e882@spud>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-12-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jP+KgV2/KzUlrI8N"
Content-Disposition: inline
In-Reply-To: <20251008073046.23231-12-clamor95@gmail.com>


--jP+KgV2/KzUlrI8N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 10:30:33AM +0300, Svyatoslav Ryhel wrote:
> Document MIPI calibration device found in Tegra132.

Could you explain why a fallback is not suitable? The patchset is really
too big for me to trivially check that the change is correct.
With an explanation,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a114-mipi.yaml
> index 193ddb105283..9a500f52f01d 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mip=
i.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mip=
i.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - nvidia,tegra114-mipi
>        - nvidia,tegra124-mipi
> +      - nvidia,tegra132-mipi
>        - nvidia,tegra210-mipi
>        - nvidia,tegra186-mipi
> =20
> --=20
> 2.48.1
>=20

--jP+KgV2/KzUlrI8N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObUIQAKCRB4tDGHoIJi
0spgAQCOTfXrsyfS3CIGSc9JYyiUFNhWFHlpRP7VzN3DQa0r0gD+PG6VUqC7h62Y
pRPxQQG4kkheap2w4cYcE/VcpEiIOwk=
=EFMD
-----END PGP SIGNATURE-----

--jP+KgV2/KzUlrI8N--

