Return-Path: <linux-gpio+bounces-16840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D8A4A1C7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 19:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01C7E1759C3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 18:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D6627CCD4;
	Fri, 28 Feb 2025 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1gKP1tG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B26A27CCC3;
	Fri, 28 Feb 2025 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767960; cv=none; b=SVlehilOMzkQsBYfSaqYlZc+nd0JX2S83PiU5hQKvw79clUu764Dvb6BOpHGiBfQj5c8or5+HgyOJ1UPhkGW2lPV0sLTxi3uyFGIF/m4ENdU/6ky9FhyQjybWwJqNitxrVFBNVe3tq2x+/Oj8GMSfgCBka0INsxuMwc5eppljq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767960; c=relaxed/simple;
	bh=AuBv0dI0/7mGcCyImiY+YF7W4pXWyjFanOGgVtp4H/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmAVJcrHWo8KI1eAesoG9rDl/OP/84/9q0U5q82Gc+mdFnhZdYYknzm3mrt68xJtb8rohkPyp32HCKZjS8YzqL2y8wTiMxjQlL0eiUyFwsC7thUluEkPYxCPe7rakwwUR+0DjsxWExsdjbuKOx+Itm51x0vOfpDpQx69uv9Qey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1gKP1tG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50378C4CED6;
	Fri, 28 Feb 2025 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740767959;
	bh=AuBv0dI0/7mGcCyImiY+YF7W4pXWyjFanOGgVtp4H/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1gKP1tGmO9TCsk0ojlDHgr7t6xSqubmNlFaFN0Zcjf1EuVDzyjAk3oTvXU6e9Jw1
	 W7jVhZXcLOmbIq5P50+yAmazxWvz/R7piauRNjADNHxPKVmhbVTs8TgtE+LzJdYFYe
	 xxK0pPSnpmJSrMNTZ1x21jqdLlZTCAVcil98FmAb+HeMPSwDXxePWr1HBx6F3mqP+j
	 VEqaObXKSs7/Tkly1YB5VUejsSHz22GCU0PNONVdY7T6EKqgfVRFAv5aijBPSuNb6Y
	 6o2mT5pe0I7Se913Szspc84oA3zbmsMwfqkPdGrlMWHrpcePLCVsVXYEH4BFe2PilP
	 z/MKA2lEywZwg==
Date: Fri, 28 Feb 2025 18:39:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
Message-ID: <20250228-gloomy-revolving-f56eea5ab8ca@spud>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-2-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/leG0Q2y3eS4Gkis"
Content-Disposition: inline
In-Reply-To: <20250228064024.3200000-2-jonas@kwiboo.se>


--/leG0Q2y3eS4Gkis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 06:40:07AM +0000, Jonas Karlman wrote:
> The GPIO is accessible via ioc grf syscon registers on RK3528.
>=20
> Add compatible string for RK3528 ioc grf syscon.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/leG0Q2y3eS4Gkis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IC0wAKCRB4tDGHoIJi
0jdtAQDGvTMV164jPUzRBKHwNEW+vXfylxVnqteojSFn8YFqRgEA92nhRCxirp16
sRP2GIrG/z+LYbF1tzPyGfKyIy4hpAM=
=njOY
-----END PGP SIGNATURE-----

--/leG0Q2y3eS4Gkis--

