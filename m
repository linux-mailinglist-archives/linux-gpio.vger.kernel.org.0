Return-Path: <linux-gpio+bounces-7434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92FE907858
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 18:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F02331C204DA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0561474CC;
	Thu, 13 Jun 2024 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BOgPACwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB9131BDD
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296403; cv=none; b=RkUd0vAGcOHSdrkicsraNkg8AnnRCA9bOav0EkBadJG15K82PBubbbKkEAEKaxUi88BThjqHfjl+d4G9Wpb+9jB+pWhj2zIZcrE9+Qb58sojjdYsxIf902wDQ0e7RYeqEB25yjUHZWX3VTsZY/rxMLOhbGSv0zyFqJw8T+8ci58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296403; c=relaxed/simple;
	bh=KxVEzA57tlb7dePRLlN+bW+GJrzbV4oxzQQUaG/sQzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oid6Cfu44GqpNwrjQ55oWpo0XqqvVhY1trIbGVK7x2XW7xnX/pVddVp8oy3IXI+LOQYkLlFLOy83iXn80rKU5xvUAHEy1H9pjO8/WMk/XcEFgVWW21H7hWClf9y3lep2nyCnuJcpza6q2Lwmeztwt58jSuBGvGQFyBkzwOx1R+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BOgPACwX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KxVE
	zA57tlb7dePRLlN+bW+GJrzbV4oxzQQUaG/sQzc=; b=BOgPACwX0ANo0oMadmpD
	Yr73nPBZBmp7baH6guSP1DC5TFWUORAgxUxptrAZbAoojBaCvMpiNnrdn6XSrttI
	C3YfitgxzPkE+oyxXwgZWWYmurG4f+Mj90F2XHtxT797WYT3yqYo/wikxb7KLVQD
	UowlqX1K2rlKQJ3sSEcs94sp+sh5c2425J+1jqf5Azt5LmhUy6mlUa64rJB1mKo6
	aW3hAiRfskBGmfhmZekPpaZuaLoYzTFw8ipSPtESgiXs1wzSeMbNpvpqt1YitGvy
	meOmYslB+gqk6oDnWrrdITiHhOASFBE/r8bsnf6Sbq8M28Tyx5pZYj7QbBAGHKO7
	5Q==
Received: (qmail 1241039 invoked from network); 13 Jun 2024 18:33:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2024 18:33:17 +0200
X-UD-Smtp-Session: l3s3148p1@ERVcDsgaVe5ehh9j
Date: Thu, 13 Jun 2024 18:33:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <7mkl7su47jqoagphc5daaonhndfw2xuap37z6yu4afdg3zvezb@5raeuolqflmo>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMuHMdXmtXcOQ1SibKFh3M+X-syEyEHfxjvSmtDoDNqU40MPVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6en6wjrd5s6y4t3r"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXmtXcOQ1SibKFh3M+X-syEyEHfxjvSmtDoDNqU40MPVg@mail.gmail.com>


--6en6wjrd5s6y4t3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hmm, I like the iio idea.
> Sorry, Wolfram ;-)

Ah, no worries, Geert. I am happy you want to take over :)


--6en6wjrd5s6y4t3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZrH0gACgkQFA3kzBSg
KbZxsg/8Czee6rn0dAMoaq7pD7T9gQoEh/Dk9CRXW6AGY0vj+qUesC6L9lSFBmBf
lx63HJJRrjpckhXn4Knk7UBJXWYMASxXpbiE+YcKhZJZn+Or/EuviyWVZWdxYwuH
ItHH7kwQSLoWykJcRA6+AX6AwRF67qFD1Ff5omCJHjYYbMrF3t4znzgazdIIGDaN
9W8EG37tdJqEHFC+lBb7gVjt5V/rnH1dDNLIOWFgt3geBP8UE5ea/rqDCxierBcG
/1pb9t2aiwCs8HeikQKFLQsY+W+mE1s0dz0+FNuxYdfo3LF8bl0kLJoaAnOjUqX6
Wujft6kYjhbHRGpJFu2Rknxban81mk3Qw1svKC8JH8LacspvjMVmZVkRaqPHeXWI
nR6bUdkCtGMldW//gD0maQSI9iJvIBFXS6gUbMrdDrIPm/d5625J6w0VIkr/yGhX
bqG/EyMqXQu57leV3YqCm1JyVYbW/Hgm3eUU4CrrLcIa76b9q8O9R5fpIlUUumT1
48LsZmHGA9j+B6cgPYUCYrU8zLpXuIJpxLjuJGQ9an/cfuih9T1YeK/K29jaUH84
zqm9Le5J1QPS2VZsccMD/h2HKjzJrXHqxdz8IH4Od/E5JjRWSsRC1moKJ+adh7Rl
8vYZWsa0sFjv6iCArYP088FF77qgdkMtBqth4bD/JlR2aqMPY9E=
=zpkZ
-----END PGP SIGNATURE-----

--6en6wjrd5s6y4t3r--

