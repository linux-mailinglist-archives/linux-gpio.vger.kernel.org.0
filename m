Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD4E45AB4F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 19:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239832AbhKWShk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 13:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239737AbhKWShj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 13:37:39 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E0EC061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 10:34:31 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w1so96193043edc.6
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 10:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rUttVp0qcoQ3onsU7kDiVqOGMVslqvMygVqIh78XJp8=;
        b=Jif420f54xa20GI6tGxJz0I4+R5sR/iB7WDpgw9fjVPVjhau8QjrkB52Du9+SdCrsN
         o76E5S5PB5Y4iIJDlh7HuHXqu16tlw8uSnO1UheitynUAmqddZUngIp1BV1w2CovHNf0
         5ElTIZVavJ/lDDTY9wCiOCk9kTEz9KHyTazz4gkSSRHdrHR8J4CEjmDkvDXcMtL2+eLg
         5ly3vFAdJzfaQLKMCirzWuVkJcKlIbPPXrIxf7iVAUfui2sYrMccJ5iFxKBl3VMNuIr/
         TCqwBugflhWjXDenMLBU7g6xpqT2oNUJ2TrxgSP6jKSsBR+M3ipOa+LciJaWkiYNvtXJ
         9qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rUttVp0qcoQ3onsU7kDiVqOGMVslqvMygVqIh78XJp8=;
        b=4Yv3FbzMOf3JBXRK/CvFKBVDEdXgbiloLGEdKscAVOqAPb5yoNDPRbXxuMq85Mk4sN
         llEAj8M3tP72V1aUOBxUH5wd+dy6pHOSruCOqRGMOBg4g4DLd51chD7mwafos8A/D/bE
         No83dzfbkWwdVWk6Wo8syWqPvdgPuh2UMrNEHCXwF3HgSNwy1H/tBnesuydAiJp8KLjo
         0AE0XswwjZmefK495X5R1eG9n2Bbs/zvK/YoH54TqfygEB6FSPMBrdkzM25IHStm3CP5
         siDC7lLy1qub4AOFsVzHGYRD2FsV/ihGmy2vR6apOu3wR38MbPp/O3JoLa88Yx0BOSES
         peQg==
X-Gm-Message-State: AOAM533SM4MWNhEfXcBy0iVlIpyRQa75Tfi0fCmQ1K8TZcUbD/IxXPEQ
        6p6A4eID2hRmGFTiwW6EnKGfo1xSipOzwILvm20Af86uap/cI0Ws
X-Google-Smtp-Source: ABdhPJwbG8101uPiXTB6tjJwbxAKKHFawm2+YtbrETxJtUZ5plM3zsECTNo4IN4XyxW9VHkj9yh5/9+HEAS+Z3ExJLo=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr12478903eds.172.1637692469792;
 Tue, 23 Nov 2021 10:34:29 -0800 (PST)
MIME-Version: 1.0
References: <CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com>
 <CAMRc=McOuJkAFg02+HWDtTxOYm+5io994G8AafnxY32eJJi4+g@mail.gmail.com> <CAEdwc-TS-yTdgg+sLag10jCT+O4H_m4sMANX6mg5oxsTRir8EA@mail.gmail.com>
In-Reply-To: <CAEdwc-TS-yTdgg+sLag10jCT+O4H_m4sMANX6mg5oxsTRir8EA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 Nov 2021 19:34:19 +0100
Message-ID: <CAMRc=Mdgk9hhKgznaH3ftmXNmLORAzrtVr7gE-qr7U6EpjtuFQ@mail.gmail.com>
Subject: Re: Confused as to what is going on with libgpiod v2
To:     Thomas Williams <thomas.hugo.williams@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 11:47 PM Thomas Williams
<thomas.hugo.williams@gmail.com> wrote:
>
> Hi Bart,
>
> Thank you for responding.
>
> > > Sorry, horribly newbie questions and if I should be asking it
> > > somewhere else then please tell me.
> >
> > Hi Thomas! No, that's perfectly fine.
>
> That's good because I've been watching the traffic and it mostly seems
> to be reviews for code that is almost, but not quite, entirely unlike
> what I'm interested in. I'm guessing I'm either not looking hard
> enough or that it is for the kernel level implementations below the
> libgpiod API? - note that I've never had to deal with kernel level
> Linux development before, I'm an applications developer IRL.
>

The linux-gpio mailing list is mostly for kernel development but as
libgpiod lives closes to the kernel, it's developed here too.

> > > 1. Have there been any releases of libgpiod v2 ? I can't see any tags
> > > in the git repo later than v1.6.
> >
> > Nope, libgpiod v2 is under development and will probably still be so
> > for a while.
>
> OK.
>
> Could you explain what gives with something like this then:
> https://packages.debian.org/buster/libgpiod2 which advertises itself
> as "libgpiod2", but on closer inspection says version 1.2-3, which I
> assume is the corresponding version number here:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
>
> Are libgpiod2 and libgpiod v2 referring to different meanings of "2" ?
>

Ha! Yes they do, it's distro's packaging shenanigans! Basically the
API version and the ABI version of libgpiod are different as we had a
non-compatible ABI change back during v0.x.y development. Current API
version for v1.6.x is 2.something.something. You'll see that while the
development files and other packages are just called libgpiod on
ubuntu and debian, the package containing the shared library is called
libgpiod2.

> > > 4. Should I even be trying to use libgpiod v2 yet ?
> >
> > Probably not, unless you have a good reason to (writing bindings or
> > whatever). It's not yet stable and is about to change again soon.
>
> LOL.
>
> Not sure what you mean by "bindings". A friend and I are porting

Language bindings are libraries in high-level languages that provide
an interface for low-level libraries. For instance: the libgpiod
python module exposes an interface in Python for using libgpiod's C
API.

> MMBasic, a *very* niche BASIC interpreter that is usually at home on
> microcontrollers, to Linux. The language has an array of inbuilt
> commands for controlling digital and analogue pins, SPI, I2C, etc. and
> libgpiod seems like the natural match for implementing the former.
>

I can't help you with that.

> A previous (Raspberry Pi specific) attempt by another developer
> floundered because (apocryphally) he was trying to treat the Pi as a
> microcontroller and programming to too low a level (directly to the
> Broadcom API) and finding that it was breaking on every O/S update. We
> were hoping to avoid a repeat of this by relying on a higher level
> API.
>

If you're using linux, then that's precisely the right approach.

> I imagine you are busy, but would you care to offer an opinion as to
> whether we should persevere with API v2 (where my friend has had some
> success) or roll-back to looking at v1.6.x, assuming that it even
> provides everything we need ?
>

v2 API is simply not stable. At the same time I'm working hard to
bring on the v2 release but I can't give you a timeline as I'm doing
it in my free (hahaha... :( ) time. For current development I'd
suggest sticking with v1.6 for now.

Bart

> Best wishes,
>
> Tom
