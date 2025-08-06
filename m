Return-Path: <linux-gpio+bounces-24046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA5B1CC31
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 20:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D313A6FFB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 18:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BCC29DB9A;
	Wed,  6 Aug 2025 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CiR7E7ps"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1D291C02
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754506314; cv=none; b=W2Bljg7inGEWJ73MQUt4nBudE8TM1tUWlRtN3AwoG9O1CvShzV/W3wb32XWe/gMvLHRDpVdkmeKjLslQnbOqsFcy4kgz80eoFIOeeqNmGudKJovzaYsuPhhEk/qcIde6CXQy07T/H+n9chKqesXQr5YqQowU1xeM0bkn/EG4jLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754506314; c=relaxed/simple;
	bh=+EhwwtxYPc7v/u4AVLSYUkKAy2fAdAJZcDGjAd/sjDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJYY9BJ0DqXnxZKnxDA62qIgkFe18ViuLTq07S6W6U4uRT5plTGrBs70uV266Zt01fFi8M0kFdN32zX73uFEGF4Cr9JKQIYpbpfuW0OS86HbudKcVUimf0+Hk5qYBjK/esoftQZkucUFG/r9IGUNQfDi0uGdDfXyZD3tD+JQweI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CiR7E7ps; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=emoX
	e+ntt4IHp6TYxPQJN9PAuaTUVIXfyd2K9C+euKU=; b=CiR7E7psTlvoF8W+FHkn
	kvjCo/+782vssTMp3OjvRjEygEuBdvorTGaaOcICZPUiybr3aMXTo5y1kbeYwSak
	dT7ejorEUPlLLby++vXSsZ2+GgSN2wjRZ/TE4wCdCZTSpaTJtUn0EfO5708dPZcT
	NhbvNoTbPH4VZnSV0NrDtlucMW4GSsKupZYXnWVq5sVUorfXwvmnBnl7ofYXcxbu
	oSlghigZ7BKrdVwSEp7H8xGJb7euG5XwPUiXCKAJf+3yUjDbfLsNWVs6kkGj4RPM
	9jkCOhy6qyG5b95UE9dYMw4Wg4Hb3muTcB3xk8CYk6qSTKkmdoHUj7LvF9A/1cyu
	9Q==
Received: (qmail 818759 invoked from network); 6 Aug 2025 20:51:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2025 20:51:41 +0200
X-UD-Smtp-Session: l3s3148p1@GHHV1LY76KwujntI
Date: Wed, 6 Aug 2025 20:51:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aJOkO0A3oQ4ZT2W0@shikoro>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
 <aIYHD5SEAqQNfDjD@ninjato>
 <20250730101007.314d88ce@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ntdpsNfdM13eVXj"
Content-Disposition: inline
In-Reply-To: <20250730101007.314d88ce@bootlin.com>


--1ntdpsNfdM13eVXj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herve,

> 			drive-strength =3D <6>;
> 			bias-disable;

So, I missed those but sadly it didn't make a difference.

>=20
> I have checked /sys/kernel/debug/pinctrl/40067000.pinctrl/pinmux-pins and
> I have also the "(GPIO UNCLAIMED)":

Still looks wrong. But is unrelated to my problem.

> When you described the LED on your side, did you reference the GPIO using=
 &gpio1b
> for instance gpios =3D <&gpio1b 23 GPIO_ACTIVE_HIGH>;

Yes.

> For GPIO accesses from user space I used gpioget/gpioset tools from libgp=
iod
> without any issues to read/write a GPIO.

I use the sysfs interface. Also tried without the LED subsystem by
directly using the GPIO sysfs interface. The 'gpio' file in debugfs
reflects my changes, alas the LED does not glow :(

I tried a little bit here and there to no avail. I also tried to build
the BSP kernel to see if the LEDs light up there. Couldn't get that
kernel to boot even.

Conclusion: My gut feeling tells me that your patches are okay and I am
doing something stupidly wrong. But I need to tackle this with focus and
not as a side-task. Sadly, I can't do this before my holidays (starting
tomorrow), so I can only do this at the end of this month. I will make
this a priority thing for 6.18, though. Finally GPIO on this SoC would
be awesome and allows me to enable way more devices on my board.

Sorry for no better news...

All the best,

   Wolfram


--1ntdpsNfdM13eVXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiTpDcACgkQFA3kzBSg
KbYPIRAAhoNlsCuzkf8BmL/ZqmbhFlaJiQEvpq4KndJT353zqWQELMv/rw91wqNJ
dO3XHTOCaFze5pRdHKGkJcqbclwjCMQf/O+M6gV+i6wUACfbtW9opnJUyQrbMPXP
A/4Kn0heG3txMQlsYTbLYJFgOgUvbbU2/aojJ8SjpPXbrq76YOhxS/HpWEW/SvEw
2+CPY9IveGIqceUq3wkWWdCMAuffLzq34MAWL6hV5RwIM/N4HyyXMCHCEebhVZkX
p16n8pBafFZY0Jli6k2fNV7/C2SM8VYrFe3BIkFWJmSUYYkd0MqWwJE+W9J3Xl8+
ov4qORfgpzGOPIGBWWd5kM/iK4V9ocNHN0xWTYa0YnqkAUZ8erEtiFzxnEozEquM
51aPtODYd7LpYiWRt6A+zWlvOCsswASSBQxxYRGh9EEtV3oZGLLxrCiro93FuPsC
ta7ZOL9tXUY5kp15/75ct0IxKk+PrR47fSU9WWxJYQc656fuBLfByXD4C+XVvMHz
iPnUfnYTR3PEAWOKBjB9FPk0AL22Mfpo3I1xNmjQ8BcVqXec/+oF4X+7Jwlvc1w6
nmaypT3JUH7IWYZP6AQ6u2SZK4RbrRn071kUL0xCGyv0RoJ/hJPtx9Xngs9JrUwl
lM99cnzbS81slTCW8l5xdq7guUXlQjTlWjsfhld654WIH40D9B0=
=TfGp
-----END PGP SIGNATURE-----

--1ntdpsNfdM13eVXj--

