Return-Path: <linux-gpio+bounces-30366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EEED0ACF6
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 16:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 632C6307268C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 15:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FE9350A1D;
	Fri,  9 Jan 2026 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHPNztUN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FB320A1F;
	Fri,  9 Jan 2026 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767971292; cv=none; b=jNiclR8J4T467FA6BGxWtueNpyq15fiE+cmOfl3a3KLzZhElq5q+moKWoCTaCHko3V9fy/l+vnG5+GvUXgLffMO+w3aZ+SV0NifaFWJ8EP3wbU/tOmHzpHPQwN5UK9PJTUCp49ue1fdtlqdQUNWNLznEg6GCfqTXnglJKLzE7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767971292; c=relaxed/simple;
	bh=+yYivR6m7de4bVDJo8K4370S1d12YvRa0ve7K/19OdA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=WdMbhCBKSAAkw2sJaI4/DSJqCT8uXcgrtlc+z/n7y8RYOIPL613Ckt1Kq1MC1BSrhL5mvUH85ghMd3g4W63yQLooXo/D0BqTLmxE4VxVAcMApHBCokzktvVNupR/kH5FtfFSdIqAz0cZ7HGyjwFS8IjimkJZCWCKQo7jF8k7bL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHPNztUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2E2C4CEF1;
	Fri,  9 Jan 2026 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767971291;
	bh=+yYivR6m7de4bVDJo8K4370S1d12YvRa0ve7K/19OdA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=rHPNztUNBvwrgM0+tRT43MKzu+mXAx8v7Lt9DNa4Z11mWqsBgqYXFdOwknanHxt8h
	 xbQ+zcfZOdDV9rRQ/PFWBjxLzN0goMyVYNufIck5vIT+c2JDzBmkf+jNrUZ2SD3exR
	 t9xSQpiEvKToocxG/iOHoTui6oawpqrQ2FYY8kpkBjz4HJSn1dQMZWg/uWo2Ynwjv/
	 5eNuHBce79tUeJlVpeV6tda5gFVTIiuKnxXKjsvF1ZOBaC6p2tH6C0otpMhovgdKz8
	 ez547ye1cbQArVuQK+dby5qd0afLjaykn72q5lBEZsWA6RionYN6Y2FOjEEfZBm7RR
	 DvoH40ihTouFw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 16:08:07 +0100
Message-Id: <DFK5IKWIJYLM.2CCXMRAXS0LYI@kernel.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Alexey Klimov" <alexey.klimov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
 <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
 <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
 <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
In-Reply-To: <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>

--409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

>> Not sure this is still valid. Because I've just learned that
>> apparently, the arm64 Image shall be made smaller and thus "need
>> a driver for rootfs" isn't a valid reason for =3Dy anymore.
>>
>
> Is a switch to disable shared GPIO management entirely via Kconfig
> (depending on CONFIG_EXPERT) good enough for you?

I don't really need that (as I'd also need a PMIC driver, which
probably won't be accepted either as =3Dy), maybe other do. Not sure,
up to you.

-michael

--409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWEZ1xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jb6QF/cKSDNHxnvueWH5aVmuyPcce5VtwNVM28
ulztUB/LQdv1McH02EzbRVwRhh0VAP+PAX9TgaecNELyf37cr7SC2SmZQ15ZqBwR
xXpQ0WmkfDXKsuE5DRyyGgZF13/qGopvROE=
=If2G
-----END PGP SIGNATURE-----

--409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b--

