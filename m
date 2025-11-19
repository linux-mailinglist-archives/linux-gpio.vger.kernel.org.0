Return-Path: <linux-gpio+bounces-28804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B0C70415
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCC6B508593
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2499E369211;
	Wed, 19 Nov 2025 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AHXs3e/g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F2335063
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569751; cv=none; b=F9hLFQn1T8tgIgTaCme9qIZpAqcGK2sMiZWZ3yKd0XyFSd9sQThg8TvcrtbRbZoqSIKPYdV+PR0lL9ZOEtb+2k3Fxgu4R+M8gOfZm/g3eKa9mNZ18c4MzhbDhRM+UWYkXd9lh+FPoPlguVhwxQx/3dmqpCD4Ddr6HfvbcJaECZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569751; c=relaxed/simple;
	bh=6r79QLXYlyDvCyfHUeGlAL4yjWn51Ex6V0gBW9l5SNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bibYnRLYyGMp3YUjDs1m4QouTspXJVekr7PYkWFbckN0zAG46cDHfYzATg3pHD9L4Xu6F1JkNMPXQNbUdksLApyWQ0bZr4ULyobVyDccMxR4xzcO65hXNrO51+/z6yYffDqICaJXy5tNUTkQpqyOuFnWyrsVHlO1gHZRdaUkZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AHXs3e/g; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378e8d10494so90804311fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763569748; x=1764174548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8m8lS6jSW5nbHLHJawUmSvFPi8QtFsw/O9XwHZ3miw=;
        b=AHXs3e/gbeATM+61OoaQh/KK80IIwzmwrzwQgSAlHKwecHV9kEgoszoJqfs/S1HhXH
         z5Hv0/zgZSHuxymDyzcFLnKcPTQ0paP/vgSxPAXyqwOdG/oL8bElGDwo6l5lPwAafO3J
         XD7cxWkkeUqcQziRRIs7xwQgdgtHsI//u8hDEO2SnsjzjIpajQt+K1QeCo8LXbP9xvxM
         RQQEcskj2SvF6RDb1O0HOYGhIK/YcD5D/WWXFkZUep0YcUxgM19b0HKjWz70vhZersAq
         wG32nS9wf/osdSrMwasT/z0XrkZ2j68O3OQuEfv9y6CFpoUr7xgJOdWMeO/Kzcx/HPoP
         zyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569748; x=1764174548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8m8lS6jSW5nbHLHJawUmSvFPi8QtFsw/O9XwHZ3miw=;
        b=tafIkdDb2/Y7iqVdB1r6BcB0NGMMcUoZq93MmUqlLeFFs3M+ApE2M0IQg8fOeQOKnU
         4WdSACPG8KAshIDNyscCfBUiuVKXQ6EFeIoI22HT9gEGTpFW7OZ5/74DZ4piosKDGFKH
         uxpQp5jB6/a/L9TserCX9Enn9iA0B7P/P17y4wkv9r5oACkfyIiWwtxK2iSa3V7XA/2Q
         e0kEWgvMKRg4Xxoh+v6NfByyxvVE1GDbLDIZr0kKf3A+KGRUgPC4EkYspyy56mJ/nkQC
         QUM9mmdksY/E+pwtWo44QcFcORuYw57FmLo6bRos4B8ZRbcaBKbTydGR4N7tuc0q7YsZ
         QL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWZnkFsyzwLxHUiRWXaJFHmHVlvlEnnLK56eTCFueHQKXJUAeGk/zDTQr5jp14macMvBBGGJxpQbFjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5nK+fMmKhENA4iEj1GlRWRkrhgWF/DR4eLLgBGlSRWLmgQ7l/
	F9xAiQoC6eeKVtmbCrv1OJcc5PBV1SUlP/NM0+DipgQy2OZpkeJxPjHJ0lY99L9xA2SKOk+jC2S
	Ljto9EAYNej0FJnkfmxvYHIeMWaG5xGyamom/kFfCvQ==
X-Gm-Gg: ASbGnct36TZL91ToqSDAqQ4N0waU2epLV1530zzJP8RQ7k+iQ+qnCAP97GA3YMaX+mV
	QmDpjkM+ooH5yCCvir7M1Rih+D2n2g4b8EUKARbp52CWD4v0BDT4l83tx4SgD7gWVIEnUKxUPj4
	UNvB+L/FkB0OiiekcEtbFhn5p6aZGt/SR4GmpWjN8HoxdGnMe723PdLar+9nWba9zlrK/Hnj/OH
	nRdRyrHP+lnkoq7f2Iut1nzp24J7G9nLmrAXiqUtkORh4QgVjV14/pjyG+V0Kk4yQMugusDMMzc
	hEm7kjA9PyOoDzIHtJpn9bAxFoc=
