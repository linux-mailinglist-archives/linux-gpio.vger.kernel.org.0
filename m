Return-Path: <linux-gpio+bounces-30577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F201DD2008E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 17:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30B1F30082F4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA783A1D0C;
	Wed, 14 Jan 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kvz6IhCI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE539E6E2;
	Wed, 14 Jan 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406534; cv=none; b=MH1vxNoE7pjdMnuRgfGybmCY+Gq/fCzXZs7z+bw4XxAX1giIMVyUSkwQ9+EcfCRMdJq6BLWMq2xQMgffwoj7Fzof57xjcXxp4Zix+H9XWUyc8F05c61rvaunaIbLEFJBhHr6pUvpRJ15gNT7r/5Xt3yzNjqXtfzyOWIwiUC9bOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406534; c=relaxed/simple;
	bh=FK5r/eruOjqTcJeKWxc+VkGWRoHylO78FiANFJ2/F5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctnHHpJp0+MwirCjbSCpnfajJPVZP5ESUm22fIgq4qfbP+m1z8j0IxO7doGFEdn47aFfP4T05bBUfSB23/wQF0yPwFdOokQ/4/x6zzH0dOOWtlVcrVskFcSubsj3dGPEKG4yzMKTzzNmGlgzVeHsCL408xnrXWs+6W2m1EVDIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kvz6IhCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82910C4CEF7;
	Wed, 14 Jan 2026 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768406534;
	bh=FK5r/eruOjqTcJeKWxc+VkGWRoHylO78FiANFJ2/F5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kvz6IhCI/iKQ3aCzByh5yu4QJqn51REAWz93ozl52tF0groNrJ06igRODbT5OcCZM
	 S7M2sVx0GGwalTEAPv3f/DPA2tYT11i3xttdW02U2VVkuMhWJY6i5uW7/Jlzsb95AS
	 hXwS1nQKqhV4rC4vmtNCWGwWJJ8CWh1m/a0XXeU+XwH6wRXnn/q0e0xvu6LjDmWl1Z
	 DtHcIncf8zcAjNjQHFZshD2NM5akoR4+kz3Zx7c17DNag3B7R5O2VgCpBvBSUD7sBs
	 l0rtFwe5ojkJblG20x8Y6AWB6jnRl73qb8/UDn9cY7KhbIlN6weIXH0CuKZ9L5Xjw6
	 o2N+1EnjEeq+Q==
Date: Wed, 14 Jan 2026 16:02:07 +0000
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
Message-ID: <b9df01e9-c4ba-4e2c-b458-bc93663ab78e@sirena.org.uk>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
 <20260113112244.GE1902656@google.com>
 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
 <20260114155011.GC2842980@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sP0C4lxuJbobslsN"
Content-Disposition: inline
In-Reply-To: <20260114155011.GC2842980@google.com>
X-Cookie: Absence makes the heart grow frantic.


--sP0C4lxuJbobslsN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 03:50:11PM +0000, Lee Jones wrote:
> On Tue, 13 Jan 2026, Mark Brown wrote:

> > Given that the bulk of the series is regulator changes I'd been
> > expecting to take it?

> I have no issues with that, providing you offer a succinct immutable
> branch containing just this set for me to pull from.

> Failing that, I have the machinery in place to offer you the same.

Yeah, given what Andr=E9 said about dependencies if you could apply the
MFD commits and send a PR that'd be great.

--sP0C4lxuJbobslsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlnvf4ACgkQJNaLcl1U
h9Cp1gf+OZ6fMIplgRtBgwqPYPb5uS6hZEcun26WBH76uuVBF7Cr+M7qHAuKj0I9
YKrrf/wm3fEA51yXKdniN6DnwYFx7yockoUuIMOK+ounuw1gJ3L0FZyXe2EpiiFy
4symRoAStI8qV49Ex9UOc0E7LRRQTr85fmAJ0FmWNG5xE7QR2mv4vxzPQcWFeeCW
fOw9Iya57+RAt85lSj5tUdU9oV9ENBBz6daMm8yykGFOKRas4ahqRJ/uF0PheSfH
JdzhtPnHVmsPh1Axb49xvRb61ZHRFef5o6qFl2wfp8odiurZ0Hng32TFNLzGIi0i
Y2sFv6GmSGj4KqGX2PHPRffLa1jGuw==
=sBc4
-----END PGP SIGNATURE-----

--sP0C4lxuJbobslsN--

