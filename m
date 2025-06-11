Return-Path: <linux-gpio+bounces-21400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A6AD57A0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77EEB17F432
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D37294A0A;
	Wed, 11 Jun 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB7a8MDf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683E28D836;
	Wed, 11 Jun 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650040; cv=none; b=dGIwpOrfvzyjwUMgGQPtcrtsQOG3SyUc8ny/zm534Jmh4QJv6dJupKc8/egPe66janBpchVtHLDpZir8eobecmg39tf+UrfzH4ZCOhvykgUwrSCBP56D5wQTa4gaWHWBMl01VsGm27xh0p6mb1Rlq06beFJvtWKKLFXC1U8EvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650040; c=relaxed/simple;
	bh=ekZAr3CEJWDzff5er4X5jw1Q0ODtHKyY9RG8ZM87MUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO8TRvTkgjdmmq4NycubgVOxvnGke+m9LeSQ/JS0IDPAvZbaMIR59p63e/G3h84l78NYpxfFYBHPwHiiNK2ghXG8/YN8rQtmiO1+XBebjvtFWGjo6snNNxgpMAR6W5HEMVxrRYnmj6g3IoORAHA+bI+Z8c0c9Gp7G6+68NNsLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB7a8MDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A8C4CEEE;
	Wed, 11 Jun 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749650040;
	bh=ekZAr3CEJWDzff5er4X5jw1Q0ODtHKyY9RG8ZM87MUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BB7a8MDf5KzPB6OObcwJpakmulnwJFPAwwkyiMMNwbfYuQA97tfHdYyiv2siBb/sA
	 agU0SrYv9VWP3bCMjey9CP6+2NolyeFEnob4mGCI06ULY6VdhyjRwCdaODXfafNWE8
	 l4UYxNl64lqpfmutaL3w2TynxMa2L5aLsJYWzFFSn2ixUdwJQHQQuwhWpk2e4XvIAO
	 8LeeIsmGqrI6UaRxj2sKkzax1HmA37yQuRsW80YK1aVc54C+Jf7/UxZ3i4/xJLHkX0
	 d2fTn32EFcgNxemMNzz0JNX7ZuWh6CReaDQeXUP7zbs5cxWXZNkbzYThqxuuhee8Lw
	 jPEERwBq8luDQ==
Date: Wed, 11 Jun 2025 14:53:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Message-ID: <f5fcaac5-fa8e-41da-b1d2-e84197992e3c@sirena.org.uk>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
 <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="II5ctZhWLoXlcVcY"
Content-Disposition: inline
In-Reply-To: <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
X-Cookie: No skis take rocks like rental skis!


--II5ctZhWLoXlcVcY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:55:44AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:02:58PM GMT, Andr=E9 Draszik wrote:

> > +          For S2MPG10 ldo20m, the following values are valid
> > +            - 0 # S2MPG10_PCTRLSEL_LDO20M_ON - always on

> No, use standard regulator properties - regulator-always-on

> > +            - 1 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M=
_SFR
> > +            - 2 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
> > +            - 3 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL=
1 register
> > +            - 4 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable

> I don't think we allowed such property in the past. I don't get what is
> here the actual signal - you described registers in multiple places, not
> signals. Few of these duplicate standard properties, so this looks like
> exact copy of downstream which was doing exactly that way and that was
> exactly never upstreamed.

It looks like we can infer the configuration needed here from the
existing properties, if a GPIO is provided then use value 2 otherwise
use value 3.

--II5ctZhWLoXlcVcY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJinEACgkQJNaLcl1U
h9B/KQf/So5r1954Cqj0MGQ3kptk5Nq5KmqHw0TJIbhPv2N+8N6g7os3+rryQOed
F2TMFmttMHHFoSD/aeBVyPGgd7ynr02oAau+FGX9Jfii4FkHyvaTLEycwnRvUJEn
oFf6CWb/DJa/9THCjgduw5I8j4qG4PH0kXjQ3FSgA7q+du7g2U/8FDAD0naJQfes
mlG1EVq1ncI89vJuRfjQt5QXeYO3GqwCK9XGhmVxrqVXeP871hJLJEGl84ZOrihY
5n5bktH5BVCfJa+SnoWc7VNlMe3poy5ya+hCtUD4BXoJXKjszzdfFvTZsKfZchbJ
4KiMIP+5AmKJyIGujjqHcyiG0lp3aw==
=XBpF
-----END PGP SIGNATURE-----

--II5ctZhWLoXlcVcY--

