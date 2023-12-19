Return-Path: <linux-gpio+bounces-1676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F162B81911C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 20:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 871C11F24FF7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 19:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428383985A;
	Tue, 19 Dec 2023 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eYU2FaM+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44939AC2
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4b6d350c08cso457487e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 11:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703015963; x=1703620763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8swe0gsGN1VXMnDDt28Qx6YlgpS3MXdmYePrb5BE1U=;
        b=eYU2FaM+6Nq4qkhtSl0VsJv3RPEYpDbRJxaBPtT7iJVJuc8QEwmKJhBsri45xt9oRx
         GUyL1Yw95/5OxUt1R1uQhmrmh4MspsKlgopCeTwPcI/O3RJqBfFESQSLzrN/e6X1gHPA
         u3nqHvf0D4ItjzBderSARqzrTdq7KPQu3c4LA1JcUSfpVPF4pA8PROZGAj3pJ/FYNfzd
         NklulfLbQ6QJvBSHJ/THPHplMP6pnjCn22MtnIV+MLZclg09RWA7sgHMlmfZbthTD2aB
         bvxBW/PgdbPqgqJEQfNGxJyc42r3fb4Wnt0e5iuGklEzqPwFfMghR0k53ijmmKYNTXMk
         AdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703015963; x=1703620763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8swe0gsGN1VXMnDDt28Qx6YlgpS3MXdmYePrb5BE1U=;
        b=ZZmDTQMQOVdkD+56gEEvU4Kex9fStKViEzyNnhGGwz/8vNMK06yukjrC/VtmG4ax+T
         7ZyYs1jWBvwPZyW+fUxXRAXaOJkH/LY3qnUFOzHiNS0+Eh1yHeG7kVnC0devMkSMdNuT
         /HuS/63pXq8LQhXIUoOM24kfmBB1DqetnZVgHS4/jRewUAyUb+ycviOMc9fhIoMA4QDm
         BUxdkzZJbrdChjXMe+DusOiWY3LwiFQBDvXLCOyo1ULv666fxVvAz10B9F01RBtSW2YJ
         uN3mLQtv9VscX/ii6y+Gc1R0pVCC33LppbXPitSh//58LvLPB6M2swl4lhSM4jwNFMxA
         0vTg==
X-Gm-Message-State: AOJu0Yxb9lA9Mc4g26f9DnayEqtH8lRzxrpQ2lLBB/Rbj1HnmlEDw3Qf
	E9zrPdKpDCU0AyWVnu+Mu5QY4c+LtRoa2qCVkQPVyIgaO2D7nSey
X-Google-Smtp-Source: AGHT+IG3wjnpkELQchJ+MkFF9rGv53jg8iuO8Y5RcLJW42vNtu7FCVnM76+vxGWFRh2vT4ReLWkkUN+0uSW3CgFod1Q=
X-Received: by 2002:a05:6122:469f:b0:4b6:e2a0:bc1a with SMTP id
 di31-20020a056122469f00b004b6e2a0bc1amr1404980vkb.13.1703015963507; Tue, 19
 Dec 2023 11:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219142323.28929-1-brgl@bgdev.pl> <ZYGxefhI9UpwknhD@smile.fi.intel.com>
In-Reply-To: <ZYGxefhI9UpwknhD@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Dec 2023 20:59:12 +0100
Message-ID: <CAMRc=MfqYAYsjdPNrc2u7NDuUVdaA4NcE3vMevhSUmZOtc14CQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: drop tabs from local variable declarations
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 4:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Dec 19, 2023 at 03:23:22PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Older code has an annoying habit of putting tabs between the type and t=
he
> > name of the variable. This doesn't really add to readability and newer
> > code doesn't do it so make the entire file consistent.
> >
> > While at it: convert 'unsigned' to 'unsigned int'.
>
> Not a big change to be a burden for backporting I suppose.
> Code wise looks good to me,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +     struct gpio_chip *gc =3D desc->gdev->chip;
> > +     int ret;
> > +     unsigned long flags;
> > +     unsigned int offset;
>
> I'm wondering if you can make it reversed xmas tree order.
> This will make it even more consistent between functions.
>

Sure but we'd have to update all functions across gpiolib.c. Let's
take it one thing at a time.

Bart

> ...
>
> > +     bool ret =3D false;
> > +     unsigned long flags;
> > +     struct gpio_chip *gc;
>
> Ditto.
>
> ...
>
> > +     struct gpio_chip *gc =3D gdev->chip;
> > +     struct gpio_desc *desc;
>
> (okay with above, but...)
>
> > +     unsigned int gpio =3D gdev->base;
>
> > +     int value;
>
> Ditto.
>
> > +     bool is_out;
> > +     bool is_irq;
> > +     bool active_low;
>
> And ditto.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

