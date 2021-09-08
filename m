Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB7240354A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Sep 2021 09:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347505AbhIHH1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Sep 2021 03:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347449AbhIHH1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Sep 2021 03:27:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4C3C061757
        for <linux-gpio@vger.kernel.org>; Wed,  8 Sep 2021 00:26:29 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id h9so2237809ejs.4
        for <linux-gpio@vger.kernel.org>; Wed, 08 Sep 2021 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y5oxOfqa+jGQ0fJQGJq3gmhfZxrLYBOPvpDpkldQke0=;
        b=VRPBDw4QfPjww0fyYwOqFu/b8UuEbcoxYHSj1pdxJocHmI2o5m42MLColTh1dR8D8H
         bt5CZzTfmwZHU0i7fogiiktK1HVMdH8e/Z0xZYIoZV2uSRftpTI9g1P4TufpwKEkCLJj
         iABFYRoQ/QqK53LlnzWnR7kGgGUN++dvbN7XW4nays2KyVC+5cQ+XDLaV9ahmZWeefXs
         gbTmd5eqfBQJeb2fOENiRnjMz2EZAcY/ef1MKwXQwqCPudANuaNquG85Ka+jh6+ZS74g
         5EA5eLlJS8xi5TfIJCjonp1tnAlbBw3XiBBTg7NN4IR7+oTbKkseJidonOpsZkg4oiw7
         67Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5oxOfqa+jGQ0fJQGJq3gmhfZxrLYBOPvpDpkldQke0=;
        b=uRm1NCPkGYNdt6jWKF/as5AoCZiZkBZa56SK38Ar/56ExJt6yJrXaTNzBR6PA6nBcE
         Aq1revb/QFi4z1AalNHOTcNhfp57OH/rryv6rN4b70Z8LqHccpR/UUaenAueapizWUTK
         ST7u9wECeDkKId8yZ3oghXL1VXv8JW3ZG4OQB6LET3muXtIL2l70its+/gcKMvOS8vGg
         jB1LHl7VC8wc6jKUX8hzJbbii2mbuVL3oFwEjwQvHf3MdhMh3Zi927OWy6YzorYgCuGP
         NzWwT5t901LhVA5M4s/p5q1RLOi1JhTzvZCOCE5te57z/JslXo7LcdwPCfnTSS437aWL
         I/NA==
X-Gm-Message-State: AOAM530OkdtFbmfplxuiVTqiyOSqtmcbm9bBv06C+R72InqSkwcscX88
        k+W8f/NGxHobO1zq4WN/2N5EXAmpS/P1N7ZUXrmPlA==
X-Google-Smtp-Source: ABdhPJwhE7rBpdZTJieuGvVC085G3HLnlR/XC9ofe1Zhw1bZwAPzYtYLpGCxF+HzbU3M+xqqRJ71oRA1DwdNZQxafAk=
X-Received: by 2002:a17:906:a018:: with SMTP id p24mr2529713ejy.349.1631085987755;
 Wed, 08 Sep 2021 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083613.31268-1-brgl@bgdev.pl> <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
In-Reply-To: <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Sep 2021 09:26:17 +0200
Message-ID: <CAMRc=MdFCOiei0xxDuChfM0puu2XDkAKC9nsr+Cw5kyCFSjYZA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.15
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 7, 2021 at 9:36 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 7, 2021 at 1:36 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> >  We also have a new/old GPIO driver for rockchip - this
> > one has been split out of the pinctrl driver, hence the pull from the
> > pinctrl tree you can see in my branch. Another merge in the tree is from Andy
> > for the intel drivers.
>
> I appreciate the heads-up, but just *look* at those merges.
>
> The intel GPIO merge at least talks about what it does, and looks
> sane. I'm not convinced that automated shortlogs are great, but
> whatever. The merge isn't bad.
>
> The rockchip one?
>
> All I can say is "WTF?"
>
> This is the complete and full commit message:
>
>     Merge branch 'ib-rockchip' of
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> into gpio/for-next
>
> what part of that screams "that's an acceptable commit message" to you?
>
> If the reason for that merge was that you want to have the current
> state so that you can split it up, then SAY SO, for chrissake!
>
> Not that useless commit message.
>
> Why do I have to tell this to people SEVERAL TIMES EVERY SINGLE MERGE WINDOW?
>
> Merge commits need explanations. They need explanations for why the
> merge is done, and what the merge pulls in. Not this "single line that
> doesn't explain anything".
>
> Dammit.
>
> I've pulled this, but I'm upset. I'm upset because I've told people
> literally hundreds of times by now. Merge commits are not some trivial
> thing that should be ignored. Quite the reverse. Merge commits are
> generally worth *more* explanation than normal commits, and should
> take *more* effort and thought than some random code commit that is
> obvious from just the code.
>
> Exactly because merges are *not* obvious from just looking at the
> code. It's not some one-liner that is self-explanatory.
>
> If you cannot be bothered to make proper merge messages, then don't do
> the merge. If y ou don't have a good reason for the merge that you can
> articulate, then don't do the merge. If you can't explain what you are
> merging, then don't do the merge.
>
> It really is that simple.
>
> I've pulled this, but I'm really fed up.
>
>             Linus

Hi Linus,

Thanks and sorry, noted for the future PRs.

Bartosz
