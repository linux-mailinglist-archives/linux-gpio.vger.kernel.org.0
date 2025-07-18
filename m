Return-Path: <linux-gpio+bounces-23502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B3B0AAE7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 21:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2384E169275
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 19:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B6B202F93;
	Fri, 18 Jul 2025 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CwHsqvg7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85583273FD
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752868740; cv=none; b=nPfpIXVJNhx02KyJ0kH9Ne/R73nbQHL3Vu9ZOYnB0JVRIEAXjpe7b3TVDIjTTeyIbuSz9sXrSicQCR+YjOH77KxdP7se+Gl6kJxtMGyg+9A6TWw8yi3+CyxcXWGSilHVUUIIuNNnQwjXiuOyZzjD8l7VaSIbFnGh+fzQkJtmlQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752868740; c=relaxed/simple;
	bh=ntRTCkdiLACtDDyxHl0JzZPk6ugxEpVRhEIHX4HyXsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJKawxj9FJDMTU6gX42zPWr23B/8Njx560APiKoJ8AYvMm8HR1eZpDraCCTNU0TSrHBw4hZyJfzEfaFQjsawQR4bzG8gPhwzf5bsTRHHuzc1ML1lcpeVYWLSeKPoapm2xFZaqbIChl1bA0HkKzFFpPbrfozEy07CNxjcLRLV7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CwHsqvg7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so4603222a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752868735; x=1753473535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TG/A8MD9h2Qm+mGXUoB5bwhbq1t5xQPNJH1ji2Dq7cQ=;
        b=CwHsqvg7lQ9UWbSemVDKfgYOf+19arHOjavsYOERHuSiiZpLMeSnX4XLlKojMGfNfL
         tVN1p004uW+lQlFrGDD/oJg5WF8gkZFX+vDN85uei+26neQmh0g2SPp2S4+yvg8vxHCM
         oFsjVRBFedB8tOlIE401tkLm6ngwqSsLApdSrsNnKo6REbkpRvFrTfQEx163HxcrVO18
         6rasjgGhp2ze79NJjnuxMlrNbsAKakoTHr+ALzCF6ijwCFJyDUmfuTBj9nDPRUtDnu+w
         3l8tfzpONU3S/7+TaDzkZQxRDBg8qpTiomK13pJae0hwvL9r9BL7YzOyi4pqlUwUgY5v
         vDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752868735; x=1753473535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG/A8MD9h2Qm+mGXUoB5bwhbq1t5xQPNJH1ji2Dq7cQ=;
        b=P3UMR5+3T8PiVHuez745VmdM47V52PlBx2jPAMl66ToIxMD6quyhYNQo9o3bKyQi88
         svYQtPY8AY4BZ3Zz3JlVoQw2Nb/TLL/vDbKyL8u+1/X4ScZI84rzcu8JTsG42ZDZW8am
         JFquYHp5heCQgMDjBm1C4jZGAQNn6Qo1PqU0wj5zlKE19ZILP108QLfaQfFz3pIQ34KF
         RhEdq0aWYcUjGQyJR0isDSPE0cD8gVAdw8f0ResR4hP8WjI1FfyaqjFLiaJw5poN8JoX
         qSYuQW76SJL96lxEw6FZp5fWzLG8FZzBejJ+2oeFz7EZGfur+WxcGaeSJDeKp87xoIJt
         L0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCV9WBZWBeMWwUbintwpsjqSJWbuQStWnej1QFSqzgy/XwDxTgkLbjsLT0JkIwUsnLbcjYRW/GCIW2Zg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jSK4o0xundz/Knt/2zAnZJMUk7X4tvbtDELheDrhQzDoMg7g
	g79mgwiawXwKzSXCNUJy98/4BoOI0XZJ4y0CtCDmkjtBw5cVK6U/HBl2/q6kKagEchs=
