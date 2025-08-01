Return-Path: <linux-gpio+bounces-23932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB9B17F6E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870DC1777DC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929322A7E6;
	Fri,  1 Aug 2025 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZggZVA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF419228C9D;
	Fri,  1 Aug 2025 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040960; cv=none; b=Fo78SpnzzmCNv9FGPsi7pyX9BaOgLU7Otjy4ODW0kmu2NtaE+JySpmLr4MA9EVCv8XSwdA92Ep0QnHhN0vzUI4oGzd2odu9l+G9Oiaq6I1igFUlFx8Y4jh2u7urJMhch5WtBq2xkVrgMYoy8Up3xUb7xvNB04qBxpAxihvnQbnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040960; c=relaxed/simple;
	bh=63+Ixi4ckuMma+HuIR/Djmfai08XglpZMQ9ULfkEgmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAg8F/PhT5biiLvA4MewcQTUkhqO9atKv61EWKnLUxf2hOv2FHacM4LPf1PlzRzq7EQfcdf4QQ5vY0qUGHeg5wRE8YWbEAIp6phIcIim+bs/PDzKVrMZuZ6F9eu5W5Gm4D2UrDHcuoLIcqL4/SPBYVdto4LnON+qV9cxQWIEyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZggZVA9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b77673fd78so849832f8f.0;
        Fri, 01 Aug 2025 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754040957; x=1754645757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63+Ixi4ckuMma+HuIR/Djmfai08XglpZMQ9ULfkEgmA=;
        b=KZggZVA92ZI2nanL3n8kLEJvTzkIgcHHLy4vaNzCbBRBTp5oM3c0BNZyqhQXFsp1f5
         jE7BWZkYZChWziD1Tvbwf2GWyBZR62ZgeYQ6uUV0Dv+oqKWiH9+u560aIzeJrDC56H3m
         RjHg8jjiGfyINbemWfD7FOvt+YZpBSrK3spY3J4D8jC2E+4PxRj0lOpfAYLMQI7GyBX4
         G7r51VPTUgNAE4dx3/U5HQ7J2C/pvaxzjaa2XomZnpsGP62gh8PQ3ralhuJ8CTbuX5eR
         i8IHg2WjBAaD08Dz94LxXbyYvvER32vkES6WSQW87EzgAdOwCjdnoPZGHIiZ19Ux2Lw3
         EMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040957; x=1754645757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63+Ixi4ckuMma+HuIR/Djmfai08XglpZMQ9ULfkEgmA=;
        b=ExJ7lmy4kOQ4s6tpg6cQQd8n29Ye3ZGzO2NtgSo217PH+P7kG2R4dcia/1TV8ZjJw3
         XNkzhWh6UwBX78J1vLHOMIfFm+O5BTUxpGYuLQdFY7+x+YWJIUk4a+EGr24yceS5bfUP
         F6s+akImlkz2O2anOtfFL2cE/6q8oLkDvwa9pMQrqAICMNN9KFHaGvFsE9P4kFoib49e
         nO1DihcjGfw9QcDqfSMdhDm7RN38uiqwRPsbkCOKBD1hEC0xKo/cwy6IoVEFH+uslYCX
         cGVWJcq75+meys6RZQV0bySEPmIkcvoZS/BIQ8INL4rT6IEpRthiR7S3R07dbZcA3FtU
         zG3w==
X-Forwarded-Encrypted: i=1; AJvYcCUHcDPIY5wc2TYXzKM8aXjeD02P3SFUqH8FPC/QIYu7gyOfuHX7f9UjizbCkQZVaYaaf4/Kplbpaf/7c1w=@vger.kernel.org, AJvYcCUqBw648sUdqa7olubm4WPiePZKAUxwBObl7vR4HBLoFg7823DrUe8OgttrolHWVlah2SSjcBi+AMpebIaV@vger.kernel.org, AJvYcCVEWd+8KUD6OeqgzumcKu463A3sMQ9WVvzno5LxW9aRqI8RMjTmEk6E1Q1TCwU1BkIchJJROmleYWjr@vger.kernel.org, AJvYcCVGBQ1gbt+z4AP7EPgk/JlFomTN19wUHeFL+DzxgBaM4RwAxjGuabCLgqfLcZkrWzqHs0Eh93bkXEOVkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrwKrCrkUUOcfBbRxFIy5bE3NgJR+iGBVa7woTjL8urt2nfw6
	Nq0X39ZV7ko49/m2avFCDmKP9fhCaaRAyl2dq2DmCa//SXdH/Stq4D+4
X-Gm-Gg: ASbGncs9XJAZ5w3qb/OeBlZQonjjjRBUTLSZKvt0GO0kxSQWHkKVasAXJpxdawD8q38
	MYqqzQY5BmcpzROFFb7V3yz/G+JaKe5/tEO+xKYweA2+m1OD2lCokCT0OsrVvxsln82xjhIq9iM
	/2lSZs9jlDgElWOLl3hTIpVe48P0RIXdyEweE8b+HMfzgZuZ6qikI+Pm4/5VPqOcBINv2ZLmSTS
	741p9771HxwHEzZQJGp4j7fNkkJLW8OwptilDxGlQuUhlCNMn/jQZ+aE79C4DMUuBhEruA060rM
	SNG4yjyc4h+znSoNikqbfLWdC2fq4mTrfSWC9qjOrvTmrzqctdC1Ni2Kg7Z+UspLBnmW03iiZRO
	lTyqynNBcZQVD+yvhdojdfqcHeri1zMCWZXvNfJZhUUtAbAh1UgIQ7fqdCeejw7/SVyikYjJFR8
	qERom5Mgh22xdVxrHf2vI=
