Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3275C4789E7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 12:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbhLQLaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 06:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhLQLaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 06:30:02 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685EDC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 03:30:02 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y13so6453041edd.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 03:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BTA2nXvdFwwc3m0/iWzHcSoz8qgj1Cg+yjrMT+WtD1M=;
        b=Kjk329bLbSlcTYRsT2D3HQUHqs9EASv4H+8ZwUIlY5kIVj9mbhlmnewaI/WH/gSkJ2
         OiS9wh3IUYS9e9JvIxjsRat+lrESfWIPd4RD/HLEjxYZdUW1KFK2iGVDBjlK2Q1K6vap
         mltbm74bcnliDg535vjS+JVoXO7zFaAH6EusRk3LvXoD60bPWf5VEL93hzoliCxvRpiT
         Ia3wI9X0yWihkzKad2/ePWdBKhAxhcf86wtUrtV1xNc6fCmKOneUisl3PNIiYpYSk4Jx
         Z+WiD7e11K5g5YJbn9Ci1NTxzrCyZER4Yv/gYYSabSGYHOzkdliZVMReoJXiQlPdY8tt
         GG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BTA2nXvdFwwc3m0/iWzHcSoz8qgj1Cg+yjrMT+WtD1M=;
        b=YcB2YRU2mqoDT9kwGqER7pnqrwnEXc0ZfCu6x+1voBmswxZSZcv7Nn2XEvxbh3wS8S
         gDlhEgcGgo4wXwktC4Nlc84bU/xzSBBEUXmOck9nXTR7jijRHufcMwDaN7T64hAdbdsY
         Nu/MWgg2cP+hJH/FKMuqDySJvtZgawESUSlAYQr7WgG1s/3euCNOQ4RwAipdVsYfEtN1
         Wr82QkCCZBOyO3KTXyEwhZjnjfx4HwFHUUrhO3m96tntYATuQE3nAYM+/ttHrXEnhAQH
         auafbU/Xwrchtpg+zCdwLqb6AEZBTaPFdnp5f9HGNihoqFH4+3J4zXMmgAYe4vMaSOqz
         rAZw==
X-Gm-Message-State: AOAM530coj0j/ejELsfIf2sgjR68zq8mOxAxKs/N4MzRom3ztLq7UJOz
        PPnmlVgvSi7timjxsxQBXqu1I8TPyq+KbXUdJIuzNTtCZ9M=
X-Google-Smtp-Source: ABdhPJxEjeCtOn2mKso3xe2SZWQ3ESzTrtR+h/b5/tkEg47RWhcuuAbB2MZ7f6ocOMMunw5gcsWaekVJFedMFdUg+IU=
X-Received: by 2002:a05:6402:22c6:: with SMTP id dm6mr2433764edb.405.1639740600973;
 Fri, 17 Dec 2021 03:30:00 -0800 (PST)
MIME-Version: 1.0
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com> <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com> <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
 <Ybs5jqW3zyDh18Vx@smile.fi.intel.com> <CAMRc=MdWQEk-+-rq5ML=Yj-7ZTFMv6B0WocgqWJQu6GPkOsx2g@mail.gmail.com>
 <CAHp75VfTQ-V6UMt570PV91ZkGFX8GOHepPsM3i2DSwp3J9ht1Q@mail.gmail.com> <CAMRc=MeZoDKOymaSyotXaD=7B+U-dM7G44b601agVqDXzRWnWQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeZoDKOymaSyotXaD=7B+U-dM7G44b601agVqDXzRWnWQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 12:29:50 +0100
Message-ID: <CAMRc=Mf+MNTkA6=xg=vhfEY8P8w9MnMzura7OwOQYOBjxcemQw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 12:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Dec 17, 2021 at 10:53 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Fri, Dec 17, 2021 at 1:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Thu, Dec 16, 2021 at 2:06 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Dec 16, 2021 at 12:46:11PM +0100, Bartosz Golaszewski wrote:
> > > > > On Thu, Dec 16, 2021 at 12:37 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:
> >
> > ...
> >
> > > > > > Are you going to pull series with the OF node assignments clean up?
> > > > > > I forgot to mention here that my PR does not include them.
> > > > >
> > > > > Yes, I'll queue it this week.
> > > >
> > > > Thanks!
> > > >
> > > > Do you know that your branches were kicked off from the Linux Next?
> > > > Are you going to drop previous gpio-sim from the Linux Next?
> > >
> > > No, I didn't, thanks for the heads-up. Old gpio-sim code conflicted
> > > with the one that was queued for v5.17. Should be good now.
> >
> > Thanks
> >
> > Btw, I have noticed you rebased your tree, can you, please, do not
> > forget to put --rebase-merges to your `git rebase` command line so the
> > merge won't change commit IDs?
> >
>
> Oof you saved me from another LinusRant. I already pushed it, let's
> see if I can get back to the previous state...
>

Done, reflog is my best friend now. Please take a look if all looks good to you.

Bart
