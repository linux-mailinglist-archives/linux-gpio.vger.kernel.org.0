Return-Path: <linux-gpio+bounces-3238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F321B853031
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 13:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD511F24F08
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 12:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F66E39FF0;
	Tue, 13 Feb 2024 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Oljei40v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCD2BB16
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707826029; cv=none; b=VEmiGU8K4B/suxmcUaTYkuklGCyqaMCssD8TrFk/VCNsv1jBkggJrbJNrGRsNdk9ZAKWVnRQKKs/H9DyLmV+SlXkjwsiCGN5bc+apWKYSYmRHoL0wHQ7+CyVDPid/LewiOGELFFTjRsnoSi6vVm2LgjFqecB5GPaonxFdUCJj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707826029; c=relaxed/simple;
	bh=Qacbe6nnq42TjOQZ8W75zFXquUf5Ax5AzQtqrUDIzDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlTqP4c6+wjzfJ6ya4D/yxMwWiDbGEL+/4kReNPaTi+EoO+mf3LRGEMXeSekgL/1TlAd2VxUo+YfjlijnLR4TOGOMNSEGgOWDb3lTumkU7fXnYG4yo5dHd9h1ZkDBB5Ib+riq1zGtcXu9Tjxm/IALLwm2HFW6mlV/DAOgf4KKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Oljei40v; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d2940ad0e1so2479986241.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 04:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707826025; x=1708430825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xSZkssqdpw0zwkJS9ZRDE+eT6ZfWXMlKeiZHUnJryQ=;
        b=Oljei40viU/J36pXVVuh7rsjzIuQcxE0tDZzV3VpLJxa3VwxL2UWVhzrpZ/haDt9E8
         JJYz6wBi9R4TdgtaPU8w3Z2sbv/ytSjhU7UOv6SgM3NKXlt7iJcuxhrodudHPOqk7Ewm
         zh28jO4qXpbSka/BDzoHD0V+AiwtFlFQgGw+tvzwSJnnNn8dnL3b5FSnYmQNwksIKvAP
         viTnyqjsDcVEswyab1D5RS3S2NUokvf0phowlpibCLJ8aWT0KYOsiy4/XqZB0gj7n6uN
         T9/f7AU/DfshlqqOwJdpXEk17xMcjuzrxBJzN5zVKZmttuIfCLcdygO+TA2aL52WYSNl
         te7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707826025; x=1708430825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xSZkssqdpw0zwkJS9ZRDE+eT6ZfWXMlKeiZHUnJryQ=;
        b=u04kKbckZhb1v3TbrX4edlo8O+H4ojkJohKmEzH2jtqMxeu0UNs4jtqEvK5AR7dHIc
         qUIJHrGU+XC/77bgRLWnUq6kswL+1O6jmDRBmApEe+b8/UijvR5O8WfeOnuRpoI2iRgv
         jbe9cC7n8jFGo6m9VCUy65ZExkCwZFswf9QTA1sMqcB/6SFd1h9OeDddEU2of6bhEZft
         cVCYDrIXhXi8WYsyaGHWaWzHblwry3VelsEk3t8GK7x3iv75ZI+0Ctxtk8DcAPqJQ/0v
         gwxiLGnKxZvPby1+lGOwVaONCo6AJryWL4qmN8F+WLB/J31vVMFHgTRPReuR/YUj1UOP
         1Ssw==
X-Gm-Message-State: AOJu0YzzMGjh0NvhCfvJQA6JdLd4UH54SeCsTDdpOucX1p6wWZbFfoHS
	vyoDXDXnep1vYTXL/qQiWKYFn/e5XUHuMuJ2qkz6PSoNbprGRm4pNZM/kt1nL7MzPy/0KdhnRan
	aEXu5kDFLSPupPrxziDdSYFbd5y19e304aieSEQ==
X-Google-Smtp-Source: AGHT+IGvrl0RhX+KlbLySmGyh3kISik7DnEHSduuYrE3AFZ92atwN4H0Xb/pAigL3W4OFk/oNaCSQM5DWsnD6RtLZhc=
X-Received: by 2002:a1f:6602:0:b0:4c0:23bd:1f0d with SMTP id
 a2-20020a1f6602000000b004c023bd1f0dmr5468056vkc.15.1707826024544; Tue, 13 Feb
 2024 04:07:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213093108.13922-1-brgl@bgdev.pl> <20240213093108.13922-4-brgl@bgdev.pl>
 <6139b738-3013-45fa-a192-92b9abaa4b78@paulmck-laptop>
