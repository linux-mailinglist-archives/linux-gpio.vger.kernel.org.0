Return-Path: <linux-gpio+bounces-13054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0C9CFF38
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2024 15:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CEC6283DF0
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2024 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB04EF507;
	Sat, 16 Nov 2024 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TPv1o90m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF6B652
	for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2024 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731766548; cv=none; b=tO6H+CXnTudgUb1zEnr5wQyMT7ANLbB8+BzmWj3YQz3dvZySUGdtzaJL5ttOxG++Q1pVYm899vTRBLCcMWZLeOANr/pikKXgs/XQtMxFBTsTjncGO9fOLkneEmgUSrGNQxdxeujHuTMjPcUNFWm5eqQQs0fJnbAXofb3xJYKH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731766548; c=relaxed/simple;
	bh=5j1vzKdF9fCOcO/7Qkl2bCjDXNlLsKT1+KFEouFPQ84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBfTFXPm3zZL8XodPpY05J1CaRbXjxMhSlSXh0vRdE2daKgujg3S75IkP7z+YdV4ttezvEet9yOA47PUSsBCybxDwIkv1E8JAmTWQhAB970uad2EOi4i4uIXoI+Piu12bcbmxIz2YjBM6emdEcCXB+rCkGfPramja+tCAwoJsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TPv1o90m; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so28505931fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2024 06:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731766545; x=1732371345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZKiEzXyBqTkKJOXK3eor4NyYrvR8ocfk9WVUz7zMvk=;
        b=TPv1o90mG1fNa6pdzEhMIIoGfSgKp8rEuayqDrFoR/hnBWlR8FGv9s0JgR1HLsV94m
         hXofzbibVYpEwug5iIfHxDRjYq3Dmd2e7ZNcAbgQp8sws2wIzJH4aTWPK7BO+gE3FkWM
         +cK4MWF/S68xsyO8IGSx5Rc0vTyjTHqMpmDTlDTp3RxxTanXfrASGoj78GNbtMZnWRA8
         BWb6/w/ZmZeJx0Aj7fj6jfNVk8bgIvpfXu4hbc/oc1FFIdcyBo2PiTMQ7BrTabrsUz9m
         kCLwmuCnCN1g+7PrfSNSDRruqjjH/FhL2UZ6zZLB+ReheSE1/VpqsUhk1VrLnuaYX4KB
         Tjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731766545; x=1732371345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZKiEzXyBqTkKJOXK3eor4NyYrvR8ocfk9WVUz7zMvk=;
        b=Q3pQpan/jHjoOaAlFljFzAd6CsO8aOSJUCGy8D7hzMVbubq6XSn0caJzA1ZjJbydhL
         KOHHYB2iaVd1MWxB5/MCbbbNbVkNUdPlTH480SfKpyAZ3zY3KFGvIBDX7XGRugrzSrP8
         5NnQ1qcF0qmnr+CKLgnM1KaYVaLBBk/xCCY8K/Z6MoHvLps7tE6B8znUBkqTDDrn1WTR
         O2Zg+g6iJpfBP7hVw+a2xHqULnZh7KEMPELkCUd4ZdVDHcVKDZPq1Kf0UBw4UOQTwzK3
         NnaBG2iR+v6jDRzH/gypqzg/TI/KqCw2ZPrMAgcK1BIdYJ6X65Ge5H59ZSVcoQFj4e5l
         ARjA==
X-Gm-Message-State: AOJu0YyTDCg6ce/IUi4UGvGMY+EwuUJ8cFCYwtBgGreBSwgWwbco8hkD
	CR4RS93BDWLQumdsf4t60+IeB38OTiViTTvWkruZObgjyi8Qv5RJGaguHQHhcvjlfZ1Tia0mY5K
	oNR/zqEq/6zLbOs+QAntVBPmA3eLctZVrDZxaNg==
X-Google-Smtp-Source: AGHT+IF58Dv2+B3SK6aaDUY2qQpArsmlRbPhf9boKeLjAPR0QFaxn8hYh7EQXQDYY0n+RNQknMNdkOl0OZSnap3m5ck=
X-Received: by 2002:a2e:be88:0:b0:2fb:4994:b31a with SMTP id
 38308e7fff4ca-2ff6092090amr29912831fa.8.1731766544968; Sat, 16 Nov 2024
 06:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115123028.3904126-1-andriy.shevchenko@linux.intel.com> <CAMRc=MfF=jrJNMcJ=yBPp_=atEt+isrJEDUwgx6gaBeQP+H=hQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfF=jrJNMcJ=yBPp_=atEt+isrJEDUwgx6gaBeQP+H=hQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 16 Nov 2024 15:15:33 +0100
Message-ID: <CAMRc=MeJi5KosBqZMqRm1QcThp9NBYQW=ufeZODjebWBeuMX6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: altera: Add missed base and label initialisations
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mun Yew Tham <mun.yew.tham@intel.com>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 3:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Fri, Nov 15, 2024 at 1:30=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > During conversion driver to modern APIs the base field initial value
> > of the GPIO chip was moved from -1 to 0, which triggers a warning.
> > Add missed base initialisation as it was in the original code.
> >
> > Also initialise the GPIO chip label correctly.
> >
> > Fixes: 50dded8d9d62 ("gpio: altera: Drop legacy-of-mm-gpiochip.h header=
")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >
> > Can be folded into the mentioned change, up to you and sorry for missin=
g
> > these in the first place.
> >
> >  drivers/gpio/gpio-altera.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
> > index 039fef26546e..73e660c5e38a 100644
> > --- a/drivers/gpio/gpio-altera.c
> > +++ b/drivers/gpio/gpio-altera.c
> > @@ -261,6 +261,11 @@ static int altera_gpio_probe(struct platform_devic=
e *pdev)
> >         altera_gc->gc.set               =3D altera_gpio_set;
> >         altera_gc->gc.owner             =3D THIS_MODULE;
> >         altera_gc->gc.parent            =3D &pdev->dev;
> > +       altera_gc->gc.base              =3D -1;
>
> This does in fact fix commit 50dded8d9d62 ("gpio: altera: Drop
> legacy-of-mm-gpiochip.h header") and should go together with it
> upstream.
>
> > +
> > +       altera_gc->gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%pfw",=
 dev_fwnode(dev));
> > +       if (!altera_gc->gc.label)
> > +               return -ENOMEM;
>
> This is a separate thing and I would argue it's not even a fix per se.
> Lack of label doesn't make it entirely impossible to use the chip. I'm
> willing to send it as a fix but please make it a separate commit as it
> doesn't fix anything from 50dded8d9d62.
>
> The commit message for it could also use some explanation why it's
> better to set label (so that the chip will not figure as "unknown" in
> the kernel).
>
> Bart

Ah scratch that... of_mm_gpiochip_add_data() would set the label from
the OF node's name.

In that case this can be a single commit but please explain it better
in the commit message to avoid confusion. Say what happened and why we
need to set the label in the driver now.

Bart

>
> >
> >         altera_gc->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(altera_gc->regs))
> > --
> > 2.43.0.rc1.1336.g36b5255a03ac
> >

