Return-Path: <linux-gpio+bounces-578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A77FBC1D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D9328230A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCAE59B7B;
	Tue, 28 Nov 2023 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UH/R7vhq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C65788D;
	Tue, 28 Nov 2023 14:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A82FC433C7;
	Tue, 28 Nov 2023 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701180223;
	bh=OCL77S9JES4lmUWGIM9GXQQEsjN7sL0ioEmMb189EjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UH/R7vhqGfBAfqpe60Y+KSqEINntkJP9Y3sPyeGVRcc5o8H7H22C6Cz+3z1ZJ6L+w
	 RhI0R7noiCcm8RvHypeDlTU/bpABIX5699OxIt+2XKOIkWlwCZTWBJNkNjg72Bdik6
	 o0j6CWZPLXFPAyoEwHfX9LnUvcu+sx0AK0eimbStKpQ7FFYHYkCKfH0NO19O9mWvVC
	 9vPys5Ci/ACgsgSeKoNRRRtwTCdxrPMcpexp5uHFKQj7pZhrQt6E6PlsGEgN8NOMM2
	 tPpSgjuhw7leyzl7LuGftjk76kROsmfI6vezFxs+CMQzjco3rHuuTxPHE7H8FKqTAV
	 LZERXHUVnM3Hg==
Date: Tue, 28 Nov 2023 14:03:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Add support for framer infrastructure and PEF2256
 framer
Message-ID: <17b2f126-f6a4-431c-9e72-56a9c2932a88@sirena.org.uk>
References: <20231128132534.258459-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5GNgz2yB04HlQ9Au"
Content-Disposition: inline
In-Reply-To: <20231128132534.258459-1-herve.codina@bootlin.com>
X-Cookie: Must be over 21.


--5GNgz2yB04HlQ9Au
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 02:25:29PM +0100, Herve Codina wrote:
> Hi,
>=20
> This series introduces the framer infrastructure and adds the PEF2256
> framer provider.
>=20
> Patches were previously sent as part of a full feature series and were
> previously reviewed in that context:
> "Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]
>=20
> In order to ease the merge, the full feature series has been split and
> this series contains patches related to the framer part (infrastructure
> and provider).
>  - Introduce framer infrastructure (patch 1)
>  - Add PEF2256 framer provider (patches 2, 3, 4, 5)

If this gets applied it'd be good to get a signed tag based off Linus'
tree so things that depend on it can be pulled into other trees (eg, the
ASoC mapping for the framer).

--5GNgz2yB04HlQ9Au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVl8zcACgkQJNaLcl1U
h9B45wf8DqQLaggJbtU8xpDv+NJztPbUyIMo8nXzPFMLhFKjaj1cw3fhy1SemD1l
ZhOA1pnDjsPfIREeU5NDZDSq5shqSQQzhrKwG6hGCnU6JyHJCtr7n/kENLG5ajLt
KQhIGNm4mO/YPjtfxeJenMULKyV5vIHJiNjycJCvGs9kNLDvRerlloKSt+5KCY2u
bGLxTV87+HuV1XNMaOmzSWcnvaaox+EGPo0/rGmXtyfF8R22E4Q5Cic2PvxBGYB/
sYrpJCEizNpcygk1WhomNPH6o84uv2AdZxMiEdT6mFkQQBSe+uotm+Y9ASwWQpCi
UeUhfpwZV+4guwnxm/bwOIySx5Bgdg==
=Cmo+
-----END PGP SIGNATURE-----

--5GNgz2yB04HlQ9Au--

