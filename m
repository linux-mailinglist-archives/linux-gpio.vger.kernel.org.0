Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B6C47881F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbhLQJxO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:53:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbhLQJxO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:53:14 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16FEC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:53:13 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z9so5684969edb.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s/PGwGD3aOEhuVc1VXoyvmX2nCBvWa/rPwVYKTB/VDU=;
        b=IplB0YOJ0SD0Y7Gf3/aPi4AxKHx6E3EZqlKoDF/OvN4ob6IZVaAEmcAodnFL/vNG9/
         bDvniKVyFotEJNeqJsu4YOacxChM9oTUF3Kh5Vhkg1GU3NxnLXKEARUJIECVOGKn/Uc2
         cI4+9445035SgxGkTd6ro08IVlxnYdcg/zlsJqGzn5+vUHLvrEugoByCPG1iKYLdXOOs
         JDA+XuYF9X86raRUjldnpPM+bqkyHClE0MRe1q7BUbzMrK6jT31rpAoCOYabVsH5Hp/Y
         cqGrxDK/u/h92k8J4NSrYC8Ivl6UH14gj+qCWgpeMSKZhkA0CHRkwwsVC+lQBJIoz60o
         oBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s/PGwGD3aOEhuVc1VXoyvmX2nCBvWa/rPwVYKTB/VDU=;
        b=Ke0GY7IOYVjJ9fux38cYMxfmaILWrAFizUMtOK57T7ZW10sn8ngIeZ/2E9CGHP4HpU
         hPlVwPZLjBJJ1YVFzuyKHlq5jMcw5v0vQgsbwbU5ygqm+eIFMNxZM347XYhVK1qunk3h
         ihw7BN0SH9uBWtgWdZiECjxYdPap+IYY3SDViewuzRg48LF2JtARJXzmqc32O3OCSIlB
         NkUDzRuPEu6Kh7kJoGfp9tJ7Dg4sGRuvMM+7dGyLw9bwFNI1gL2/Uo6Syw3x1YNYFnLG
         O7PKoHAGB1PEVLAGc0nHeUGnKV0gVgX0L9PZXDPlyBaXJNCj16cA81mwGiD+WEv9biGW
         nYMA==
X-Gm-Message-State: AOAM533cAxL52a9aRk/VTdDZQzMX0kpETGP70LMYiZ1yk74OwxvWm6an
        wlmCE/vSn0+cFQ8UXOTk5l5lLiSbQskIESKYkxg=
X-Google-Smtp-Source: ABdhPJyDL8k8X4l2HRAKQsCrI1o5jCt1mRApOpdg39t8tcQU1FHZC7dZZU0MkZpnB4NvGL5F+ZlXR9PpdVBQ/qGksks=
X-Received: by 2002:a17:906:a3c6:: with SMTP id ca6mr1871040ejb.639.1639734792445;
 Fri, 17 Dec 2021 01:53:12 -0800 (PST)
MIME-Version: 1.0
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com> <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com> <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
 <Ybs5jqW3zyDh18Vx@smile.fi.intel.com> <CAMRc=MdWQEk-+-rq5ML=Yj-7ZTFMv6B0WocgqWJQu6GPkOsx2g@mail.gmail.com>
In-Reply-To: <CAMRc=MdWQEk-+-rq5ML=Yj-7ZTFMv6B0WocgqWJQu6GPkOsx2g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Dec 2021 11:52:36 +0200
Message-ID: <CAHp75VfTQ-V6UMt570PV91ZkGFX8GOHepPsM3i2DSwp3J9ht1Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 1:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Dec 16, 2021 at 2:06 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Dec 16, 2021 at 12:46:11PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Dec 16, 2021 at 12:37 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:

...

> > > > Are you going to pull series with the OF node assignments clean up?
> > > > I forgot to mention here that my PR does not include them.
> > >
> > > Yes, I'll queue it this week.
> >
> > Thanks!
> >
> > Do you know that your branches were kicked off from the Linux Next?
> > Are you going to drop previous gpio-sim from the Linux Next?
>
> No, I didn't, thanks for the heads-up. Old gpio-sim code conflicted
> with the one that was queued for v5.17. Should be good now.

Thanks

Btw, I have noticed you rebased your tree, can you, please, do not
forget to put --rebase-merges to your `git rebase` command line so the
merge won't change commit IDs?


-- 
With Best Regards,
Andy Shevchenko
