Return-Path: <linux-gpio+bounces-18373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98BA7E066
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 16:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E237D7A36A4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398B61C6FEE;
	Mon,  7 Apr 2025 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcPeqhDs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4AB1C5F3B;
	Mon,  7 Apr 2025 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034657; cv=none; b=i6M1kubZrcqsfxgrHailH6h7c11uvuVt1qSR9F/8SebiE3PRbTH9HHaDtVLsItQ8B/FOU05moQxJX3OXg/SxgWhGK/HLatroOXbwdzc1ixOgERbV91swrTtqt5je1lwFL+Js/GDCki39kAxAzlPjJPDo5/0oUeLlaPsWNRlsunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034657; c=relaxed/simple;
	bh=eu9yIb4RmWPgMf4roDTJFRVXE2Pe29ncgeymr6g9Q+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYLY+JB7Lg+YgA7qUO38nToFh7+cGOjJ6vPqYVz1KvwaPYfK65rsoBnBdAGhk0GwGGCfgP7ZjMtw2z+JWZZYAY1zY+oYL3Ean47DHaIIHnTRP518MI0Z+EOt7EHR1do+9sAAbwbxsZIwi6B2u2J/4/KQFjcxNWsibn136qgKqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcPeqhDs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11C9C4CEDD;
	Mon,  7 Apr 2025 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034654;
	bh=eu9yIb4RmWPgMf4roDTJFRVXE2Pe29ncgeymr6g9Q+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcPeqhDsRiX5NHT54CNFkCyBFs4hABcDXaFHFXilrrNlXkh+v0QOTFjsHcXPQvoAe
	 ain2isDCT1W8SnRKBSnzUWPesNhDe1PnmyacIKopKPeY63uCF+dkwIHhVpJO7Ql0n3
	 B5drnE1dD73P6TCUZGRZyYoM8dWQxqh39nc9Ydpp7c18RjnQOx8rGP3h82vtsOv6pG
	 N2eXp/bxkgyFDe4eF/SQRhGz8JQ4Nq4sPL6en7Ie59FS2q+fF+c48MQl98rOoz1k+w
	 QXBc30jnW5yE3EQa8A4nDbQlxujfTT1/u8eeN+N9w1+sG37DfpCmBEzPu0z7qnb1vL
	 D/F3gBNzjb6aA==
Date: Mon, 7 Apr 2025 15:04:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/2] gpio: don't compare raw GPIO descriptor pointers
 directly
Message-ID: <87414af1-a8e4-40f0-ac31-6d760bc00e70@sirena.org.uk>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5tkIU590IsaVVqL"
Content-Disposition: inline
In-Reply-To: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
X-Cookie: Meester, do you vant to buy a duck?


--z5tkIU590IsaVVqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2025 at 09:08:13AM +0200, Bartosz Golaszewski wrote:

> For merging: I suggest to take patch 1/2 through the GPIO tree and
> provide an immutable tag for the regulator tree.

Sounds good to me.

--z5tkIU590IsaVVqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfz21kACgkQJNaLcl1U
h9A05ggAhLmbt4hVjIxnadb4oHEl2bLdKjVENwoNnaRlYzrl9hk07Te5LBwSUyPP
oR4bdXl5Zk8L2eDy9y0O3jbEAf/29hSnQP/kcfHT0VNFV6SFh4jQwFMVauKPM0ti
kVaeb850H4m+eY+KGV0+0Kt64f92CzF5OhN9w79N+VBgjWDkgZIxTREtNDm6Me/e
fCLdmM/B0Bzgn423CvKk/427alPir2MAbbReO9vPC/qVfx0Qf002FyqWfLOpBGZw
0Aa8NvZTXdKiR9RM6bbxLnFSIilX+OjUvEHA8+inv7GkWxBtf08vVjAZhREy62sq
MR6VsR8bqWX/ycyOo2U2be1zs/GDPg==
=4+r9
-----END PGP SIGNATURE-----

--z5tkIU590IsaVVqL--

