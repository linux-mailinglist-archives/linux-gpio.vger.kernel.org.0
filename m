Return-Path: <linux-gpio+bounces-26477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAFBB91BBD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F2A3A3537
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B39D21ADB7;
	Mon, 22 Sep 2025 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgMl6B0F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F763CF;
	Mon, 22 Sep 2025 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551547; cv=none; b=Y0n7vVFgrXjlVVSFt8Aw5vvmyifzReffmoVdzgvzpuVEsYA8HjLheXRnmtKfG/iOWRj4mzCD4ZzZBrrNBXFOzBzOJLpWHijOQhDcjzhC3zfivzqEHzHCsBsEsyGd8HxT/GKfjQY/lErr7jWaIb90yu8/fiNb8/MDne7Cyp0uFpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551547; c=relaxed/simple;
	bh=w1YZpf/54LKDSrGyj/F5KBKf8qtT5LLzjqYmCAb3Vw4=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=o1nJZwZvN4XWR+OuyOcpYeC1jE4U3COA5vRyria08WOnprTn/fG9w9XyVCliUL7we94RO6H50cd/2p2nZ/3uGBf6GiohC4p4RrWLRT8lemji84wELnQ428qa1PkGYQ2sqHClIMix7rN3wZvUh1exTxVn3v3xMIeAGGG8gpBlJTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgMl6B0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0400AC4CEF0;
	Mon, 22 Sep 2025 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758551547;
	bh=w1YZpf/54LKDSrGyj/F5KBKf8qtT5LLzjqYmCAb3Vw4=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=JgMl6B0F9ToWxl1zDwYYk1LCd50oiamBIGWlS2VabOO1jNyMZNDpTBkI6NsU8wYVB
	 hNHDVjoNpA1UXV3lwcprRJk9RMNQFmkZJz9urcrecyIaWeXdJkcNXXexgSctW1OVWx
	 h4wnK9i1xzlOtXTRKHLbpXn3spNBgoPY9shd7YkZb7u5aRE3HTa9csyQ1km64yxIAd
	 4e6ItSfg0aEr/RbhcDovcHQHMde+v9eYJe+UzFqF7HrEAB5rbEQl7erSN0h16Rpy7F
	 bEKGgRwW9RoikwVeAABrbOPvt3glLvH3lwDXpICWlsp6C+JcH1e/8LfuK2aThRoZwM
	 F9ckEtkaA6GfQ==
Content-Type: multipart/signed;
 boundary=e357fa411785beded18b33173555b534bf3695c31beb7709b7468d14d492;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 22 Sep 2025 16:32:23 +0200
Message-Id: <DCZEHUCR7Z0M.V8VY2036N4IW@kernel.org>
Cc: "Frank Li" <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo" <shawnguo@kernel.org>,
 "Lee Jones" <lee@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/12] gpio: regmap: add the .fixed_direction_output
 configuration parameter
X-Mailer: aerc 0.16.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
 <20250922142427.3310221-8-ioana.ciornei@nxp.com>
In-Reply-To: <20250922142427.3310221-8-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--e357fa411785beded18b33173555b534bf3695c31beb7709b7468d14d492
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
> together in a single register. This cannot be modeled using the
> gpio-regmap as-is since there is no way to present the true direction of
> a GPIO line.
>
> In order to make this use case possible, add a new configuration
> parameter - fixed_direction_output - into the gpio_regmap_config
> structure. This will enable user drivers to provide a bitmap that
> represents the fixed direction of the GPIO lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--e357fa411785beded18b33173555b534bf3695c31beb7709b7468d14d492
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNFd+BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hBHQGAoI8dTBYYAlWcyPXqg4KxIqsA4VB0w/nI
IBMenexh5Rl03GWNoBEBMgSIzkbWAKHrAX4sA1hhi0JtWP6eK6zVqD3I/IXj01Ir
RFqQrOcnPkDnAlzRDxRpk7jXG6SAoKmFLhs=
=BhSk
-----END PGP SIGNATURE-----

--e357fa411785beded18b33173555b534bf3695c31beb7709b7468d14d492--

