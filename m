Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1981F3763
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 11:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgFIJ5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 05:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgFIJ5m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 05:57:42 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A65AC03E97C
        for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2020 02:57:40 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 205so20176115qkg.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2020 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mSZ9Pf7BMHDh3WUE/xt0FmuEkxc1Vdz25gGMRgBtWPg=;
        b=hvs/IFpkcvVFV9C0DuVWpln5RNediRV7+SlNLZGIbWgMSdFuPGK70CEnXRvuVqiCPQ
         yEz0uxDZjlVw+OgyYdC5rQMURQocdeM1dcKoGVbveeOVW45aLBMd+LKdCjvyf0+U7pop
         Sv+Zo+H8eoCH+rONDcBcgGvxNF4AodAUCq+m7SWn3lCIe1T2HT81SjW3ryd/AFpkrtaT
         5Wrmt5XSUiwS/Aj8HYtyDObXrego3RX3Y4NCKNNDkoN2bzxAnOCQr6G68ui1/BThRaca
         XgPEhB2hS00JxvtU+R6xXL4KLlSQh5TUSwuXq2qn+KTv/j8a95WcISYbssHxOzdzH5lv
         5wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mSZ9Pf7BMHDh3WUE/xt0FmuEkxc1Vdz25gGMRgBtWPg=;
        b=kQ9GuKVPvb/GGSBbNXx6Qwqvp/FN2FmC2g8TrAajUfynpn+B6X7gbKkJFK340AbTxX
         m2mAQgOfLdAismmHM14ro0s4LsPRWs6WaHQpuBfnYsPrHMJMCVXfDoGcDJPmrNFw7Wkr
         hCzeaof7uE05niSVpL+nfjz3pioJxpLbeyXor+9xiq6UQvzUHrVM7vIYG0kX9lIZ2itu
         wufwiAcwZN1Uz0e30S3WVqCmJCX3h3E9zDZqj1Zq+f9AAIyeOdkpuF6FxGxeWHlFPdSt
         OlcyDf6xpsq2bW/FUpKT+CjVZJQQ7Pr1SyN0UhPMvHsQO5MZQN63VehxnQxoGFLOppls
         WP0w==
X-Gm-Message-State: AOAM532cJhGOQxYdQJgyj5w5oYIx5zigaib1qA0C5X54VSjk3L+MvQok
        NekRZwP1g5wnGL6WBqe9Gxc2FxoRJhoXCzyS7vaIJQ==
X-Google-Smtp-Source: ABdhPJxu6LS/DBVDrKsowqECfF6MhViQJW4MJiVqI/Gqv4K2dXJOO/xIxFFqQHdnBSnwNdXKJU2SU9BCvvkekboYeVo=
X-Received: by 2002:a37:4f52:: with SMTP id d79mr26882586qkb.330.1591696659006;
 Tue, 09 Jun 2020 02:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200516064507.19058-1-warthog618@gmail.com> <CAMpxmJUbC4qmUGM0Z-6hXsYPRSpEpNM7iXgc7XbMcf_epi0Lig@mail.gmail.com>
 <20200604160006.GA5730@sol> <CAMRc=MfS1sCTU3vs5Gq_6+Ubt_89HX34mqabtpGbAASo+SfzSw@mail.gmail.com>
 <20200606015647.GA8099@sol> <CAMRc=Mdz__0TD8Qa33KRK9PE6jLvxa_O_dDjA54MHBLOeMxWfg@mail.gmail.com>
 <20200609094338.GA16448@sol>
In-Reply-To: <20200609094338.GA16448@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 9 Jun 2020 11:57:27 +0200
Message-ID: <CAMpxmJV9SL9pJpc5MwhREiP0On999CRW2Em4SbRKf9PQHOtPCg@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 9 cze 2020 o 11:43 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> On Tue, Jun 09, 2020 at 10:03:42AM +0200, Bartosz Golaszewski wrote:
> > sob., 6 cze 2020 o 03:56 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> >
> > [snip!]
> >
> > > >
> > > > I'd say yes - consolidation and reuse of data structures is always
> > > > good and normally they are going to be wrapped in some kind of
> > > > low-level user-space library anyway.
> > > >
> > >
> > > Ok, and I've changed the values field name to bitmap, along with the =
change
> > > to a bitmap type, so the stuttering is gone.
> > >
> > > And, as the change to bitmap substantially reduced the size of
> > > gpioline_config, I now embed that in the gpioline_info instead of
> > > duplicating all the other fields.  The values field will be zeroed
> > > when returned within info.
> > >
> >
> > Could you post an example, I'm not sure I follow.
> >
>
> The gpioline_info_v2 now looks like this:
>
> /**
>  * struct gpioline_info_v2 - Information about a certain GPIO line
>  * @name: the name of this GPIO line, such as the output pin of the line =
on
>  * the chip, a rail or a pin header name on a board, as specified by the
>  * gpio chip, may be empty
>  * @consumer: a functional name for the consumer of this GPIO line as set
>  * by whatever is using it, will be empty if there is no current user but
>  * may also be empty if the consumer doesn't set this up
>  * @config: the configuration of the line.  Note that the values field is
>  * always zeroed.
>  * @offset: the local offset on this GPIO device, fill this in when
>  * requesting the line information from the kernel
>  * @padding: reserved for future use
>  */
> struct gpioline_info_v2 {
>         char name[GPIO_MAX_NAME_SIZE];
>         char consumer[GPIO_MAX_NAME_SIZE];
>         struct gpioline_config config;
>         __u32 offset;
>         __u32 padding[GPIOLINE_INFO_V2_PAD_SIZE]; /* for future use */
> };
>
> Previously that had all the fields from config - other than the values.
>
> When that is populated the config.values will always be zeroed.
>

We'll probably abstract this away in libgpiod and your Go library but
for someone looking at the ABI it may be confusing because a zeroed
values array is still valid. I don't have a better idea though.

[snip!]

>
> > > > > And would it be useful for userspace to be able to influence the =
size of
> > > > > the event buffer (currently fixed at 16 events per line)?
> > > > >
> > > >
> > > > Good question. I would prefer to not overdo it though. The event
> > > > request would need to contain the desired kfifo size and we'd only
> > > > allow to set it on request, right?
> > > >
> > >
> > > Yeah, it would only be relevant if edge detection was set and, as per
> > > edge detection itself, would only be settable via the request, not
> > > via set_config.  It would only be a suggestion, as the kfifo size get=
s
> > > rounded up to a power of 2 anyway.  It would be capped - I'm open to
> > > suggestions for a suitable max value.  And the 0 value would mean use
> > > the default - currently 16 per line.
> > >
> >
> > This sounds good. How about 512 for max value for now and we can
> > always increase it if needed. I don't think we should explicitly cap
> > it though - let the user specify any value and just silently limit it
> > to 512 in the kernel.
> >
>
> It will be an internal cap only - no error if the user requests more.
> I was thinking 1024, which corresponds to the maximum default - 16*64.
>

Yes, this sounds good too.

Bart
