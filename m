Return-Path: <linux-gpio+bounces-7745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D619919F96
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 08:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39E09B21D82
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 06:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E7E3D982;
	Thu, 27 Jun 2024 06:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Yy/nypQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B53BB2E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471167; cv=none; b=BcdO287svGOrEjTTAQIzfm1uHVJBAkS0o3l9rsAlvalptD4fwNa80evNiYVpzc3Z4NER+BT0eXW/dfvZUBqC7cNNAGI80H6y0w4sZDAj5RbRDdy9oe/CzcB1O+Yq+wQhIagbbuXqH3giXjtcIvK8HLTVOxtjK5bYmnTKc9DA0Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471167; c=relaxed/simple;
	bh=iADA5e2bx1YDluIZn5+VR399Udq6ZrVy4Mf32NSBuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWY8mPOJ10MFJYowmRpL94TBZWhrZAtbC9TlLGvtjU4aHKA53RlfECYKEn6J+q0SQ+KYSs18SKZwqt33WJiqEbbCvpKNY8g2zFeyzII3JsnU2soDJ2qMVMgyt8QltC9cEU/XzO/sC9iuey7qA6okvAspJvlzzkhGXT+8S63wyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Yy/nypQh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d07f07a27so1288165a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 23:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719471164; x=1720075964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ms/cUmH/O2t0XouINBi6+IS/85WouIg6lT0ZWpSqnic=;
        b=Yy/nypQhvz1VPQUSLY94w/EQHPYrQ0W6/RR4gmaP68edql7BORXko4TsSF29HQrefQ
         6geVrrOyYe9FtON5694gWRKP781NxvuChSSr698QWO1eCv5pmh3APGCFqTJ2g9uN2i/7
         oe7SgSsSyKXV9G47bi99GEFWtUD+7aflF3hooVUH3IIsuVNW3MYA1qk5mD5SNFEQ9qKN
         SXMqcHVMcsb3b92wEZ/gW4bDOp9Spmwk0OSSrUkwHWg3VnVj2G5sOpUM1q963+RVuIwA
         wk+XOtsytLKDCtU4ezjOvZyKtMljotxWLVxDojeb1oLXGt+kulsyJ9OLUyZxo9VqqOlp
         w7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471164; x=1720075964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms/cUmH/O2t0XouINBi6+IS/85WouIg6lT0ZWpSqnic=;
        b=n/6nZA1M6Hc35l6cyai5mmaA5q1O1e1CNOevm85ZUOG8KR3R0kFV0wIL0aT3keFB81
         +ltZZZN4/u0KjmmRHXNMJUH5eZp1tfmHUV/zUfIM7fdZq6+ecwIBgR6FOmY1ryX3L5se
         szevmJMmxKRsF3xYJZV4Qypk1NnoYpfLRSIwtvfFlMzKGTOPIbaNNsFiRhEk84z0Ztk4
         Pc9Wsvx9ttUNbcOWUNyvN8DwSuZEIQT4RjZdS8Cr5swCTpBdY4kzmySeLlRalcfqs/bP
         X+qWC/Icg0Y1o7lU+Wgym2Ym/hdWaO8HCGKMxNC0lPFTjHr33k53mHDmnc/HFSAsNHFd
         txSw==
X-Forwarded-Encrypted: i=1; AJvYcCXOpg4TM2PPOl4TWcmQK6AFXjpxF47XXqrzTOzaZcLBCc4jYJgvLu+YxE5ik92qICH5dYzz2jRjAwQdomwg6uCOhW5AIRF3Qq66qg==
X-Gm-Message-State: AOJu0Yx0zR1E/vbvB8TwYlFNgorw0HeuYaljZgKKmXQBfJLgf31nNfox
	cCXncr3rkazE9r5bi7p5KHgSRDXjKJddMjYXfCq0Nw84EkwM5h5Nyehw4ebP8Po=
X-Google-Smtp-Source: AGHT+IF9xaEP7tkBb+5aSd2QHhMnb9VhzKEwv9ybERwT5f3jp+rE3EP81yWIer37PPUEjIEN1hYQTA==
X-Received: by 2002:a50:8e5c:0:b0:57d:3691:baf9 with SMTP id 4fb4d7f45d1cf-57d4bd8151bmr8522557a12.22.1719471163898;
        Wed, 26 Jun 2024 23:52:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d17b0292sm466844a12.50.2024.06.26.23.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:52:43 -0700 (PDT)
Date: Thu, 27 Jun 2024 08:52:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, andy.shevchenko@gmail.com, 
	Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Stefan Wahren <wahrenst@gmx.net>, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	Nicola Di Lieto <nicola.dilieto@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dhruva Gole <d-gole@ti.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v7 0/2] pwm: Add GPIO PWM driver
Message-ID: <oytpr6q3rmyj4n6ufktl5okg7ugusks5csgkg3zvs32b4jqh24@lmfovdemzi4y>
References: <20240604-pwm-gpio-v7-0-6b67cf60db92@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pp6rs6j5l4nvlrpn"
Content-Disposition: inline
In-Reply-To: <20240604-pwm-gpio-v7-0-6b67cf60db92@linaro.org>


--pp6rs6j5l4nvlrpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jun 04, 2024 at 11:00:39PM +0200, Linus Walleij wrote:
> Add a software PWM which toggles a GPIO from a high-resolution timer.
>=20
> Recent discussions in the Raspberry Pi community revealt that a lot
> of users still use MMIO userspace tools for GPIO access. One argument
> for this approach is the lack of a GPIO PWM kernel driver. So this
> series tries to fill this gap.
>=20
> This continues the work of Vincent Whitchurch [1], which is easier
> to read and more consequent by rejecting sleeping GPIOs than Nicola's
> approach [2]. It further takes over where Stefan Wahren left off.
>=20
> I have not looked into the interrupt storm problem mentioned in [3]
> but instead focused on some real-life tests:
>=20
> The IXP4xx NSLU2 has a speaker connected directly to a GPIO, and I
> wanted to use this patch to provide a proper beeper for the machine
> and not have to rely on custom hacks.
>=20
> I added a DTS patch like this:
>=20
> gpio_pwm: pwm {
>         #pwm-cells =3D <3>;
>         compatible =3D "pwm-gpio";
>         gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> };
>=20
> beeper {
>         compatible =3D "pwm-beeper";
>         pwms =3D <&gpio_pwm 0 1 0>;
>         beeper-hz =3D <1000>;
> };

Applied both patches to=20
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--pp6rs6j5l4nvlrpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ9DDEACgkQj4D7WH0S
/k4KZAgAtNWJdmwlEMhZOwvZcVKNbX7ry4oBUx913GFfdeUdWjjNByvUYeayfXke
iLuijeUhvcsPDtjB5+aKPZG2rUtaO5IUWiiYwMbpNktkzlvgHUzxLpP094FLT6Rg
JEWi7DmTuY6ko64jcu442XDdK3twsEoyUBefxZG4NNw74SIzaB/Q6w+UsKU2Ft0u
uUfBo8C/Pj5n6wOFooygWhGT+ApTVxpwlsL7T5UG3OsMLGWAvt86V8wpMLC1UIrB
Wzky3wLhfIszSNJMt643Cr1NApEYyu76AgtYiS81SZHoSWKKPZ8WhRM0w1fo4dmV
aE1My1jHPBKKIGFtYqfpxrLYv82i/w==
=0Ius
-----END PGP SIGNATURE-----

--pp6rs6j5l4nvlrpn--

