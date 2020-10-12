Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222F428BAC9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 16:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388921AbgJLOZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388865AbgJLOZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 10:25:29 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BE7C0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 07:25:29 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id q202so8524896iod.9
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmn9U0rFBgOjuY5Oahh+xCRk8RqyPQJfriPo/AAw1MY=;
        b=c+Klb+l5eqH+HMdS6aTQlZFmCRmwY9Ur2AjNMx2BzK3acje8Av+EatAQWZSwrFnG7y
         FlJbUg+5p5iNcmaA1HQd/zr6/DSgn6Vq1hUq336TgyCi9zWGJkvNpLA8jgF+98+bmtOi
         jm3J6+AkrNOpXHolqqyHzzgCpaVDnS/XhUcRRQB84QYGeOEI8djBIl/hvmkITJj1m+PP
         fNIkW1nT/EVbsoaGS/Oy2JDHgr0dEZFzPKr5lwvzQEotTzzPPwDjWlwnTvxNJzf6oDW8
         T02WfR00vOPEd4r692dkJOh2qS1Yuvgrba2w3cAH/Kufr76ZLr+U+tD7W/zqvXiXJp3t
         zLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmn9U0rFBgOjuY5Oahh+xCRk8RqyPQJfriPo/AAw1MY=;
        b=ryVask+1tdihVyIyTynX1ZakZgLhrTZiwr7IVWmJi65fHnQQwghMfJYJXG/S3/3it+
         Tt3h7SQ9Fjgk3MXUdsmnpxr57CgxqXR/LlhV897LPg4S78krUbUIIRNi6oD/En2rP/Qg
         pAsswxm4vW+GTWwhKkfihSS+Tvh12MzvmrYL5ofQKEqC6qCAkDlGyesbTZzoX3S6DkDF
         Smp39LptkHn/S/kMiN6Zj87XP5YgI1l8tLqqsau0mhfoVtJyNnOHB8s9uf/T6yHsZY0D
         UieK1r4sitzAybfrtErS7N+8WBppThK04iyWbz4ZXJZwNp6ppgSeeoyBc2nenlzDBVlW
         wDCw==
X-Gm-Message-State: AOAM5315pU23DktebWvS3DAQL3PmLRY5WG378+nBKmTTPiXfNCBo2aV2
        481kMHQ1EzUGYssrOY0dB5W2PldgVoppiE2Ff3BUAD5DCuA=
X-Google-Smtp-Source: ABdhPJydSPBZFXdo0E6sMWw/+mJkFVvxxT2zqin0Gp7dxHzIy7HiUq1Rc60mxjekuQ+XOrzI172W98s3M1NmBFySFDo=
X-Received: by 2002:a02:6952:: with SMTP id e79mr19353399jac.24.1602512728901;
 Mon, 12 Oct 2020 07:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <CAMRc=Mch42qdf8Z6FSOutGkcB79ScBi-bidwA5P2s9WhiyRaHg@mail.gmail.com>
 <CAFhCfDbtK=d6PJHSfYFnt17vqC=TzbWD3reFYgM8WBXgS9gUYA@mail.gmail.com>
 <CAMRc=MdCWsdRm5eiti6ZHHxZ1UJ3+0+acTdcrE_pq5hmhV7xNg@mail.gmail.com> <20201012142152.GA100342@sol>
In-Reply-To: <20201012142152.GA100342@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Oct 2020 16:25:17 +0200
Message-ID: <CAMRc=Me8uD58b57YVtPCG0=4RU+uiTVsP40QCoA288z2kyP98A@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 4:21 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Oct 12, 2020 at 03:39:21PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 12, 2020 at 1:01 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
> > >
> >
> > [snip]
> >
> > >
> > > > We still haven't released uAPI v2 so I'm open to some last-minute
> > > > changes if they make sense (as you explained in the other email about
> > > > in-kernel timestamping) and are posted soon (before rc3-rc4). I'd like
> > > > to hear Arnd's opinion on this first though.
> > >
> > >
> > > What's the timescales for this?  As I would be doing this in a
> > > personal capacity, I will likely have to look at this over a couple of
> > > weeks.  I would also be limited to testing on an ARMv8 platform, as I
> > > currently have limited access to hardware.
> > >
> >
> > It would be 3-4 weeks from now.
> >
> > In terms of effort: it doesn't look too complicated. It looks like we
> > need to add a new flag to the uAPI:
> > GPIO_V2_LINE_FLAG_EDGE_CLOCK_REALTIME which would make the edge
> > detector use the real-time clock. I wouldn't stress too much about the
> > performance of obtaining the timestamp - it's probably negligible
> > compared to passing the event struct over to user-space.
> >
> > Kent does the above look right?
> >
>
> Could we make that GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME, as it
> controls the source of the timestamp in struct gpio_v2_line_event?
>

Sure, even better!

> Otherwise I don't see any problem with it, and I can have a patch out in
> a day or two.
>
> Cheers,
> Kent.

Bartosz
