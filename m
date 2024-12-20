Return-Path: <linux-gpio+bounces-14083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28219F93CD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 14:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A3E1633A2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2B1215703;
	Fri, 20 Dec 2024 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdagBno1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDF7CA4E;
	Fri, 20 Dec 2024 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734703049; cv=none; b=L0bS4OvGhTWgkDSK7zCSKI0/lXdSjJyLXOisFUM1rJxiZcNwed98Whw1Scyn/v66ujXzO04iBPhLIXGv8DPbROHW00+WOXHTneNI3+CZ1eN/YReQGMWVoLYth13vOtvNfF2DDQ10xpagjLGv4HK1a3bK1uQLcoD9VpjbUNJu0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734703049; c=relaxed/simple;
	bh=EJpXa3nx9DvueX3NwULiz5yDhd6/NS6jn7osZlKxKV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfwos1ZjNSUQWYKihrvRwFqxntxa2BUNcWOubwbOjxYfBchviAUCdwVRU+4z5S3WoD5yo0kWws7GcX2oyljqmf7S12IWfa7BS9r84pvE+yC9yqVTHt/GJtfsoPOEj4pkQEVy/9XF2rnjJj2g8Z2n0PB+bhInFHqiK47jnFen2ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdagBno1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20467C4CED7;
	Fri, 20 Dec 2024 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734703048;
	bh=EJpXa3nx9DvueX3NwULiz5yDhd6/NS6jn7osZlKxKV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdagBno1yhnGQQIxFWaQ337T0odP0fdULftIdPc4dc8DqSbo/uNpkGia03rhjJc8B
	 LpyiR7eFmwcpuwxwGbGmrUtueeHCaXWdPStS7UG5Gtj3JLJ/cJtSQ3ioxIC/tYcxnA
	 9Q1VkkisBOU1Gt1QU7ipsSo3jbWEgmAcxkuGLW3R8jHz9B1JQyv1UPTsd4blVQT18H
	 SX8ZRYaQDmRrrbwpEbOu+WcKaFpgZyr1dp7rP5WkuwijRTcGWt6NjhwBpTjLYYc/pq
	 RJmziszh5bM6et1reIp0nnUlVb/PnaevVgrFLEVp4NS58HwOddVCuR/gh464MYEc6K
	 IiS6zmdwlO9dw==
Date: Fri, 20 Dec 2024 13:57:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits()
 helper
Message-ID: <4ea6c6b1-fe2d-445d-8e8a-b00c3c2584ad@sirena.org.uk>
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
 <a7b98f12da735f735b33200f6324360fc380e6d0.1733739697.git.matthias.schiffer@ew.tq-group.com>
 <CACRpkdbRdT1=30DNyn_=7rfqsnppfbdBr5QXCfWyM0f+FzLjgw@mail.gmail.com>
 <dc83bbd1cd960f8a5daa7ad687f419609f5e14b9.camel@ew.tq-group.com>
 <CACRpkdar+8qS6r30WwCJBjVuqc16xnruVQa3y1m1rKAnJbcN7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J+VVPeqiqOVkO5mp"
Content-Disposition: inline
In-Reply-To: <CACRpkdar+8qS6r30WwCJBjVuqc16xnruVQa3y1m1rKAnJbcN7Q@mail.gmail.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--J+VVPeqiqOVkO5mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2024 at 02:43:15PM +0100, Linus Walleij wrote:

> I don't see why we can't add
> unsigned in regmap_read_cantfail()
> that always just return the value if this is a common problem for people using
> regmap MMIO specifically? Could perhaps be restricted to mmio.

I can't recall people ever having much problem with just ignoring the
return value if they don't care about it.

> > - I introduced a tqmx86_gpio_clrsetbits() wrapper around regmap_update_bits()
> >   (having arguments for set and clear was more convenient than mask and value
> >    in a few places)

> Isn't that what regmap fields are for?
> regmap_field_set_bits()
> regmap_field_clear_bits()

The field API is more for and indirection where bitfields move about,
but there are top level set and clear operations too.

> > - I was still handling locking outside of regmap because we sometimes want to
> >   protect a whole sequence of accesses or other driver state

> So reg_sequence cannot be used in this case? (Other driver state seems
> to imply that.)

Yes, regmap_multi_reg_write() does what it says on the tin.

--J+VVPeqiqOVkO5mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdld8MACgkQJNaLcl1U
h9CUjAf/UrM5kQjIBPOimpk+4DrY6ExIbXwApo4w6nLW12n49FdTF1tZEKjceody
YnDLSS+s/3SkhS9aFa+BNuMeQckllO1prHDJAZ4aQxuavbSFyIknlXOkebpgQgTC
WPD+y4cSDit4gDFNBGUard81C2J6QhN8NeJkNvAGz3lF6zenWnwvDcknBfka/CTL
KSuz45Xgg5s0JZLCxG0GGy3pIVvMD88AEmcP6DLn0VHKFlx52Ngc9gQi+t5bQZ8L
82TeoLZbwUBthGmlm9Uz+BoeESV1uwbI3KUpDrMGzgmxCPhOxE4MNV9cU+ur0IXL
Dl3LAxxvAHYtWzZblz02bEs+1x4gzw==
=qSp+
-----END PGP SIGNATURE-----

--J+VVPeqiqOVkO5mp--

