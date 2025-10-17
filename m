Return-Path: <linux-gpio+bounces-27259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF00BEB139
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 19:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B58F4F6449
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 17:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16E4306D52;
	Fri, 17 Oct 2025 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzLT64v5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607EA2F0C75;
	Fri, 17 Oct 2025 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722345; cv=none; b=dx8ey18a2Pb7KrDb4FozBAegjf0BYabTktikwfUHJfdnnI8xBHMb4OWZFCKVrmuRNZS2kX4NBZuqwcRaxhB/2by8T6CYyERbwwwQD5IvGRdagaCPltRDx3WYvsFQ0UYavVcyY01/LDrotIZEq0d3OqorqrDKL+E9ZxGPTK0ImWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722345; c=relaxed/simple;
	bh=mK3Fl2Pn6OcWYGOVgkej8ydEl/IKicHd6XlHsQq/EbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1739g6pMibdG3WCsXSyV6r5K+ENaPdxgE45nRslsGkfTcm8nT68JhxZoqgGby0l/+7dqci/JWmHH262ElcZ5rTm270tCEXSdmjTmD0ZX9kQClPn9P+cJAVPaiYG1EdZKZAWs2b/CrMF0Jx23EP3vPE7wA62sqS8a2xctO9lNDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzLT64v5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76ECFC4CEE7;
	Fri, 17 Oct 2025 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760722345;
	bh=mK3Fl2Pn6OcWYGOVgkej8ydEl/IKicHd6XlHsQq/EbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzLT64v5SSaSKewtscDNrZX0ED39JvTzLpjo/a779mwwFtcGjlfBn3DMgLvNFtAxZ
	 lDVbIMDtirzCw/oAHZnzeFlu9RVbJxJLhbhWN/RjVRw4huh8Gm9sKACSVA1lhTu6hO
	 7wQsD9UCXR1ATe4KJKkNG+8GWwkpLMyf6PFyP6+pohzQ4LiCP1ClR0918LJzTjXZwW
	 yeo/PG9b1GAT1n57PrHQAPuJoJwj7FBGtzdZnL9MxQef7ZoLStWWyuaPaND8hWfJVe
	 qv4LqXoWJGOXv53r4YpzmZ2rIxaVyBkFejAvaZV+dCPzLmUlfpj17UD3sm5BRzU0ab
	 gUNbSCPx+az0g==
Date: Fri, 17 Oct 2025 18:32:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KbGHBWGA+KCN6s9I"
Content-Disposition: inline
In-Reply-To: <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
X-Cookie: Androphobia:


--KbGHBWGA+KCN6s9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 17, 2025 at 07:26:51PM +0200, Bartosz Golaszewski wrote:

> Upon a closer inspection it turns out that this is not the case - the
> ENABLE/DISABLE events are emitted when the *logical* regulator is
> enabled/disabled even if this does not involve a change in the state
> of the shared pin.

It really should be the actual physical state change that triggers the
event.

--KbGHBWGA+KCN6s9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjyfaEACgkQJNaLcl1U
h9BErQf/Z/sKUhSw6MAZ93yfrnBWym2QF5z8oMpsH7JQGCNPCw9xhi9ONVG3iIWO
VmtCGqQumniEy8IL0mHp6No11tieFxS7lSjEg6IoAE1eoFvyPpGMBQ8cNDnuvV5E
BYwaq8DfHvb6vzVp1eP9DJflPAX3sUePRz+Yg/mIS9yzcF/yUOzDD6JJUC6pMwfB
K4idkg8y39S6TfnUi2k2btUj1xBzuYDn4/ep/Au7y0NiBrnkliUaxUU7MfF6MfJU
6zM9mTj4Gbu4R5tb5b+6Q3CgPMMm9Kdjzi/oePlu1LQuCsctb0bBKrq5gn91h8q0
ScTJfYoYMevt5u1QE0G5oL3mQAinUQ==
=o7y1
-----END PGP SIGNATURE-----

--KbGHBWGA+KCN6s9I--

