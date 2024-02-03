Return-Path: <linux-gpio+bounces-2908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8A8487E8
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Feb 2024 18:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A187B21C87
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Feb 2024 17:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9965FB95;
	Sat,  3 Feb 2024 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T31wnoaO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294D65FB8F;
	Sat,  3 Feb 2024 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706981447; cv=none; b=G5GpH1x05RwVk0pDn0iIRF5cmIrue3jsNPiQofk7dRB2IzNOzTUBo9UnyltReRZELjPx+epDyeEbvWDPrFKS2M7u0xjShpEjP+JiaAmc9nSzTqSXGLcI1PqTDa+Ti0a2I71JlAkBb1u9GTHaEu2zm9jlTk+fd4Wr6yKz+7yLB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706981447; c=relaxed/simple;
	bh=ou+kBgutYSrLBVD6sr6Vyu+60zB00EZ0LjojpJgcob8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JK+P57Z3WMxO5frRJ7Ol8SrlwjiaP5BPywnD3og7zS+kfd0yrRdgstxApYh/lUR3aPbX0Qj/qYGHm8gn2lofvft6GtV9by/zyb42LzWHP0sbnvnXKuYBT2YJELXVDhY75g+BUkPSaX/6JkXKYVeMClt+zCw/ZLBvJqbkdK4fIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T31wnoaO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257B7C433F1;
	Sat,  3 Feb 2024 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706981446;
	bh=ou+kBgutYSrLBVD6sr6Vyu+60zB00EZ0LjojpJgcob8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T31wnoaOSC7cvZW+8uQ6gh4BkLTfvgnH7x1nSIqKl4IMD5hfUJA2zZUAI7X5CO3+3
	 +RGObfb0ihuPflxiPAZZuSqDVDUAXGYcRkML6JhYY8OHe5HMG2PilgvMnkdFjZl1BA
	 HO4Ca8kKKCAR+/ZMYNw5rTiUOo0xEBYVavQbm/EC0peDqvWW01jEDLmhmIQqZAKhAb
	 Peh45szNjkpDw6p43Z74OkZt8B3+qrtVkZGhOWBSTCFmwYljg8ZoJnpuxACuZL+irO
	 PRu1ZG6rdHyKFHA0mWaG+PVc2FA5NslmvQClIBFY7S+PmL9R604KKRm9t5DauW1XG/
	 4C3QpTMdFtRdg==
Date: Sat, 3 Feb 2024 18:30:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779h0
 support
Message-ID: <Zb54QisWCB56LNRD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbsE6o4m/P51t7De"
Content-Disposition: inline
In-Reply-To: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>


--xbsE6o4m/P51t7De
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:16:33PM +0100, Geert Uytterhoeven wrote:
> Document support for GPIO controller blocks in the Renesas R-Car V4M
> (R8A779H0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xbsE6o4m/P51t7De
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+eD8ACgkQFA3kzBSg
KbabfA//aBYKIHPDMV3lQmOQ7L4Ng2QZH9dnIHvFMtDfLQF9+1d7XVatWFDDr1SB
0Zw/4Aw3bcx8MyiQNAo3QQ2vhrue5BhgF/J0O0ifAfobWvew+9kSIR6bnW9BDVzJ
0cnognLilExPiNt7Q3/fKDFxgBsqSgODaxlXggqKCf3UwYqea2bPMEtqL6q0jr+J
9ag4x4lmCqEfhV14nS1tXB7owxa4EWbiCJauT9+5DM9iN0xGS+5YhIxO8B1fbLa1
QUuSXW6Jdb3W1fxW8FFV1Ph1ULYMYPfirmzAtdu9wZ8Xoz+nHzrefmNiQkYDjg6L
5kJ7P5VjfH3q/BhZkBc6SeCje1oFMARKVMxlbZvEhAN1MTdrsSlW/fyyxJnDXh8W
7GgijpCjKw1m7P+PllOZXY/jJiIqlgp6jgpoYIDzbtWV6XvoWpq+Wg/Ytkhk3OTY
evCO08orUFUU2sRaMFH9MIok1dxRl6/zp0PnMM4SAcrtfOXe3BZRlSzmfkzdl7Eo
j0E8yfLAvcktS+Jbgv2hMD+MZjGK3eSrE5dZ40QiYMuerxy1YuSFw7toSkw/THzD
fSx2mCF/6zwWh96+7Cdepe3tPeIsDDuo9Vv7PlMs2r++cEvMxVHxeou7qGYwOlym
UV6ieEF0a/2+w3NiuOPsdPSAjHuEh1SqWyY9cM6oUAmt0jp01Bg=
=eC81
-----END PGP SIGNATURE-----

--xbsE6o4m/P51t7De--

