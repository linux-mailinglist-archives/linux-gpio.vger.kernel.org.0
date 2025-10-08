Return-Path: <linux-gpio+bounces-26917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBA1BC6B05
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 23:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CBD919E151C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39892C0F76;
	Wed,  8 Oct 2025 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoWzoiGV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7C2C0267
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958921; cv=none; b=K166M29+TWByjR2DINysvJs6+zlXubXHVZ+CyssiMFsDVNDDSq3Etq6r1RmCAm8vu2drHbx6nXoF3Os9ny8S9CWCrBcd3TvF8GAfMBMa9DXT/+TwMvTWHXEfGeneTevP/9W/CPnUcFhDNtIHWHj4ugkg9uwypiJtXLG9ElwyTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958921; c=relaxed/simple;
	bh=gGodYYFxH+jsG0qCHPc7o14Eo5hulEOlNs8Wy5REovw=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPCguG5Prtkm5Aq1FT/d5Zr3cyAVBjdCDAIXObx9/hXlMw6lQtPzWxp7odKgjEU9/0lWl0WtGjD0PoTbZqWMb+gzGGZEaxiYR4rHZeWh4LG6xn+Qlr7bHXQ+MvZd2cq7dwCJYIACQ2b5ZY1keG8x00kWqcujenHhdp6o2lh+Yz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoWzoiGV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b41870fef44so44343466b.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 14:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759958918; x=1760563718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyfpjLrqJ6QlUqbfp6rN6SLKr9bkjhkOub121iG/VYQ=;
        b=AoWzoiGVVJArE8tafnylllnbZMD0dw+/QYBPZt1oXvZG7scAcVETRf7WdIw75p/i61
         qkjFjK+XvnDR3+CdD2B//oSKShDVFCdC55KbHxgHaNkGBX9yMOwODj3INAt3NL6gJpn6
         j/f4wKDgwt5lPHV5Z7XtqOjRRbJAR48ohmH3TczezWF5GIRmUQ0BeuwKrNV8nv+4FSHw
         P9cqA0onpvz3Zf5q6uur5ScfBDh5EHwYbySS8ELAu1SniKEDV67bv2iJ+EeDC/Xip3IY
         o0+oV+rLXgii75ErqCgzGeIJ8gW+8/sfxVlCfVV29fqNmVFd2njrajR9JzaPPQAEt+pG
         gwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958918; x=1760563718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyfpjLrqJ6QlUqbfp6rN6SLKr9bkjhkOub121iG/VYQ=;
        b=rZZmvQgeu/BB2UFySizaW48NAh5hy1YidfQz4MR+erV3Po0JmZAGS5gWHQBIzsmUyW
         Rb0qpiZqNp+9MdFJ2cH4qP4MmhkaMRAD8iK7OsabwCxQ0aDFTXkxLX3m3G4VBpXoL4UV
         q9FQgvkKK1BEysdB8Afy0Mhn4OIEv36cHQkX76zrELCOk+zvOfpiuywRt82Gv8JX5Vb0
         l+boQB44askjIEuGbbzIZsyfYX863PszVhlL6v0+QZVT+XyeAxTI4ocSOUfKp8Cq0yYo
         xSLKveUGYJ7g4WdzrbzLHcaxQpM5Cx3/CCXfF2Ip43JyRGTrgawqDkda2leaq/7H6JJp
         cImA==
X-Forwarded-Encrypted: i=1; AJvYcCUPZKEtEkuDx1lSSMiBayaN5OL2GfO3K/fIJYL30W7BAOM8focPFIaYIsJlP168V9oEXXIs7vJSM86I@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcUcZtC+ptXe5Ubcj3c+bSIVtB+AisVzC+aIez1dZP2fALMBJ
	JR7IyAPrasm6w5Bm2ZAYogyBHNesVZZQoQHuPjDWARcrXuOOK5r8n6Ln