X-Gm-Gg: ASbGncuv/tO4Jg9AMBw4i5xevmiG/FQhiiauGwrhCShPpp6Qpo6rmhoBjiPaiYf8kk0
	GsKwtrh7W8piw9RhW9d3f0IYoeft9WAUS4/BlrmxLIuqlz1kBYwW55jqAyGd9HpYjJI9ZzfKDaS
	vTaELpL4i0lEC0E7GDFvM7j3NP2j8zvjsSgchUjZbXuA7CHzhcrpyobnA/+BjK15qjkkPk6RMV+
	XQI5PfMw4P28hqTL1YgOVGLzbUUQi+jCgJJSuk3xOWJ2u7FY+4wfk5AmKNPSbe7aMqifxLGkTEc
	f90pfIjysSybTVhQawgy9dlyVPP7zsXvndAbDsMfeuMf4JG4T00jdmZzEDhx6DxaR2LH3Ty08fW
	iMfSnxfCVeZ5FoZui8di9U/6gS8s=
X-Google-Smtp-Source: AGHT+IGZLmz3m5l0IF0Yg7TQTgu7wIO/R+HbeCFkO6tY9HA7GXMvUK7u4rtRvY6OYiVsxWmV3DbWYw==
X-Received: by 2002:a17:907:1c15:b0:ae0:685b:5e9f with SMTP id a640c23a62f3a-ae9cdd82e9fmr1255906666b.3.1752868734219;
        Fri, 18 Jul 2025 12:58:54 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aec6ca3005bsm172320166b.88.2025.07.18.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 12:58:52 -0700 (PDT)
Date: Fri, 18 Jul 2025 21:58:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Clemens Gruber <clemens.gruber@pqgruber.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pwm: Provide a gpio device for waveform drivers
Message-ID: <sjhu4c7yjwbkl4c56okpwpjtufdi245ok2j3nsssrqfsrpybpy@nsjr3wrydhnz>
References: <20250717151117.1828585-2-u.kleine-koenig@baylibre.com>
 <CAMRc=MdVLxBcH7EbVC_ce_V74W1+pLTX0js5__db1puVwwXAnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fomhupbbsnhnwfob"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdVLxBcH7EbVC_ce_V74W1+pLTX0js5__db1puVwwXAnw@mail.gmail.com>


--fomhupbbsnhnwfob
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: Provide a gpio device for waveform drivers
MIME-Version: 1.0

Hello Bartosz,

On Fri, Jul 18, 2025 at 10:24:35AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 17, 2025 at 5:11=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > @@ -2449,9 +2494,33 @@ int __pwmchip_add(struct pwm_chip *chip, struct =
module *owner)
> >         if (ret)
> >                 goto err_device_add;
> >
> > +       if (IS_ENABLED(CONFIG_PWM_PROVIDE_GPIO) && chip->ops->write_wav=
eform) {
> > +               struct device *parent =3D pwmchip_parent(chip);
> > +
> > +               chip->gpio =3D (typeof(chip->gpio)){
> > +                       .label =3D dev_name(parent),
> > +                       .parent =3D parent,
> > +                       .request =3D pwm_gpio_request,
> > +                       .free =3D pwm_gpio_free,
> > +                       .get_direction =3D pwm_gpio_get_direction,
> > +                       .set_rv =3D pwm_gpio_set,
> > +                       .base =3D -1,
> > +                       .ngpio =3D chip->npwm,
> > +                       .can_sleep =3D true,
> > +               };
>=20
> I would have probably just assigned each field separately and avoid
> the cast but it's your code so I don't have a strong opinion.

This is not a cast but an initializer. The nice side effect is that all
unmentioned struct members are default initialized, so there is no need
for an explicit memset(..., 0, ...);.
=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks
Uwe

--fomhupbbsnhnwfob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmh6p3cACgkQj4D7WH0S
/k7i6ggAsasseJwqk2bwjYrRTCy8aRkoGSy4ivEt5VlVtAzWnju2kTQ+ZHsX0EdK
4ZpUKvlY2BUEW+t05narXQp8U2cLNUbkH0lQRRgidu2zWuZw8+mPuaEnhGN1hPqo
diGMmomibe+2D25y7AX836MzltfVA0zHXYERqNWdK8iWKC3cMv5TrvABgrd4uOp3
P33BFHOSdJwPD7r7KO5AnMS+cRZnZ4F0u6tgEJJd8i5OyI4HtUol4kyYmJuBgtKQ
8l25SCvdTuCOfwiZwp/qnJEaA1DuhJpWLxIBOXaEXTqiyepvJr6CjW4Q0lP07Scf
w4+PzI7x6Rp77U/xlJ4aA/G4qkaYqw==
=LWCr
-----END PGP SIGNATURE-----

--fomhupbbsnhnwfob--