In-Reply-To: <6139b738-3013-45fa-a192-92b9abaa4b78@paulmck-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Feb 2024 13:06:53 +0100
Message-ID: <CAMRc=MfS90PjZAgO4W_ia77LbNoPqB5npf-C+Gze=xOjuEctBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: use rcu_dereference_protected() to make lockdep happy
To: paulmck@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 1:03=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Tue, Feb 13, 2024 at 10:31:08AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Lockdep with CONFIG_PROVE_RCU enabled reports false positives about
> > suspicious rcu_dereference() usage. Let's silence it by using
> > rcu_dereference_protected().
> >
> > Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_de=
vice with SRCU")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202402122234.d85cca9b-lkp@intel.=
com
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpiolib.c | 12 ++++++++----
> >  drivers/gpio/gpiolib.h |  4 +++-
> >  2 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index c1391a9a0af6..d7503376b918 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -109,7 +109,8 @@ const char *gpiod_get_label(struct gpio_desc *desc)
> >               return "interrupt";
> >
> >       return test_bit(FLAG_REQUESTED, &flags) ?
> > -                     rcu_dereference(desc->label) : NULL;
> > +                     rcu_dereference_protected(desc->label,
> > +                                     lockdep_is_held(&desc->srcu)) : N=
ULL;
>
> Why not this instead?
>
> > +                     srcu_dereference(desc->label, &desc->srcu) : NULL=
;
>
> And similarly for the rest of the changes.
>

Ah, I missed this one. Thanks, I'll use it.

For patch 1/3 in this series - should I stick with
rcu_access_pointer() or is it better to use srcu_dereference here as
well?

Bart

>                                                         Thanx, Paul
>
> >  }
> >
> >  static int desc_set_label(struct gpio_desc *desc, const char *label)
> > @@ -2978,7 +2979,8 @@ static int gpiod_get_raw_value_commit(const struc=
t gpio_desc *desc)
> >
> >       guard(srcu)(&gdev->srcu);
> >
> > -     gc =3D rcu_dereference(gdev->chip);
> > +     gc =3D rcu_dereference_protected(gdev->chip,
> > +                                    lockdep_is_held(&gdev->srcu));
> >       if (!gc)
> >               return -ENODEV;
> >
> > @@ -3012,7 +3014,8 @@ static bool gpio_device_chip_cmp(struct gpio_devi=
ce *gdev, struct gpio_chip *gc)
> >  {
> >       guard(srcu)(&gdev->srcu);
> >
> > -     return gc =3D=3D rcu_dereference(gdev->chip);
> > +     return gc =3D=3D rcu_dereference_protected(gdev->chip,
> > +                                            lockdep_is_held(&gdev->src=
u));
> >  }
> >
> >  int gpiod_get_array_value_complex(bool raw, bool can_sleep,
> > @@ -3593,7 +3596,8 @@ int gpiod_to_irq(const struct gpio_desc *desc)
> >       gdev =3D desc->gdev;
> >       /* FIXME Cannot use gpio_chip_guard due to const desc. */
> >       guard(srcu)(&gdev->srcu);
> > -     gc =3D rcu_dereference(gdev->chip);
> > +     gc =3D rcu_dereference_protected(gdev->chip,
> > +                                    lockdep_is_held(&gdev->srcu));
> >       if (!gc)
> >               return -ENODEV;
> >
> > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > index 07443d26cbca..a857848b8955 100644
> > --- a/drivers/gpio/gpiolib.h
> > +++ b/drivers/gpio/gpiolib.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/err.h>
> >  #include <linux/gpio/consumer.h> /* for enum gpiod_flags */
> >  #include <linux/gpio/driver.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/module.h>
> >  #include <linux/notifier.h>
> >  #include <linux/srcu.h>
> > @@ -202,7 +203,8 @@ DEFINE_CLASS(gpio_chip_guard,
> >
> >               _guard.gdev =3D desc->gdev;
> >               _guard.idx =3D srcu_read_lock(&_guard.gdev->srcu);
> > -             _guard.gc =3D rcu_dereference(_guard.gdev->chip);
> > +             _guard.gc =3D rcu_dereference_protected(_guard.gdev->chip=
,
> > +                                     lockdep_is_held(&_guard.gdev->src=
u));
> >
> >               _guard;
> >            }),
> > --
> > 2.40.1
> >

