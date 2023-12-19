Return-Path: <linux-gpio+bounces-1677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE0819132
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 21:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CF611F25283
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 20:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1C63986C;
	Tue, 19 Dec 2023 20:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xoNqS7HV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8B39AC7
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 20:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d9fa8f6535so1791787a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 12:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703016394; x=1703621194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd0KZBzXX17A+4/4irqRuXit/iogRnCS0NnRs3EEDHo=;
        b=xoNqS7HVBdRXZpkDdhHeS691VakqGzQloHEFA4QUhOPQG1LjdS53o9yb+Zt2/geuk4
         6dWhi3A1YDNVTph2fZ+hHX2BIaP8hSw4gbfle2taDa0OWDUv6GQ84JLIK4N8wGkm2vmC
         bRP0iWYb/Wv5jrehBnHuGHw8SBd2wEhKDs0EF649czBMAMuHpDnTlibUNHaiSOa6dgJT
         KH2iZZDmYGE3arI1js9JIVN4MjnDF/O/W2WOhw5+mTDS9OHTC8L+u3vwlQ2qx6okxB/X
         Gjzjd6hoxnpki+LRaON27r4UV7PEweLJjvmGi8sYFXwui2/T86JVwY9GDP1Xk5sRWwUJ
         Jfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703016394; x=1703621194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd0KZBzXX17A+4/4irqRuXit/iogRnCS0NnRs3EEDHo=;
        b=EiPTvf3pNhxp1zEacH/ilzbnFLuDcqmqcQDEFwcs/2RRgRvdtiHJIteggxRp63Mjbt
         ht5l7dlV2a8S8JJb0doWG0rzJEACM3rXZq86Lqrmdl+eu1UotOVS9wxs6gWraLvvlVSK
         aqovHUdEL/fc5DZlQLJJZJwbPGRLTJy84Sg/noiG09/hcPcQ3syqjTi3+9Ku4+fgyHUf
         p9pBR50J1jwaaS7HZQZd85OITkgj3t6uXrpyBO1JAY9nHEucgueDGOhyD+iGS+IXY2i5
         R/4BKlPcma4LkrnRndWu6PhtckAXw699NKXPUgb6xvopIMwMbtVEA9xp2R3aJNya2fD0
         XNLQ==
X-Gm-Message-State: AOJu0YxshYGBFQBd40Bferj01Jda8sngOWrEk7BI6HxEU1K+XRwSUhyZ
	bLKlde8JxmQcya2+b+RKMrGz8Cr8A4v4XYx2teS1vQ==
X-Google-Smtp-Source: AGHT+IES6LrX2oJ1Fleh9OkH9OogE9k0GI4dX/Xlq4YUnHZ12ZGidqUuEuQ6tvfgcJWgRKy7QbSS7FFYO6XhIiZ4yGc=
X-Received: by 2002:a9d:7849:0:b0:6da:2ec0:c964 with SMTP id
 c9-20020a9d7849000000b006da2ec0c964mr7643237otm.8.1703016394809; Tue, 19 Dec
 2023 12:06:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219142323.28929-1-brgl@bgdev.pl> <20231219142323.28929-2-brgl@bgdev.pl>
 <ZYGxwgkngL2c5KE3@smile.fi.intel.com>
In-Reply-To: <ZYGxwgkngL2c5KE3@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Dec 2023 21:06:24 +0100
Message-ID: <CAMRc=MfD4AyurZO2LkFpM_4nwJbOdPubMwCR9fkgpk87F0TyHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sysfs: drop tabs from local variable declarations
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 4:07=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Dec 19, 2023 at 03:23:23PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Older code has an annoying habit of putting tabs between the type and t=
he
> > name of the variable. This doesn't really add to readability and newer
> > code doesn't do it so make the entire file consistent.
>
> Besides similar comments as per previous patch, see below.
>
> ...
>
> > +     struct gpiod_data *data =3D dev_get_drvdata(dev);
> > +     struct gpio_desc *desc =3D data->desc;
> >       int                     status =3D 0;
> >       unsigned int            flags =3D data->irq_flags;
>
> ???
>
> ...
>
> > +     struct gpio_device *gdev;
> > +     struct gpiod_data *data;
> >       unsigned long           flags;
> >       int                     status;
> >       const char              *ioname =3D NULL;
>
> ???
>

Thanks, should have not trusted my regex blindly.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

