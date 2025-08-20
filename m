Return-Path: <linux-gpio+bounces-24635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891BB2DF36
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3370D1C85030
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 14:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01983276050;
	Wed, 20 Aug 2025 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ov7P0L6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957126F45A;
	Wed, 20 Aug 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755699707; cv=none; b=no7QXKx/CDoBRkOQhLmDWDms3FWKzDx+c/AM4hudDUoOIeASq8MgRqJ7Pc6MFN2p09E4K2mPmkGrNNLHNJNBP0qVAK6hEWBmaQsu6suOF+O+q82oH2FAoGEN06xJT+aNGUBS0GXn3Q5v4N3c3B2CyyKaBZl2YqYFiwjPMCFpKPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755699707; c=relaxed/simple;
	bh=oqNZJj++AlZ8Ps0cc+9Vt/kMxVfjlJ3sjFH2mz3NPjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVt4TrgbHtoTQb/5qNprLoTms8VHe6+/JtUgqUEX6NTAweswGrhNGeaN+iu4boJhT5xu/ba4tspYEaCPYdtO0dAES5j4YLXCRzPnXDS90uH9du1JZtRbNmV3dC7k7gcofXKyQeSS79Yjl+nK3jvnhSqfxT6wnqTVhlGHhAYMgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ov7P0L6i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904EDC4CEEB;
	Wed, 20 Aug 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699706;
	bh=oqNZJj++AlZ8Ps0cc+9Vt/kMxVfjlJ3sjFH2mz3NPjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ov7P0L6iXmWRO1R7kJepvTyesG5pqkN/+U63hvE3aS06vs/+MuKlOGUSKbiUytdEX
	 1St/UwrhmbGX0wW3k5WkXrBYONCPcPb8cMrq/0AsVTrn1GWopIH+BwKzcECfA94kp1
	 Y3vHSAIguM5zfjUCNu8AsQnOhVt35+lXf0gbS4CxX4JbNxZSAjb5voiJ0+PJ1sbUGO
	 lzqgwG5wURY5QhOynMMyZ4COgYjmwsGZmY8la+DF/OnNzbcU+XXsDaJe3jmXrFae+r
	 h8n4Fc+S+I6IyCUTiX/GUzRMn/nbY4JsCLM5UMZ4zlJ6oEoopeV2P8EUjBxpejyKJl
	 tJjudSu++++4Q==
Date: Wed, 20 Aug 2025 15:21:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
Message-ID: <d02d2a5f-b8d7-4fdb-b3c5-6e6d21127733@sirena.org.uk>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nGxggd7EixyA+X3k"
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
X-Cookie: Semper Fi, dude.


--nGxggd7EixyA+X3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:44:51PM +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation =
warnings for MediaTek platforms, with a focus on MT8183. It follows the ini=
tial cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780=
177.html)
>=20
> The patches in this set eliminate several of the remaining warnings by im=
proving or converting DT bindings to YAML, adding missing properties, and u=
pdating device tree files accordingly.

What's the story with interdepenencies between the patches in this
series?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--nGxggd7EixyA+X3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmil2fIACgkQJNaLcl1U
h9AT6Qf+O4+Z7uHUog/4pJNkvJdaQakvVyleGl1rZZhFeiygjeRj7kGarSjQtJjP
/qh5Is7DkgUy+DiROexGk5Z+t9r0yFCkFK+qyvWWteOqiZjna3YsA7NGmssLswTN
DY6uF15lOVUK7f6cKAEzKoXlct2HK/wZ/l8/AFiIpRxuXxzXB5jyuK7P4dV2UtK4
bZKuj/3VVOuTrbIkfIJwvlewKhQ4OCswcJHO+8ltNCo1omKcdWZOfS2+4PzVhZju
XU68yXOWzxgbTWgjcXZQ4Ia/u7uzMOV7JZhSjPByMFRZVVcIfkPkW4D3lbctaggG
OsL5Gyzt77XUGtoCDX9CXoft9b5PiQ==
=S34d
-----END PGP SIGNATURE-----

--nGxggd7EixyA+X3k--

