Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0942FACF1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 22:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390529AbhARVoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 16:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388595AbhARJ6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 04:58:07 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675E3C061573
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 01:57:26 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id n6so1758683edt.10
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 01:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PEdJuvRovun2XBYWu7zDwcSgXgkePjiZI9JCJEf9aWY=;
        b=zWHd3FVZEEOIiWF320gSXCH0QNJEm+MpVw1nXofNUBt9Yj2n1Gvt+Vb/hDMn27aK8Q
         sMDFUjXQHPdTp6yexYY2pIfas+Nb+o+jLLHGj81NcbGHDoih+44ZZF1wry0Z3qHO5kme
         eDHjElchY8++45S0Af1CKyuD4v3uEUbIYftEXpzvtSQP9zJTZ7EljVqc7W8ePBjh9P7B
         tgZs8UfYNNNNvvt3Nbry+qls9Zc7Ew9iKL1d/gHRgRkNtOjBa5pPSfKujg3wmeH7E+KR
         t1bnXCVjHqqJm5xo51Gm62zf7VWbql7BC56cK5cIhU9q41sg4uEUKsO9CAbmjhyXNtXH
         kjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEdJuvRovun2XBYWu7zDwcSgXgkePjiZI9JCJEf9aWY=;
        b=hlmJaJbhqgT9ifCL9LxUddfdi873SMEDtzmNc4AbkuBWCMC++mD4NIjdLqd7XYmYFo
         LOMyflSelsiDF9xrZd2H1hDr41Rc38EwhBC8eG3XwVj2mmwO6xiDco8YaQJyqyQsajWg
         B/dQuE9WyxuzNK+Dpkks1CrNK/WbQd176kJEiJMmSsnGdzLO/WvKZUHHtC0QBf3WBRh3
         r1O/GcwCxciAfjUqBKk/AmKC5REc8t6KJ8GFBHUTKIHcnAvBuakTyess2ouoi0ipDEIW
         U4DbMzFmerx9hf321OE/0zNzam1MgaDN0mslgtAxH0G7Sj3pbqPfTLhCp1a9jZBFT4/G
         P1Ww==
X-Gm-Message-State: AOAM53173dhbgMx0/3KrpMfqlS9rApwMTE+LOfLPRK4BTeUk6CZ4o77T
        fEq7/cGQi1AL0MBC1Cs0FwI9BFfLtLQ9f0jyhDmAOQ==
X-Google-Smtp-Source: ABdhPJzNbXkBC1wcDmJjbFyzZPgvpImbQBaCaNg09qp8IXCky+ZtckHHJqsaizNhwtpR6almMljmvcX1IBrr6flFJrQ=
X-Received: by 2002:a05:6402:14b:: with SMTP id s11mr5336788edu.214.1610963844950;
 Mon, 18 Jan 2021 01:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20210115103018.27704-1-brgl@bgdev.pl> <20210115103018.27704-8-brgl@bgdev.pl>
 <20210118002218.GC6841@sol>
In-Reply-To: <20210118002218.GC6841@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Jan 2021 10:57:14 +0100
Message-ID: <CAMRc=MfXgUKNx3fj2JBD0qtN3-9n9Yr2qg5UR-f-aDc0DGj2+Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 7/7] core: add the kernel uapi header to the repository
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 18, 2021 at 1:22 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 11:30:18AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > In order to avoid any problems with symbols missing from the host linux
> > kernel headers (for example: if current version of libgpiod supports
> > features that were added recently to the kernel but the host headers are
> > outdated and don't export required symbols) let's add the uapi header to
> > the repository and include it instead of the one in /usr/include/linux.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  configure.ac    |  12 +-
> >  lib/Makefile.am |   2 +-
> >  lib/core.c      |   3 +-
> >  lib/uapi/gpio.h | 522 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 528 insertions(+), 11 deletions(-)
> >  create mode 100644 lib/uapi/gpio.h
> >
>
> [snip]
> > +enum gpio_v2_line_flag {
> > +     GPIO_V2_LINE_FLAG_USED                  = _BITULL(0),
> > +     GPIO_V2_LINE_FLAG_ACTIVE_LOW            = _BITULL(1),
> > +     GPIO_V2_LINE_FLAG_INPUT                 = _BITULL(2),
> > +     GPIO_V2_LINE_FLAG_OUTPUT                = _BITULL(3),
> > +     GPIO_V2_LINE_FLAG_EDGE_RISING           = _BITULL(4),
> > +     GPIO_V2_LINE_FLAG_EDGE_FALLING          = _BITULL(5),
> > +     GPIO_V2_LINE_FLAG_OPEN_DRAIN            = _BITULL(6),
> > +     GPIO_V2_LINE_FLAG_OPEN_SOURCE           = _BITULL(7),
> > +     GPIO_V2_LINE_FLAG_BIAS_PULL_UP          = _BITULL(8),
> > +     GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN        = _BITULL(9),
> > +     GPIO_V2_LINE_FLAG_BIAS_DISABLED         = _BITULL(10),
> > +};
>
> Perhaps include the header from v5.11-rc3 that includes the
> GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME flag?
>
> Unless your intent is for the next libgpiod release to explicitly target
> v5.10?
>

Not at all! I'll just update the header once a new linux version is
out. I doubt v2.0 will be done anytime soon and I don't want to rush
it.

Bart

> +1 for including the header, btw.  Targetting a specific kernel header
> simplifies the build.  We are always going to have to deal with current
> apps being run on old kernels, either way, and anyone that cares to use
> current features has to ensure they have a current kernel, either way.
>
> Cheers,
> Kent.
