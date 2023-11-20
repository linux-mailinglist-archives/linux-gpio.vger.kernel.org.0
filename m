Return-Path: <linux-gpio+bounces-261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E767F146D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 14:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B54D28178F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4EF1A731;
	Mon, 20 Nov 2023 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Adn5+nCR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240981A5A8;
	Mon, 20 Nov 2023 13:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD7EC433C8;
	Mon, 20 Nov 2023 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700487020;
	bh=PHdu57Wzp+xZqOVNY9Pteh5+H3/OUfTVYEQwZtnjgaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Adn5+nCRh7+2esCt06PpWOJ6Q7Sf9wGWzyL8OZ3xQ4KTuGsVYCl41uUSDvoZM1Qgh
	 xYH9OzH46SDNykHqua+lZM2VDAFNJNwAhIazL4+HhuPw4y+ePFT4d4rp8a2u9mWmRp
	 PnCbz5w1ll14XS8VhdWdJuOuFS0/ORhBUxPN9LZrU5nM5XwUgSrSc4kXfWDjHIHbGB
	 JT3utmOA0eqk2DInnearZCiHRLiXuzkgmY4JBzfMGPTQF/bM9Mo53CgDyCMs/E4vK7
	 vEYpztDFwP8Cf9bC1VZuImptYoTJCr3dqt3i1A+skz+dJKGH7DjDkXQ+BECL8kWBh6
	 +vMaV+mcY9SLg==
Date: Mon, 20 Nov 2023 13:30:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
 <20231117164746.0589e955@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuVabfiR1A06kEJd"
Content-Disposition: inline
In-Reply-To: <20231117164746.0589e955@kernel.org>
X-Cookie: <Manoj> I *like* the chicken


--HuVabfiR1A06kEJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 04:47:46PM -0800, Jakub Kicinski wrote:
> On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:
> >    - Removed Patches 6, 7 and 8 (patches applied)
> >=20
> >    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
> >      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'

> I thought someone (Mark?) asked for the networking stuff to be put=20
> on a branch. If that's still the preference - is it possible to factor
> these out as a standalone series, too?  Will they build on their own?

Yes, can we *please* at least get the generic non-driver bits of this
series moving - they seem uncontroversial as far as I can see and are a
tiny portion of the overall 20 patches.  Patches 21-23 look like they
can go on a branch in the net tree?

--HuVabfiR1A06kEJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbX18ACgkQJNaLcl1U
h9BhUQf/Y8e+dECLekhRMQLy8O0p4YRvMtVtYbyazFL0PEJyvuI93CnL/nqRzW/7
x6zzsmJn2uab1/SmDbu8m5yE2PQDQs448v2ZAIcvu9SOQoH9ph+y/Li1dsCx0MQS
b+VU0vl6YJcBmn8ycRkgBldpLgOoc6HU2tss4FQBAlR2R0Aw6KG97Smd+Py70Yyg
ewedo+nXh+OkOHdJiG3Fbcbw6GwLEoQB+jj2MFy4QA3VilnEu+NBvRxIoegctggc
mPB4GWRQNg9fb57iy6IqsME7oUq1hUb4SJ55O7s88qko3hFJ4ediuncLVP25kbl/
HNP87K6I1Mebqh5LHTcVOvfo8zM/BQ==
=n/vU
-----END PGP SIGNATURE-----

--HuVabfiR1A06kEJd--

