Return-Path: <linux-gpio+bounces-23937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6BB18013
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68AFA1C8096C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 10:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1D923371B;
	Fri,  1 Aug 2025 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FeSOSrYh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524322D786
	for <linux-gpio@vger.kernel.org>; Fri,  1 Aug 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754043677; cv=none; b=mzZtpnMJcxvenfYEWmZ1xm8wOTp46hlpaXUfNDWPUB/fSkG1EONRodU03jOZ5iId+MNyE5zHQUlZWqqIsk/HKH8NknGCjkQtzOJzcpIkU0VnzMzr4rNFHzS1oYNr9dnODnTA0Yck0IrVue3CBPI5FWqjVfnNsHI7wdLPLmhPvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754043677; c=relaxed/simple;
	bh=Rh+UFUzoHulbvruqDl75o8ghub8Gy1HdkHcPajByvp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXhs0akiHMEJq4mtj276uJa1dyro3wG/MByTW81yN7JEsIpIJQF6K2119OTOnTaxPobn9LA8HH0AlcALNUexCH6EHCFoNUP3jQWu0wMjsNDo9odM8LRB5fJWCpN3Tj+jlJnuGzYlI0J2PzwxlIUdIjwM0zbV2YhqaMiopwQkh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FeSOSrYh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b794a013bcso874989f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Aug 2025 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754043673; x=1754648473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh+UFUzoHulbvruqDl75o8ghub8Gy1HdkHcPajByvp4=;
        b=FeSOSrYhdtR0mYS99nM+XixVq6GPn2NozDeXetygQssjsq7/rK9R8oeVkeZ44g+K7x
         ShFfeYdEfr0AH4RAbZLUDn+Q0sO2XSXSqb0LFhlw3p2R3Ffsn7Vg7f85zZ2t3RfTY8op
         AFpKu8CYa+f+XeL7Sx7zQJ9bTQPbWPlmiW/33WdDtn8tkAoXvLmbI66EWEbuTYgbVc1v
         ufLaIjTM71MZc2nTa1LIXiFUWqGBwP189MDB7QvbBAreJTmck6k3xaC55ss9nfLAiD0d
         CnQSvjINS/5oCZ8DrIM9+X4okl+lPJJ3VVdafKy9FDSmdE+KcDrvZdzC/9HVIinvlTg1
         0yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754043673; x=1754648473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh+UFUzoHulbvruqDl75o8ghub8Gy1HdkHcPajByvp4=;
        b=ER3YkeXi+/KsFGgYIoGttE+ty8fva/WB7oJX8cC7CGjPIC/MWfqugnTNlsOTsN4Zpf
         gZGWYw/BTw7g0XNIQ7mBJi8PxPyQWHrbiUEPyY1LQwDWfNG6Wy+Yhn5QhMsBE7/qtt0r
         ekeT+JfRnV/BegXRxAXndE7xOIXZuTh+1TFZoF8aZ6408ehwUggzhAD0i9EOfRIJvLtV
         HujzlM8l32dt4CHfNu57yE5QywkT2tW0zYa0YeYyO+YY730lYUKzs+X6Gvuq7pDb+A/4
         ZFtZUahX4iVsNSbpSG62j5jOa1hVI98r04hmEL5Qiou4gHa+1v5wB5FBBefRNPj3xWoK
         Pclw==
X-Forwarded-Encrypted: i=1; AJvYcCXNA1LyOctobI4TJmZXI/MKuMHBk4GZ8EeP4cPDAVwRkLxVp6VLooy1YfQtRtjOKmMvf2b3/24grM35@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGnPr2492j/XAsBoD3wRqYQ/RIAS0ySzz2fevSkVZQkYZKS3f
	DCyAucHqXYqE5We/656hpM7lVhypXZe/kRHYIr6jpy44GhMOT170PsB0SbYquWB3ick=
