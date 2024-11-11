Return-Path: <linux-gpio+bounces-12819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8FB9C3BCA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 11:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F30A5B21A16
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AB1178368;
	Mon, 11 Nov 2024 10:21:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7016DEAA;
	Mon, 11 Nov 2024 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731320493; cv=none; b=dh5f1LZ5/JXYpPTHYE/TJoHcb60cXOh7Tmd6B6ysdQHBLYl0a1l+qX9quBpKEp3wv0MN6J0zkCpm1IHVrBX8gJU1JPoNqohOT4xjUb+scZZX6xHk83Uygj4iOTVwrn8wkJgHArWKZhNyD5EqRsDMCFvTJRe/hbuR4DQK4XpctRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731320493; c=relaxed/simple;
	bh=KdiGJu18JwQkumaQM+w3BP2/Lc/VQeBEoG4u7PY69rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7/KeZu7yR1cgjVEU9U7Kn3NPKw4fFj4Z//mjVclUEferYEjJ2sh6dBAesmAQ6O6YiUHBkBVMlS9NO07i9DV7Flg+xvkapcRYDpMd61c58NC9IY9ZSOFaJetzbIA0KLOj0x1dtfqlhzEfYrBJoHAJYmLbxmsHa0YdIAKfb51EzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e30cef4ac5dso3936248276.0;
        Mon, 11 Nov 2024 02:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731320489; x=1731925289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaEOyMbaVWJTZKa+Sq5zT53vxz01/13ANVZcLosS5Ms=;
        b=jDLJdejJlY/6TA84nbZD3l/s0gzRKm0hcQQ9+3+G52CdqJ5ooCb33SEn9rM7+e9Fdt
         Mv9dkCkmws8olzvZPMJfW1glQdUf3lLAM7TsnU2GB5AT9/ENYdlvinPhfU8SK4P7ZBqU
         7K/51gFH6Se/B4zEkwNiXB9Q2lIgsEMlAbrajDkQzJv8Le8ESgf2lG8SxVUD8f1J6A83
         QcjFJ6lKnM06VJ8nF5oEj6yrQ1ycjQXAadW6HlAvUryThQrf4T5g6YtZCvPwG4gydcUd
         XDfiBxy0Y+8cYqP73+mQYxh+zC6MN5gvVkaSXdoUj6YEAD7bauoIPiMutiywzTQ5OFye
         xJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsaqAplziFITNFej7hFdoyH6nykbhloKirUfC//J4zrR9ctbvaztniPf8yZ9sP0nmV1E0pA9+1IDMQ@vger.kernel.org, AJvYcCWNlJtk7TIjBs5Ztv6mkuF/Pt9MOu98ZGwbiBh8XYy8KYCtdWzBgf8XyrD/EdS7orunNk2AX6/dyycA++8=@vger.kernel.org, AJvYcCWT2zgFSQdv30cFZnLDxI4RPdRkMpVTHoXjiQC/F/4QxkTh9kK1Q09RWtIyvGSe/K5sR99F/6Hko0e23EMD@vger.kernel.org, AJvYcCXV6/K1GHa/hcYSYDoVI1a7GqT7iW3QF1X0JOQgbiLIcRsNamuS6nv0gaSpcPVhDTSrOwcErlmbflC2jw==@vger.kernel.org, AJvYcCXZuwiM6mjOLIxaGf6Y46ljofms6tmgoh6KmpuFAx4i+PWwfR410wHNmIC5aHANkoS/HORkXkeUkCYH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+VKP4OMA53sUX1F2xtTMIrBf3vl0Zn5Micv4J00AkxMEOTUf
	NrU0i5ZXjIs0ib0TT5vGoLqUoZIyZJ4lSW2sh/txrPXS1MfDAwF0Qi9SsyGG
X-Google-Smtp-Source: AGHT+IH8py6XlkejS5DyRf+Z0e9sH7h9872vwc0BFnIf+3PeS1F4vKD44G6pnKQ65kR4Jc0vAdUO4g==
X-Received: by 2002:a05:690c:4d83:b0:6e5:a4d6:e544 with SMTP id 00721157ae682-6eadddb5d23mr114054677b3.24.1731320488964;
        Mon, 11 Nov 2024 02:21:28 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8ef432sm19515317b3.33.2024.11.11.02.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:21:28 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e333af0f528so3915956276.3;
        Mon, 11 Nov 2024 02:21:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI5bc8AoeoLZys7+iNnSC82DVSlYIWfU0RfrQBzdfhO0bF4kQVxsP5QT6eJxKkD0EtmPYDgE4wd7FATQ==@vger.kernel.org, AJvYcCUajA/u1aaYhXtdfvYlJIQqllqCjcgt9xLPTMrFRz+APXo+Kh1Dr1F0oud7QvXQi3rl2/nF0D8/d0L4@vger.kernel.org, AJvYcCWtoAbKrh0McsRLstayYKZU22LEe6LX2qcrFnVP+avGUtr3cJO+q4eoKOJ9RqGlrse5Nwl+fjfIFwXt@vger.kernel.org, AJvYcCXXkY3twezjs+O+Tu7BvQlUn+EGbYrcqV7BHZN+QL+vCImfZ9Cx5M+5BuiZLH8lVtmTvcZWH0GsXMnYn50=@vger.kernel.org, AJvYcCXxGMlN/X2f/wjwLWbyjaEy9cU/26+kQHIl2L569vOJlPOCjepc/VqHrGBJcvNFuDu27B+FKYdjMF7z1J/Y@vger.kernel.org
X-Received: by 2002:a05:690c:6288:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6eaddf6f2cemr115795827b3.31.1731320487426; Mon, 11 Nov 2024
 02:21:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com> <ZzHU4absCxcA1FBG@smile.fi.intel.com>
In-Reply-To: <ZzHU4absCxcA1FBG@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2024 11:21:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsjfSCcdVQee6tFgvs6PDB+iKWd964XhHKmF9WRDHWkA@mail.gmail.com>
Message-ID: <CAMuHMdVsjfSCcdVQee6tFgvs6PDB+iKWd964XhHKmF9WRDHWkA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Nov 11, 2024 at 10:57=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Nov 11, 2024 at 10:45:13AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 4, 2024 at 10:37=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > -       if (template->active_low)
> > > -               flags |=3D GPIOF_ACTIVE_LOW;
> > > -
> > > -       ret =3D devm_gpio_request_one(dev, template->gpio, flags,
> > > +       ret =3D devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_=
INIT_LOW,
> > >                                     template->name);
> >
> > Just wondering, as I am not 100% sure: can this change change the
> > initial state of the GPIO?
>
> You probably wonder how ACTIVE_LOW affects the OUT_INIT_LOW given above.
> I have an answer to you, however I might be mistaken as well, but I spent=
 some
> time to investigate.
>
> The above mentioned call ends up in the gpiod_direction_output_raw_commit=
() which
> uses the value (low in this case) as an absolute value. It does not inclu=
de the
> ACTIVE_LOW in the value calculations. Hence, setting ACTIVE_LOW before or=
 afterwards
> has no effect on the existing flow.
>
> If you notice a mistake, please elaborate this, so I can fix the approach=
!

Thanks, I had discovered the same, but wanted to double-check!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

