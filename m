Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047833EB5F0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 15:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240560AbhHMNE3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 09:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240520AbhHMNE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 09:04:28 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB998C061756
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 06:04:01 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e15so11864538plh.8
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uKxPSauy+2U0pFIji3W55hcw3dahBR/1HB1TsLq3Fc8=;
        b=L4uonK6M6OMWfFoHR+vTxxLtpMSFkL1I8N9Vqml/0qq8rUCkwMQ9bESb3dgo/g3TL3
         DYGj11jzcL9VlU5HuvUTuucSK3pDGBwfZc6KTtD67CDR3w/2GuPjgUE/tr9C0YzEcWmP
         QgsKDHCSIMyby9mQ3u7PYyc1LhLle1/tqpJx/EGM0t3P7s+r1LJdyNRC+nJe/l93eiee
         GP1MK4IgKKo2EoCNV56VBW1Wiy6gviZvr4pyd+iq7iw8A4UzcsgmUtJTH4ly68fjKald
         bchpOHcu0pqzt894iQI3B321kdIUnCMjey6g/jKIFpto3608L3r5brFT4RNXyUFaqAv8
         zbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uKxPSauy+2U0pFIji3W55hcw3dahBR/1HB1TsLq3Fc8=;
        b=QfOIUEOVHQP5c1FsomCgK2ikr7Bq4uMVbGyIVNXIEqiui2+WLMzEG4A8wLT7+5OqlU
         VPxkPiLPkwF7txtg9UBNGLyL3/XCyMD0U6ZArJ+Sq2ZjjefD17OXWVoNE80TcOcmKG7/
         jPeagYM/d5tMG/GHAcWwDAw4YHyyB+7Vb6h/K9rF2BRfZ56XKVJRUxGUCrioP0ygLsRK
         k7s/0yWHUGivo6y7a+hEJ+3srDV/avuLg6Ry+QeKGLSlch4Tp50At1Vi5RO+T/lzz6TB
         k0Dxy6P0ElOtxk5aopKCQayU0hVgKil/uspnS+1rym7m0qyforx38EM204cI+oiDQ0OP
         9RBw==
X-Gm-Message-State: AOAM5301nwO8L9Cahv3TVK29IQWrl/29bJ1+mBw8qUY/owrFsGFWUXgE
        UzpM2zIWVoiMxN+cQQKyWiNQiZFOMnddPg==
X-Google-Smtp-Source: ABdhPJye/RMP+dfQpEpKcMjjgwYSfwnLy29Ymjleu5i0bTVrqsndnD+d9MY9Vx3OHUes6sqoqAZvKQ==
X-Received: by 2002:a17:90b:3718:: with SMTP id mg24mr2683609pjb.158.1628859841494;
        Fri, 13 Aug 2021 06:04:01 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id n33sm2838289pgm.55.2021.08.13.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 06:04:00 -0700 (PDT)
Date:   Fri, 13 Aug 2021 21:03:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210813130355.GA54036@sol>
References: <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
 <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol>
 <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
 <20210812142345.GA29599@sol>
 <CAMRc=MdV+GDGpwdMLwKTxaXR+x1ogLzanRBuvwG-aL2jQFrxsA@mail.gmail.com>
 <20210812150223.GA38195@sol>
 <CAMRc=Mdt=SmzTuVMgXwk6OKeCT3U8U_oZNPLuGQmKU6yRCCz-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdt=SmzTuVMgXwk6OKeCT3U8U_oZNPLuGQmKU6yRCCz-Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 13, 2021 at 02:59:43PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 12, 2021 at 5:02 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Aug 12, 2021 at 04:43:46PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Aug 12, 2021 at 4:23 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > >
> > > >
> > > > <snip>
> > > >
> > > > > >
> > > > > > Sure, it's a trade-off, but the alternative is requiring a 2-3k block
> > > > > > even for a one line request, which seems a wee bit excessive.
> > > > > >
> > > > >
> > > > > As you said - it's on the heap, so who cares. But this is also an
> > > > > internal structure and so we can use bit fields. That should reduce
> > > > > the memory footprint significantly as we now don't require more than 3
> > > > > bits for any given enum. That would leave us with the debounce period
> > > > > and offset as full size variables.
> > > > >
> > > >
> > > > Rather than introducing a new collection of enums and bitfields, why not
> > > > just store the v2 flags for the line?
> > > >
> > >
> > > Why a new collection of enums? It wouldn't change anything, we'd just
> > > make sure in the setters we never overflow.
> > >
> >
> > Yeah, my bad - you already have the enums.
> >
> > > I would prefer to limit the use of kernel symbols (and types!) to the
> > > minimum for clarity.
> > >
> >
> > OK, but you need to map the libgpiod config to kernel flags at some
> > point...
> 
> Yep, right before passing the arguments to the kernel. Having separate
> fields for each setting is much clearer IMO than storing flags.
> 
> > And this is all internal to line-config.c...
> >
> 
> This code still needs to be maintained and using enums makes it easier.
> 

Fair enough.

> Anyway, this is implementation detail really as with bit fields we'll
> fit in an 32-bit integer anyway with all those enums.

Agreed - I thought of that after I posted.

> Does the general idea sound good? If so, then I'll rework it.
> 

Sounds like a plan - rework away.

Cheers,
Kent.
