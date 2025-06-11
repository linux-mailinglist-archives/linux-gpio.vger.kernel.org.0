Return-Path: <linux-gpio+bounces-21406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4BAD5A56
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 17:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4031A16836D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEA21A238F;
	Wed, 11 Jun 2025 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz4gC06+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51F1991B8;
	Wed, 11 Jun 2025 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655388; cv=none; b=C+0wAkotHFv0rnqW0IHnysxmwXV42BrEWtSBDXGVaTqRJzTuJ7qd8E2OgxtbuEkyizrj4GloQL97MJ7Ihl1csYoUtDBNOTdQr0glY7LXGmc2wE40558JO2sTTqv7F9oK222YkUJAUhLdwooPD6XvdqfC6sDev/HSr0n+CmS1I+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655388; c=relaxed/simple;
	bh=OcFx0OPiyVtSIEok0hOGBDNb+WaSxUqfVYCf+tXb+sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQhLMqDBDnJ10QJ3jn7mUjjsWtvEfaJjcrLZLomPqihXvtqewkTBeDNIdK0rQ1gSDVvM3+ZmTtB50TOTF7xxVsOujllw23D952xF24ZrBeCxTE15xq8h6n2Er0qWhQ2lTov3CNqPwXr9176/cvQIPxM05SGAbaAe3lI4j3IgTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz4gC06+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45024721cbdso58621865e9.2;
        Wed, 11 Jun 2025 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749655385; x=1750260185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ltahiKvsCCzMEDlcxd6cs8qre5FafzSYn4Is2Jfei0=;
        b=gz4gC06+bqrZ7B2yaa5DI7ggS/BADS7DmkQ+2hckN0mhEIuDQzSXWARt6o2Itk8RDN
         NIc8gk5to/Zj7XlGec566kSeozIMF4JdcK2thfpY9IJ+xsArW1zQGd5LYwrXvt4McwhK
         +/tE8Dmx+sQxyG2S5kAyoY5uLx07SI4qOHPpX/nCdE0h44U1aCRTLKsN8O19QNrA3FHa
         lVkK/SoaF3Br2Zyp9JY8ctYVnC/Ynio9lVf3zVY9NHmpzZmYMLOeRzuiUU3PaWg4JjIv
         cI1JN9rfz+9EdsDFWeVqJLCKQOnhSCaa/Gp+/yDGDMdgh6HyfyTb6eAxLdu3CS+YZFlF
         a5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655385; x=1750260185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ltahiKvsCCzMEDlcxd6cs8qre5FafzSYn4Is2Jfei0=;
        b=JULv/GjdeuMOd3EpSyq2RqpuJejD9neQcdEBOA0/ujrC10uZgGcjc+bWpen0XXhHIa
         k7NgvhL8Mna8YOlgJEyHtZTckA9MbEu+UKUOiT9UzXm0JTf9Cu6s0fMH+eG8CBjzPUV6
         tOfzk/rTTdgMwaoS2kdbp89xqIcqg1tk1apbS+ChF7URx9OJcN+nuT4ZTP7YgaxcaDVk
         yyQ+bPJnvlbnPNe9n9ZCI/R11DzHe5xDAgfxxjscQEIwq4ZpxLNV7/eKJoV9unyVTNli
         HhdRPMi5UMxStKhOiBjMP8uGk1ACW7LOLdWXl1d6bZkACzcGpOyghfp0ZtVfe+1Bv5EN
         34xw==
X-Forwarded-Encrypted: i=1; AJvYcCVWkknOGz/lteDk2dAKFgc5lnJf2EOSCP+C1+ieYAwxfcrgQcz+9o7EAA9GQWHU/r82hcjUHuw1gkuHPw==@vger.kernel.org, AJvYcCVfG8CcDKIQEskGQ8BbGPGuG2Nk8KurIjQCFJMLouiPIG4VDBXlY0UB5syxl1R9dazcEWJBg+25IXPgpHvs@vger.kernel.org, AJvYcCW/Hlsi6yOBkYT6smGAPBAc/UuQTfipXpIL2Y3EfaAQb3C+C6JLY9OUtGr3RdCd+5hkXgm/wNvcp3pnc7Y=@vger.kernel.org, AJvYcCXYBMTfJOil5UudVLZUv3UBZc/yMep0OWqbLm1Od+Ga8swi10tAdGyVjIqf/GExKgtAHSAGyhd2TqwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNeJLjppZbobiM0kO9uPWVxeXVgcP3wJYLWGyJUp0ozQKoB1A
	AWaWCziGJ4+vYYZGQ6VRkJR9LkZjSDPRUZQJ+l9b63U5gZOWifZnj1k5
