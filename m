Return-Path: <linux-gpio+bounces-27593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B13C070E0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 17:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3152E189E71F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF9732B997;
	Fri, 24 Oct 2025 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKRl59ZM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B911DC994;
	Fri, 24 Oct 2025 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320783; cv=none; b=X8KD5/faBY8epF3b47LAMSAnWK2LqxGagYqt9y9gkRDPi+22ChD0zb1OIdkPbl5yXF9SyozP4Pt57utSdo+2AZjReNy99RoAo09hdE+/PGmOxEyQbWlSOpiQCdJciDv6pQgrBW3zXsqH8mpGW1eMER8ozFYrgdC5hexvjnc5rg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320783; c=relaxed/simple;
	bh=9PHQQmN7U58dEYd/jGpL7q3Dd+5cmWnn8PKw2g9U1rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sw54C/mZUHM5jPEVHIWEncsBLcddqO/L8YzC6IZJCxRxhFvk2W8oEAlEUgy2JyoMAIvBmbsS3TOGlxNqyZoLpki4TEUkUSo090tbFEBXXqMH50sTxbAkxflqPe0QjMHW/Hpk/bN+sXso/Lh9A2qniel7UfTxz71z2x+W6xjb9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKRl59ZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F18C4CEF1;
	Fri, 24 Oct 2025 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761320782;
	bh=9PHQQmN7U58dEYd/jGpL7q3Dd+5cmWnn8PKw2g9U1rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKRl59ZM8rvoik8ee2+FejsEO+8k2Pws6sZbZJr3HGruy4UjMw41/4LjEEaTlAZdZ
	 2eYiUbjTZaC5lG3bVsFWss/d75BmaJRrEc2cxa0JfrHKJAK+dXzB73AGN6GRkrYRhJ
	 eGcfcCCYwaC57ghc6HookvgrtC+jZF35r70CBLf3kvLcg5vx77KspeXbW/k5Alz8JS
	 bpUIWd+d4T+CBs1nd2DClhQNuP9MG5OHfR74Ozy2Of2Fl49kJrMrtEHffrnxWVyfqU
	 6AbtxMu0tElxF4Op0ohB5nlsSYTM3xDSrn0S83C6eDdFcVAnVxBzgZRRqF59rmINZs
	 uRU9qJZc/Wy2w==
Date: Fri, 24 Oct 2025 16:46:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 08/10] ASoC: wsa881x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
Message-ID: <aPufSoALA--iJeVn@finisterre.sirena.org.uk>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wsyROlqG9veSnDyd"
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
X-Cookie: If in doubt, mumble.


--wsyROlqG9veSnDyd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:10:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.

Acked-by: Mark Brown <broonie@kernel.org>

--wsyROlqG9veSnDyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7n0kACgkQJNaLcl1U
h9A69wf/QahGbiw/YMV7UmAmFOQctvV/QPY8gXkwyoIILpibLbN8jzinWqQcLI4Y
de3G0ouRnd6psYaxcoqdvmoSgcFRvdM3NH8egptFL4ZcJgKcrgLfh5Xv7oxXLTTe
SSW6pYCv1+7tTttECErVE9y3UlTCj4iBgWeOkyUcidGg3iWSWDRXQMEhTD0CbxRx
vHHHv4MincZyu88gM3aqZP001FrXnlAk3mh5tZ/qDntF6x+7EdBfTeZDs05SxXhM
RwatgXTeynPOhxRrK05leI9bTXzkv5OOcNXU5Zt9AKhP4XvPHIBQp85TKA4fbvAT
nUmf4H4/9/7OUkguARLdScin2yPciA==
=5Wuo
-----END PGP SIGNATURE-----

--wsyROlqG9veSnDyd--

