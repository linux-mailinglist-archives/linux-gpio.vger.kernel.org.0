Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7BA401995
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 12:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbhIFKRM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 06:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241728AbhIFKRM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 06:17:12 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72882C061575;
        Mon,  6 Sep 2021 03:16:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g22so8814454edy.12;
        Mon, 06 Sep 2021 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=oo2xWBhFucxQhgfCJPJat37DS4B52WhmbBtOKiTxJic=;
        b=B9i+FFaL+D8vW6JzaIvpiMpQLI5G6NuCqRABbmuyN9Go+TPC077khQtAC2bumJiYdD
         YQEYetWy3pRZQdkqviEFHgyMW37viZyEKkuGccUHVwzD8zE/fXEtFNLTsuofwQOvTOCk
         /6sv2RsXeQTHzc1+40h5z0hrYmC5SL+hlO1BKFLFdtg/CtMLZFa06buv4+xT4n35SQ1O
         GJP0T6kQSNKwlNobt+fUSf+0+FSZfy0LegUe8uHgXzDvUoBvsU8xtTN+Mb88zHIBnqnO
         msdqp1LPFV0X8oHdupo7PiujDfyG6z56IABPyFw+nPCyY6otkfAc/ErxL+vC0A+3Yu4r
         bi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=oo2xWBhFucxQhgfCJPJat37DS4B52WhmbBtOKiTxJic=;
        b=afuvZgwboLSDzepqN2mFuQALmOZ9dDbnX4OA9WYq2HeCRYyCDfaXY9NVP5rr+sNlJf
         JDH5UL/0gw6pgSh2sWCdUtZh8282lNBatbFyLo0g4Xr1uod5nH4imGuzlHGUNs9D3o59
         7NQWCUY9yVnRq5IOQikRAxKJkv7HMH6D3GxW4W0t4PZ9KbugacjJ5DcsHjUeSyPhWJYB
         uuIi/9aorbTHmtUt6mJZzRGRr7u3gTnoPkjuGCFz+IOoZsITBVK5zOEdv3jMoMbw2Da1
         mTAgKrC8McuW8ywr3OCHZx8mMtoyhg/aIExMTnQ6PVUbef24pyXaIPxjjTpbDjm05qrN
         jx5A==
X-Gm-Message-State: AOAM531BQCUj+TuN2wvJuSxRkEJ4WjDfuS8aK2pdWP4zbTsKxtFt2MWU
        M3ASK2/GH3wey0rWSCqJjhm4mlis8cGoe/Rho74=
X-Google-Smtp-Source: ABdhPJzQw6zHxo7M/Y9oDkgLCijq13EI4QrtckTgsiLz8v+rHPvKT09fsdCpvstKi6F8ke87yChzNGGZPuY2ofzSlcQ=
X-Received: by 2002:aa7:d40b:: with SMTP id z11mr12832262edq.224.1630923365971;
 Mon, 06 Sep 2021 03:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210901194549.3999-1-wsa+renesas@sang-engineering.com>
 <20210901194549.3999-2-wsa+renesas@sang-engineering.com> <CAHp75VdZt_dDb0YpThfsoqRvWdjfVZT70o=eCJCbThJ9qbD42w@mail.gmail.com>
 <YTXZgNQJj0aI4zuC@kunai>
In-Reply-To: <YTXZgNQJj0aI4zuC@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 Sep 2021 13:15:28 +0300
Message-ID: <CAHp75VdJZhgqshOQS=L1rKiNZLTqNnrc4FXoJKaNpaQT0QB_Eg@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 6, 2021 at 12:04 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

...

> > > +#!/bin/sh -eu
> >
> > Next step is to add 'f' to the mix here :-)
>
> -f broke zip file generation in a way I didn't know how to resolve
> differently. Sadly, I can't recall the details right now.

Yes, it means you are not able to use * (a.k.a. glob() function) in
the shell which increases a lot security and other (misuse) concerns.
Instead you have to use `find` or similar tools to collect the list of
the files of your interest.

...

> > > +while true; do
> > > +       case "$1" in
> > > +       -c|--cpu) initcpu="$2"; shift 2;;
> > > +       -d|--duration-us) duration="$2"; shift 2;;
> > > +       -h|--help) print_help; exit 0;;
> > > +       -i|--instance) lasysfsdir="$sysfsdir/$2"; shift 2;;
> > > +       -k|--kernel-debug-dir) debugdir="$2"; shift 2;;
> > > +       -n|--num_samples) numsamples="$2"; shift 2;;
> > > +       -o|--output-dir) outputdir="$2"; shift 2;;
> > > +       -s|--sample_freq) samplefreq="$2"; shift 2;;
> > > +       -t|--trigger) triggerdat="$2"; shift 2;;
> > > +       --)     shift; break;;
> > > +       *)      fail "error parsing commandline: $*";;
> > > +       esac
> >
> > I would prefer to have a clear shift here instead of doing shift 2
> > everywhere above (less error prone).
>
> If we ever support binary arguments (toggles), then a generic 'shift 2'
> won't work?

To me it's less error prone to have something like this:

while [ $# -gt 1 ]; do # notice the condition, btw
  case "$1" in
  opt_with_parameter) ...; shift;;
  toggler_opt) ...;;
  esac
  shift
done

> > > +done

Either way it's minor.

-- 
With Best Regards,
Andy Shevchenko
