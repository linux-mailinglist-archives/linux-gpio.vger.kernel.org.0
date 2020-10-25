Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1435029837C
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Oct 2020 21:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418683AbgJYUZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Oct 2020 16:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1418681AbgJYUZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2020 16:25:17 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21DCC061755
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2020 13:25:15 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id n6so7757645ioc.12
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2020 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSJGBdBE+3Kd87NaLbp/Ua3/kYlCWxiWZOpZI4/UkBI=;
        b=a6LLj9xvkctVJVZzWAV0Dt5aCtmWiFulrN1tcqm4ZUxSGmGQhsFFOzMMGkuuwfpH+X
         PHWINGIqm4tLwx6BqK0GwTvvlZvqiuaXESK/LDNZI0fczvWY9ABBCg5KEJp0MzNR9i4g
         utn+U35ixAgQx7StbXieTmgPnqneLz5yufqTKOLiHWOrhCkm6p9eOEsNnGr1xbCcvdiF
         iokVFnAp4VaR5FUklFT9XQVThMKyJSWOVspnMzMDdByFeFnu+97t8dA5NlVzCFtPlZoq
         j0GVbTZOxjt9TTUY6o/PUuRaFkrWT4SHADPF1rZwzvS7UuB4vqR0cZ8eVqpIJXcjwmK2
         toZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSJGBdBE+3Kd87NaLbp/Ua3/kYlCWxiWZOpZI4/UkBI=;
        b=C5kx/n4giwaDXyofh6yPRRIon5Dqt+57TzsSLcnY47HXA9z6WHsW/zf5UiKyJ1H5PZ
         uZhPaeuLsnBpQDG/tswDlrPn7M/qrm9wFJehhbgf3YhIms22TIWTI3Sq9cHqFLOdfext
         wnh+6jc2DJk0RvXujZBmUyoMDhwi6jIXEvI8QhBPA866knCxwbFQKtjiyBv0yJ/uNrzo
         10MmQKLDiogM8Ot32RwaHLHtJ/4RylJPz89h/+308HlMEhobA9KkvmS6HCFL6x6IhuuN
         KYEDikr/mHRM+D7wWQAWayXwPpfFKF1LTb0LgUoiXn7c3hpYwMgJV5CWAPM6sS89pO8i
         FubA==
X-Gm-Message-State: AOAM53271F9VZpjd1NDkTe/IANuTqm5r6kRqpdHzXJTh5WDhChp7wzW3
        DdVZXVpSB+tm3g3/ohdm85dleHzQRyAjv3dFY0Uiuw==
X-Google-Smtp-Source: ABdhPJwDL+fSW23VcWp1i+z5vzx4FYo4dzbM5tetG5puNfcrqgjHywZ4bewSpUNO9bZf/u6ocoFySWs95h3O8Dwy9lc=
X-Received: by 2002:a05:6638:d55:: with SMTP id d21mr1654689jak.136.1603657514871;
 Sun, 25 Oct 2020 13:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl> <20201024080139.GA133149@sol>
In-Reply-To: <20201024080139.GA133149@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 25 Oct 2020 21:25:03 +0100
Message-ID: <CAMRc=MfCA8cUbdxGO-O6YyWsTV19WywSEdM0jpLaKQw7EgcqqQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 24, 2020 at 10:01 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Oct 23, 2020 at 11:28:31AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
>
> [snip]
>
> > @@ -74,6 +74,106 @@ struct gpiod_chip {
> >       char label[32];
> >  };
> >
> > +/*
> > + * The structure is defined in a way that allows internal users to allocate
> > + * bulk objects that hold a single line on the stack - that way we can reuse
> > + * a lot of code between functions that take single lines and those that take
> > + * bulks as arguments while not unnecessarily allocating memory dynamically.
> > + */
> > +struct gpiod_line_bulk {
> > +     struct gpiod_chip *owner;
> > +     unsigned int num_lines;
> > +     unsigned int max_lines;
> > +     struct gpiod_line *lines[1];
> > +};
> > +
>
> owner is only used to check that added lines are on same chip.
> Just compare with lines[0]->chip in gpiod_line_bulk_add_line()
> instead?
>

Yes, of course.

> Also, line_bulk_same_chip() is now redundant as lines can only be added
> to the bulk via gpiod_line_bulk_add_line() which performs the check,
> so remove it and all uses of it throughout.
>

Sure.

[snip]

>
> I question the value of the struct gpiod_line_bulk_iter, and also
> struct gpiod_line_iter.
> They seem worse than the user performing a for-loop over the
> bulk indicies or chip offsets and getting each line themselves. They
> add a malloc overhead, in the case of gpiod_line_iter both a malloc and
> a calloc, as well as the corresponding frees.
>
> What benefit do they provide?
>
> Similarly gpiod_line_bulk_foreach_line().
>
> And I'm not sure about the utility of the struct gpiod_chip_iter either
> as it bails if opening any of the chips fails.  There a several reasons
> that could occur, e.g. permissions or unplugging, so you might want to
> leave it to the user to decide what to do.
>
> So I would prefer an iter that provides prospective chip names, or just
> a scandir() wrapper that returns an array of names.
>

I can think of a couple reasons to keep iterators in some form (while
of course addressing the issues you mentioned) but I'll start a
separate thread for discussion about changes in the API.

> Wrt rethinking the libgpiod API for v2, I'd like to either reduce the
> API to a minimal function set, for example stripping out the iters, or
> at least identify the minimal set that everything else is built on, and
> then look at how to rework those to expose the uAPI v2 features.
> e.g. given lines in a bulk now have to all be on the same chip, and given
> uAPI v2 supports per-line configs even within a bulk, the whole line and
> bulk lifecycle, as well as their relationship the chip and the line
> request, can be rethought.
>

True. I'd also consider removing the entire ctxless family of
functions and data structures. Throughout the entirety of libgpiod's
lifetime I've received a lot of emails from users with various
questions but nobody has ever asked me about the ctxless functions
which makes me think that nobody uses it. If so - there's no need to
keep it.

> I'd also like to see ALL libgpiod types become opaque.
>

I'm not sure this is desirable, not for event structs anyway. While
it's true that not exposing any structures to users is recommended in
C libraries, this would impose a significant malloc overhead when
reading events. While it's acceptable in Python bindings - there's no
way around allocating Python objects anyway - I think that in
low-level C interface reading events into a buffer provided by the
user is still preferable.

We could probably live with the config structure being opaque - though
for most cases I think just adding additional padding would be enough
to keep ABI compatible. Opaque config structure would mean a lot of
unnecessary churn for getters/setters.

Agreed for all other types though.

> But that is getting way outside the scope of this patch...
>

Yes, let's discuss this in a dedicated thread. I'd really like to get
most stuff right this time to be able to guarantee ABI and API
compatibility over all feature releases in v2.x series.

Bartosz
