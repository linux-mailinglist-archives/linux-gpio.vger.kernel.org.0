Return-Path: <linux-gpio+bounces-18153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD28A77C08
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 15:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 822837A26FD
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 13:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCE520409B;
	Tue,  1 Apr 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLmvr+7x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7422E339C;
	Tue,  1 Apr 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514035; cv=none; b=RUXaLGunGvd/oVPK4vWzgz6YVybStpX0xhpkdqBlnDGlez+dOBR26ZzhVTwQFa5gQAKo0uM34HsuXuAJCMA5pvR7Ec2LWmjcQXWLn79sSQabvp9V5hNZcdRstIQjr8qsSFgEcTwtoxG4i17yD9ryr6OVDB648HAWasoXeWtKqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514035; c=relaxed/simple;
	bh=GWu0spu6LpDdlY8k97r5kk+JiGQrW/F6sBBB76vqL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNavvKd5lvcI1UL67FsMx5g+mcEG8Sw0IM76R+dl7nFWgpRxQaHYplGxUJm+PTnBoB1h1nLjXHQ0l+0otYkIX0hsDbH5T7RHpVuPAqavVXVZUuWzLPbFA+uGgHNaJGWiIWbJSu4Pu73uaAiUmcRiNmig7rvKhm/4GgqBLnYjqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLmvr+7x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E7FC4CEE4;
	Tue,  1 Apr 2025 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743514034;
	bh=GWu0spu6LpDdlY8k97r5kk+JiGQrW/F6sBBB76vqL1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLmvr+7xnWtly9SfQuuCriljmUmRu8mnzWbhNhoMEIpCFCaodUZrpQ83ws+Fz8Y5C
	 q5RiDU3mjo5g63Y4CCxFJxcXXd/hhtZcYiEGVDmb/lNOayMZhCSKA+Zdr1sdYZumhm
	 bFVg6iAQUAYknTbWXpvMWi4E49wOqCIfq+vbuzkdf0kBdDoUPHyXJ8aEAxzPiu4lL8
	 buLlUVaERruYH7S0RPEqXklI3wg+JJjnT97lWw3yU6K1EF1Z/qZNlz0OaiEhn9Yc0c
	 JXZRS4SOwUkw7Tj+/vFPxiWlhXvXuBiU10PqTNq0d9NcDxYQmVEBjtpniPT3LRMbTI
	 NlSYnG/5J86Xw==
Date: Tue, 1 Apr 2025 14:27:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ToSTNeq8uu1TqEzF"
Content-Disposition: inline
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
X-Cookie: 15% gratuity added for parties over 8.


--ToSTNeq8uu1TqEzF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 01, 2025 at 02:46:41PM +0200, Bartosz Golaszewski wrote:

> Let's deprecate both symbols officially, add them to the MAINTAINERS
> keywords so that it pops up on our radars when used again, add a task to
> track it and I plan to use the power sequencing subsystem to handle the
> cases where non-exclusive access to GPIOs is required.

What exactly is the plan here?  The regulator (and reset) usage seems
like a reasonable one TBH - the real problem is having an API from the
GPIO subsystem to discover sharing, at the minute you can't resolve a
binding enough to find out if there's sharing without actually
requesting the GPIO.

--ToSTNeq8uu1TqEzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfr6a0ACgkQJNaLcl1U
h9BYEAf/f21wWbqQEfbMcxfq7sz2pfCLuhY4ytW02VZdLB5JoW5mDUqCot6Zwbv+
AnSE8UzWXYKZ9bJsykzr6fUQfU1+xWLjvsS45qQhvzrMeLFGaQQgJGyG6LXVRlDW
/SPPq575NZmATsBey2LwM50FIlxwWcLidws+z/6Bv1UrWnabbzqviaD4+lBZR1l7
7eZ75QX3FtCsEm7GO93JiAyRSIaql5r0euWkkll04aPg4TSrTVIzX5E99hVnTjNK
2rtDQQ9Vu+69TL/Bzlv8RN4UanSXX76cMXBIwHBxZgPXoPQGhdc9mdTIYMjNJCeM
+3HFqSDD8dryEnj/MFsdQ/pwvrTPHw==
=GWVY
-----END PGP SIGNATURE-----

--ToSTNeq8uu1TqEzF--

