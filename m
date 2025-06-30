Return-Path: <linux-gpio+bounces-22454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE8AEE1D9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 17:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5589F189E13E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8E428D8C4;
	Mon, 30 Jun 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzGUY+mY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE028CF65;
	Mon, 30 Jun 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295748; cv=none; b=kWMeLJLetpY4oU8H/xty7wVJbGZMUGueIg582LBeEAWuFmEgFv/5JzzF8AP0Z7NitZjl0peN4FDcTnOQNC4R0W6gmBjt0B17Adoo6h2vT3TP5QZXAJg/vWONDyCWvCX85S1YldItJfp/5maXYJ4jq4PSOioHA+ZuNHtjWdb4S+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295748; c=relaxed/simple;
	bh=YcLHh+k63YrGnVqc3FfVtSUGIQrzXb+AYCgJwkR+5pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9uC4MUCHNobQi37TYObIa9idNW9Hgv9sKPTjEhbvCFXzqvcW8zFf8Hmyp4eLDUCfG4Xaldr5JUZIC2IJz775oJOc9K/A850qxGWg7dsG+FG/EsTk4QhMO42jFB9ZAx/ZvBs6XPfUtB+pntZClUGCV3FTF13teiIvGTzOjeU5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzGUY+mY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F321C4CEE3;
	Mon, 30 Jun 2025 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751295748;
	bh=YcLHh+k63YrGnVqc3FfVtSUGIQrzXb+AYCgJwkR+5pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzGUY+mYP6jvnj1LGpydx71+PntTMbfbP/wiaFdQ81g3O01NsfQvbqEDCwoQEnvQi
	 cYdzDOAebK7BivmaHB8+HU45Ri1Fkpfs+0LuekXZxRbrbSzm8k9YKNKFbB/JUkz1LI
	 IAiEeC0N/mmrqYV/8IYWOuAfXpb376Y+gaDOOYgDGwUaCgjgqNppjDoMABVpZ3RsiQ
	 lQpx4KXd4NRLbI7GM/f4+6Lwhhxj8CK5DEuJp/aL9mSNFVD4EE9nUTQ3X0g/2TIypk
	 j8FftQcLJBVTdsNXhg5/YGZjim8FMDNn+gRx8xSEVtwefJO0neUxfJojsc0eULDFka
	 ZJN/MD1bnkMUw==
Date: Mon, 30 Jun 2025 16:02:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] regulator: sy8827n: make enable gpio NONEXCLUSIVE
Message-ID: <440c4bcd-0fd7-4c12-85a6-5eb343fc3f91@sirena.org.uk>
References: <20250629095716.841-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UAVpDRsTcs9rWeUL"
Content-Disposition: inline
In-Reply-To: <20250629095716.841-1-jszhang@kernel.org>
X-Cookie: Say no, then negotiate.


--UAVpDRsTcs9rWeUL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 29, 2025 at 05:57:16PM +0800, Jisheng Zhang wrote:
> On some platforms, the sy8827n enable gpio may also be used for other
> purpose, so make it NONEXCLUSIVE to support this case.

When you say "other purpose" which other purposes do you mean - another
regulator, or something else?

--UAVpDRsTcs9rWeUL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhipv8ACgkQJNaLcl1U
h9DxHAf+JT3YzGFqndvQ0ENy2+4cVQ0wAn87m0sf5KKOPGcAagu/qzrWbxNVpY0Z
9xVpDOL3pDUy6jBKiqVGUItGJEW9BxTsGie8CTlAgJt3O4F5YAy3hR6Q+JsdoL+J
x1FRT+iieyFHruz1FNz20aJxgfHvbwuBWciXLc2AWQmvRbMslHenRLE+1eFqYkR4
Xp6zf8wYuafw9HOGGvVkM0fpw0Nm9n/Kx77+ULrIMJo/wZj+k7iGqrcE76MU7TO+
b8UiE+5w+gcpk0aFcYTWaol0o7d8ViAj9ccE0Ywt+21Qk2g6+iUCOq5NGOMTd9Ch
knAzJVkvsXqOlrfNdbEVL4WaOco/Fg==
=Dpr1
-----END PGP SIGNATURE-----

--UAVpDRsTcs9rWeUL--

