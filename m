Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9AC478991
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 12:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhLQLNW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 06:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhLQLNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 06:13:20 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8157FC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 03:13:19 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id y13so6289957edd.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u85Wh5FbaLvjCCrTArRIzfZuKEa9Y16ELUruodqHgHo=;
        b=fx6cbIGC7vAWd8w/uQi9mUF6Itlx+FcQ3+KE+Fo8srTOLC263kEipHHr6BzFQh0a83
         sFncQVvhX/rHP3Badx9yosRrtnhlV1WZmYFK1ZwfdLUJKFo8XiOQR0m3Y3+P92wXfcdd
         FcE2FiC7xpsLvEXZZnsi/y5F4tqCK0oFUVUypnW7LGn5R+HrMpPQQYic2/Q7wgnofIqb
         /vbAwr/lHFw+Rkp556j+vHrylXa7iebt8nJhSeTve4CzSG4/GqRoA1u44oqP18ZDWule
         NWI7ycgXYBAxRJ9EosiX6J1vrEu3YPQdw99u5Yf+Rl522b9dG0IaYW7FyGFyTm3Exle0
         2v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u85Wh5FbaLvjCCrTArRIzfZuKEa9Y16ELUruodqHgHo=;
        b=y0jGR11XcYfLWu6PC4Petc0ORO+CQxEofJKrBzJVaBXpBLUwHPwtMRxkWPdvyiiDJN
         4EegR0ZTUUP6V5dsLC3jdmN7bcZDqNZ8bEYJsia5AkzlZsBcI6Bpt1XVG/WSarQBMI58
         LXWthT8qZAD7Yx56xONN0OO8dGHe3G/cmP2GfrYCulzdkDGem7K+4lAF0CfJAZzGzYHD
         +ykGKq/exVZJNdZOyjm7YSYwhFcJS0EXH1w5iUqygVPMlphRqQmf8xxoFv50tm3Z3NKd
         l8Ns1YXoAQTQ3D/fnqFKUEnnMiSZDak25/xP0kctf9DT3jszOSzMXFRNM0terYfLNl2r
         J0lA==
X-Gm-Message-State: AOAM533mgLA5biDokrfrQsPjmhG2RPUVllsZU8c6kcfsvju6dbq5ydcP
        M40eTmijm5PGB+aOH0xm4JecpiqDfoUsVdGD8MtY7w==
X-Google-Smtp-Source: ABdhPJw5rpQrxc8RU0d9Uvo86hc9aVtILlLYeW5V2MgrnCY1eRdcYVGSWoQAiYaKqqFyRjAVL6bx36yz+146Oa8xE0I=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr2084403ejj.636.1639739598104;
 Fri, 17 Dec 2021 03:13:18 -0800 (PST)
MIME-Version: 1.0
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com> <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com> <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
 <Ybs5jqW3zyDh18Vx@smile.fi.intel.com> <CAMRc=MdWQEk-+-rq5ML=Yj-7ZTFMv6B0WocgqWJQu6GPkOsx2g@mail.gmail.com>
 <CAHp75VfTQ-V6UMt570PV91ZkGFX8GOHepPsM3i2DSwp3J9ht1Q@mail.gmail.com>
In-Reply-To: <CAHp75VfTQ-V6UMt570PV91ZkGFX8GOHepPsM3i2DSwp3J9ht1Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 12:13:07 +0100
Message-ID: <CAMRc=MeZoDKOymaSyotXaD=7B+U-dM7G44b601agVqDXzRWnWQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 10:53 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Dec 17, 2021 at 1:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Thu, Dec 16, 2021 at 2:06 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Dec 16, 2021 at 12:46:11PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Dec 16, 2021 at 12:37 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > Are you going to pull series with the OF node assignments clean up?
> > > > > I forgot to mention here that my PR does not include them.
> > > >
> > > > Yes, I'll queue it this week.
> > >
> > > Thanks!
> > >
> > > Do you know that your branches were kicked off from the Linux Next?
> > > Are you going to drop previous gpio-sim from the Linux Next?
> >
> > No, I didn't, thanks for the heads-up. Old gpio-sim code conflicted
> > with the one that was queued for v5.17. Should be good now.
>
> Thanks
>
> Btw, I have noticed you rebased your tree, can you, please, do not
> forget to put --rebase-merges to your `git rebase` command line so the
> merge won't change commit IDs?
>

Oof you saved me from another LinusRant. I already pushed it, let's
see if I can get back to the previous state...

Bart
