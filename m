Return-Path: <linux-gpio+bounces-21539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB4AD8B9C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778841892E72
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CA02D5C7A;
	Fri, 13 Jun 2025 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGqxvvHo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF4234977;
	Fri, 13 Jun 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816439; cv=none; b=VWn3jHSEmdfwVA7vUSY6hzxX+VqO4jMr0Ks01LUEZzZ237X3h/hCw0FbyxhR4e7bf7hHTBWxn7gSZPJxW7GpqK+0AEZM8iewN58X67I7J4gohnIizf2itrJxzpHevIi099oR8jeeTPNK1VJMP/8hfYYe53C2pkWiV2zfRtR45lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816439; c=relaxed/simple;
	bh=8ySbe6JV0Y+P+RmUTxWhQwivlgHTIuT1wt/1QL3WCm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ublyUAI7Hp1M8ksK1x6AxwPlwlfn6Sw6GiJzA9b2lVMbd/VuCcd8vR1HczQnbI9IrOLYE96T97TqCBG3fiHnhi+YNFpXra+NxcjZbygiOClkL+e60lYZ7GALWsi5rDEP5U4cxsZWzujud3X6TcndXBtPPsDNxdSXCwPBsX6EZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGqxvvHo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32EDC4CEE3;
	Fri, 13 Jun 2025 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749816439;
	bh=8ySbe6JV0Y+P+RmUTxWhQwivlgHTIuT1wt/1QL3WCm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGqxvvHoyEd+dUVqMs3b+ANqbx8ct9LrHirSLwK9uExcBu4S5jAU4/ioawDK/UUZE
	 JkaD+y3B4pnp5YOyHhpLAs7seLVjlFBIJMJ8pYPSz9qdj/Kb95UklYHx/Y3EyllQ/F
	 ztbpRhpFVyH9xMJRDMyPLxNdZocAnjJR0SplkK8HPVZVpa0pe5aM/UpyMd5lY6Fw1d
	 1+MIM2Losr481QQ2OB1hWrNsQiXd9ZJRj/9Uw58WMgJHplm1JmRMcSlybDnrBWu5Kc
	 e2z7uI/9x4JJmTswXY7ixS8Zj48RBXm65Z+dRwpUg1hb8AF9Gpjm7LWH0EUReyAekN
	 ZD5M572VvqJhA==
Date: Fri, 13 Jun 2025 13:07:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/7] regulator: tps6594-regulator: refactor variant
 descriptions
Message-ID: <14694267-175d-4566-ae74-da58ebca08b5@sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-7-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ftoSe9ZUrOvHQHK"
Content-Disposition: inline
In-Reply-To: <20250613114518.1772109-7-mwalle@kernel.org>
X-Cookie: Use extra care when cleaning on stairs.


--3ftoSe9ZUrOvHQHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 01:45:17PM +0200, Michael Walle wrote:
> Instead of using conditionals or tri state operators throughout the
> .probe() provide a description per variant. This will make it much
> easier to add new variants later.

Acked-by: Mark Brown <broonie@kernel.org>

--3ftoSe9ZUrOvHQHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMFHEACgkQJNaLcl1U
h9Dznwf/fLsXMIUAaHRjYZFj4t8rya4bxjXo0pZ9IplvXEBg7j5KV3+Ses5E+/mL
2E5dPBhh/kDt9XUA+JYAOar7DjbaPah4Y9fDwqshQL2aNI1kbuhXxpq9UQawK80y
+DHckjMAejH6HjT1KDvBvi7Se746PSVbhE8DHVhTbyClOyKwDuri4FFl8+COXtJv
ZvpKJLNw9rK5SxhZD3piuPxktbjdiO2Jjb4jwqFJFU9LEBrUQ4Fj6iDmeX2T+3a5
s+Fagjqai6PbmxOSf4VyLohDS8NoDfvqBhsknlfm/7VZkUJA1/0RyczcEVGFtL4Q
gOFYoGeaqNIZqJrb2smV7+zCjlgf2A==
=Y4QJ
-----END PGP SIGNATURE-----

--3ftoSe9ZUrOvHQHK--

