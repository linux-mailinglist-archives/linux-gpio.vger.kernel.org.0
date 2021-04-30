Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D5436FA47
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhD3McO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbhD3McJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:09 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FE9C06138B
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:21 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u17so105083220ejk.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8aGJi1NqHUUqxfwnc8G8P5tzdBIe1FDGwMat5QhH2k=;
        b=VW21q59J8oGKtp/kvH8bedVKnXY48Vcyptd6saLdH5LnbmoV6uOVTDykxy0r61dDGI
         elP8kIUnWqEUP8z/VXrj+MABr50KZrEzaG6rBOVWgGYA3CrttYvzN1h/SpnZBRPdaC47
         lu2eb5rE/WpGjWDiKoJa7PL/L2JRm1Yorf/Xv+qJ3SUETusj9pmtOXy+lrr6oAtJnRXk
         7abshrdrgikzJZmpShDkYQww2yQhjYzmzpD0kOcYVq4mmu68MO3DU26xNL77WeudA8Bs
         2XlrB42XGmfOBoDpPG8VnRug0c5jCPy0SToP5wKZGRHmzBi8QSW1JjlwTCxgZ89ZNlgH
         IU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8aGJi1NqHUUqxfwnc8G8P5tzdBIe1FDGwMat5QhH2k=;
        b=S5zthcTVbK6NRcH3LxP5vlq3/azCQ8iujcjaseK8NPxCg9qGo5QtqdY8r1OGkro7YU
         NLqoIEQs2HTFARmpZvMyyK5foca9qULIAQxz4JM8RaFqs8HA26JmfJFkhOXWkonCfQBg
         i2F0E+IQR2cyCKCloUt3bfQ81caf5Jp811eZ7DRTL/u4M68H3/vtwE6e4DTnx9PLwzas
         52bnwc4kwGPwPR4XIpgWoyFZpTeHXUCN7q+BgKifWi6B/h35wASbjF6Desy9DrUrUB8c
         UKpGnzZX+YcDlNERN1gy9UXVJod1unMVGhLOPdcCVLUBqEdEYYDHxlnniJkhMYRZV+IQ
         u5/w==
X-Gm-Message-State: AOAM531Cg+LIj4+xIbXYWU70byOKht/GsH5BfG5pWBF96WFtMv3mV7b4
        dcX2CHTtgHaqjUm/nMX7UO7NBoCfUrTBj6bDNi3Arg==
X-Google-Smtp-Source: ABdhPJxJr0vhs0tjmo9vdtHrj1YjisYFoxifym173DRXFPnw3MKmW7UX8s1dN5xlGKH8nR6/ma6dwCo9G+xk9NK0tcg=
X-Received: by 2002:a17:906:4881:: with SMTP id v1mr3972211ejq.383.1619785879853;
 Fri, 30 Apr 2021 05:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210429094734.9585-1-brgl@bgdev.pl> <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com> <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
 <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
In-Reply-To: <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Apr 2021 14:31:09 +0200
Message-ID: <CAMRc=McD5CvF=ybpHRmD7Okh4xrKud_TrhdSnX5+j+Ea2yyp7Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling the
 gpio-sim module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 7:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 29, 2021 at 03:07:49PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 29, 2021 at 1:23 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Apr 29, 2021 at 11:47:33AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +/* We don't have mkdtempat()... :( */
> > >
> > > But we have tmpnam() / tmpnam_r(), why to reinvent it below?
> > >
> >
> > Because of this:
> >
> > $man tmpnam_r
> > ...
> > The created pathname has a directory prefix P_tmpdir.
> > ...
> >
> > And this:
> >
> > ./stdio.h:120:# define P_tmpdir "/tmp"
>
> Still you may advance the pointer by the length of P_tmpdir + 1.
>
> ...
>
> > > > +     for (i = 0; i < num_names; i++)
> > > > +             written += snprintf(buf + written, size - written,
> > > > +                                 "\"%s\", ", names[i] ?: "");
> > > > +     buf[size - 2] = '\0';
> > >
> > > Dunno if you can use asprintf() and actually replace NULL by "" in the original
> > > array. Ah, see you already using it somewhere else, why not here?
> > >
> >
> > Not sure what you mean, we can't use asprintf() to create a composite
> > string like what is needed here. Can you give me an example?
>
> I have got this after sending. Either you need to create a format string with
> va_args, or do it manually.
>
>

No can do, you can't create a va_list out of thin air.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
