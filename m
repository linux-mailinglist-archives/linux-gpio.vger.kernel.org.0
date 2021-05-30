Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD4D394EE8
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 03:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhE3B3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 May 2021 21:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhE3B3E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 May 2021 21:29:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0083BC061574
        for <linux-gpio@vger.kernel.org>; Sat, 29 May 2021 18:27:25 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id q25so6257753pfn.1
        for <linux-gpio@vger.kernel.org>; Sat, 29 May 2021 18:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Mp3Vt9uM1eRHFLwjMG5T9Kreh4tfm69JlsfGya9kmo=;
        b=GUBPWO3Rz3dFP8cazZqfnu6FmKEdt+pL65c2t5WSabsGHZ5I8ePwI8TwSzo/uZxLtR
         ke7Tx8IxfebwnqwOEd5DTq6YoJGx8gBlBD1xPgJA1DnTRpZ9KGAMeUEKUZOMqCym9EPf
         U3WkIahX2uDwcr0Z/ZeJpusKdR4SBuubUv3cOKunBbKq2SCcdAqsJyotz6SZVuvpFYll
         zlyTPmGuGeeWhbunKevNGtu9WCp9VoEBmAmRVijOYreBKGWV5RNhKZjlc7QZpiIbM9Li
         EH81O/KJpJa6JwelVWzUXOkleal32oh6TD0oa6iZxBfD/McHwrRYaYDQsnPiXmtESnVB
         +bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Mp3Vt9uM1eRHFLwjMG5T9Kreh4tfm69JlsfGya9kmo=;
        b=BifhOwwzJmEC5XOkNNrzEszFZksIdj3ggLzUEGpacPBQsWTr0OeEg/SykzZ2sNmWlF
         qf10vTRoKSuZlcLa4Nyu/J6mF0B/QAn9YVV5c4JYR3RRV/+pxIWidij5yzoKLxC5dT7y
         DB0lu9q56wyHssAttoOpPP/Q+EBAIoLbjYMYsKFfi4navYt+VogKiQuRxk4K7zpYC1Au
         WyE7a9lO8IIJN6QhiBUl3V7Nef6JMxL/LsODnefqxBYXRWU/tk/LnaYCImx7WVH8F6jC
         89Aia6gm9OATMqk74ljOqZw48osqra4mqDV23O4ODByKhimLZqfnxSW3XvOiq/KYXTNA
         XI6w==
X-Gm-Message-State: AOAM531KT03/bIysf39dWb1HB8/1mCmLBTxx4TP9+xAytFB7mf68kxo9
        GkK3HqQKlDPMHp4UxLJXRS8=
X-Google-Smtp-Source: ABdhPJyhMTYDK9jZYWPAMM5+xN7sHsRebaH0sEEDUJmQP+eYLcCCWU1o4JhURRaEddefyyitDRb9fw==
X-Received: by 2002:a05:6a00:1a92:b029:2ca:4c19:e4c1 with SMTP id e18-20020a056a001a92b02902ca4c19e4c1mr10614350pfv.32.1622338045501;
        Sat, 29 May 2021 18:27:25 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id x13sm8477697pja.3.2021.05.29.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 18:27:25 -0700 (PDT)
Date:   Sun, 30 May 2021 09:27:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210530012720.GA11390@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
 <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol>
 <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 29, 2021 at 08:19:32PM +0200, Bartosz Golaszewski wrote:
> On Sat, May 29, 2021 at 1:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 

[snip]

I meant to reply to this section as well but managed to snip it out...

> > > > the gpiod_chip_request_lines() or gpiod_line_request_reconfigure_lines()
> > > > is called it isn't too complex and so can be translated to the uAPI.
> > > > The check has to be performed as part of those functions either way, and
> > > > validating a transitional config doesn't prove anything.
> > > >
> > >
> > > Indeed. OTOH with return values in mutators taking integer values we
> > > would throw errors on invalid values passed. I need to think about it
> > > some more.
> > >
> >
> > I was assuming separate mutators for each of the enum values, as you do
> > for the active level but, with the offset and subset variants
> > multiplying the number of mutators, I can see why you would go with the
> > parameterized versions.  While you could still perform the range
> > checking as part of the translation to uAPI, that can more difficult for
> > the user to debug - depending on how many mutators they have applied.
> >
> > It is a trade-off, but I still lean towards the error-less mutators as
> > it simplifies user code - consolidating the error checking into one
> > place. A parameter being out of range means the user is doing something
> > stupid, or running a future app against an old libgpiod, in which case
> > they should be fine with slightly tougher debugging.
> >
> 
> Having error-less mutators here would mean something like a hundred
> functions just for setting the line config. I think that even with
> mutators taking enums we already have enough symbols. Let's keep them.
> 

We don't want separate mutators for each enum value as that would
explode the symbol space.  Agreed.

To be clear, in my "trade-off" paragraph above I was referring to your
existing parameterised error-less mutators, not the parameter-less
error-less mutators that I had been assuming.
Different paragraph and different things.

So, to conclude, I would lean towards keeping your existing mutators that
don't return error codes, rather than adding error codes.
And only performing the validation when the config is translated to uAPI,
not providing some functions to perform interim validation.
i.e. wrt error handling I'm fine with the mutators as they are.

OK?

Cheers,
Kent.
