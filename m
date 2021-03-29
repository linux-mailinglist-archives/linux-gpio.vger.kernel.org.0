Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E048C34D29B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 16:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhC2OmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhC2Olx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 10:41:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF27C061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:41:53 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso5273383pjh.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UPKoS9uw8tobjv3T8N+Aey6YZCH5StIDHrujW/uL/Aw=;
        b=uyF0aWiCu2YG9qotf0yBvKdSFAZ7e7Cp5uVwovIHkn1KclZ+IB4qhau73wswETgpYj
         o/6Vzt/xFh1cjAW09UvZogrxW82CzdcN2o3BuZcFvzLE2dTRjPrasZ3LxDmD5MPq1Fbn
         V92loGD/2fDNNetbUp4IQIa4t5zPxwsiA4W7cDy9goQFmfXjSCTjCo/KtpuVyp+CNOoZ
         sDD1Zyts9r7S7yUnMw3X4c5LJ9xYis4vhPGyfARUyp8Iil7Tdkbcde2Ha+M0fERCe3eb
         Pyk2km1nTQKW2aa0ntqEPfO2won4mvaNG4/XsDD+OC5LsVSVllsErHv8zUcVMa6DgL5x
         B47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UPKoS9uw8tobjv3T8N+Aey6YZCH5StIDHrujW/uL/Aw=;
        b=kUGGG1GCe37K5RCQLr6aXiixZEDB87bUnG04iP4kCDfDwl/FCV4yzWU3U6d1D0qfPz
         AAIU7EZi4CAos1Lye1fR7qzbegymgD0rJ4qCyvNP833qRT3a7oFaGgcZms1sUJXsFY3x
         fgGYB8podS7yyi75FMlFrjGoo4XtnVtavd8eBe8f//Do7IsbKmJQNuMwAMwXgpGqb7ie
         REjFhZUxKyQQ3wBvBNA6pU5+cLdmvuwTeZVlyDkkfZV0V4u3/pyGckEVTHTsiljjP1c3
         qc5yc5jAbmqbyxwhde3/PXalpYcpzosNzYkZG/BeXb2Ky+mRexC2qXLkgcdrxCVix4KQ
         3+qg==
X-Gm-Message-State: AOAM5302Lj2MVtqjIgzUOT6IfWIjxHf8dIJDdPcLA+UtEhsENwGBthRz
        +zwDPRozL7FMVE1giasNjk9Hf8oUO2EfBY4+eU4=
X-Google-Smtp-Source: ABdhPJyjp200+6EfUx6yLTH5Fq66OsduYSGDyysDYg7CCNfmUa+y0ZhU94t2EtCtedgMoVJRtkCKMwhHL2F7pWyCsyo=
X-Received: by 2002:a17:902:7883:b029:e7:32bd:6b97 with SMTP id
 q3-20020a1709027883b02900e732bd6b97mr16580301pll.0.1617028912644; Mon, 29 Mar
 2021 07:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VfFfJ8g-mHSneNbk4ujDdTbfu3CypSY_e106+3jhS6SWA@mail.gmail.com>
 <CACRpkdY_uNpeg9Y6k0NeKPxV14Nd3rJ1faFtrKs-16PZ8=boGg@mail.gmail.com> <CAHp75Ve584UmwG6EWVewcp8N49yXPEp2hMCidVnRzS-g9JHrWQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve584UmwG6EWVewcp8N49yXPEp2hMCidVnRzS-g9JHrWQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 17:41:36 +0300
Message-ID: <CAHp75Vey813Y=P6c2qOp6gCqYNqxKwappnS7EEfL0nwLZ0XaNg@mail.gmail.com>
Subject: Re: gpio_is_valid()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 5:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Mar 29, 2021 at 4:31 PM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> >
> > On Mon, Mar 29, 2021 at 12:50 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > Anybody to shed a light why we have two stubs of gpio_is_valid() and
> > > one actual declaration?
> > > % git grep -n -w gpio_is_valid -- include/
> > > include/asm-generic/gpio.h:44:static inline bool gpio_is_valid(int nu=
mber)
> > > include/asm-generic/gpio.h:143:static inline bool gpio_is_valid(int n=
umber)
> > > include/linux/gpio.h:109:static inline bool gpio_is_valid(int number)
> >
> > Remnants from "generic GPIO" where some custom platform would have
> > a custom implementation (and semantic!) while using the same
> > API.
> >
> > include/linux/gpio.h:109 - this is just a stub !CONFIG_GPIOLIB
> >
> > include/asm-generic/gpio.h:44 - this one is used if CONFIG_GPIOLIB
> >
> > This is for all "normal" GPIO providers and consumers, end of
> > story.
> >
> > include/asm-generic/gpio.h:143 - this one is used of !CONFIG_GPIOLIB
> > but only <asm/gpio.h> is included, meaning the system has a
> > private implementation of the symbols, not those from GPIOLIB.
>
> Aha, thanks for elaboration!
>
> > It makes sense if you realize there are GPIO drivers that only include
> > <asm/gpio.h> and does not include <linux/gpio.h>. But I wonder if
> > there still are? (Unfortunately I think so, used to be some weird archs
> > and some minor ARM systems.)
>
> The files so far that include asm/gpio.h
>
> Documentation/translations/zh_CN/gpio.txt
> drivers/gpio/Kconfig
> include/asm-generic/gpio.h
> include/linux/gpio.h

Another list (asm-generic/gpio.h)

Documentation/translations/zh_CN/gpio.txt:477:<asm/gpio.h> =E5=8C=85=E5=90=
=AB
<asm-generic/gpio.h>=EF=BC=8C=E5=90=8C=E6=97=B6=E5=AE=9A=E4=B9=89=E4=B8=89=
=E4=B8=AA=E6=96=B9=E6=B3=95:
MAINTAINERS:7631:F:     include/asm-generic/gpio.h
arch/arm/include/asm/gpio.h:10:#include <asm-generic/gpio.h>
arch/m68k/include/asm/mcfgpio.h:12:#include <asm-generic/gpio.h>
arch/sh/include/asm/gpio.h:19:#include <asm-generic/gpio.h>
drivers/gpio/gpio-davinci.c:26:#include <asm-generic/gpio.h>
drivers/pinctrl/core.c:31:#include <asm-generic/gpio.h>
include/linux/gpio.h:62:#include <asm-generic/gpio.h>

> > Generic GPIO was probably not a very good idea, I think at the time
> > it was a compromise for making custom implementations migrate
> > to the generic implementation over time.
> >
> > I think it is actually gone now! We can probably delete:
> > arch/arm/include/asm/gpio.h
> > include/asm-generic/gpio.h
> >
> > And just move the remaining stubs into <linux/gpio.h>.
> >
> > Interested in the job or should I take a stab at it? :D
>
> I think it's you who understands the area better.
> I missed (I hope *fortunately*) the legacy GPIO APIs.
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
With Best Regards,
Andy Shevchenko
