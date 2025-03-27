Return-Path: <linux-gpio+bounces-18063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44FA731E2
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 13:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FF3189934B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 12:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E262135CF;
	Thu, 27 Mar 2025 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIFQ8Eyk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37254213259;
	Thu, 27 Mar 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077109; cv=none; b=ACGtdz9OqQXewf3Wnv12hVYcxTtEdJD1H0Zb0As7SVtlq5s0cY2WfHTtA7O7LDOdv7IZnJVXjaUHtxqqxnWoQ0BTRkKB6A57jMfQQH8krxr0f6Cz5RYWWcedBtuWPG+I4/5TZnZCoLRntiFAyeTEVX9rJSPFhYqIf7Ch2qvUUtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077109; c=relaxed/simple;
	bh=vV2HYGNtyfzbQ1dLXOhHIYGrrbWQmwLqz0xfo93dzsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9S4OWKdC7jP61iPY72SwN/TV1FmqTrjx45sCXUNyVKmZQJf/6UcmZCAyhcvQiaEe1mdu3jgH1ED6RvSUprDdhX98bt8UQdqtorXgsylKY5YvWH5M2730hoZBRLei8vE15WL8g9w7lauAuZbGDkmMJc85vjW+bOHacgKYFRwsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIFQ8Eyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D78C4CEDD;
	Thu, 27 Mar 2025 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743077108;
	bh=vV2HYGNtyfzbQ1dLXOhHIYGrrbWQmwLqz0xfo93dzsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIFQ8Eyk7OqsMnWw+HkCZCf0JN2sH/lyliAM71KI4TBJqYuRevz/DCl9QGJmU+ql4
	 9Vo2tNYfi2lmt428bDOgPk06xUKneHzwhgRDH4MP0DmhnysaEQ1u1+tKcCdjLKNk9V
	 JfmE52jU/dhiOlalH4dXlx6sc+QTaPZxcTqfDsMW28OLP/S+ngy8lgUocdmkM3ldSV
	 MOiECrNZVwjZC5zDPNjyPCvYAU+GdtarF02f9rkHx3nDxzsWbUF7jingQ3zGfv7N8R
	 1/CCIWntjlNevAk5psppZCXgkw8mHIfy1tMnn+zHYnh4swWW+JAvHbmzyaWlkqHn+M
	 uOzBb77nUqv7A==
Date: Thu, 27 Mar 2025 12:05:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linus.walleij@linaro.org,
	krzk@kernel.org, lgirdwood@gmail.com, andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Message-ID: <d0ff1b7f-f597-4b35-a4cd-8e16ee7ca8f4@sirena.org.uk>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
 <CAMRc=Me8YdNcU1CHH23Bsi8yp33OL8a00-MiMNwA7skD7S0Jbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vRVmMp0AmVZUt2wI"
Content-Disposition: inline
In-Reply-To: <CAMRc=Me8YdNcU1CHH23Bsi8yp33OL8a00-MiMNwA7skD7S0Jbw@mail.gmail.com>
X-Cookie: Multics is security spelled sideways.


--vRVmMp0AmVZUt2wI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 27, 2025 at 09:55:03AM +0100, Bartosz Golaszewski wrote:

> Once v6.15-rc1 is tagged, I'd like to pick it up and provide you with
> an immutable tag so that you can take the corresponding regulator
> patch through your tree, does it sound good to you?

Sure.

--vRVmMp0AmVZUt2wI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmflPu8ACgkQJNaLcl1U
h9Cxxwf/cBmzKz7CMWH3emSamxKUPWRY58600NEy613B0/zo08LO6qmARJ7BP8Um
8Myprsrg26x2FRdnjC+2rPD82Q1F+8evv4ZX87W4hdGG19tzPOONR676hfUPFuZ2
mm6q0sXD7tNeAi/5A53nvnTS4F7g0muaEHi+aq1KCT8vrOw7Q5qk55/1zikVyj1p
t7gpU+Bk77ywkLvXLF6CxlqYNVuz5anbpWYgzbQ3LtbWLjZ0CYvHn3+L4WBuwJpz
7liPg79cTuUD/4CCIYjp4eQnwgBk6od/vvd6YGwnfbbNMdhzW/UUepEYL953ffqt
cWJCXs+BJmOVDGxem/f0qbPQy1HXbw==
=ZlOs
-----END PGP SIGNATURE-----

--vRVmMp0AmVZUt2wI--

