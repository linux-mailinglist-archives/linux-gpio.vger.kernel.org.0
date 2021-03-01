Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8BF328BE1
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 19:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240133AbhCASlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 13:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhCASju (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 13:39:50 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15B7C061788
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 10:38:44 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w21so22119653edc.7
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKo9ExMmrHlTmongI5RfBIEyb1clP7RLxk+jvZHmVD4=;
        b=B/kqgluz4LUCIM9eXc2T4GUIkgsTm4XaeaTC4hkke5K2wxJepoied5sSGEGJghh0j2
         RAeBXpFN+1M6kWoSVdADVkgR9k6UvQHF7TIB0kYPvRVcIqTfxWk2h5XdY7g28RG3iuVB
         Ms4KMHL9nFzoWtQ80MJ/w7Fdqg8s5LQeDMaYTpAEnZtElpt86wl9C9f6IVaRKSbl+evW
         NWBLf2jWaFbQ4UdvLxjuGz8E2u2AReYmuwRpTACbnStVHzpLAm2Cx7ZJag4BLRc0i3l+
         NJ3Xzpk5LR/PzQzrSbCi8Yw0jm1lRWFGVET3g+qTxRCOJU2haNP4Ucl5IgnHhSQbkRR5
         +50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKo9ExMmrHlTmongI5RfBIEyb1clP7RLxk+jvZHmVD4=;
        b=YepKTRjmnqT0PUIOXO5jlUDW2UYbkCpYUG0IAAhF+gfNEoH5f5la2afaG9+zG1MoMo
         8397fO+u3WxpwxrQgAE/Moqgc/xs78ixiwrsVhm1EdZFwyN2QQ8r2smq1nHzu+ZzzuNw
         XO5ZU1sC5005iT8crEN1H7q8BVXU7hhLBxHjJV8PoWqnDwnjaLMkiBKmHlSX4yvsgHYE
         M491dqzF98d8kDHp2t+LldMc0w/Xlxs3Yc3LFIe5edaCEeJwEuh2nGU0j4HX+AJSI0Rn
         Y5Z/kTkz/X40Kt0Y9bGwvDO5LrgYu12J1TV3U9NstvOtgiuV/f7K2HhNv3+Nc3fudqKU
         yNfw==
X-Gm-Message-State: AOAM531fHaPbfyXaY0x3Wm0aFi6W95TehV/+6fOKJtmDYXKn3Koqens/
        MLJWBIw3uMLdnaTg/bvaNw0Xnnae6wUA4xC3VtSmWQ==
X-Google-Smtp-Source: ABdhPJx7UANxwj0FNZT+2AAuYY9GCTsUe9HtySLQBUkDygFZNi8hF2U3NNQZCx1VFjzXFBXUzxzh76B5gWo3UAAK+bQ=
X-Received: by 2002:a05:6402:84e:: with SMTP id b14mr17874087edz.186.1614623923425;
 Mon, 01 Mar 2021 10:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20210301090519.26192-1-johan@kernel.org> <CAMpxmJXfyM89vfFDQfvOU+CX5EQSp_n_UrbEYC5MP0T-0phc-Q@mail.gmail.com>
 <CAHp75Vc2NN59qxQ_5W4Uz_N6Nsrz=oKCCGUhizg1BpQuNHfmVg@mail.gmail.com>
In-Reply-To: <CAHp75Vc2NN59qxQ_5W4Uz_N6Nsrz=oKCCGUhizg1BpQuNHfmVg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Mar 2021 19:38:32 +0100
Message-ID: <CAMpxmJWNsOgasaq5UVsCnfnDxv_wjGhHY1g1wK-Bw-M12pWzWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: regression fixes
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 5:57 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Mar 1, 2021 at 11:13 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Mon, Mar 1, 2021 at 10:05 AM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > Here's a fix for a regression in 5.12 due to the new stub-driver hack,
> > > and a fix for potential list corruption due to missing locking which has
> > > been there since the introduction of the character-device interface in
> > > 4.6.
> > >
> > > Johan
> > >
> > > Changes in v2
> > >  - drop the corresponding drv_set_drvdata() which is no longer needed
> > >    after patch 1/2
> > >  - add Saravanas's reviewed-by tag to patch 2/2
> > >
> > >
> > > Johan Hovold (2):
> > >   gpio: fix NULL-deref-on-deregistration regression
> > >   gpio: fix gpio-device list corruption
> > >
> > >  drivers/gpio/gpiolib.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
>
> > Patches applied, thanks!
>
> Ooops, you are fast!

The regression broke my gpip-sim I'm working on right now so I tested it too.

Bartosz
