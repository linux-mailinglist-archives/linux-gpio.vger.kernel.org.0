Return-Path: <linux-gpio+bounces-29533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E10CBB97A
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 11:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6BFF3004CF4
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 10:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B8929B229;
	Sun, 14 Dec 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqTS3k6Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EE4221726;
	Sun, 14 Dec 2025 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765708469; cv=none; b=LTxn3TZaE5K5dnozOTDRzOxy8Z+DPSEGnlyvzaFzL1neLb2ALXmoIlAsnrPYUFWPXT/U+PsvC5MeVPOIOUO8b4OFJuoI8COzS+dQnbK4H78PduKg8GHsCL6Fmw7k0iKrxc2B40rUa6c/VvbYT6M9aEBqnkV7Iyl0iXPD3rC84rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765708469; c=relaxed/simple;
	bh=i4ofKMSBk8Wgqhh1BdCxHfMYilkWDKmIFT+x47M+gjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEktfjM0jULD5eHLT91FaZzw3lkBJHorP04mDEP/BFL+d4BVYl1PexrZAl3/PykZj9GPqtnzsn5mk+7WXhqzALE7r1tIS6a17868mK135dF1d6p8BEpjL6RL59NyjxBXZ2VVT49MyeYBw6hc9HFGwkJcyJpAjYTMgQqgm44l8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqTS3k6Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B2DC4CEF5;
	Sun, 14 Dec 2025 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765708468;
	bh=i4ofKMSBk8Wgqhh1BdCxHfMYilkWDKmIFT+x47M+gjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqTS3k6YR/sogV8ka6V0v2B7Fx3hMH6A8fkO+cb+ve8o9IVQF2Mv1UtLV7Ca2EhmC
	 HJZvqgwqFMgK6xPuHsasPpgLbo6162/BJez1eFJisSdXjX8IfvE8dhEOGyeyYiWzfB
	 v9DUvg3SLxQXbqg6MqdEZDur4T8gzKXPg23XHmnPAE9P7TQvOGMsnEQuzGXK78Zcwg
	 nUR1rHufD/NEBQJKppwc8RDF7pPnk5Dbu/QQFwbeEbnNg+EfYuiVMItkkHVKYrN5Mq
	 Z9XL1d8GA0WhfaBnZdAQFc1oAWOqdB79pDjjmEpUUzvm+db+qbcCjRnpONxbLkZpbh
	 1rFpkHKUuFMAQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E38171AC5685; Sun, 14 Dec 2025 19:34:24 +0900 (JST)
Date: Sun, 14 Dec 2025 19:34:24 +0900
From: Mark Brown <broonie@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 07/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <aT6SsKEGK553Xg5i@sirena.co.uk>
References: <20250822125301.12333-1-darren.ye@mediatek.com>
 <20250822125301.12333-8-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FooSzIoE8/IvdhAD"
Content-Disposition: inline
In-Reply-To: <20250822125301.12333-8-darren.ye@mediatek.com>
X-Cookie: VMS is like a nightmare about RXS-11M.


--FooSzIoE8/IvdhAD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 08:52:36PM +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
>=20
> Add mt8196 platform driver.

This doesn't apply against current code, please check and resend.

--FooSzIoE8/IvdhAD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk+krAACgkQJNaLcl1U
h9CA1wf+K9nyWibGgTGxTOYC3pIeLvcG/zmQiJ95Dop5yRay8Sty6uHAiqafCSdT
tYhHyCNHAHXsyanb2fmXZHM2pTyUbcTuYuQAnl8ysbI4LsG+8/KL9c9T36ZmOSlc
ZQeLXHScoEoE9B+AfBwUa44h0djTkl/iwqiyAOeub+JRxFA9o+RSmdQ+WB86DEqS
Ve9yvm0dTxiGDvEY1dm7Y1Y+qIuTRhZzgxmUVvueOLx87/+tb7LtOrdzNvgMpL9E
QUqVSNc2aqUQQkoyprTPcE+jC6I35TD2R5nubOG452PXbMsoPaevD1a4ZiHQUGkM
1azxMKqxp/eHe9IP1kvlU+933sT9gQ==
=K4Vp
-----END PGP SIGNATURE-----

--FooSzIoE8/IvdhAD--

