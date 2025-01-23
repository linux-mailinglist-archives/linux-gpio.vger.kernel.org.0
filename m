Return-Path: <linux-gpio+bounces-15043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87435A1A7DA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 17:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D943ACD2A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 16:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E4020F98E;
	Thu, 23 Jan 2025 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NEQjiFYt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BA2A1AA
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649814; cv=none; b=PK88ds9obrC3eJv2hwRcUx3SF9ojgC6FZRc+3dxjwyjI3GtUxDimt/iZKSae+t2MR49jJE9UkXxehrmJP3lZm0jMQZqnj6GFCeaQRCWTzIXgibpb3tTlzH1lu3/cIWp6W961FfZbQVucVs4di3++DDRK3OctbPzila2y4g5cLNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649814; c=relaxed/simple;
	bh=w+D3sTQQ6T3tTTUhsSZDjy6lXX7N82/wEzA5zwi2TPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsxRPA6TQUwJ1tp/frSjUn55XOZqWO96sLs9n4rYwOGxNVAxULMWCX+O5blWxPwxk8tes60yD2fqNceQQ6MD3IN/0bYOwvEYqZwRsdqS5+fKLx5x5DQxfGvH6uTDZSUqldj+hHzfhFKToVYtIgbpWz5og2eA1AC6ejTDqzK7nag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NEQjiFYt; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso2039259a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737649809; x=1738254609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+D3sTQQ6T3tTTUhsSZDjy6lXX7N82/wEzA5zwi2TPg=;
        b=NEQjiFYthPuOlv+V6j6tfVo2lMAeoq1fwwwiIqGXQ15KToFk9mzUyojEeWiJfCqj9u
         Vxp0KslNzBssozrccDrT5e/3vL7oZN2FOs+WmincUG1aNeq7QRV400QgpBx13BsI3F4G
         0spbCL9EhpNvKTGvMe2XXX1QUV75y+gLFBcKTOwrt8ogXeVKsHR1fouMxswev+r5Db/o
         OL/jklWnB1pGNQAvs+GfeKcN1bqMlwGTzb9Ap2VqptjGSU4yQWvBBI5xW8gvBNfyfu0R
         9T0SHJ81SB+fI6v+xh+SsP5DeFLat2t1UGYMpYjR1W3mgvXPbHoL4SgcdI0RUZnBFOA3
         2KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737649809; x=1738254609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+D3sTQQ6T3tTTUhsSZDjy6lXX7N82/wEzA5zwi2TPg=;
        b=vj/L27BwWBs0Os7uFeT0aIq7BVKj4I65xCDAbllFcu2jbtdboBeq5bWKKdVqtShemZ
         vTKfKAI7OWrRAJLzLCPx29lUj7qb3jCANgOYIQVpuqkCusefv+vJVuS5dy7hcMxgsD1f
         HC9nTrlhr1LmjEUXR9Ou7veHAALnOokGU6sIb/UIXFUwmTr/WlKYjhtf6CAdfvNtleTe
         X+jRWOOLkgv8acjHFhfkCsptZqrhk6i0tGwnaP08R72zDVgL3A4YaJK7W8vPTZiQB9bm
         hSAJvlhcL4B+raLwfOHv3ffIlKCbmFke1NvqY2a12njlEMJ/ENanoyQt7+usD8eLKg4v
         COPg==
X-Forwarded-Encrypted: i=1; AJvYcCUA9vLuBmNmcGb3ptdf9tq5RoLHUfxFMLAGBL1eoIpvUHHVU5Txgc6nAsL+LymZnyfqDFr1CVFX7Mky@vger.kernel.org
X-Gm-Message-State: AOJu0YyW0ouyTDPUx2ujbpKjhVa+RLiODK6m9JBnj4Zvj4UH6YAJHC8Q
	N4Qc65u7Bc5GYRFK+VDe7xqAoTzP7p1hw2AVoE9kNixmCgg3r654cuditjyM40SE1dNvNM+5GNr
	KSbazRA==
X-Gm-Gg: ASbGnctZ/3UVnWs+ny+dkeUPP+mQdob3xA9+MxnBmnm0RHvkQ19ZYsIymM0oHx83BVk
	32Z35R2pERkyY5D2tPv5X96HMQ4fpMby6YDm1mP6iuOto7Tnxv6ZXQqcGsHdT0tQS7N2Dyil1to
	JHAXD562YVXeJKfaS2xBV18mZT4FQxxYgjv2Hb6A313o+0zy6aDsKyj6Nmyrx3OOAo3Ze117HaZ
	3KYDksZNNxCJ0nNaLOKNr8euoS3Pd8+Xhr4xcJK039rLtQrTX0PeWUBxfiSWtv1Q+AGc4zVrawc
	kK7/CILCpRNTUcmUEGn//+ifRbyt5+5Lvw4ob+7jztAYEwI=
