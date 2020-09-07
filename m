Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D89D25FE27
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 18:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729972AbgIGQIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 12:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730239AbgIGQId (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 12:08:33 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD437C061574
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 09:08:26 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id b17so12911648ilh.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JqN+Ld3wZPmbVgI62Wk3h0aeRwICf084UpC6lt1ISUQ=;
        b=t+zrA6Zax5sYBKq6LQ+BBjT0mXvkgqo1EQagCOBiGh7Gw6vDfaDBc1h2BgAQD+5B5Z
         O4l+DjThBvV07ZhnkrV+Pxdm+gJOJVQTbav12VmkxLaeitbWMcKHcgJ/L263Nz8rCg2P
         NqYSoiyiMa85MFREwFmfpnKC/0OpLJaP/Ey8Fbd9bB9X2CtM5DjzcJTjUQbmbr01FHEW
         gAGVicIGl4/5IlJ9zuw5P+XJiOtxfiHinQtO257YEewAFwyVzWUvD96X/KFHHHXscKNv
         S82b21ElO1RRbvUyYFHUHv/2FKiWT8fwv79tt1LO4pk0JDOGn1lIB6JZaB5ZJTMVBN7P
         FRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JqN+Ld3wZPmbVgI62Wk3h0aeRwICf084UpC6lt1ISUQ=;
        b=uZZFlk4+Jx+2OlcDcK5LY5F9VilXQtJjni+HbSM3Ay/mIC+vmKtNgZm6rQu6CaPXie
         NYKm5kGGsSeoEvMGyrb7YsxDxsZ5uDBJnJOpIIq0l/SPAr7+HT878JImmMTNr3BCD7Ix
         0ynG8cE5HS64KJdu4dfc0ll1aQe5n7+5fQ9e41IvZziQyWbEt9xMQP0iJAggN9aZ06Z/
         i6VlMfgobqwKkk25HTe+vhnodFm98dlzg1LT1yM9GkuYuzDG+zvkE3hvdgl8Lo3NUphk
         A5XxeTNxphUN/vcuVdBrZGojyQmDn93lpiEfiuckK4PdRljB6/C6XlwCf2LMQ1Z/KvZF
         mdvA==
X-Gm-Message-State: AOAM532IiAW0vy8xC/H0QXqE72x+vZE0HL8mfsM1vvKcepBQs28opQit
        xcyrGkJs7F/iwpnJ1soqVZmRvZB6lA2LxBROEUP4FUNcX94=
X-Google-Smtp-Source: ABdhPJygbGhzi1UjXL8W5ZYdCpkiPK64via60tqGaifPutE7y9g1OWG5mxVKMiZEo45zI0mgt2/Sl1DPIqvev7fxd84=
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr16653071ilq.189.1599494905629;
 Mon, 07 Sep 2020 09:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-24-brgl@bgdev.pl>
 <26ea1683-da8f-30e7-f004-3616e96d56b3@infradead.org> <20200907095932.GU1891694@smile.fi.intel.com>
 <CAMpxmJXvhYOVkZY7LLf=v+o8E2xKTh1RYhLrdVsS9nN1XZ5QJQ@mail.gmail.com>
 <20200907115310.GA1891694@smile.fi.intel.com> <CAMpxmJUfNkko4Rrb4N5CF_rdwRAWGhVr9DSOHfhYyTxYSH7dsQ@mail.gmail.com>
 <20200907122238.GA1849893@kroah.com> <CAMpxmJXM=8oGoPSGg8G8XJ4HXJFrAQ2-_EXrz3rf3+ZmCSWB7g@mail.gmail.com>
 <20200907140829.GL1891694@smile.fi.intel.com> <CAMuHMdV42oUu=af_O=aUVED_Nxce0wnTKTMNNSskaSGT=p5ZMw@mail.gmail.com>
In-Reply-To: <CAMuHMdV42oUu=af_O=aUVED_Nxce0wnTKTMNNSskaSGT=p5ZMw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Sep 2020 18:08:14 +0200
Message-ID: <CAMRc=MeBL7opS6wBO1nEesHJg8Yv_GR0xxRae3mtQ2xj=eBOGg@mail.gmail.com>
Subject: Re: [PATCH 23/23] Documentation: gpio: add documentation for gpio-mockup
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 5:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Andy,
>
> On Mon, Sep 7, 2020 at 4:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Sep 07, 2020 at 03:49:23PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Sep 7, 2020 at 2:22 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Mon, Sep 07, 2020 at 02:06:15PM +0200, Bartosz Golaszewski wrote:
> >
> > ...
> >
> > > > Yes it is.  Or at least until you fix all existing users so that if you
> > > > do change it, no one notices it happening :)
> > > >
> > >
> > > Then another question is: do we really want to commit to a stable ABI
> > > for a module we only use for testing purposes and which doesn't
> > > interact with any real hardware.
> > >
> > > Rewriting this module without any legacy cruft is tempting though. :)
> >
> > Another thought spoken loudly: maybe it can be unified with GPIO aggregator
> > code? In that case it makes sense.
>
> You want to aggregate GPIOs out of thin air?
>
> From DT, that would be something like
>
>     gpios = <&gpio1 2>, <0>, <0>, <&gpio2, 5>;
>
> ?
>
> For writing into ".../new_device", we could agree on something like "0"
> means not backed by an existing GPIO?
>

I'm really not sure this makes any sense. Why complicate an otherwise
elegant module that is gpio-aggregator with functionalities that
obviously don't belong here? I want to add various parameters that
would affect the way the simulated chips work - this really doesn't
need to go into the aggregator.

Bart
