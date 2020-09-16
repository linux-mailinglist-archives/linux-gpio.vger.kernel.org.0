Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195F126C085
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 11:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIPJ3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 05:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgIPJ3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 05:29:12 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4ABC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 02:29:11 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id r9so7524422ioa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ssWXm/aAzV/mWSDAwgcxBk2bNFE2yr8MdoFQtlOyi4=;
        b=n3drZwnKQRG5RCudBJtkgTc0pqjeCdXlpcMzdPQhFdWVbJyt20MULtbbvNm84rrdz2
         LcGRyuSls5+sSz5kUot+QRL31IQlBjTTQPNfqv/YXIQIOG71SHa4AghALgmLuOt2x26/
         xQ6T6sw3R2Gwgz2lnwRsScibQJB3qFQxWbc49JyWfU2gZ3WJ00yxyO5KB6jTaFgotK6j
         uS4yQ2w0sjlY/MI0n97nJ0x7njosDmcVfAE2UBxMNIJBLkzqTHdXe52GUh/oSkjVbGDR
         BY2LbWPb+Z+gHc9zUgdaVvcNF4+UttJtaPktlrxTMLPQ0giRZqql7xsuhb0g4C+aNrWZ
         0lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ssWXm/aAzV/mWSDAwgcxBk2bNFE2yr8MdoFQtlOyi4=;
        b=MBEowxNX5xrGpQjqOBQ5TDTTfsjKWNPQSwlQ7dmLTdnU4jHiPZAujkbKn3TZRF3DZI
         X4BvcITS6mrcqdq437qfB5aj378F2YMgWc+NaKcmRQ28wyteapa6YPlUyTxLsM0jOsfj
         E++daVAscoYYAzl0xfbKQUwucPyt0zXUeqhcElRB2Czt1RBysKSeBoyfSpuLVDvTkt7a
         DH9E17MmoS+owHwRP8zGiKVF/b01DuSt89StzfRSFV9xAcnf2e2iskQ9ypqUWXF2Me2s
         xWPliKclyCJE8+aAPbmiNP6K5ShpAAsur+iEcMhgfon024R92iPxeNkC4RzXEL5yt2kc
         9H8A==
X-Gm-Message-State: AOAM533GUd2B0X0ztKNajfgevXSpepR/01HDp6rY6ZdwaqFZGxXx/MLE
        LEAe6YoBoSStYAOBTtLcKPPiDCANh2jStlZtko1++g==
X-Google-Smtp-Source: ABdhPJyIfBgL7SXFrkw72pt16Jrvmlo3b1fEehyUBORfOfvMXEzQ7rqwJ48TSOLhDf7jFIXA3KmHgNOC3GDBM6Gr99g=
X-Received: by 2002:a5e:dc08:: with SMTP id b8mr18370429iok.13.1600248550690;
 Wed, 16 Sep 2020 02:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol> <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
 <20200915135732.GA100294@sol>
In-Reply-To: <20200915135732.GA100294@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Sep 2020 11:29:00 +0200
Message-ID: <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Maxim Devaev <mdevaev@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 2:27 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Sep 15, 2020 at 10:34:31AM +0300, Maxim Devaev wrote:
> > > The bug was introduced in libgpiod v1.5 so, depending on your
> > > circumstances, I would revert to an earlier libgpiod or apply my patch.
> > > ...
> >
> > Is this behavior documented somewhere? It's a complete surprise to me
> > that this is how it works. I expected to lose the old events. It seems
> > to me that for software that catches edge, the loss of new events is a
> > serious problem, since it can lead to a desynchronization of the
> > physical state of the pin and the user's information about it. For
> > example, if event 16 was falling and event 17 was rising, and the
> > signal stopped changing and remains at 1, the kernel will tell us that
> > it was only falling (i.e. 0), while the real state will be 1.
> >
> > If we lose events in any case, then in my opinion it is much more
> > important to keep the current state, not the past. I can't think of a
> > case where the loss of old events can lead to problems, but the
> > desynchronization of the current state actually means that the
> > software can make the wrong decision in its logic based on the
> > driver's lies. Yes, this would be a breaking change, but it seems to
> > me that it is the current behavior that is incorrect. Don't get me
> > wrong, I don't insist on it. If this decision was made for certain
> > reasons, I would like to understand where I am wrong.
> >
>
> I agree - it makes more sense to discard the older events.
> The existing behaviour pre-dates me, so I'm not sure if it is
> intentional and if so what the rationale for it is.
>

While it predates me too (Linus: any particular reason to do it like
this?) I think that requesting events from user-space is a contract
where the user-space program commits to reading the events fast enough
to avoid this kind of overflow. In V2 we can adjust the size of the
queue to make it bigger if the process isn't capable of consuming all
the data as they come.

> And I'm still trying to think of a case where it would be harmful to
> change this behaviour - what could it break?
>

Well, I wouldn't change it in V1 but since V2 is a new thing - I think
it should be relatively straightforward right? If we see the kfifo is
full, we should simply consume the oldest event on the kernel side,
drop it and add in the new one. Maybe worth considering for v9? I
don't see any cons of this and this behavior is quite reasonable.

[snip]

Bartosz