X-Google-Smtp-Source: AGHT+IEVa2GD13NRi92xJNdo7NSXiZpiZwOwmMtVGmQsgkMQqgoZJEKkCHGESH4P+4rSjQIvA9iIZQ==
X-Received: by 2002:a05:6402:2710:b0:5db:f423:19b9 with SMTP id 4fb4d7f45d1cf-5dbf4231aecmr6278512a12.16.1737649809360;
        Thu, 23 Jan 2025 08:30:09 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73ef6c37sm10429319a12.81.2025.01.23.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:30:08 -0800 (PST)
Date: Thu, 23 Jan 2025 17:30:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: intel: Import namespace for pwm_lpss
 function
Message-ID: <yynjwr57jf4ytixfo2c6bojo5ib5plue7krlwzb64rxrfuqghy@u4pkkktbe7b3>
References: <20250123101110.339337-4-u.kleine-koenig@baylibre.com>
 <20250123101110.339337-5-u.kleine-koenig@baylibre.com>
 <CAHp75VekFNu8Jzfit5euj2pKeesGHs3DQS4hJdT==RM7MONb4g@mail.gmail.com>
 <gw223bv34jyszlssyegvz2znb7q4zzh3lax2qgmvcx6m5lvy6l@gpuvyyhvsgf7>
 <Z5JkwTAO5NKeHnmK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v7tgpdjpw3y6rsks"
Content-Disposition: inline
In-Reply-To: <Z5JkwTAO5NKeHnmK@smile.fi.intel.com>


--v7tgpdjpw3y6rsks
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] pinctrl: intel: Import namespace for pwm_lpss
 function
MIME-Version: 1.0

On Thu, Jan 23, 2025 at 05:48:17PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 23, 2025 at 03:52:06PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Thu, Jan 23, 2025 at 01:45:17PM +0200, Andy Shevchenko wrote:
> > > On Thu, Jan 23, 2025 at 12:11=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > >
> > > > The intel pinctrl driver can provide a PWM device and for that need=
s to
> > > > call the function devm_pwm_lpss_probe(). That function is provided =
by
> > > > the pwm-lpss driver which intends to export it in the "PWM_LPSS"
> > > > namespace. To prepare fixing the pwm-lpss driver to indeed use the
> > > > "PWM_LPSS" namespace, import that namespace when used.
>=20
> ...
>=20
> > > > +#if IS_REACHABLE(CONFIG_PWM_LPSS)
> > >=20
> > > > +#endif
> > >=20
> > > Why?
> >=20
> > Because devm_pwm_lpss_probe() is only used #if
> > IS_REACHABLE(CONFIG_PWM_LPSS). Without the #if but with
> > https://lore.kernel.org/all/20250123110951.370759-2-u.kleine-koenig@bay=
libre.com/
> > this results in a warning (with W=3D1) :-)
>=20
> There is no such commit in the current Linux Next, so let's solve the iss=
ues
> when they come up.
>=20
> I'm okay to take your series via Intel pin control without that ifdeffery.
> If you don't agree on the change, we need to find the way how to avoid ug=
ly
> ifdeffery from day 1.

I'm ok with dropping the #if. Should I resend or do you want to edit the
patch? Would you take both patches then?

Best regards
Uwe

--v7tgpdjpw3y6rsks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeSbo0ACgkQj4D7WH0S
/k60pwf/VC4RxUsVBMUI4AyD1jPBH1hhcaiiu//PGrIbW+mlJuPSyWLOJKSJKLEQ
SlBcUQTzN50e375UrXLG1FqwYsiAnOSODnFJaeLBSQl9lCpu7+eqXHZKdDqki1CJ
v2hPg2Y4mi/M/j/Ai+nwUyNPm2S83AP61qRfcVg0IFpMiB6vrAg+agGG863j5agZ
JC0/AOsPIy1ldQsBmosTlUZBgFjfvCi/nn3ap6wgNh6TVXQXrbaafxuHyygcxEZM
nHXXqKpt/vjAav2XBTmvYwy3HAJe2/RbPmvwUdyoFSPdJUEuj1ReEWM73gKpAS9K
W8sGYacSlJjq2aqO57dm3NvLMfMHMQ==
=d+bW
-----END PGP SIGNATURE-----

--v7tgpdjpw3y6rsks--

