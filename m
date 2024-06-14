Return-Path: <linux-gpio+bounces-7449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB190893F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 12:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D65282128
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 10:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0C1195384;
	Fri, 14 Jun 2024 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RVVKhdFD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC311946A5
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359385; cv=none; b=aLOk4eCv95MGEQD9I72YHoXAq05p6nU7yK9vpllhRrFm9+LFzmCluhnnD8WK7e7LaVSkob95IK5RN8V5+l1+9ZUdUDhwJxAKe2DQ8xWH10KTwi2LqBuZt3DAS6vss5Os8tCzKsJzC+cfT57D5v68/xhgaiZ/37IitTpZhyM8k/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359385; c=relaxed/simple;
	bh=pAHj4WCEYsPaZ7guGi86eSiZcgNHGNgnhFZ2CmMHITg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILtBdm7zu4ncRrnr97SC0BAosfl8gVdWnDRHA4GWmz1O2IQKAqREJD9a4P42pwc/rC4Bp1JEGLFPq+XfIIWs6bYNhmV+Ur6QD5eUQCmkTUCs6RFDNSs9AF3efUWtGHtIZ+jV+luWaKfw8/WAqvYtKuU2lgKZy1isPHeJLnD6zKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RVVKhdFD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=loN7
	xuHi36pMgxaqPgnIzslD2U5A+TOaD28E3/1x6Ds=; b=RVVKhdFD+NkRoGgOVfhE
	QZUxLm2TrdYiGbmJySXLGpCK5h8caN2C3vQtXw13AY0A/nAqRQB+IJWAuW0W9xrK
	qpNV2hqOxEz8mEOaAqwWlq+oBH9d6fYTqUEaXKdHj32+eRq3BKjudgPWAel9qQdV
	FsjQmxZ+ttJymHjkOdq7747/GmyBF+Ses+umqrOj7jpgTvRLQSFQaWwpAUfMiZFl
	yzwQVvLtpXrRzmkIbEpt2fWBXn6shhJBPsRY9PQdgehA/G1wrHQ5pAmS6hSzMfvv
	o4VuZjQeZ1m1+y/xrKiuRxPFhfnFTe8xSX9cGa5SaNM2JU3lzvt90jYPJUsdKiZN
	Lw==
Received: (qmail 1473055 invoked from network); 14 Jun 2024 12:03:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2024 12:03:01 +0200
X-UD-Smtp-Session: l3s3148p1@jqF7uNYavs4gAwDPXzjQABqqX1QYyOSW
Date: Fri, 14 Jun 2024 12:03:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <slpwvai5q24qwymh7nktihvykmlhi5j3nhqjxruxb6yacruu47@27b7rhykw2f3>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
 <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
 <a7463c6e-2801-4d0e-b723-fc1cf77a04ed@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pliq7sursgqwq3ih"
Content-Disposition: inline
In-Reply-To: <a7463c6e-2801-4d0e-b723-fc1cf77a04ed@app.fastmail.com>


--pliq7sursgqwq3ih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, everyone,

> I could imagine treating both gpio-virtuser and this code as
> a gpiolib extension rather than a consumer (which is usually
> part of some other subsystem's driver).

I have difficulties seeing this. For the analyzer, at least. It does not
extend gpiolib in a way another consumer could make use of it?

> It would also make sense to me to separate gpio providers
> from gpiolib in a way, moving one or both of them into a
> subdirectory of drivers/gpio/.

I'd also like 'drivers/gpio/providers' and leave the core stuff (incl.
the analyzer) in 'drivers/gpio'. But I am biased, I2C looks like this :)
And yes, this is some churn and git-history spoiling.

> gpiolib-virtuser.c and gpiolib-sloppy-logic-analyzer.c

'gpio-tool-sloppy-logic-analyzer.c' ? Based on what gets added to
Kconfig with this patch:

	+menu "GPIO hardware hacking tools"

Happy hacking,

   Wolfram


--pliq7sursgqwq3ih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZsFVAACgkQFA3kzBSg
Kba/oxAAoALsBaGmooDy9SxIKUxN/zuU3Fqq20YNihd6wcLFYb1sKfj7o8UvACJ5
6b/QdYLkdZ3hKhgzsOZjwkAMzTDuf2p4imhUHqlPqIeN6JApeARFqdPtYqZN9uo6
zc/x4zM0ilGB0vRqgDfbqLLoBeCHDsthPesjZ2tyxGVkpG0hj0VtSf9zXQrRgm7Z
aQ/Sh4w+yRocVIp7oEAR2Zpr6oCF0ftwEf+3XXL178KqPBrcgzDYX3vC+gxL+fcE
7lu88kOEygxT9J7cJXBexLiLv3vaw0uQUPVtsQilf0ia1ncTg0JQ0G/uyr4qlzng
m7rhL4XazEGwt/P+AipoKxLG+zGnH11OaCwPlsmIJLYz0U3+d6IjSb8t7pYef/3n
RRkDxAR6vlc0r/jOJXnRR0OEasGN/6euX5mNaTFU8zZ0blSHG70w6x0tnHjY49ps
H4Z4iCWQF93/j8Lfrt0lnNqRswD8NJMubpoLFF+pJbR/Os0/2BPBC4OT1aa9xmdK
xJsYU3/h2ZNcY9s1DYm6+F8yYIgsw6ONIhHKV/pKP0bJ1GAdnt3sRt7DHdXtrvea
WppKuPaEcz+Y9bV8u9GbUVjx64iZyNvWM/KcYBM3yi5PzXtUt2wrVGiUqYNo5ohG
K0zTz++edy/WL49/uJKw02dWILZgY7kTARC3IZ2+CiYDS4RHZbk=
=OEh3
-----END PGP SIGNATURE-----

--pliq7sursgqwq3ih--

