Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1814024531C
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Aug 2020 23:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbgHOV6B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Aug 2020 17:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728915AbgHOVwA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Aug 2020 17:52:00 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33334C02B8F5;
        Sat, 15 Aug 2020 06:21:45 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id f9so5572669pju.4;
        Sat, 15 Aug 2020 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1uixVnw4VqVRWBxjLItwqvGPWa+lcvmh4b3cIx3Xb64=;
        b=meBYpFKfZGJfoM+cLyqrj1fe3d3boOTYypFqELfkisrmrZVlGPAQBtePqMqyFOrQB3
         Cc/nFs46SwiWFIct3N1kx4mlrEdFTHyrFVkoh31I1UKdBvFVtKX61Zkg7tfbovIFYzj/
         FFbIUExgZKNdsT+YV+XQZl2wWLbnkJUqV0r1rIqjqJ2ob5rFRN+AcrVzeuOmr6GdJhj4
         S0vesbPzZsNQ7iwr09KLeXBDlA5xQ2hs05KaoRPypH9iTrwT/a5XcMEhVurj8+TjYqrh
         wBxd8uxnA+NhOegQ7gE+XWhloVMCs2ZisXrFrGM0hFEu606nHJAbg3RmstTBcedMC4nP
         T+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1uixVnw4VqVRWBxjLItwqvGPWa+lcvmh4b3cIx3Xb64=;
        b=QD9YKjpgw5N4djevR52pV5pdG1ynKFJn6QRmbbN4ih4yHSzsKjepqq+wlELK79MGRc
         eluh7JLFTMghreHs7qXY3lb60b9fjcrPgyN9HQKawZmcpEa/tE7LFMx8rylrgWauoMhK
         E6VWVp5i4pbJRVgdO80ACNpbhkoj2GdZ3CNPUNTc0rCdxk4ZnWy1UkXDEv0NYU369fVc
         tZ/7IUbJxUgU3C2klR01ByFcO2gYGOF2/7BkgzI5WmNmYGdS5mNBFC06KTfTBhGfa7lH
         S/pYhHER+WSSMb6GKKJYkFN2SzR3DrBbC4HTCZttt6UB9sMuH87G6IYC3MJfDnE5xvTL
         9XCg==
X-Gm-Message-State: AOAM532ZDbHhqlk205fDAeonRdEkG1GMIzlSq+upddeCNOxr9t3c17Wp
        AkujLhMAcM1tbmA9Yfgylsm7CdMmudY=
X-Google-Smtp-Source: ABdhPJxbk52AnBRSmfVNk8XI6Ty+YU14VH35qkrnjDVKBaPq7aA4B1AcKNSuoTXdfUG4GeC9zJvnZg==
X-Received: by 2002:a17:902:ff16:: with SMTP id f22mr5330256plj.269.1597497697744;
        Sat, 15 Aug 2020 06:21:37 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id d29sm11068823pgb.54.2020.08.15.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 06:21:36 -0700 (PDT)
Date:   Sat, 15 Aug 2020 21:21:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200815132132.GA26885@sol>
References: <20200814030257.135463-1-warthog618@gmail.com>
 <20200814030257.135463-8-warthog618@gmail.com>
 <CAMpxmJXdGUnnomfWNRmpi979jLPMj17JuA=0K2Nq-oVS_-oQ3A@mail.gmail.com>
 <20200815065309.GA13905@sol>
 <CAMpxmJVMJYJ71z59Mu-mCTQPNqV9N9sXJXNBjYazGo0tmXthfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVMJYJ71z59Mu-mCTQPNqV9N9sXJXNBjYazGo0tmXthfg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 15, 2020 at 09:21:22AM +0200, Bartosz Golaszewski wrote:
> On Sat, Aug 15, 2020 at 8:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Aug 14, 2020 at 09:31:29PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > >
> > > Hi Kent,
> > >
> > > not many comments here, just a couple minor details below.
> > >
> >
> > [snip]
> >
> > > > +
> > > > +/**
> > > > + * struct line - contains the state of a userspace line request
> > > > + * @gdev: the GPIO device the line request pertains to
> > > > + * @label: consumer label used to tag descriptors
> > > > + * @num_descs: the number of descriptors held in the descs array
> > > > + * @descs: the GPIO descriptors held by this line request, with @num_descs
> > > > + * elements.
> > > > + */
> > > > +struct line {
> > >
> > > How about line_request, line_request_data or line_req_ctx? Something
> > > more intuitive than struct line that doesn't even refer to a single
> > > line. Same for relevant functions below.
> > >
> >
> > As I've mentioned previously, I'm not a fan of names that include _data,
> > _ctx, _state, or similar that don't really add anything.
> >
> 
> I certainly disagree with you on this. I think it's useful to discern
> the object itself from data associated with it. Let's consider struct
> irq_data and let's imagine it would be called struct irq instead. The
> latter would be misleading - as this struct contains a lot additional
> fields that form the context for the irq but aren't logically part of
> the "irq object". And then you have irq_common_data which is even more
> disconnected from the irq. This also would make using the name "irq"
> for the variables containing the global irq number confusing.
> 
> I think the same happens here: we may want to use the name "line" for
> local variables and then having "struct line_data" (or similar) would
> make it easier to read.
> 

My counter example to both points is "struct file *file".

> I'll listen to other's suggestions/voices but personally I think that
> _ctx, _data etc. suffixes actually make sense.
> 
> > I did consider line_request, but that was too close to the
> > gpio_v2_line_request in gpio.d, not just the struct but also the
> > resulting local variables, particularly in line_create() where they
> > co-exist.
> >
> > Given the ioctl names, GPIO_V2_GET_LINE_IOCTL and
> > GPIO_V2_LINE_GET/SET_xxx, that all create or operate on this struct, and
> > that this is within the scope of gpiolib-cdev, the name 'line' seemed the
> > best fit.
> >
> 
> And that's why line_data or line_request_data do make sense IMO.
> 
> > And how does it not refer to a single line - what are the descs??
> >
> 
> I meant the fact that it can refer to multiple lines while being
> called "struct line". I do find this misleading.
> 

And struct line_data isn't?

Cheers,
Kent.
