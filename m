Return-Path: <linux-gpio+bounces-7546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BFA90D857
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 18:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB04A1C236EF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 16:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F262150297;
	Tue, 18 Jun 2024 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i8MEH4C+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31214D8A4
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718726995; cv=none; b=UxF62ecEA/tYs3admctNnXDVvW53yQYq0KqvSHdYZBCTRCVNz42amucxes/7jJRiQt8w5aOUkoU6znVQVKV27WSx/h8JfdzQQNO2Hz9COSlxs7gKuppIuJUt+DFr4Mf0GC4VvXKoklFwFvR2ifQZUPaVweS8Ru+EYhMgtPUEYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718726995; c=relaxed/simple;
	bh=b9bXeRoJpbw3v2jWIi5RGRiSok5QY8bOI/A5YxVa18M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4T6V8NxVoBuSqAJ1xpX07C7NofAbnaWjp1Ye2FyKmULrbwfJ8BE52p/MNtjtotm0Br+fY9Mf/fcuIJYhJLpVTA3LTcGDQO+HA9ck0qk5f84d8kpz7f9SQeeC+ToRjtbeIlC/VWDAmNixsUt9SxkFXa88lDaW7qwhG8nh3nV0Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i8MEH4C+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b9bX
	eRoJpbw3v2jWIi5RGRiSok5QY8bOI/A5YxVa18M=; b=i8MEH4C+KhQrmah/GsWt
	YohMHFdrtjifBFIvfyEkECENzHCGiFqJkQ1UGAAv+RduAH4TGmBxw+WAFApjGHGr
	yax9HqsewdTs4Qz/IxPEipUh8cbSfWcaFwx1QGQTXPYft7H7jpkhie2+14oAnsaJ
	uvpHd+BRwbqFnWQGqmzQW0jd51U8qn+AfXsYDwoCPH2bGadKM+N7CHred1BQUg5X
	4aCowllIPE6uQwFYV7jFDaFqzRUq19dVdU4cnOICGiIMIKtBClAFlSMbQBv3q+3M
	Tq8pIdNj/DHfq6oj3hfaRCAAR9mqwmCGpdkb6R9F6Q9YFGYj046IMRFuoaQ0+mGg
	kg==
Received: (qmail 283759 invoked from network); 18 Jun 2024 18:09:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2024 18:09:47 +0200
X-UD-Smtp-Session: l3s3148p1@hlyRTywbJohehh9j
Date: Tue, 18 Jun 2024 18:09:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <ekuchwcgvggsriqodasx6pneybqbwe3cc2j3huisb7mnacnj3z@mhx4snzwbbqj>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <3h63msxchuuxqa5liufoivss4raqtzjlusjn7ufti5nyjkshcb@pqevlpuvrm5q>
 <CAMRc=Mff2L_M=zkxQTqoFjMxbi4ZXBHPxm48UGnYFEnwfDWFHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6vvdwno3oriajiw"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mff2L_M=zkxQTqoFjMxbi4ZXBHPxm48UGnYFEnwfDWFHQ@mail.gmail.com>


--t6vvdwno3oriajiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You mean configfs? Please take a look at my proposed gpio-virtuser

Oops, yes, configfs.

> module, it should do what you want:
> https://lore.kernel.org/linux-gpio/20240613092830.15761-1-brgl@bgdev.pl/

Thank you! Exactly what I was looking for. What I like is the symmetry
of instantiating GPIOs in either DT or configfs. Very elegant for the
user. But boy, this is a lot of non-trivial code for it.


--t6vvdwno3oriajiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZxsUsACgkQFA3kzBSg
KbYV8RAAmlV7dakmx/ZeWbYLcZ7onJJ62V7CTKNFPwN28NQpGyBK9yTWVMRhBwF/
vQS2johY+4ah2/f8h8/6NnShb8EBZ+Zco6nfb2bAAC4+RfHZ3S7PXYJSDn+VE+Pu
wt3Y1toC6yWKhPA6n0bQXwC5YlbSIc2fp9X/R+FjTw1nUV9sHkNiOOmPeThdm6E6
j7lgSe8Z2/F9wvigbormsMyfqxEvl2f9mTi3MWKNiWivwYUu7+NmMtARHu8lDaIW
s5K/Xf+/SLoM/UFGkeCI6guz5nkSBFvWDruxQZDCiLFE/hFaTTLo3XDMf84nUg9y
QEelfrCeBtUztvPy/THkbTOzOEapJ1tk299NzQwUF2ppa0hgQ/Eudq3pAHMO49QA
FZ63984Ge7TQGLD1yNmsnGcCa1b1Jblv8kW3Ksv9K88rOmmr8VqCUbctWd3PmQmT
GLqKCL6/oVxN6RX5gko5D7oQJ2phvte4HRphQ1VD9kqSh+R/FruWyURr92jT6pF+
Qwr9js0ksCd/6d5wITPnYp7vZZe1YjedZYbGVNR8w3wHnUEzt9JniHXdmJN4qyDs
CFBFv5fkCnuEjOWcRSxtOS61w9b9kd+H+lsFFCtt5RmJg30DFVmnHJITJ2jw9zm0
IKGGIRfr01M7YYU67OqxdK/2pc1pP9COtbVpvvjAa2lPNHbwA/g=
=zQ52
-----END PGP SIGNATURE-----

--t6vvdwno3oriajiw--

