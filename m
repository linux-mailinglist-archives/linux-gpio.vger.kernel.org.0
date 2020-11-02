Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FED02A2677
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 09:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgKBI5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 03:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgKBI5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 03:57:04 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0572C0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 00:57:03 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id ay21so183548edb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 00:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XKCEPkor6No1flCj3QWU99lT12Ofqcg/woCKr9EHkXQ=;
        b=TXECMQHkNsBfmgFt2gxrFfh4vBNWUehZ1RK0KVZZ2qhrEotFD6PFh//A43MxXimim8
         iERso2u35wSK3pP70nrVDySA901kUIWFQIyS98WPMG8LglluE3BeBhW64O32/Dw59QMg
         ObAfZsYC6V5y0bJSw92OSmGG8obieB9clG/kXRf3E22LufOs7IiKMlZa9G3YoHc0+GTU
         6sK3U6PIM/+1d8NiZ2SPzv56yQB9qOA/HGKd+WjLFlqombZcjLJEv6xB8j7y/oH+HhAr
         v0CDR9BiNbT5a8dH0H3KCaLFOpMkrdpIzF+TXjWOWw1T/yoFPv6TxTR9gJEBDov7qc3V
         q/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XKCEPkor6No1flCj3QWU99lT12Ofqcg/woCKr9EHkXQ=;
        b=bs4q7D8e9zj1fe+/SX1Kk18VgQIGblZ0B7scvZqjFFqfOXi3i3rs+0zbMUsNkVjlOn
         fSLizdLqK7rhxbF6jW61fSdRKnHzHufPEZajqfli+mzjSkVTkGOdsBY9kq/ysZxfBwTn
         Wvp1fxAQWBrUGPnmDXMTn7B4wk9CV4ZCzXI4vlKdhBLMpbTPV7iNWm6Q+I0qLavv3JzV
         m8ZPEIg35bhlgGRQo5gDHFLs4tohgXJylf7/Ol6dtAnxbjeehhkPzWovPo2fGmbT4jOd
         95kwp/p4JyuHiMfspOXbM1VroSqHr67uGLv6FbO/dKP4ApJdZ6XrJVPoyxJ49bd+g6+h
         EWsA==
X-Gm-Message-State: AOAM5301nYDL93RvNFSenTrNgxGiuEFygid/xgThEVndN/LWHA9Cry1J
        7EGEvz+qDV96Dz7hud5tFuReT7WOhFYC1E9CTD8CzQ==
X-Google-Smtp-Source: ABdhPJwJRyYvDryN85I1qs2qcqeISMOByxvstsJx5XXG6KOYVJzGikvRvOM6d8fAroXMT2EXNqL4Czo/srFIXy71VQo=
X-Received: by 2002:a50:e442:: with SMTP id e2mr16213423edm.186.1604307422747;
 Mon, 02 Nov 2020 00:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20201014231158.34117-1-warthog618@gmail.com> <CACRpkdbTsN6p4n3f9SJrgAjdkzDu2S67rU3tLWwX0X50ekjctQ@mail.gmail.com>
 <20201028232211.GB4384@sol> <CAMpxmJX61dRE_d2Eyu2nXKx64rNrrTfScrdg=Cc-N-R_FKfUNg@mail.gmail.com>
 <CAMpxmJXiObcKyoE264oyiZOs08=uRYno6siMzz6BH+jmT_NKgQ@mail.gmail.com> <20201031000139.GA7042@sol>
In-Reply-To: <20201031000139.GA7042@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Nov 2020 09:56:52 +0100
Message-ID: <CAMpxmJU+sq5Tq9NdCLyW54FN0_oFJXz4oLAHymuTaAHNSqGNLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 31, 2020 at 1:01 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Oct 30, 2020 at 03:52:24PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Oct 30, 2020 at 3:49 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > On Thu, Oct 29, 2020 at 12:22 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Oct 28, 2020 at 05:01:49PM +0100, Linus Walleij wrote:
> > > > > On Thu, Oct 15, 2020 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > > This patch set adds the option to select CLOCK_REALTIME as the source
> > > > > > clock for line events.
> > > > > >
> > > > > > The first patch is the core of the change, while the remaining two update
> > > > > > the GPIO tools to make use of the new option.
> > > > > >
> > > > > > Changes for v2:
> > > > > >  - change line_event_timestamp() return to u64 to avoid clipping to 32bits
> > > > > >    on 32bit platforms.
> > > > > >  - fix the line spacing after line_event_timestamp()
> > > > >
> > > > > Where are we standing with this patch set? Good to go so
> > > > > I should just try to merge it?
> > > > >
> > > >
> > > > I'm fine with it, especially now that I've tested it on 32bit platforms
> > > > as well as 64bit.
> > > >
> > > > Bart was ok with v1, and I doubt the changes for v2 would negatively
> > > > impact that, though I did overlook adding his review tag.
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > > > > Yours,
> > > > > Linus Walleij
> > >
> > > I'll take it through my tree then.
> > >
> > > Bartosz
> >
> > The series no longer applies on top of v5.10-rc1. Could you rebase and resend?
> >
>
> Nuts, it relies on my doc tidy-up series that Linus has pulled into
> fixes, and so will likely go into v5.10-rc2??
>
> Specifically it is based over/conflicts with:
> 2cc522d3931b gpio: uapi: kernel-doc formatting improvements
>
> If I rebase it onto devel then you will get a conflict when those merge.
> Is that what you want?
>
> Cheers,
> Kent.

I'll let Linus take these through his tree then.

Bartosz
