Return-Path: <linux-gpio+bounces-13754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F229ECD21
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 14:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A812718868A6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 13:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5080722B598;
	Wed, 11 Dec 2024 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ow/qtzLQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2523FD06;
	Wed, 11 Dec 2024 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923550; cv=none; b=mU+TLg7+trMHKQr0fWSOqneJbPzokw/hLsjwx+UqnsErLVYz8LajL0a24a8L5RuBKMiiS/c6WT8iLEIHESKLdG9yq0vhHunUDZ6YVbPb9kDoSpaVDEtAhE145dPdARMIpTbLpY69Dcji0lF7+8rWXeNnSg9FNHRLZpy59zWieJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923550; c=relaxed/simple;
	bh=8jyEiPx2XgjKHn81uoDheb1vwz2easQKgcFU/SqHuU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL23tsu2DfeKibXvB2iKYBV0lSDJikArzhUoXTrS+60DazqTbqu8y1hSHiEFYQTar6lmOcVbw/tLm1Rkn7MN3D6xnjMGF84wnsqksC90DBhPGeJqo56oVLXU1yv0xjkpC/IOF/araGwcDxMyc4rbh0YNVR+WpQ3q+6zq3HhNjwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ow/qtzLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD91C4CED2;
	Wed, 11 Dec 2024 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733923549;
	bh=8jyEiPx2XgjKHn81uoDheb1vwz2easQKgcFU/SqHuU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ow/qtzLQFm5l9O+TFeF8+Zlm0mI2x18auLMcnkodVh1b7aW6xDajDKyWAKHwlTVyw
	 7sA7egQ2Z94m9iZyRiLwql7gfz8jGw/wmammusegaYIpeJ2rfFGEB+/He01WXlvYD+
	 AIPyVpjiFhpcowdCwqjKWDHgSoLiZwk5tvnYVWRbJcpVQIgjF5loE43nbuaLXPO6xR
	 pHdnBdyvLbgpfkgyDftk7bdoNNq7cOKbkf806qoasQTLWgkKc4dijbUUgGFTRFZF+d
	 JKX0xCS0DcGfh+wr1SiWRla5XmnsRQYq1jiS5ZrYgP/lWkWpZvzkJcMYu1rgsthgRi
	 6vGJENM2YWdhQ==
Date: Wed, 11 Dec 2024 13:25:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Song Chen <chensong_2000@189.cn>
Cc: krzk@kernel.org, lgirdwood@gmail.com, lee@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
Message-ID: <8ecd5325-f347-4869-9049-2731b719f5d2@sirena.org.uk>
References: <20241211051019.176131-1-chensong_2000@189.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x23V6mMyBfeeNdU5"
Content-Disposition: inline
In-Reply-To: <20241211051019.176131-1-chensong_2000@189.cn>
X-Cookie: Every path has its puddle.


--x23V6mMyBfeeNdU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 01:10:19PM +0800, Song Chen wrote:
> This converts s5m8767 regulator driver to use GPIO descriptors.
>=20
> ---
> v1 - v2:
> 1, reedit commit message.
> 2, remove development code.
> 3, print error msg in dev_err_probe.
> 4, doesn't set gpiod directions until successfully requesting
>    all gpiods. It's pretty much equivalent with original code.
>=20
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---

Your signoff needs to be before the ---, and the changelog after the
---.  The tools will get very confused and remove your signoff here.

--x23V6mMyBfeeNdU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZktgACgkQJNaLcl1U
h9CpeQf+KrcJKSJOMXnfO3IPgQISl9QlxNWu4k3eOOqxEe0amoy7O37YkvXfRW9Q
oA52J1TAjdA5NpPVTiFC0FRYfQeD22cYE4IMWrc2UgmKeWBoxWNQwWGqxnKx1Vi+
a8E5H/vnQ0S3pjjTX80sE/8tqug3Yg0HS/lTMjP4B90VsUlp6HMkbbeaW2JR7Jiu
xz2bfGU/4tC2NvzDBrLlTikzmDfBTD1m/k8uLMSe4ZTJd2aGxsEohWsJXGW32/yd
/DDo9nUva5a58Vzxa+5RrKZDE18Fyr1b+LsqzTvT46zNlTsM4tNy3H2BV2ia4fKG
K7SCmuZreZ2jH080IHmoIiZ5D8U3Og==
=7ltg
-----END PGP SIGNATURE-----

--x23V6mMyBfeeNdU5--

