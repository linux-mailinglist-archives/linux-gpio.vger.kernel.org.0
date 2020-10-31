Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6696E2A11CC
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Oct 2020 01:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgJaABq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 20:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgJaABq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 20:01:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8301FC0613D5;
        Fri, 30 Oct 2020 17:01:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j18so6692398pfa.0;
        Fri, 30 Oct 2020 17:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rCRjK7Akw0TOdsFtKnu+v7xP+ZfNkg9XvMoHOEpcYoo=;
        b=mDXLccToyKLQR2Zu/xUrx5vtQ8+geb+V17+23UgOyh8JGtyPOkLXH5unON2ptL/o0T
         //pzJgF2R7YMAXZQZhfZSZ11JllbqaphL6blgtmtD+EeZPR00fThf/mIWgsWcjsT8a/U
         QnXkfSUv5ke1mKIaAetU8Ca9uQgA3cvVvNMTA+0vctqQFu8CLRCdXyfwKb5Btu+6zH6a
         5M+5A2RPpmC2Lf5wVDmKB4IAlh9ZPEax9dZTLV1OQ9XYauRRy9+woBC2SyUQZTiPgXUQ
         sWeeFwQysluaJbJd1kbBvqpEs6WxJN4GGInC+KL7yWj5tkOMVFlb4wxEeOYq6asYibjU
         hGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rCRjK7Akw0TOdsFtKnu+v7xP+ZfNkg9XvMoHOEpcYoo=;
        b=AcHzFfvUfFByLfSWQPYVBA+GQ1rk7y5VZ2TQt5NHJs4nOgThTIODToZXNR2VE4R0db
         NUPBkletnej0BiRyxicJCuDQbgwG7oYw2udiWWB/AQUZzM+qQ01Lvr15LtJkge+SwpnU
         H6UiNOSzt0+kNkjRZVG4C6iEk0JzPU6xP1Nh6aCcP+eI6Yds01LOWyIWbeod5LdDs3uK
         HT8PjMAHU8KqbSJ+yWySYxUu9Z2tpnPUAbeYpumqrTc78jfLNVTjMybMk5e00v0Ug70e
         3x9cCVtLiaVDBayRDTyk6p7t93kpNlwo5eNnhJGFvwqRFe5RZc5Ww9r4hEI9FnKC2rqj
         u3Yw==
X-Gm-Message-State: AOAM530u0na2Z2YKvUEuQdZA1EeIAjPNlmjy3OHDFRHoT3EVG/4J1Ass
        lf9d3rhHDWK7eoGBwa/gSqTSanO6atc=
X-Google-Smtp-Source: ABdhPJw28wzB7V6qzBb4EwmqBrlI8vlxYK64QZkjfCmcBvKKGci/ak9nsIRth2GMU0OVXaVJHhRucg==
X-Received: by 2002:aa7:9245:0:b029:156:552a:1275 with SMTP id 5-20020aa792450000b0290156552a1275mr11492999pfp.12.1604102505787;
        Fri, 30 Oct 2020 17:01:45 -0700 (PDT)
Received: from sol (106-69-160-250.dyn.iinet.net.au. [106.69.160.250])
        by smtp.gmail.com with ESMTPSA id h10sm6397352pgj.69.2020.10.30.17.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:01:44 -0700 (PDT)
Date:   Sat, 31 Oct 2020 08:01:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
Message-ID: <20201031000139.GA7042@sol>
References: <20201014231158.34117-1-warthog618@gmail.com>
 <CACRpkdbTsN6p4n3f9SJrgAjdkzDu2S67rU3tLWwX0X50ekjctQ@mail.gmail.com>
 <20201028232211.GB4384@sol>
 <CAMpxmJX61dRE_d2Eyu2nXKx64rNrrTfScrdg=Cc-N-R_FKfUNg@mail.gmail.com>
 <CAMpxmJXiObcKyoE264oyiZOs08=uRYno6siMzz6BH+jmT_NKgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXiObcKyoE264oyiZOs08=uRYno6siMzz6BH+jmT_NKgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 03:52:24PM +0100, Bartosz Golaszewski wrote:
> On Fri, Oct 30, 2020 at 3:49 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Thu, Oct 29, 2020 at 12:22 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Wed, Oct 28, 2020 at 05:01:49PM +0100, Linus Walleij wrote:
> > > > On Thu, Oct 15, 2020 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > > This patch set adds the option to select CLOCK_REALTIME as the source
> > > > > clock for line events.
> > > > >
> > > > > The first patch is the core of the change, while the remaining two update
> > > > > the GPIO tools to make use of the new option.
> > > > >
> > > > > Changes for v2:
> > > > >  - change line_event_timestamp() return to u64 to avoid clipping to 32bits
> > > > >    on 32bit platforms.
> > > > >  - fix the line spacing after line_event_timestamp()
> > > >
> > > > Where are we standing with this patch set? Good to go so
> > > > I should just try to merge it?
> > > >
> > >
> > > I'm fine with it, especially now that I've tested it on 32bit platforms
> > > as well as 64bit.
> > >
> > > Bart was ok with v1, and I doubt the changes for v2 would negatively
> > > impact that, though I did overlook adding his review tag.
> > >
> > > Cheers,
> > > Kent.
> > >
> > > > Yours,
> > > > Linus Walleij
> >
> > I'll take it through my tree then.
> >
> > Bartosz
> 
> The series no longer applies on top of v5.10-rc1. Could you rebase and resend?
> 

Nuts, it relies on my doc tidy-up series that Linus has pulled into
fixes, and so will likely go into v5.10-rc2??

Specifically it is based over/conflicts with:
2cc522d3931b gpio: uapi: kernel-doc formatting improvements

If I rebase it onto devel then you will get a conflict when those merge.
Is that what you want?

Cheers,
Kent.