X-Gm-Gg: ASbGncv5aEO1Ld0CQ166YG9fAvlU+hE3d6SElU/w/SZEpNw2d36zOZJfb7mtO/drs5h
	jnqG6xnIlYP3H8s/IMYk7QHpTOw9QDLW6CEK/gp8aCIk+cX//Iz5Oc1HSfftaJt8iL+/+egwqDh
	VO85bDX3tCA6/W0nkxIzCpSWRqLHJnjJwH1FPjsfM8fOwFRYVp9UXqjrBM4rByjj/nekUqoydHj
	Otq8WYzAPiiWHOyzkYfsqrJslBkw3ellTbwdrOl3oCA1D5CQCOzeoQoBLQrsBnqsfzUeSnmufdE
	lJ6DkEqThYwRIRRt4QmUEq2K/uehIOzMvihsBzwzjZg+mpmYqB+rx4HK0StKmIgV6qkjQfv6gW7
	1NUuYJTNWMdgBa9uqV2nSQnDbwmmblqQnE3TC4Gj8igRVqeUUisqGFzuv+lDgnUvSL6OMjZ2+2D
	aWY+IuN6qUaAjQKxg=
X-Google-Smtp-Source: AGHT+IGIeYcw6vOkpm/HcxGOq7wg2RMmJZSrQWTRzVpWF5ez02FhM8tPERcmmJnce5WqEl3AqtrZdg==
X-Received: by 2002:a17:907:3f1c:b0:b3d:4ab4:ea2f with SMTP id a640c23a62f3a-b50aaa96b1amr639860166b.19.1759958918110;
        Wed, 08 Oct 2025 14:28:38 -0700 (PDT)
Received: from [192.168.1.186] (2-229-167-183.ip197.fastwebnet.it. [2.229.167.183])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5007639379sm450116666b.48.2025.10.08.14.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 14:28:37 -0700 (PDT)
Date: Wed, 08 Oct 2025 23:28:31 +0200
From: Stefano Manni <stefano.manni@gmail.com>
Subject: Re: [PATCH v2] gpio: pisosr: read ngpios as U32
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-Id: <JZ0U3T.53FSIQ97H39F1@gmail.com>
In-Reply-To: <CAMRc=MdfjuSSsD=LWDpUroyf+fxC7jQrJDtZJtmj_YiQYQjAuw@mail.gmail.com>
References: <20250806091531.109861-1-stefano.manni@gmail.com>
	<CAMRc=MdfjuSSsD=LWDpUroyf+fxC7jQrJDtZJtmj_YiQYQjAuw@mail.gmail.com>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable



On lun, ago 11 2025 at 09:56:51 +02:00:00, Bartosz Golaszewski=20
<brgl@bgdev.pl> wrote:
> On Wed, Aug 6, 2025 at 9:17=E2=80=AFAM Stefano Manni=20
> <stefano.manni@gmail.com> wrote:
>>=20
>>  If of_property_read_u16() is used instead the value read
>>  is always zero.
>>=20
>=20
> Please state more clearly what the problem is. This sentence is quite=20
> garbled,


the value returned by of_property_read_u16() is always zero, if=20
of_property_read_u32()
is used instead , then the returned value is the right one contained in=20
the dts.


>=20
>>  Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
>>  ---
>>   drivers/gpio/gpio-pisosr.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>>  diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
>>  index a69b74866a13..2dc1b1e021d2 100644
>>  --- a/drivers/gpio/gpio-pisosr.c
>>  +++ b/drivers/gpio/gpio-pisosr.c
>>  @@ -117,6 +117,7 @@ static int pisosr_gpio_probe(struct spi_device=20
>> *spi)
>>   {
>>          struct device *dev =3D &spi->dev;
>>          struct pisosr_gpio *gpio;
>>  +       unsigned int ngpio;
>>          int ret;
>>=20
>>          gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
>>  @@ -125,8 +126,11 @@ static int pisosr_gpio_probe(struct spi_device=20
>> *spi)
>>=20
>>          gpio->chip =3D template_chip;
>>          gpio->chip.parent =3D dev;
>>  -       of_property_read_u16(dev->of_node, "ngpios",=20
>> &gpio->chip.ngpio);
>>=20
>>  +       if (of_property_read_u32(dev->of_node, "ngpios", &ngpio))
>>  +               ngpio =3D DEFAULT_NGPIO;
>>  +
>=20
> If you're touching this, can you switch to using generic device
> properties instead?
>=20

what do you mean with "generic device properties"?

Best,
Stefano
>>=20



