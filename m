Return-Path: <linux-gpio+bounces-28546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FBC618CA
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 17:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C2224EC0BA
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 16:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C2630E825;
	Sun, 16 Nov 2025 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCKMdAJs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF72C190;
	Sun, 16 Nov 2025 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763311614; cv=none; b=VgBhSyDbXL6ABY8PW7Ja2h/fCqQEq0AJcuJP4VPMUns3QogvNHe/nSZgokKxeVVLzrcw9MVAkSsHQAODhX+M/c8Fx6ji7XoBTUEnLRcNV1ANvRoTjgYJw9NnzAiwfQyN/g4NsqOU4MwGr99lCmIVM9V01Y13AN2dw2BVkxu2wHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763311614; c=relaxed/simple;
	bh=IB0SHzJTCmC0aBxKNhQYokgomuvEdoiHhkLaS0VbXUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeqzTd9QrCqU4r65VerJ3TGhi3cSpdjiOrDTWlr6sHcxJiwro/lClCNu3jySD2ANuWVL4s6sOnBS9+9b1NGYfwevCQPxEZaRID4o7HggY9zUkMOXuouRV/tD99mhED8R3Lob26myu0g/F5ybkmiUwvFF3K0xyoRFMzPZijAe378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCKMdAJs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6900EC4CEF1;
	Sun, 16 Nov 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763311613;
	bh=IB0SHzJTCmC0aBxKNhQYokgomuvEdoiHhkLaS0VbXUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCKMdAJsC75fTkPRoz5i3ni3+lV7VItE9AYnGYHAIwOB83lc7UOye68vDwD6Hle/o
	 7Qi3xzmEFKIo9Ni8Kk3FSGu591k2Ad/6ouviQbKjtFdimS0ablAg8f8Ivxsz4Znix+
	 gg0NX/YOneFxkKcWBnZ+oXRyuBjxTZYX/5AJmtA6+BP23zBuVQZl0mONqJMoqcT2hX
	 WxepSd517eSbTow4vp4GXeAj7kfsYpv6DNQcRAiIo0amBxxlsiPDxEygB0trb7RJlj
	 w7jdklwjiEodMlZ4MzNqrY9IcnZXdaJu04a5bH2BH6St/lbqGbYRK8sP7JRco1TseN
	 pNCT8Azce01hQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C31931ACCC98; Sun, 16 Nov 2025 16:46:50 +0000 (GMT)
Date: Sun, 16 Nov 2025 16:46:50 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
Message-ID: <aRn_-o-vie_QoDXD@sirena.co.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
 <20251113162534.GO1949330@google.com>
 <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
 <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
 <f1e9a9e35f7c16d8db0e39128eb184f3f42b7d02.camel@linaro.org>
 <aRklfJtOJ_Cy7tEE@sirena.co.uk>
 <845ca29cf8af53bd3093d1dcbea64cc3e04432f2.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTSeFMvaEzVHYhHn"
Content-Disposition: inline
In-Reply-To: <845ca29cf8af53bd3093d1dcbea64cc3e04432f2.camel@linaro.org>
X-Cookie: marriage, n.:


--TTSeFMvaEzVHYhHn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 12:49:55PM +0000, Andr=E9 Draszik wrote:

> The typical use of the S2MPG10 PMIC is in combination with an S2MPG11
> PMIC in a main/sub configuration. Bucks of one are usually used as
> supplies for LDOs of either itself or of the other: several S2MPG10
> LDOs are consumers of various S2MPG10 bucks & S2MPG11 bucks, and
> several S2MPG11 LDOs are supplied by various S2MPG10 bucks & S2MPG11
> bucks.

If you're doing something to resolve such rats nesting of PMICs you
should do something that works as standard rather than just bodging this
one driver in a way that treats this specific device as a special
snowflake.  That might reasonably mean going and refactoring existing
drivers to look like this one, it is a fairly obvious approach.  We
should really have a uniform approach that works well rather than random
variation between devices though.

We could also do this at the regulator level by arranging for the
devices we make for the regulators to have deferrable drivers, that'd
be a core only change.

--TTSeFMvaEzVHYhHn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkZ//MACgkQJNaLcl1U
h9Cvgwf/ZoWso6hjivCrRCtK/dN9mTbBO/SSM4Vfi3mbaE5vv+wSDFC1zw7LReGS
UaBJ45CfoGQlbDr7zSvUKlCpKGP6oxuRAdrvQt/NwYUxBJ/68Sw9QhjLYcBwwZSZ
6WfQgKgX4K3c/q8sPkv+8XKdZFhBnrqet0F9lL2v86eqCTR4ld/bQEz/raMDCPw9
j65BhNErlV04HCK25epfFTNHStlsudJ3pdwtkWl5xas7gVvBwRzzdLLR1YOZWl2s
C4G/Pqw8rctWUWB4mY89ye9ywlrmBTJIx401aZ2QroVcThwV3bjgt0TL0Dgd+0+i
uxE8TU43AEQ5aQLly6S0lX3n1oI3/w==
=RpUa
-----END PGP SIGNATURE-----

--TTSeFMvaEzVHYhHn--

