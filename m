Return-Path: <linux-gpio+bounces-11980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B136D9AECAB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 18:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E36211C23301
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 16:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C141F76C8;
	Thu, 24 Oct 2024 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOQJ699J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C11EC008;
	Thu, 24 Oct 2024 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788767; cv=none; b=Am+8d3V33flrrzd368AJU1jYDsjXyWs0DE0zamk+0Lb2n60O0alcssis4SSRAHBjx7X0TRRJltUWsDPnadr3IRouEfveLAinT1vi2x0MXbDKQpdaV514uryA8YbfHOixxQ+XThrfkkVGFiMUhCNrN3opSkCISjeDMTSfqKzZeBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788767; c=relaxed/simple;
	bh=wS//y12rOW2SLPWvXkahYiYgqOO1mUtWPUOhvGFx7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrI6o4jM+PTY3dsQwkiw9JCl3poMUj+A4TfRndnxuGFBjrRXZarqHVzmyzeqTbQzaO+FBmWsMX+IfoQQYmbj3HXkqMMpGUABAXs+E4XOW+sxu4cDZSJ3WT8xDUv+Vqo20+0HxF51Fp47fb9sxz2RmyDDDBT1ZdK1o4NqTqeY2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOQJ699J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F091C4CEE5;
	Thu, 24 Oct 2024 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729788767;
	bh=wS//y12rOW2SLPWvXkahYiYgqOO1mUtWPUOhvGFx7X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOQJ699JJZyUSMcSkn1IRY1pieHRcD6vyrR/KfxL8ws1KXy1yYJ6FWFh7hed/GR/z
	 IavOBzv7wlZAIzeuhDYQd355Cj/wvNSW30ycVEesMKMt8H/I8+ROD/Thh6X7hA3q4I
	 oMbAem4A39izANS6/mLQ+usNvePTlkHmHtNuxPe2nvvPhf8yTLEQJAvfoavXXaeOut
	 4Dn7tBC9mEQqRLignzvpRKeX12EDlcJ4Mfa99jU8Y4pYSmq8ypZ9Iup+TqW3AR3qmi
	 v6jAC7r5N/8vHYvEKJ/xPkY4/pbEq7MmQw2aDQ40D7QMH9QXQaCQYfnGgQ75nEJu77
	 a/52hSUMjWJrw==
Date: Thu, 24 Oct 2024 17:52:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Klara Modin <klarasmodin@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: fix a NULL-pointer dereference when setting
 direction
Message-ID: <a754a5b5-de5b-4e51-ad79-cb03484e942a@sirena.org.uk>
References: <20241024133834.47395-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3IQV/WnRoFZB5Jc"
Content-Disposition: inline
In-Reply-To: <20241024133834.47395-1-brgl@bgdev.pl>
X-Cookie: Real programs don't eat cache.


--u3IQV/WnRoFZB5Jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 03:38:34PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> For optional GPIOs we may pass NULL to gpiod_direction_(input|output)().
> With the call to the notifier chain added by commit 07c61d4da43f
> ("gpiolib: notify user-space about in-kernel line state changes") we
> will now dereference a NULL pointer in this case. The reason for that is
> the fact that the expansion of the VALIDATE_DESC() macro (which returns
> 0 for NULL descriptors) was moved into the nonotify variants of the
> direction setters.

I didn't test all the boards but this does get several of them working
so

Tested-by: Mark Brown <broonie@kernel.org>

--u3IQV/WnRoFZB5Jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcae1kACgkQJNaLcl1U
h9CNBwf+MIXPehij+Z+gexW9IizvLaOtnqFviC/pxtGFjdyQiO1vgovqgQNDtBjK
D/HHDu1sjEXbFxfa8xm9cHs7FumaCZvGHMWje+vWYKeL1jlaTotvJKkH+MeojkrX
YumGlSQlQnGYvlDmTyXzpfFCHcffSebukG7ILKfCXDRaAHSkrWFgIXzpUjREAzvE
n7FOckHex2nid49ONlFlAVHTJHCdow33iVT4+qwmBndzrV+pAOR0xspEgFav1GbC
aD0f3okhDKahlcZZIYZOZo4Ence0tCQN/xKjuM7nfphO2SnlUlDOUfGz4HOuH0e3
7AXxezlvdemhyi0rpZFo06XSqtCLAA==
=1Zi+
-----END PGP SIGNATURE-----

--u3IQV/WnRoFZB5Jc--

