Return-Path: <linux-gpio+bounces-30285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A267D04811
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 17:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE0A530CE37D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 16:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20CF2D131D;
	Thu,  8 Jan 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3vV5PsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48EA2C21DD;
	Thu,  8 Jan 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767889752; cv=none; b=nHatOycQ4tf6nafjZ6snL7wY6waIkDRcdiQspZnl1vftBigulMGhIFjHybsSqNDurB/6NrfN4Aiq1Rhot9aOCYKxyN/nWp1LmCF6YsM5JTqDg+39STP9wE3nZ0TvI2AajTuvzigAl6PH+9FzBHCyTlSCD/hffUZA/kkg2/A708k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767889752; c=relaxed/simple;
	bh=Gw9MnRxGkkH2YhOUz+Q+RuFmq9rZ69r1dEa0EHC1LaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgX+ExpI9ULnVHlmzSkOzU2szBRqCTprD0GJtWsbZ4pZl3nZrXadSy9/ygrAsT0MJIlDi5mXdWX8fGg4MVEvZd7pfsyqpJJAO4zfO78s0VKKxmY1fk/90EklNbI7xjLUaMKWSszNCsc1m9O9OYn68DlmAfaHR6wdPer3BO/iZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3vV5PsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA6FC116C6;
	Thu,  8 Jan 2026 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767889752;
	bh=Gw9MnRxGkkH2YhOUz+Q+RuFmq9rZ69r1dEa0EHC1LaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3vV5PsBmA+WfGq//P19Ufx3QlunelJqYVKo4WSbWLci5XOt/GUuhZCLeloXgjOG1
	 Sl6wYHHi1zO+lzKIzmTWBp6gSpQF4zJQWHk51ADHfpbpOrN4usbyHIInuwWWA2iQge
	 AzBTP5KDbVYi+b10h4yx7J9kK9O+FEEyRW/jg8hchLRXzabXJEkynESMNKvNUMuf3q
	 RbMRhnJLT+dxw9DHTNP8J/gPrx7FHnPmvapJWONS92dOmoYdU3Xte8neOa4fDCjVbn
	 Th3G8Ulo2Xx3E/T41sgKEwLsxZR98OeMpWVwXE1FnZuFwyM2zy9olgPXIDtH9Tmjnj
	 l3x2S30OqiajQ==
Date: Thu, 8 Jan 2026 16:29:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin
 between reset-gpio and gpiolib
Message-ID: <c0ded9d3-b9b9-464c-81c0-63e0ebdc0194@sirena.org.uk>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
 <0bce9429-1cff-4a62-bdae-57697daf2920@sirena.org.uk>
 <CAMRc=MeUBhDqQWKqSbRP+bpBcc0Xptdgdj9CMfOzJmgqARJMDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4fPvwJX/XesizxfC"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeUBhDqQWKqSbRP+bpBcc0Xptdgdj9CMfOzJmgqARJMDQ@mail.gmail.com>
X-Cookie: If you suspect a man, don't employ him.


--4fPvwJX/XesizxfC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2026 at 04:52:24PM +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 4:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > We're seeing futher issues which bisect to this patch in today's
> > next/pending-fixes on db845c:

> Does the following fix it by any chance?

> https://lore.kernel.org/all/20260108102314.18816-1-bartosz.golaszewski@os=
s.qualcomm.com

Seems to, yes thanks.

--4fPvwJX/XesizxfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlf208ACgkQJNaLcl1U
h9CwhQf+O/S1E0OCJZdF5/yblncyi5gdiRMaXUFiE6p/HMFinobLWALDCUk6TyJv
2rQwQ/r2cVYXUw6BW2/+ZSYoWjLiNbCfqs/26PLhJohBRKdcWunRHjzpHTgj7Nrm
B4hBLmRL7ZQKdjJKFJqMiJ5SNIq2ZeJKUlkdb4uHsmGXZv7uRq3PzFaF56+TS7fh
gF1f6miA+jxZcxjeIscKrQfecBxOQu1++JdTz1SXKdCHg3QCTZNQ5heoIgBEUa/U
xvnu6dEeRHBzw7rmpNzu+i1cBM9eH7W2b2wYT9UbAbVmHdJSaY8xHg7G0Le0J1UN
xYxSy/uuQIDPzbP2gS7hCvwSHmburA==
=/7So
-----END PGP SIGNATURE-----

--4fPvwJX/XesizxfC--

