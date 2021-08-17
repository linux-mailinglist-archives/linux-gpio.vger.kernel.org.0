Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2443EEB8B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 13:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236583AbhHQLZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 07:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbhHQLY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 07:24:59 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10771C061764;
        Tue, 17 Aug 2021 04:24:27 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d17so24480932plr.12;
        Tue, 17 Aug 2021 04:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zd92nrjzI8zurBAPMonQtE/CeMgakfdlkb3PWS8lQh8=;
        b=glftwNGQbd4u+6kFmCEyZOUo/2WuF+NausdGEGkUx0H0eCF9W07rdbVCGqZbfGrdGJ
         uWO4oMtZ5fNaKcdn8wmtHYixk1Hrx64o70iDgStwevEXiPBVKY97ILvnsB9EBmYyimRT
         cr3JgKN28+G9PjH1rOzXTgjEN3HJWMqqP1Nk4z7hSqfGwhVSh2++Bvzc2H1uBFM+4jzD
         rfGCWgSLQbJZQMc6/lztx1uOyU9TrXj/GBQPnwkE6PaMpPeRV5715jwFbL4NSwqUBjsT
         nONWxOz7VZs/73MvrXlDK5JDaZtRbm8bAOKzj+Suggqsu88uo6KBdvCRTLHP/bDFYkb3
         U6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zd92nrjzI8zurBAPMonQtE/CeMgakfdlkb3PWS8lQh8=;
        b=hFXHRDq6wu10BeU1GyGTfdtbS6iMJPFnvParmhjrMw3WtabZkb+j5j00YqTeC1OBF/
         BUccueMDqYtMa/xEGjf7Tri+UYGza2/dEbygGtn7KvjDxfrZd6EREwHz9Va6qAueKUZE
         mkGTNRWAfLLJsPED70jgE+8zTd1HEwrU889FREkTKmwx7IJy9TB+c+i97hEIWyexpofq
         gFlMKA4C9mPCTYAR1YZJR+IcxHrvVeIH7GZXr4DGtTX7U4FpL3dlcb6P6Y9PRwy3sPV5
         ezc3nTBwthrckNaYy15nuW24lLayJTG4v97bw7WMAGvKSLPshBq4FBLkEKzEi6USN1II
         HnNw==
X-Gm-Message-State: AOAM531qpTyVgAdsqflmKvHRk+lPP/QCaBrKB6NAlvo6gk8PjDTvyyr5
        TI9hFejYBreTN/WKNqSwjZ7sSpSIDjlh/5xZ1zs=
X-Google-Smtp-Source: ABdhPJzOKwYE9u8j0XC3Act53OvJC0nJGi5wkJbIhjntZmOXyL1U1rlCPvvpYEQQ+hXiK3Nr59IfjcOUDUitG0MaVRo=
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr3116009pgg.4.1629199466446;
 Tue, 17 Aug 2021 04:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com> <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com> <YRpva4gS1LfncPUj@smile.fi.intel.com>
 <YRpz5UEDQbpewq5o@google.com> <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
 <YRtkt8e25ZSeOICx@google.com>
In-Reply-To: <YRtkt8e25ZSeOICx@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Aug 2021 14:23:47 +0300
Message-ID: <CAHp75Ve-24wno-z8rQSCtgBdf6_a70TFf3aCJPP7JSFPG8sfhg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 17, 2021 at 10:26 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > On Mon, Aug 16, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:

...

> > > > > > Would it be okay for you to pull the immutable tag?
> > > > >
> > > > > What immutable tag?
> > > >
> > > > It's here:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1
> > >
> > > My Ack can't be merged like that.
> >
> > Which one? There are two on different patches.
>
> The one that I specifically said was "for my own reference".
>
> > Do you have any documentation on the rules you imply by MFD?
>
> No, the documentation is provided with the tag.

I see.

So, what is the recommended solution?

-- 
With Best Regards,
Andy Shevchenko
