Return-Path: <linux-gpio+bounces-23922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D13B171DA
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 15:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31D2D583F45
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 13:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B502BE65B;
	Thu, 31 Jul 2025 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAZydeyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883FDA94A;
	Thu, 31 Jul 2025 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753967909; cv=none; b=L5sLr69TLqbjfDVHpGoPQQHTn6A5ZJ5gzx4/LbR+uPpjKLd9NGJVFC9JR9NgDb8h36h0aKA+SIRZbgt75OXbgNrdzvfbGDhY8b0Gp3fwtCKdbMzIkS9+Mvkz7pV3UrOTM6P8YmnDYeCXTtywjT92jDWHGsQ5q/rVPtNZd5NRBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753967909; c=relaxed/simple;
	bh=P9nn/jMwr1m9nGwweKXqIMHsZ31lkdI/FpSSZFBBJl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz+iYzsWH/9VMfZ3EMNjyaUu9dS16Xq3UZEfHy1mYTcoT9aZ2FI7nnuvfzdEL0f5mEWDBLXxPgweaKpCdlWyATJknzXSOSNHaYjj5yzDsbalQOCCH817Am6z2xbYCoBTFPMf3q9afu+f5pUsE3ThBQRy0Bs+OL0e9EuUCuNDco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAZydeyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D582C4CEEF;
	Thu, 31 Jul 2025 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753967909;
	bh=P9nn/jMwr1m9nGwweKXqIMHsZ31lkdI/FpSSZFBBJl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAZydeyJ0AEoDy0Nl9cgGOqihOaWg/O8h2lvu09HVo9Acw+/trxsBU6GuCkpM4Jra
	 ptYB5iJTc4bMLkis7vdCOtNsowyEF8ku1wqNvYHZSF4By+tCqsS8ZA8Vd24rSH9HBh
	 XlaSKMMRTtyZaGL8jSc3PvXaZ8YkSthqUQDm8yaGGNGiz7BB5Kzy0s+uAUvC88//lo
	 wefZsDTfTi9XdsKw/wMRJy47Q2tVnktZI+Tg3vtxc+Hdl6wtS8Lefkp75nLu4Qqdre
	 uxk4mzDK48LXn/6mQTZ7fRHXTuCRL1X77rF2jbtCF6Jt8HQmmhOSk5g6IEtZHruVff
	 GDtdQbqnvKitw==
Date: Thu, 31 Jul 2025 14:18:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4N7Hgo9XZnVXYWfV"
Content-Disposition: inline
In-Reply-To: <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
X-Cookie: Gloffing is a state of mine.


--4N7Hgo9XZnVXYWfV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 31, 2025 at 01:43:14PM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 31, 2025 at 01:31:32PM +0100, Mark Brown wrote:

> > Yes, your analysis is right here - it's not come up before because it's
> > very rare to chain regmap-irq chips.

> Yep, I just changed all the "d" variables in regmap-irq to "ricd"
> (first letter of the each word of the struct name), and lockdep
> confirms that it's the mutex.

> I'm not familiar enough with lockdep to know how to fix this, so what's
> the solution here?

I *think* mutex_lock_nested() is what we're looking for here, with the
depth information from the irq_desc but I'm also not super familiar with
this stuff.

--4N7Hgo9XZnVXYWfV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiLbR8ACgkQJNaLcl1U
h9CZIgf/VCKbx2IqEZ4RivwWxNiTjzhCYz6rQarqp3v29lwY+IjOPnJBc3Xn6e5x
ltpBBzFwuthE2SPMMd5z/VVRbu7CRqIUMCs/wx9fed1QwBLnXO1RHxjg+o+e4vHc
TRDtyFGigtDOBLst+70fv0UJMXnjTp53eYmh8aIGD7Kyp3r7TNrSDNZijwT3OOLh
1TQPZoejRaVEy77re3IRMDx+47dV3agiCIQFmIfNjaskKrueFFTnoVxTb2qHiSj1
wwK4pbypDahQHOuNs5rLIDMHGf5em39LJ16FfqoOFEYc0gu7RQm6LAcS1MpdeEli
fkyXwVVi2ZlWvRTC70DJpOjkWVwDKg==
=QZl/
-----END PGP SIGNATURE-----

--4N7Hgo9XZnVXYWfV--

