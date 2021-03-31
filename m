Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B349335064F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 20:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhCaS3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 14:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbhCaS3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 14:29:38 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B1BC061574
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 11:29:37 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id v107so17160154ybi.9
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2jQTnecP2FoklA04onryTnkX7RD4TLimO6NvlAanGU=;
        b=ErRuAAy/bx50uFBM/WS6oiOyBGx0gDr6lpV433S8QMDvg/bLPoMzuvx3J+nF2p3Ga9
         asyKWy0fI0TnCsgVyVpeC+qYCi1G6HTC+cxex93z2u96IG7bOR1ofkBlKAgdCDHRxGMz
         mePXajUbOYTCc4/Jl37HiW8O7gYRzLcfXb9EL5RjQrHbw6mG7Npa00smn5bZlsQe0IZB
         8JN3RkYsIm0qUb5foxe2C6baZKj7+cthaEcHcGbeRNKb7HS00hO1dVeu3UQIkrG1YBwF
         HsPWQAaoLhMlSWWFFx41hE0XD/Okes2Lmm0i+WQDPEAjRrxRATtMTlpiUnTb6YE8Vxto
         zSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2jQTnecP2FoklA04onryTnkX7RD4TLimO6NvlAanGU=;
        b=ETlPRP6IBqsu1pTl+5J7opcyzksYeXvsyL4Hh2NlIaZ0Rk9HyLkBjZLXlAK0YBfMGB
         CtGraEzqTOobkWz+cBkhJktVhUguY88cVZuQvJPPcyD7JPOy/Fy51sO6YvV8CUUZgLDX
         7NfgcgkaVqr13C46k2CAkCIXQT93rqZxU5daXofnFJXzvzeGH1U7MnwQ9uQpBm0Ie3Lv
         r4i49LLxxlnvXqRQxrGqzHyU/MKlTPec9/ySFDdhsdosKOVIROt8LUX/aGUWsyVTNe51
         6qPx14zctVSigwFabGSyMTtg44v3nHXxEx4A8nhCyBbChW1q4+9ffn5GKC1+/VsvmrZV
         3Ahg==
X-Gm-Message-State: AOAM533flemgRCd2f6xd/lfWhXS+3Yz5hh95OQbz87Chj3KMMFRnmqy0
        1FsxrpDtMgkj6wIsOTFOxPBCfVMkZ4H1BOsIoGDv/+CxGtk=
X-Google-Smtp-Source: ABdhPJyxdYFEdUCe0ghJ4LhNnigtSAp+W383ktXXxJT5l/nKeUbuBHMOnT9rzC5SjlDmopmGbDllxW21AEHaoqxFHsk=
X-Received: by 2002:a25:d2d3:: with SMTP id j202mr6436313ybg.157.1617215376457;
 Wed, 31 Mar 2021 11:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMpxmJVKmBp06_2Hd4XF-eL4KfgZFy1o+xUvvs6H=TaAnkmYhA@mail.gmail.com> <CAHp75Vcsw8uQOL9RAxOU3jeq4mGAiK3cNMYbKyWGe7F8Dz2dZQ@mail.gmail.com>
In-Reply-To: <CAHp75Vcsw8uQOL9RAxOU3jeq4mGAiK3cNMYbKyWGe7F8Dz2dZQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 20:29:25 +0200
Message-ID: <CAMpxmJXL=_8MBwb0Dy4d8vKM8SCbzyXJaE78azo1Es8hY7mN7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: Obey valid_mask
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 2:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Mar 31, 2021 at 10:58 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Mon, Mar 29, 2021 at 1:41 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > >
> > > Do not allow exporting GPIOs which are set invalid
> > > by the driver's valid mask.
> > >
> > > Fixes: 726cb3ba49692bdae6caff457755e7cdb432efa4
>
> I have just noticed that this is invalid format for the Fixes tag
> (luckily, haha, due to a blank line it's not recognized as a tag!).
>
> Matti, I highly recommend to add in your .gitconfig file an alias:
>         one = show -s --pretty='format:%h (\"%s\")'
>
> Bart, there are real Fixes tag issues from another series. I will
> comment there as well to let an author know.
>
> --

Eek, sorry I should have looked more carefully. I'll fix it in my tree.

Bartosz
