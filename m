Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB81A4597D9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 23:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhKVWu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 17:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhKVWu1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 17:50:27 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18728C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 14:47:20 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id v203so17760509ybe.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 14:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9LaFzLK0hYh0Uvvm43v8pM+uoWt5O0sDRI1MK9UEFgM=;
        b=nivRTfNIjXolb0x6gFIq12iNdLTv8tr7fm9s+nMZBF3km/12v4p/Q4m3vYt0gMS+SQ
         p2LZRGjvqR4Sb3TBSN47DkCLLXO2qndg1sSTcfY+K7JBmIGyrvhW5shq2qqg8tmAdubu
         yiGgUWAMxXaXb1D4dj0dhHIlbjKj1iO6MDVDJjXr6oN0eL/07WbOQDQMwxx/CyLnBhk6
         Catpf/PcvuDKci0YvhySkep+1llqZUbJqADNVgF4TDCMPLiYzO2Qs7vplP645ksAe8GN
         ynwcWOZG/wRlW3S4nhzCs7UJNabqhIxTpc0zQDM9wpeUUQHgQEDA7aJDBAwwlZLbBSo/
         WCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9LaFzLK0hYh0Uvvm43v8pM+uoWt5O0sDRI1MK9UEFgM=;
        b=QRBt2dRD9hXe+wOowOJ/Em6giSq6buy2fdU7PmS/0qnHeAW0k0j1E+RTRWjz5uCWBu
         r9g+oLksTKLh0JuatmL8uHoGdKGa8MqgIe/uHBr0rZ3ZuZLRPhQGAWlduMevL0JO2Pf1
         qD2B8I38szSPITyDrG1onsR4g5dWx9S6HcbRAe2lMO61DTLtqpW+0fl9z7OQfRiNnKmm
         p+l0vqFhPSw5Kmq4s+kuR4TT3Ax6B6QtFZ3KiOoRtm9tI7H31G9CXJi8YIzjceQwHBRQ
         eL2N9mXXHko5ZuS1iXHmXiL8vE66i9nT9ZRtkySjw8dI3iJN/smUxcxuzsUnRNeGDJHQ
         8zPg==
X-Gm-Message-State: AOAM531Gcb2f/9taB7zKv3+kwqdt7nyywB6B8Sjw3LS0oq12TuheAOmU
        S5qZ4fhaW8xs7TpEa7XAjku8jjWht0zRrqh8KDsWHX8Mng==
X-Google-Smtp-Source: ABdhPJysTM2OEJqANaPzJ33gx12IGiwGrWA6pDMRtCIufrf9sZBK952MxVkXVyhyQrxcDQPlBv/vHKEeDyLd41OmKbQ=
X-Received: by 2002:a25:b7c2:: with SMTP id u2mr762870ybj.17.1637621239287;
 Mon, 22 Nov 2021 14:47:19 -0800 (PST)
MIME-Version: 1.0
References: <CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com>
 <CAMRc=McOuJkAFg02+HWDtTxOYm+5io994G8AafnxY32eJJi4+g@mail.gmail.com>
In-Reply-To: <CAMRc=McOuJkAFg02+HWDtTxOYm+5io994G8AafnxY32eJJi4+g@mail.gmail.com>
From:   Thomas Williams <thomas.hugo.williams@gmail.com>
Date:   Mon, 22 Nov 2021 22:47:08 +0000
Message-ID: <CAEdwc-TS-yTdgg+sLag10jCT+O4H_m4sMANX6mg5oxsTRir8EA@mail.gmail.com>
Subject: Re: Confused as to what is going on with libgpiod v2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

Thank you for responding.

> > Sorry, horribly newbie questions and if I should be asking it
> > somewhere else then please tell me.
>
> Hi Thomas! No, that's perfectly fine.

That's good because I've been watching the traffic and it mostly seems
to be reviews for code that is almost, but not quite, entirely unlike
what I'm interested in. I'm guessing I'm either not looking hard
enough or that it is for the kernel level implementations below the
libgpiod API? - note that I've never had to deal with kernel level
Linux development before, I'm an applications developer IRL.

> > 1. Have there been any releases of libgpiod v2 ? I can't see any tags
> > in the git repo later than v1.6.
>
> Nope, libgpiod v2 is under development and will probably still be so
> for a while.

OK.

Could you explain what gives with something like this then:
https://packages.debian.org/buster/libgpiod2 which advertises itself
as "libgpiod2", but on closer inspection says version 1.2-3, which I
assume is the corresponding version number here:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/

Are libgpiod2 and libgpiod v2 referring to different meanings of "2" ?

> > 4. Should I even be trying to use libgpiod v2 yet ?
>
> Probably not, unless you have a good reason to (writing bindings or
> whatever). It's not yet stable and is about to change again soon.

LOL.

Not sure what you mean by "bindings". A friend and I are porting
MMBasic, a *very* niche BASIC interpreter that is usually at home on
microcontrollers, to Linux. The language has an array of inbuilt
commands for controlling digital and analogue pins, SPI, I2C, etc. and
libgpiod seems like the natural match for implementing the former.

A previous (Raspberry Pi specific) attempt by another developer
floundered because (apocryphally) he was trying to treat the Pi as a
microcontroller and programming to too low a level (directly to the
Broadcom API) and finding that it was breaking on every O/S update. We
were hoping to avoid a repeat of this by relying on a higher level
API.

I imagine you are busy, but would you care to offer an opinion as to
whether we should persevere with API v2 (where my friend has had some
success) or roll-back to looking at v1.6.x, assuming that it even
provides everything we need ?

Best wishes,

Tom
