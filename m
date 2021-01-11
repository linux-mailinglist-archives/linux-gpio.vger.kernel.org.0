Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB3D02F1958
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 16:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbhAKPQP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 10:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbhAKPQO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 10:16:14 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4635CC061795
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 07:15:34 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id j16so126607edr.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FzgkbHegdCA7K9vj/qbXflU/kxCPdWZspabIYz0ksp8=;
        b=fN2EnYW78nETiDKQSfDMzwFQN858zm9HhmnN5km6Y//JYD/jqupaNBCupQqGdZLeRv
         mBxeAQNMJ1asf/fgzJ9FIPnAHOocNKEUct9talZPd7uyIaViS18UR/pHTfbxIdlHziit
         FdWgrWIxHg+44dnG8/SwmSNZFe+tbiZzbMrxfgeaKv44dFg8ZNruHrSQBgumASWuBTCY
         othHI/1z4GqgThXI7yGfogwqIJJwO9ISeQNB3qGcC5x4XExsbZkRCEV+scIEWCHWPqaI
         Cd6DsqrAcOE+Yg7jxzzUybsHOLxxfS+4wuk6jOX58O0lqWkme/mPDyPW7clmLB0AUSOj
         DlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FzgkbHegdCA7K9vj/qbXflU/kxCPdWZspabIYz0ksp8=;
        b=LvXJxAH3MpK/fNniQJwIDoS4b2fIwL7B6ASACb3TMheD45dtohLfv0BODza8m+5k2h
         VhdkkvAlgoOL8ouP3fWLSwJd203f30VGecG9n8wqdVH4ppd2/PurDtBKX1Jp5CePEHjW
         o7Lj/CJn/42Ak6bfNjsEv0ZySTJePtnBvh1s2qENvoOGZYubgiu6AtKQZu+BQXV/pidi
         GoLK+t9qAbcAt7ARbQEiPiTNUKSFRVh0OC1QsN4pADMqqXLj+iSZfaSo6D7RUVOJIgqg
         LfMegKFX3zv4ybyT0Ezk1CHEZzXrA0AQ8FUUU09kmu8hKafatNhvBLbweBvwshuoS973
         KpMw==
X-Gm-Message-State: AOAM532XB+JEqeDNQexP+fWPMn5qqx3dRcvHNn2PvBcWHYRdytT7b2Dj
        kgjMslNco6Chi37Pwf7D4di2hBPW9ZQgktIP3bL64A==
X-Google-Smtp-Source: ABdhPJyNiQWhYoNCf0F3oJHP1AZp6amVsA1Phbu8FglhJ4UxC5vdDHJpB6hZBnzxR6SKH//NpurnxcA9Rb97IyN/4kM=
X-Received: by 2002:a05:6402:14c5:: with SMTP id f5mr14192172edx.232.1610378132983;
 Mon, 11 Jan 2021 07:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com> <20210111144647.GY4077@smile.fi.intel.com>
In-Reply-To: <20210111144647.GY4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 11 Jan 2021 16:15:21 +0100
Message-ID: <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the repository
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 3:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 03:06:28PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 11, 2021 at 2:45 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Mon, Jan 11, 2021 at 3:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > In order to avoid any problems with symbols missing from the host linux
> > > > kernel headers (for example: if current version of libgpiod supports
> > > > features that were added recently to the kernel but the host headers are
> > > > outdated and don't export required symbols) let's add the uapi header to
> > > > the repository and include it instead of the one in /usr/include/linux.
> > >
> > > I doubt this is a good decision. First of all if the host (or rather
> > > target, because host should not influence build of libgpiod) has
> >
> > I meant the host as in: the machine on which you build and which
> > contains the headers for the target as well but I see what you mean.
> >
> > > outdated header it may be for a reason (it runs old kernel).
> > > When you run new library on outdated kernel it might produce various
> > > of interesting errors (in general, I haven't investigated libgpiod
> > > case).
> > > On top of that you make a copy'n'paste source code which is against
> > > the Unix way.
> > >
> > > Sorry, but I'm in favour of dropping this one.
> > >
> >
> > Cc: Thomas
> >
> > This problem has been raised by the buildroot people when we started
> > requiring different versions of kernel headers to build v1.4 and v1.6.
> > It turns out most projects simply package the uapi headers together
> > with their sources (e.g. wpa_supplicant, libnl, iproute2) to avoid
> > complicated dependencies. It's true that now the library can fail at
> > runtime but I'm fine with that. Also: if we add new features between
> > two kernel versions, we still allow to build the new library version
> > except that these new features won't work on older kernels.
>
> I see.
>
> So known ways to solve this are
>  - provide a header with source tree (see above)
>  - modify code with ifdeffery against specific kernel versions
>  - ...something else... ?
>
> Second item is what ALSA used (not sure if they provide a standalone driver
> anymore). Ugly, but won't require header which may be staled.
>
> Any other solutions in mind?
>

I tried to go the third way and just ignore the problem but I've
received too many emails about that. :)

I don't like the ifdef hell so I prefer to bundle the header. I'm open
to other suggestions, although I can't come up with anything else.

Bart