X-Google-Smtp-Source: AGHT+IE2QD4vNSKtDl9s3gywRzN+MyS6IMs7+o3AgZ4a/bIhYSgI8wp5G8/PxTLo2z9TqHV+YnaSCd701MPH97DrpAI=
X-Received: by 2002:a05:651c:40db:b0:37b:aafa:5af6 with SMTP id
 38308e7fff4ca-37cc6794a3fmr108831fa.16.1763569747867; Wed, 19 Nov 2025
 08:29:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org>
 <20251119-cs42l43-gpio-lookup-v1-2-029b1d9e1843@linaro.org>
 <CAMRc=Md4jHrHxHUOM=eFuWRSaEO9jFEoHGTjEEJLj9w6E53gOA@mail.gmail.com> <aR3noZXxma9vOXEI@opensource.cirrus.com>
In-Reply-To: <aR3noZXxma9vOXEI@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 17:28:54 +0100
X-Gm-Features: AWmQ_blzP_C981ge0JD5PSwRAPxVinTRGKJse_DL2JrYXyTvS7IsFo-VaZxY2fY
Message-ID: <CAMRc=MdYJ0+yXziHB5ok40yUJMyYPKPt0K5COXDm3tM6dWqAJQ@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC 2/2] mfd: cs42l43: use GPIO machine lookup for cs-gpios
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:52=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Nov 19, 2025 at 04:35:07PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 19, 2025 at 4:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Currently the SPI driver sets up a software node referencing the GPIO
> > > controller exposing the chip-select GPIO but this node never gets
> > > attached to the actual GPIO provider. The lookup uses the weird way G=
PIO
> > > core performs the software node lookup by the swnode's name. We want =
to
> > > switch to a true firmware node lookup in GPIO core but without the tr=
ue
> > > link, this driver will break.
> > >
> > > We can't use software nodes as only one software node per device is
> > > allowed and the ACPI node the MFD device uses has a secondary node
> > > already attached.
> > >
> > > Let's switch to GPIO machine lookup instead.
> > >
> > > Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
> > > Reported-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > Closes: https://lore.kernel.org/all/aRyf7qDdHKABppP8@opensource.cirru=
s.com/
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >
> > > +static struct gpiod_lookup_table cs42l43_gpio_lookup =3D {
> > > +       .dev_id =3D "cs42l43-spi",
> > > +       .table =3D {
> > > +               GPIO_LOOKUP("cs42l43-pinctrl", 0, "cs", GPIO_ACTIVE_L=
OW),
> > > +               GPIO_LOOKUP(INIT_ERR_PTR(-ENOENT), 0, "cs", 0),
> >
> > I sent the wrong version, sorry. This should have been:
> >
> > GPIO_LOOKUP_IDX("cs42l43-pinctrl", 0, "cs", 0, GPIO_ACTIVE_LOW),
> > GPIO_LOOKUP_IDX(INIT_ERR_PTR(-ENOENT), 0, "cs", 1, 0),
> >
> > Charles: Can you fix it up yourself before testing?
>
> Yeah can do, but I am still very nervous about how this approach
> interacts with device tree and ACPI systems doing things
> normally. Is this also ignored if the firmware specifies the
> properties correctly? I feel like if we go this route I am going
> to have to bring up a few extra things to test on as its quite a
> big change.
>

The machine lookup always comes after the firmware node lookup. Even
after the secondary node. It's the last-ditch effort to find a match
actually.

> Apologies for the delay on my suggestion but something weird is
> happening deep in the swnode stuff and its taking me ages to peel
> back all the layers of in abstraction there. It seems something
> copies all the properties and somehow the fwnode I want doesn't
> make it through that process. But the basic idea is like:
>
> props =3D devm_kmemdup(priv->dev, cs42l43_cs_props,
>                      sizeof(cs42l43_cs_props), GFP_KERNEL);
> if (!props)
>         return -ENOMEM;
>
> args =3D devm_kmemdup(priv->dev, cs42l43_cs_refs,
>                     sizeof(cs42l43_cs_refs), GFP_KERNEL);
> if (!args)
>         return -ENOMEM;
>
> args[0].fwnode =3D fwnode;
> props->pointer =3D props;
>
> ie. As your patches add support for using the geniune firmware
> node just do so.
>

But do you have the firmware node at the time of doing the above? The
software node must first be registered with the swnode subsystem to
become an actual firmware node. Only then can you reference it by its
firmware node address.

Bart