X-Google-Smtp-Source: AGHT+IEzT4QuTnS+opylwWwJ8ZFtEhpWVGV493HDhdtwWSkvwRk079L725rbuM+nKLoxjSQ7k7xhGg==
X-Received: by 2002:a05:6000:220d:b0:3a5:8a09:70b7 with SMTP id ffacd0b85a97d-3b8d348e65amr1831729f8f.38.1754040956756;
        Fri, 01 Aug 2025 02:35:56 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47c516sm5284172f8f.62.2025.08.01.02.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:35:55 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:35:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
Message-ID: <ofym7vi5wudw2agh4ydgvxvw5vlptncouz57dm4c5ervixc5rj@bq5afsmhzpuz>
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com>
 <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
 <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
 <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>
 <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub>
 <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com>
 <CACRpkdbLzAJS=iqgOEzE9kD-fM9tx22JTDPgQeLwbTFKiStrtw@mail.gmail.com>
 <CALHNRZ_1_WeUrfqUiOTsy3cEkwm2k7nj+4hA-7xZFgoA+DZKjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o43wulfghexnnu4w"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_1_WeUrfqUiOTsy3cEkwm2k7nj+4hA-7xZFgoA+DZKjg@mail.gmail.com>


--o43wulfghexnnu4w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
MIME-Version: 1.0

On Fri, Aug 01, 2025 at 01:33:10AM -0500, Aaron Kling wrote:
> On Wed, Jul 23, 2025 at 6:08=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Mon, Jul 14, 2025 at 7:45=E2=80=AFAM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> >
> > > I started looking at the pinmux scripts a few days ago, but updating
> > > the pinmux driver import/export for the t194 style spiderwebbed out of
> > > control quickly. I expected it to be hairy, but that was an
> > > underestimation. Doesn't help that I'm not the most proficient at
> > > python either. I'll continue the effort later, but if someone with
> > > more familiarity wants to try, it might be quicker.
> >
> > If this means people with 186 dev boards cannot use mainline
> > Linux and they would if this driver was applied, maybe we need
> > to apply it anyways?
>=20
> I wouldn't call t186 unusable without it. The devkits work fine
> without kernel pinmuxing as the bootloader configures everything to a
> reasonable default. It's only if something non-standard (for example,
> an audio codec) is plugged into one of the expansion headers that
> runtime configuration could be needed. However, I do agree that it
> would be worthwhile to move this forward for merging. Since it is
> unlikely I will get the generation script to a usable state soon. If
> Thierry or one of the other tegra maintainers agrees, I can start
> addressing the review comments and send a new revision.

Alright then. Looks like we can't find anybody willing to work on those
scripts and it sounds like I'm one of very few that thinks there's still
some worth to them in this day.

Can you make a pass over the driver and make sure we have sufficient
spacing (last time I looked the various tables in this driver were all
very clustered together, so a few blank lines here and there would go a
long way to make things more readable), consistent indentation and such?

Thanks,
Thierry

--o43wulfghexnnu4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMinkACgkQ3SOs138+
s6GkFxAAjngJguKpmN35lTqVwxregbkYYA5/xmvpDzqsIaNYfbZIvLUI5OivXlBL
m2JwklBPSyhP8ziXUGJcwim2xVWxordoaAn1fHAvVEJ3WAtt2/NkuCtDzF4dr63i
VVnQWLmwfbmuWBAyJCNCgfKUXqp7er3SUaqNV9fujQcCJKJkKbZWr+11PCciF2Sg
A6uMLXsjLhdqV+1m0xhqQWgskogW/wAwHWUS1WeVfdVEaWnF0LD8Xs68RW3iivcv
DVMV90ZSQaQaYIEK2okTenqh4OCIHMAyUjwhx5tvIwIZ6USwulDLHZoJ56ZrCDoY
MuXqqZMTEy9U3ONaXo2FU9WRAVxT5zqN4ViaRyJ9dRoED0lNCY/JqFe4sf11QVFU
lMbimTJgVBsQALz9F8mr6Afaw1SnO8AHtl6ZVlr3zzpbPyo9XaDcapquXZcsGzMM
LftAGY83vrATV5mX8wEeanDTVUr3OuVCATdBJx1n7A0Ls239JRzHjU5moN47qTLW
rrvDt4gpHKiBX90ZwERuYxR8qRpDjP8exQ7tUVujATQLFPwkGSS29qi8FK8t7h1f
DWUJ1JNZkToGW/Vy8gQIEGpY+aRoLK2UlsMpOjnQpawC16W/onAyg6sSp0YF8apg
Qq6vlggy0GEvO11GELaeIjQ9CnQiUdvXnLEWceMDoy6UFEudY78=
=mx0Q
-----END PGP SIGNATURE-----

--o43wulfghexnnu4w--

