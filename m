Return-Path: <linux-gpio+bounces-6948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727928D4B30
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5C8285F8B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9876B17FAD6;
	Thu, 30 May 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mqg3IB16"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FA339AC;
	Thu, 30 May 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717070384; cv=none; b=VxphU/Vn/VwdJTrrlQ/1rANEuuZwUPr/A97mRLQz4eqNzBR8ENc44v8L2PzNZaELxZJu9iYuBTdyl9QpufmHaZ75e3jKxr4nm5BCay040ssF4JfXp0KM46ViaxI2f66RbzpxyNa8tETB6WyK6zQdWduhQrdwhNeEBalVCcdImSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717070384; c=relaxed/simple;
	bh=8kTTWP9KKerLOBH7sOJ6kRkd4l+zeLLm8E8cdaSboqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj7qrUk4UuS3nHWiDev6yzIYiCr29dwQd4wU5ktywrhg1nuua13BWaIRdH+ZFb9il7hczE8o1D6RmiNt4+tlH93ZybovlS4zy7zkY1FF8AoZ+UVkaypCyOXiJKA//eYM7JOVIkKfavZtmyO2HOwHbZTdxI91uF9LSajvG2SVtvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mqg3IB16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234A9C2BBFC;
	Thu, 30 May 2024 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717070383;
	bh=8kTTWP9KKerLOBH7sOJ6kRkd4l+zeLLm8E8cdaSboqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mqg3IB16KCl4iVocK2ANNDet9sKxP/D79issOs52V4nylRTLMcYW5Sadf2dCM89Ea
	 oe+lEU+VT8Ne+JUOwW78a/nnoTjigbrxhc+G85t00kpKd6qYFCIALfsI7o5rpaowvU
	 GKK4GnibMg+2ejVQZlQVG9AOA1d6OsVe0oxGqpob+iwjhZrA/dRYbNyd5j+xMtj9MV
	 XP+RAidre1R6cTdhwoVkuf5gdGCac2GfSM/jTbiHHHE4AvTQ+hu5G+npa7bbxH7fDs
	 fyE2rtDDApUdFRI/kuSYfr+qnAJXo7lLYpYP0PlYd8UC0Kshzb5ZA18Koo7WAjT3N3
	 99NH0dFwBvqzg==
Date: Thu, 30 May 2024 12:59:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 13/14] regulator: add pm8008 pmic regulator driver
Message-ID: <9f126943-2d73-491a-9267-6585e10aea8d@sirena.org.uk>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-14-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0mJZbpVe58dxAH3V"
Content-Disposition: inline
In-Reply-To: <20240529162958.18081-14-johan+linaro@kernel.org>
X-Cookie: To err is human, to moo bovine.


--0mJZbpVe58dxAH3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 06:29:57PM +0200, Johan Hovold wrote:
> The Qualcomm PM8008 is an I2C-controlled PMIC containing seven LDO
> regulators.
>=20
> The driver is based on a driver submitted by Satya Priya, but it has
> been cleaned up and reworked to match the new devicetree binding which
> no longer describes each regulator as a separate device.

Reviewed-by: Mark Brown <broonie@kernel.org>

--0mJZbpVe58dxAH3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZYaigACgkQJNaLcl1U
h9DPVQf/XpPDBDoyoV/qBv6jdSFnaUIVIhIJ4t3WR8qJ42MxLVJrRWkbEAhgShfN
vsROxh3DsaBpC64ahrFPKK7Opv61SdIVtfAf6anp/jYW1yxFaHZa8GKyATVvgRYp
iC+iwOY6AiJKtVjXRc6a4cXbWUclQ1bqDOTgLaGeZ/HkrAB8mAXEOM+vaX4JXqPN
TAFCxBWMzBdeOFAghdfOukV0024rkqMKNw1BqOFLkdk0IKtzvt+/34eq/6kgD3V7
2ALbIM/GdGcU+9VRj+YVsh8TOXKPchwSnBNnYPGWBca9X/83i5jgNIz1HpqNfJDd
0RziAuWoiECj/mAekCSP56G4wjnRVg==
=VPPI
-----END PGP SIGNATURE-----

--0mJZbpVe58dxAH3V--

