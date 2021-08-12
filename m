Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7482E3EA70A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 17:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbhHLPC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 11:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238247AbhHLPC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 11:02:57 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA88C061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 08:02:32 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n12so6996051plf.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KNEQZNxpx38I2l1fGOSwKTuYmC/Mv4bGO3lFF6ZP0xE=;
        b=ZsCvlc25Vk2hColqy2aVCxkBjEEkhGYVHZ4o/dcI+kweu7waKrFAxAIWCG0/IetG1Y
         FpUPw3M88QWCOggB2782meckY9AsBHzrGGLPEGBWIxELMTsV58ges0fwuN9PTCvRbPvj
         /PyA44/UrDjn0o3omFJcbuO1VFcNxzM84baYvQN5fH8flwv8R5Cb9IbcNxhjyYOpkqT8
         fwZivcujyO56nxKeQQ1KvABxsWWHEMZ77tkOmQ313gN7+bTFikd+4qpWN+YNl2dwJioB
         0ZhySZ7YpIaoHQLK549DrVkqG8f+4uoT/zFh9pXTFtnDnD5sEani0CzJEWNXM+X7uyyK
         Vrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KNEQZNxpx38I2l1fGOSwKTuYmC/Mv4bGO3lFF6ZP0xE=;
        b=GhTi4mwh4S5M7uu7KA+ecVr2dOrQpt4tyLVvJKkuDviR8NPhzipeHBnpuxd/OrDhNe
         dfzZ+wmt80eKsFN3PZOocjhOUp9f14qr34aKzN/64CpFSZGejN6TJo/yRg7Z8Faa2tJJ
         3CvLda4wqXfDM8jM8dHlP/aQfJ4efgps06FaoNbIH8tAVd6d+KNfw9+/CbhiIycrx8Vg
         XyfhTixt1T5OMcJdzzs4Z/okiCLgHQHNM3dTCw89SPKbHRBcD30iMTFRIJprmVoQOHX0
         Bd9q3uhOkOB0HDqTaP0KSgYn2DKLsgwHQ0nsRVEsEhnHT1V/76M1oWEtvixLqBZ7OPv2
         /XWw==
X-Gm-Message-State: AOAM533lc3wTJSDqdBYeVNB3KROk5OOAqJhCh7gF/a9wWIHWDwk6cAEK
        Wq8Sp4bDZOvvh2qJBtdQ7oY=
X-Google-Smtp-Source: ABdhPJwAdYWA6uG9M0Ts7iDui5AvtkVZmY2//yvtjmWXXkN3IU5objSt3FPTh//gpAGaH7xkRvKf2A==
X-Received: by 2002:a63:f63:: with SMTP id 35mr4181841pgp.148.1628780551350;
        Thu, 12 Aug 2021 08:02:31 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id m4sm10616193pjl.6.2021.08.12.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 08:02:30 -0700 (PDT)
Date:   Thu, 12 Aug 2021 23:02:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210812150223.GA38195@sol>
References: <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
 <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol>
 <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
 <20210812142345.GA29599@sol>
 <CAMRc=MdV+GDGpwdMLwKTxaXR+x1ogLzanRBuvwG-aL2jQFrxsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdV+GDGpwdMLwKTxaXR+x1ogLzanRBuvwG-aL2jQFrxsA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 04:43:46PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 12, 2021 at 4:23 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> >
> > <snip>
> >
> > > >
> > > > Sure, it's a trade-off, but the alternative is requiring a 2-3k block
> > > > even for a one line request, which seems a wee bit excessive.
> > > >
> > >
> > > As you said - it's on the heap, so who cares. But this is also an
> > > internal structure and so we can use bit fields. That should reduce
> > > the memory footprint significantly as we now don't require more than 3
> > > bits for any given enum. That would leave us with the debounce period
> > > and offset as full size variables.
> > >
> >
> > Rather than introducing a new collection of enums and bitfields, why not
> > just store the v2 flags for the line?
> >
> 
> Why a new collection of enums? It wouldn't change anything, we'd just
> make sure in the setters we never overflow.
> 

Yeah, my bad - you already have the enums.

> I would prefer to limit the use of kernel symbols (and types!) to the
> minimum for clarity.
> 

OK, but you need to map the libgpiod config to kernel flags at some
point...
And this is all internal to line-config.c...

Cheers,
Kent.