X-Gm-Gg: ASbGnctvLXhQ9xdcaCV7PO7RQM5PybYoV1v/NQL2pDlnLMalPUkSSDfA/WK6o+IVpTd
	ESZf6bI426FqCNndLvS45+ERP280D8vyIXdq9SgC+tkdzskq/ddHJWQehKg8258/b8wz/OCA8Aw
	PCq7/zLcGaZgCkvow5SUu++kyKZfFSBfFRCdUmiDg3g3gPxiVcvBvKQT+PgNsyZTFshe9HAYzds
	3FfBHbE0phN5Td3Udu10b5ugN6c++TYQSuhZ+bWWqEQnrnFTlgXJIhq1IrZ/kX/ZFPCr494K6+5
	EW3M6kxHpSO2ShLMriqNafgVO+TaxMPz8GM54ZGpkzJKjQFIDBYwxOgoVBerGbi/QeCa+bCTqoq
	21gqSR7XuGW6vi2IZLJ1Au6jXoS34ln43DyISa/fQcA+ntEoUzWyqHmTBCREU+o16
X-Google-Smtp-Source: AGHT+IEgNiIDeuOgJgIqIxyHSByqpvTblvGAc3fFMjCO9ZkqvvLw7rWTo8y5Dzo94CEN6yPbuEK0cA==
X-Received: by 2002:a05:6000:2008:b0:3b7:9350:d372 with SMTP id ffacd0b85a97d-3b794fde45dmr8709433f8f.24.1754043673343;
        Fri, 01 Aug 2025 03:21:13 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3b9eddsm5383306f8f.22.2025.08.01.03.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 03:21:12 -0700 (PDT)
Date: Fri, 1 Aug 2025 12:21:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Clemens Gruber <clemens.gruber@pqgruber.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pwm: Provide a gpio device for waveform drivers
Message-ID: <gbprqdehipeumbwo54igtcgzdpig3nbxiegviwvru22txdt3ho@wuaa2pthlijp>
References: <20250717073859.1777226-2-u.kleine-koenig@baylibre.com>
 <yr7eydif5mguqpflydthhigpsenfum3agqie4wufbf3624tvjb@3kog3guxiwin>
 <CAMRc=Mdz1b4UxtQBTc2j7HjQQDjxmwODjZSEhfmiOMnJ4aSZPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtch44l62k5oiqjh"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdz1b4UxtQBTc2j7HjQQDjxmwODjZSEhfmiOMnJ4aSZPA@mail.gmail.com>


--xtch44l62k5oiqjh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: Provide a gpio device for waveform drivers
MIME-Version: 1.0

Hello Bartosz,

On Fri, Aug 01, 2025 at 12:00:40PM +0200, Bartosz Golaszewski wrote:
> > > cannot generate a constant signal at both levels error out.
> > >
> > > The pwm-pca9685 driver already provides a gpio chip. When this driver=
 is
> > > converted to the waveform callbacks, the gpio part can just be droppe=
d.
> > >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >
> > Applied to
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/=
for-nexxt
> >
> > as 6.18-rc1 material.
> >
>=20
> What about the v2[1]?
>=20
> [1] https://lore.kernel.org/all/20250717151117.1828585-2-u.kleine-koenig@=
baylibre.com/

Yeah, I noticed that myself, too, after the build test failed and when I
progressed to v2 in my inbox. It's corrected already. Thanks for the
hint.

Uwe

--xtch44l62k5oiqjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiMlRUACgkQj4D7WH0S
/k6G0Af/WwtO5JAsraAmeGNU6coocXtjSA8ONRUjOhKrVG644Ba9YWAX33xY55j2
dVZl52NeZNNjGUw5wvYfpA8F/wqzukLsAmxvwnjczmAYdK6uG/nWauA/InzKhHEF
cVLEtOdk4snN26/dcum9jHRAxl76H778vEUSaGzaT9eIMCyD2Q67KyKuQ8r9FS8n
HBTjwlH9ox5ApuHhWivHuBNvpnBqR3RJnPbTncSQHP6vnr9KtRRdXXAIKBgurQf8
r/EHZpDQo0m6/2W+vgll/UA2kQ3aTUhVfUDbGdzAgsBXCp4HyU9qWvqFWuL2a07e
KAYdi5uiA4bWKzbTfxIwa0+wwbJFlA==
=jc+h
-----END PGP SIGNATURE-----

--xtch44l62k5oiqjh--

