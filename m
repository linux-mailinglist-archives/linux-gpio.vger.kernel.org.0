Return-Path: <linux-gpio+bounces-23463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6363B0A526
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C26FA80B36
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 13:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD9D2DC339;
	Fri, 18 Jul 2025 13:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLyam8DJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C949D2DC34B;
	Fri, 18 Jul 2025 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845279; cv=none; b=e+gdIrMNR5pSlyzcv9p6jmNKPbv3kTd0puwN8ysB/ywOK5D88q4TaDxbTz+C/HfmIu70UrTdFXF+pz+cANgud8fonUY9ySqSmAsiDu4nHmg+KwpreGqgIYASnJenwCqC7X+Oxo+Gk32X8acde/hsgAT4W9LVyOxalut+qWgkCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845279; c=relaxed/simple;
	bh=MKiE6huY3GBf2rYcIW9ksdAkmQcp0EAZzQu+6JbDnxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQdja+ayvFUS0rrza96agZlz4eErNkr1M7Qm4Nn/v7iywE1nUyCj3VrbYGQoprsKJrWZCuzJ1FK+8RTyorxDWAzolehs1CYaj5F4UQCdK6kZfcZ9yzryhtSKxquHWD72PvPG6R9aMrbd8CumAU/ebADppvILEYQmnjV0fO1Mx3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLyam8DJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158B3C4CEEB;
	Fri, 18 Jul 2025 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752845279;
	bh=MKiE6huY3GBf2rYcIW9ksdAkmQcp0EAZzQu+6JbDnxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLyam8DJsm8zglGPZCdy/rgU9vO8nWwUSTXhKU2XiJ0BHLhWCWH1xKjg2HlTEOzz3
	 x0vqjGHcRs4Ur/1YsjHB3id9soYG4fgU5G03Ejw5PHEPBW/B9vTfUeCg74X2zVtUMN
	 nrFtZzOljkfbR+09yIz1xOSXCWBD7qBP4O7yBaiXU0JznMIRxetOG0kEsmCesZY0LM
	 sfcIrn4IdN7OKQhF4pVhy6Z3pjkvic1jYMCQFTkfE3c4E1yP0LZ0ra4EX7grkxwWM1
	 cdmBcwz4zFjNesKX0M1GfdW2YemENU9+vRUQUs6++VEYUHMJyGCeL6SrOUv3GrlPsM
	 goK4d+CpAOXiQ==
Date: Fri, 18 Jul 2025 14:27:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due
 for the v6.17 merge window
Message-ID: <b57e761b-c1f7-46fc-a1bd-c419062ceb18@sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
 <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
 <20250718071344.GA11056@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/cZ4yH0iHo5i4rrv"
Content-Disposition: inline
In-Reply-To: <20250718071344.GA11056@google.com>
X-Cookie: Accordion, n.:


--/cZ4yH0iHo5i4rrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 08:13:44AM +0100, Lee Jones wrote:
> On Thu, 10 Jul 2025, Mark Brown wrote:
> > On Thu, Jul 10, 2025 at 10:49:06AM +0100, Lee Jones wrote:

> > > Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merg=
e window

> > Is there some reason you didn't also pick up the regulator patches?

> Is that a joke?  I'm going to assume that you're not serious!

There's two things here.  One is that the discussions you've linked were
=66rom back in April/May which was before the merge window and things only
got applied a day or two before the merge window opened.   Then rather
than resending after the merge window as expected whoever it was
complained about the patches not being applied just did that with no
further context and it didn't occur to me to look at the date and as a
result I missed that, sorry.

The other issue is that due to the constant drip of MFD serieses getting
resends what I'm doing I'm just glancing at the relevant patches and
then not looking further if I've already reviewed them.  I frequently
have no recollection of any individual series, especially if there's
been non-trivial time since I actively looked at it.

--/cZ4yH0iHo5i4rrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh6S9kACgkQJNaLcl1U
h9BzxQf9HgNXcrdqJk0N9l+gDL3CUY99ag1YSESEtUwsyG9at5OljiwnL0Ytv8i2
DyufIaI0ICYQRSJ7vrNO83BT6MA6q9t/n+Tm+/NhB13lqC6CV786qyoi8YcUgAm5
59xoevx0C67LSplqcSX6DYHIBiIN2808whUE00AtMHzz+wpeMOKCc2G+MyGUyA92
9DSK6KAEJ8jR/KssY2SnZvOvCNUA/4Q9tHO+6ed7qlZvp0CPJTG5YlHqwo/sinPL
4iu+MvnLNqz7Pvs19/EGd46KGWEPtawr/rNgZ9ap+nGRLTjF+qrRKw9h7FJ4pJ2d
yA5AayYRJDzYpBHBbXbBGj06W1gI4g==
=EirP
-----END PGP SIGNATURE-----

--/cZ4yH0iHo5i4rrv--

