Return-Path: <linux-gpio+bounces-19625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CDBAAAE73
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 04:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DACC116A57F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 02:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BBB2DBB2F;
	Mon,  5 May 2025 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Utq2YDpG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944882D1105;
	Mon,  5 May 2025 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485455; cv=none; b=U4lU4Uxity5POl5vniFaxXQ/5TnBH2/3R4tMbjHRUUSsy/H5tXnA4d6b/TbZTjgdHlO2swE8nEKzzLLXaSCSI/Sznmx9UIjEIZnYK+m3CuJKoAMVfjVh5oo8mpbp0pVlr0k7Mgx4tbzk35uT4xoSlBCJHanVoN9GAXywOAD9CCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485455; c=relaxed/simple;
	bh=h93WNiWTrCyQI3Nh7+7mDmYhlhKFljlivtTz1PbBYDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhhFXNl5dOGHX5MPoWvM8FgVvOYIuP1JHErdbrj0SyAy1Wv8TZzXf6ULwrkfhOPjbGKC/4mshbhNC76Mxt5D9EuL6jDyyyQtDApe8A4GObxUR8qspFV/yQM++GeQZurVsOVysL1L4IgT/KUOaakEWlXJl+FcKgCKSEvQPFyUU7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Utq2YDpG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8D7C4CEED;
	Mon,  5 May 2025 22:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485455;
	bh=h93WNiWTrCyQI3Nh7+7mDmYhlhKFljlivtTz1PbBYDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Utq2YDpGylG1fsAlgziWYcuoLBLkJgK12hvOUP8xdcbhzKCLQPCyJ9I39YZ0bUtiu
	 SluMlGiZLvb46N2Q4DG5PamA5XC+QgziPQKWy3txE91Uos+8Kg1tuEc40Uio6IzLCq
	 at8qeKmDlXN9PpJnAbQt6rvI4gQIM0qDoB/t1Kbwcw1rLmw7Rzw++kaY2Ro15+7fCs
	 JmRlrZ9/6bE+FjZjbijUZh+xKD/Mu7I6PLff8kwqsVrdNvmVDPB2je4bZdOkmAIs3b
	 SXB+sR5TFafIb43E9kBAPPiGcMNOVr0FzbPZ7q6XwXkku4rBrcB2aYOfSAinQDz4ta
	 EvBzXeQjV/7iQ==
Date: Tue, 6 May 2025 07:50:50 +0900
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/9] ASoC: codec: cs42l56: Drop cs42l56.h
Message-ID: <aBlAys_SvQRHNTcp@finisterre.sirena.org.uk>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
 <20250428-csl42x-v2-2-e8056313968f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5vMaPAMM9Oxt2fN"
Content-Disposition: inline
In-Reply-To: <20250428-csl42x-v2-2-e8056313968f@nxp.com>
X-Cookie: "Elvis is my copilot."


--v5vMaPAMM9Oxt2fN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 10:09:03AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> There is no in-tree user of "include/sound/cs42l56.h", so move
> 'struct cs42l56_platform_data' to cs42l56.c and remove the header file.
> And platform data is mostly for platforms that create
> devices non using device tree. CS42L56 is a discontinued product,
> there is less possibility that new users will use legacy method
> to create devices. So drop cs42l56.h to prepare using GPIOD API.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/codecs/cs42l56.c:26:10: fatal error: 'sound/cs=
42l56.h' file not found
   26 | #include <sound/cs42l56.h>
      |          ^~~~~~~~~~~~~~~~~
1 error generated.

--v5vMaPAMM9Oxt2fN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgZQMkACgkQJNaLcl1U
h9A1Igf/Q06MRKirMShcv/TcB5l7drBIkDOMikE6u4JLDnDWRMiKvQMv5hBWmf2Z
7dZ+Yj++8mN06HJICtBEhWgF5f8qKM0GEheCbe8AfHEDqsf4mJiSVkPOFF6KNkV5
XAFg+fU7SpLPVhFpF2k02l734j1AP4OrlfYz1MwwRPit2bG94oFdaH7u/zEnxAIf
1YYC8qYRiHUUavnPJIX8V9T4TAKw8n9EMLCLK8ApjYgwuxoDVIbnCgyVyyEhL3Mj
3dj5sLe9lYtVXu7O3+nF4R6W7MrNHJ2rimlRnRhP/oEs3pxkvtwhHbQPty6bn9UQ
mEN4LZ+tPfGWW+aoIYgdma+8Tm/ong==
=Eg3Q
-----END PGP SIGNATURE-----

--v5vMaPAMM9Oxt2fN--

