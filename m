Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C030A3310B7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 15:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCHOXt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 09:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhCHOXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 09:23:43 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195C5C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 06:23:43 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id w9so14916519edt.13
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kkxtPSP0Xi4lX5Wx+/32tPbjIn3SdpQg5a9ZAGNqcyg=;
        b=hYVpWVrIwf5fngjt5ImHdSEt8Qlz5tu/Fg3V+OqirMtF96qmwL5uNlEYCt4X1qjaZs
         Ia64wAB8nNSfK9lkk5ioEzHpyGUkfUaMup2sKVCPja2oHGQdvbXXUIg82G9N0D3gcfz1
         P3W2YXR5baN/N63WfysYcZ6m0Te7yNKUNZzga5T/xB3epK+A3HKvnOTq4vqH9F3OUzS0
         S+nwJDc6t0GnIRXY0LoKZVp4TE6XldTLzQ4lGrWOHGVmRr2VKFWreBIVmZzCnOzYBKRX
         3G1OyWwejQEO8cc5aWGlTHlGx5CxBR4O0v4SxWU74Rd22eTXEsfe5van6md1HZTT0UVx
         1zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kkxtPSP0Xi4lX5Wx+/32tPbjIn3SdpQg5a9ZAGNqcyg=;
        b=Ps95ranCGR9Xbcct3clRZuOlqr7L1TsWqGHZHAdQm1w2XxckKc3jqv3/Dz+80XlEOK
         80W/0hMDldfSMyXZNs0wZoOdLDWIISI9bJsrnU+AceSVi2bvGm5Prt2CJGkNysUmsFQI
         WqYaosQEowJfs5fFYg8qZ2v5hUsJWRtxzDxKFuAMEisys8BqrezzC7PptgqatUYnwhrT
         c+eEk6/x7RDeJqoZZI9uvxG8uuQmRVM7BSbbmy0SGfRq3p0WadctfXeJ5H13QQ+edwbk
         1ewc1H1qpDSDeNFS+rBKPheOYfopARwIdwqSFowmi/5zHxMbLpkYLVA7bebIufCj8UHr
         ncfg==
X-Gm-Message-State: AOAM532882rdIAWRf1qTgZvzTRR0HVrwhPobsHJH6Qepbi9Tp2LsyxkR
        8t8L6nT2JcqIlaTWhLmfPnzE0lsrO/4yZB2Ml0aYvw==
X-Google-Smtp-Source: ABdhPJyu97PFuV+ZX1moMZXEZpLArfz/muWiBc/dgpOg9ss0Iagg551x4SlUz4EA8WfJpBbOJg2+ufU0NUAR/IT+S4k=
X-Received: by 2002:a50:ee05:: with SMTP id g5mr22313526eds.164.1615213421770;
 Mon, 08 Mar 2021 06:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-1-brgl@bgdev.pl> <20210304102452.21726-10-brgl@bgdev.pl>
 <YEDdbfbM9abHJpIO@smile.fi.intel.com> <CAMRc=MdRxXzoZuyLs-24dXfOft=OQqDneTHa4-ZKqFE1kMBWcg@mail.gmail.com>
 <YEIE1nG8lZ4V2MXq@smile.fi.intel.com>
In-Reply-To: <YEIE1nG8lZ4V2MXq@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 8 Mar 2021 15:23:31 +0100
Message-ID: <CAMRc=MekGnK17rYf3Bx_UHumVVrpmJphOnMfO352NB9SaOJCGw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] gpio: sim: new testing module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 11:15 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 04, 2021 at 09:15:29PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Mar 4, 2021 at 2:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 04, 2021 at 11:24:49AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> > > > +
> > > > +     /*
> > > > +      * FIXME If anyone knows a better way to parse that - please let me
> > > > +      * know.
> > > > +      */
> > >
> > > If comma can be replaced with ' ' (space) then why not to use next_arg() from
> > > cmdline.c? I.o.w. do you have strong opinion why should we use comma here?
> > >
> >
> > My opinion is not very strong but I wanted to make the list of names
> > resemble what we pass to the gpio-line-names property in device tree.
> > Doesn't next_arg() react differently to string of the form: "foo=bar"?
>
> It's ambiguous here.
>
> So, the strings '"foo=bar"' and 'foo=bar' (w/o single quotes!) are indeed
> parsed differently, i.e.
>         '"foo=bar"' -> 'foo=bar',
> while
>         "foo=bar" -> 'foo' + 'bar'.
>

IMO '"foo", "bar", "", "foobar"' looks better than '"foo" "bar" ""
"foobar"' and I'm also not sure next_arg will understand an empty
quote?

If you're not objecting strongly, then I would prefer my version.

> ...
>
> > > > +     ida_free(&gpio_sim_ida, id);
> > >
> > > Isn't it atomic per se? I mean that IDA won't give the same ID until you free
> > > it. I.o.w. why is it under the mutex?
> > >
> >
> > You're right but if we rapidly create and destroy chips we'll be left
> > with holes in the numbering (because new devices would be created
> > before the IDA numbers are freed, so the driver would take a larger
> > number that's currently free). It doesn't hurt but it would look worse
> > IMO. Do you have a strong opinion on this?
>
> It's not strong per se, but I would rather follow the 2nd rule of locking:
> don't protect something which doesn't need it.
>

OK, makes sense.

> --
> With Best Regards,
> Andy Shevchenko
>
>
