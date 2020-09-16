Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622BD26C13B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 11:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgIPJ5m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 05:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbgIPJ5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 05:57:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA55C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 02:57:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s65so3630625pgb.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rcQzIw0Af1rlmMPGYsI/JDKEYe8+BnnwfKVSWPdFcS4=;
        b=DyM0knxCsqGNKnpLyVOk2oMdUTVBV28U8Az7p3+uRjKX/3uEAzPcAKaQonbdnAigf4
         uKZ8hlDYI/QHmmkrd5QMbGQi5zYEZHGNWfqIAwoRZ9zKNY/kAPPEo/lt9tAoNGUIKBxR
         REl6+FGGzo/EObyusHZXpwoawwNtL4LCgezF8sr363MOhhOB/BrJ0U5qblMsPnmA0s6J
         lKQlSzDCCJyvVdepuGyVTnYZIjiebKcwR0tlCj8sXSAw9jdsRJrAsgwzse3gXSpgxEEu
         OdInvVIS8bL0xsr8CMMT5KIL0XVgDqtLK0JspvSOVbRznJ6Adu+Jugr+JKrlnXgbXiTL
         tdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rcQzIw0Af1rlmMPGYsI/JDKEYe8+BnnwfKVSWPdFcS4=;
        b=XwJMkOio7bMi1Ez1HFNOAEH0ov4v2neb0u4saWCmV2D9IgLrjBFAkRNz4ZSLLS58JS
         rz3Q5uM2mHA4sDBkLW8Vp54m2eHlr17tvpvusehLxf/n3QiFRRVCrrKqFBGDQMfmdfRe
         ydVwJNXDBMyPGTvmhBuGv9D9RRIXDMG67hmYWJjKqYmEpZAJc+kbSAxi94NmG28NO9k/
         pq34EvX52L9GQJoYoLHfJx1ad3YNo+RwIAUM+nkGuoR8FVaipFt7KI+82n9rH4h4plqH
         bUqlKvJ2HVH/hLIGHqrKts4VvZsIWsZPtNsALP4rQvGWUr/fFMLgH0eTKjYCajGg7f8W
         40tw==
X-Gm-Message-State: AOAM533fVp6byjlYS5CnnU8e8t77eCIk05hDBV+uei49otSqakvJWEAR
        yKxqB8gZ/pB5PwOyaoLpj0BxXeKebYI=
X-Google-Smtp-Source: ABdhPJw7e1e4MEbhEyVoRtmXcboNghDi0Q9/ciesSdCFKdu7tASluJtsqIRtSthWFQ50BNFUkG46/w==
X-Received: by 2002:a63:5043:: with SMTP id q3mr17519213pgl.293.1600250260008;
        Wed, 16 Sep 2020 02:57:40 -0700 (PDT)
Received: from sol (106-69-164-34.dyn.iinet.net.au. [106.69.164.34])
        by smtp.gmail.com with ESMTPSA id b29sm14223971pgb.71.2020.09.16.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 02:57:39 -0700 (PDT)
Date:   Wed, 16 Sep 2020 17:57:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Maxim Devaev <mdevaev@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] gpiomon loses events
Message-ID: <20200916095734.GA32888@sol>
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol>
 <20200915033428.GA14286@sol>
 <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
 <20200915135732.GA100294@sol>
 <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 11:29:00AM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 16, 2020 at 2:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Sep 15, 2020 at 10:34:31AM +0300, Maxim Devaev wrote:
> > > > The bug was introduced in libgpiod v1.5 so, depending on your
> > > > circumstances, I would revert to an earlier libgpiod or apply my patch.
> > > > ...
> > >
> > > Is this behavior documented somewhere? It's a complete surprise to me
> > > that this is how it works. I expected to lose the old events. It seems
> > > to me that for software that catches edge, the loss of new events is a
> > > serious problem, since it can lead to a desynchronization of the
> > > physical state of the pin and the user's information about it. For
> > > example, if event 16 was falling and event 17 was rising, and the
> > > signal stopped changing and remains at 1, the kernel will tell us that
> > > it was only falling (i.e. 0), while the real state will be 1.
> > >
> > > If we lose events in any case, then in my opinion it is much more
> > > important to keep the current state, not the past. I can't think of a
> > > case where the loss of old events can lead to problems, but the
> > > desynchronization of the current state actually means that the
> > > software can make the wrong decision in its logic based on the
> > > driver's lies. Yes, this would be a breaking change, but it seems to
> > > me that it is the current behavior that is incorrect. Don't get me
> > > wrong, I don't insist on it. If this decision was made for certain
> > > reasons, I would like to understand where I am wrong.
> > >
> >
> > I agree - it makes more sense to discard the older events.
> > The existing behaviour pre-dates me, so I'm not sure if it is
> > intentional and if so what the rationale for it is.
> >
> 
> While it predates me too (Linus: any particular reason to do it like
> this?) I think that requesting events from user-space is a contract
> where the user-space program commits to reading the events fast enough
> to avoid this kind of overflow. In V2 we can adjust the size of the
> queue to make it bigger if the process isn't capable of consuming all
> the data as they come.
> 

For sure, but if there is an overflow for whatever reason - maybe they
need to debounce ;-) - then it would be preferable for the final event
to correspond to the current state.

> > And I'm still trying to think of a case where it would be harmful to
> > change this behaviour - what could it break?
> >
> 
> Well, I wouldn't change it in V1 but since V2 is a new thing - I think
> it should be relatively straightforward right? If we see the kfifo is
> full, we should simply consume the oldest event on the kernel side,
> drop it and add in the new one. Maybe worth considering for v9? I
> don't see any cons of this and this behavior is quite reasonable.
> 

It is pretty straight forward - my current patch for this looks like:

@@ -537,9 +537,15 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
        le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
        le.offset = gpio_chip_hwgpio(line->desc);

-       ret = kfifo_in_spinlocked_noirqsave(&lr->events, &le,
-                                           1, &lr->wait.lock);
-       if (ret)
+       overflow = false;
+       spin_lock(&lr->wait.lock);
+       if (kfifo_is_full(&lr->events)) {
+               overflow = true;
+               kfifo_skip(&lr->events);
+       }
+       kfifo_in(&lr->events, &le, 1);
+       spin_unlock(&lr->wait.lock);
+       if (!overflow)
                wake_up_poll(&lr->wait, EPOLLIN)

I'll incorporate that into v9.

Cheers,
Kent.

