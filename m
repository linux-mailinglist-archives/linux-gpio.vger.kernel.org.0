Return-Path: <linux-gpio+bounces-30503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01281D1A358
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A359230AEEC0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17092E8B78;
	Tue, 13 Jan 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KV3SosWT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC962E2852;
	Tue, 13 Jan 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321260; cv=none; b=s5/Ds2vKHT8e06cQ86ZunXXoPeNg5e+eP9w7TbKWHRl0Vqn3ykFu3OtB0lJmmjV/jLM9M4PrdXf8gLLRgxnZhEq49bM/dUw8OG/mbYZbgTMFj3BLT+biYSNCc/UUcWtVAWEsGYpvadTrL76Wplyd9Qc81PHpojKE2bHuihO9d18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321260; c=relaxed/simple;
	bh=mEatuWTFMJ7opE9HJSdwyGc6dGCQ/DdKDKcWkmz23oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN+8zDVNliWinRP5+kgSYKYK85wCzSg7TW/2nvoUsw6Ri/hcv0vnNJHgKFOtt75XvQq9SFJuFuLzDjSU6Lv89bIpUxKa/kNWtE+bIWg2UGtAq8kbqAXKxt1nVqea2RV/2tB6pKAOojAZM1XPzVtSIU1/yDRu9ryHcpVT1f+V9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KV3SosWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74168C116C6;
	Tue, 13 Jan 2026 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768321260;
	bh=mEatuWTFMJ7opE9HJSdwyGc6dGCQ/DdKDKcWkmz23oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KV3SosWT8JeFdPcEbo6t0sHaI6/MrFynZil+wdvBRH/e9ybAXcDK+HUiBqGQevaIO
	 HItQFdBqE0bP9uxxGQEVLH6OziEw7by6gN+B3EpPXGpsDXd1UbK+xCW4sPxlrPYsX1
	 bNtCDfLWJcYHK48WFRhSkHsD/8azi7Ro0cgaIe4YtDj87DPDvQ+dmJWsLCrjX3HdF9
	 vdVZzfj/AFKGn7bd0TZ+wxrzwdqPtGmMBfR3cFkvYs13JHUzo/d0fYaX80qnFBj5e+
	 PfudDhEF1f/zxJhZH2Wu6msqTxLjoJdHqU5FHp2cLckKGSA3YzLY9PSgSTe+hAq3Yl
	 x+76XK9Kp28CA==
Date: Tue, 13 Jan 2026 16:20:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
 <20260113112244.GE1902656@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yd7U/Fz06TPcBCPq"
Content-Disposition: inline
In-Reply-To: <20260113112244.GE1902656@google.com>
X-Cookie: All models over 18 years of age.


--Yd7U/Fz06TPcBCPq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 11:22:44AM +0000, Lee Jones wrote:

> MFD pieces look okay to me.

> Once Mark provides his AB, I can merge the set.

Given that the bulk of the series is regulator changes I'd been
expecting to take it?

--Yd7U/Fz06TPcBCPq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlmcOQACgkQJNaLcl1U
h9DkDAf/aXUdb/ij0NeG8LB1f9KJZA+1JBPDJ+37zcJtQxZa6HVv2KPIZzP6pd5v
8v2VpOQJ9KvRq3TADwBeVrBDQdJFmG7C6+HN7BcgVsVXsF+0OCgCAyZ0XJaXpmct
8eyl2jpvQyvtsKzfrMfDrIY2vDVoiqI4U90nfkHP2+HYuUCuym2JEogjTfNp8eHE
GWEI8a3hBwph0Y334Z0oLZSvbAnV6UpAn/AWa3DBCNpWnOzH0uxuodJTKxg5uivj
zpOTBhsBWjQ7vWc5ABMV+m2THd1K75xsXbnq5bPB+jTAnVfBp7D/G/o0oJTqmFQn
xgEWkGl/QJol2+w9orGmnAd/2cJXfg==
=zs0M
-----END PGP SIGNATURE-----

--Yd7U/Fz06TPcBCPq--