X-Gm-Gg: ASbGnctz2MoyGjaTfhuVdIS/wZnTQnwFHHP8VJ9YzEg6quUVzWmP5TS7vJHOG+Kwb3D
	rfmmVtG7bP4aNUImexelcY7TCcsG6rEGYbqn8tFMXHdIoqr04IJpXrW+7cNbz4s5J+X3NItEsNA
	KqTI8U8Ljmu/2HNAw9wK32wAI9zY8prosncJiFMQKnzMoC6KGa6Ia1LV7Tvn74Ka7l5i4JDvDZ6
	V3S+BzWy6N0FmjF7/2VAq17p2TTXttBqSBH5n0lyG4oRssMDA+8nkBtgrNOHy34KEKCZjfbxPiD
	b4fip3WvHsBQVV37cFaXYWPWSr8YsXgcSBB6wIRZvEqGfzqBzOI2SccUuyt7UuSVPH6G8x9qJxn
	SkCBYnu9eL6ICpIOKF3mFxFDVN/dGhoI5ZA3fynGwlohYAMd5
X-Google-Smtp-Source: AGHT+IHphyA66Q8e/eqXWCCxRS7ufKANsxLIZgpVR0wE0Sof8sTOrzgXgFeYQw9TKFI2q0StLBmzRw==
X-Received: by 2002:a05:600c:384a:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-453248cc53dmr34170825e9.27.1749655385355;
        Wed, 11 Jun 2025 08:23:05 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322a9bbdsm15345101f8f.21.2025.06.11.08.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:23:02 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:23:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
Message-ID: <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com>
 <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="onb3f7hrvum6ompk"
Content-Disposition: inline
In-Reply-To: <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>


--onb3f7hrvum6ompk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 08:58:49AM +0200, Linus Walleij wrote:
> On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Thierry Reding
> <thierry.reding@gmail.com> wrote:
>=20
> > One thing that's not clear from this patch set is whether we actually
> > need the Tegra186 pinmux driver, or you're only adding it because it
> > happens to be present in a 5.10 downstream driver. Do you actually have
> > a requirement for setting pins dynamically at runtime? Do you need to be
> > able to set a static configuration at boot that can't be set using some
> > earlier bootloader/firmware mechanism?
>=20
> Actually, speaking as the maintainer of pin control I hear the following
> a lot:
>=20
> - We don't need pin control, the BIOS/firmware deals with it
> - We don't need runtime pin control, the BIOS/firmware deals
>   with it
> - We don't need runtime pin control, static set-up should be
>   enough
>=20
> These are all enthusiastic estimates, but in practice, for any
> successful SoC we always need pin control. Either the BIOS
> firmware authors got things wrong or made errors (bugs) and
> there is no path to upgrade the firmware safely, or runtime
> usecases appear that no-one ever thought about.
>=20
> Aarons case looks like that latter.

This was a long time ago now, but I have a vague recollection about
hardware engineers telling software engineers that muxing pins
dynamically at runtime wasn't safe for all pins and hence we had to
do static configuration during early boot.

But then along came devkits with expansion headers and then people
started using scripts to mux pins to the right functions and such.

> I think it'd be wise to send the message to any SoC system
> architects (or Linux base port overseer or whatever title
> this person may have) that a pin control driver is usually
> needed.
>=20
> The SCMI people heard the message and have added pin
> control into the specification for that firmware interface.

I'd agree with you that there's plenty of evidence that we need these
drivers, so maybe I need to go back and look at what exactly the risks
are that come with this and maybe there's something we need to do to
avoid that (I'm thinking along the lines of certain pins being generally
safe to mux at runtime, but not all).

Thierry

--onb3f7hrvum6ompk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJn1QACgkQ3SOs138+
s6GsmA/+OwAKGK0M2/en1lm7TGWqxLGsE8YlgXUYMiZ+7OKWTh4CK4+LNtH9m1dE
JGIcn0qjUuD4ZNDiMUC3bVjRnMfdfOnRI9nmlIl2iWt0qI63CMX0d3UA+lK3gaK8
hlhdex8sVMoxWQ2ugaJ323buKfiRQS9oMajS4rqchWrIjIkTfAPEPo7lNQteNBUu
ImTlSKCoaIzLtXfE6l0sTZEgNxpmvyG8hcXMcSnxtckG7OlTsmmRULisS6/uUNSr
VJuKIdy+/l6DdJPQ0VUggr+JklCIF0jHPEhrQFOsNGGvAIE8y4+KU1ipKaRU3mUx
1YxBxjl9PhHjuFLEkQBX9cLXMG292thP9dlVHO/vBH9Abexam8zbG7Nei3zGelTV
MMGRf1fBQ8oVSz+1/0bGsoQDYYH+GkVID7eGALr1pqe9drqqGOhNIXGx1XScH1U9
TcAWekoyvcs2l9K4n5GYS+KFP/Xn/RSteDxWBjcsEj4t7Qirse1tHMUtuLAbkAp4
OLbN7og0Uy0ojmCFQy0nuBxYOnf/YuOuGGesEAZgVqhxGa+vIdjVQlSrivt1kJP4
Q+5ROiP7eGJh/iT6fKPPfT09qrkvtpvhPkcSAV4aOm4NX/rkqQHsJkGzaPu6PKb6
M2xQzREVtnOWIeHrsPwd59ErgUk0CglXQEyMHJYaOtvNt5gnoTE=
=LcNM
-----END PGP SIGNATURE-----

--onb3f7hrvum6ompk--

