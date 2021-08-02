Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074063DDC33
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 17:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhHBPS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 11:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbhHBPS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 11:18:27 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6C7C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 08:18:18 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id m193so14377330ybf.9
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJ1uiAC38lCN+0H0I78DV/eCZT2iUHzDU8u0RM5YfYA=;
        b=pLsXyILmbXYu2do4b3rFmOGziHdYL9UNQsLwfWZyIetia3BQXACnMYlnj+w/1n+aQA
         PFI0mcGUUdVZXRHfFcjwxW2VAuIsf+eLw9zJMbxZ8hwm2Q0wXaGL5pVKD87obS90lRNV
         dYc0O1b16aaO+HJzeUBovtx+VPXSgMEz1WswnBz8wX+sdqrj+5dmaG+xc697O9Uzsqst
         UL9fiAWod1DwjvbInUypjuVY0wgmAfrfO79W/OY2gLX+qg+GdWZWSqpLm/YHDguYIRSE
         IIHzDdo7snt30Yil82D/0tRxuX5F2xSi8tutLG0bc/N5UGaix3U3MDVG96qaZ5V7xbc3
         PiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJ1uiAC38lCN+0H0I78DV/eCZT2iUHzDU8u0RM5YfYA=;
        b=G68VyNBCNwksDO8xUmP6rfQiMSjV+/FXgOMK/PRh1JQHmHptQDR33RxFHmSqxdEd9r
         BVD2b/rz+TcUVWUmPhhjk6+7Xb++NHDx0HRWawkIwe+qNPQvLZu2QIGD+oFu64gfjC8m
         IeNk0ijHMt+iSRaVMjCo7d2gSEucsrZx0NALRWlfGon+SlcoD7qelq0zN0dqXEHy76iD
         5c+R2mlFrf5pK3dOPYHeOXkasY3wjJblS1dDW0xdk7QSeMTnsmEBcqFx7YvznbicJvpk
         T2R5d2UzVGgKIipHNc3Lqokzpx61OuM0rVUQYwbQ8QjP4Ed1o4OEjy0lxHXSDeOzdQWC
         XxEQ==
X-Gm-Message-State: AOAM533G9lYmROaigHeGULLCeRePIdDUMUDALzrQ8kIye6c2JRL39qL4
        VODbFmW5JUT3e8dupgVOGJvQhNy+Fps2DY1ZWoatMg==
X-Google-Smtp-Source: ABdhPJzGzA4UnM5kRs1UQzFPL8q8WFiZ1p+oa8e0d56G3jdfg33oeS336bhtiTKKz9AVqUc9Dh88DIfJc5L8qiLA+G4=
X-Received: by 2002:a25:505:: with SMTP id 5mr21859792ybf.157.1627917497620;
 Mon, 02 Aug 2021 08:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
 <34be64092b7b4d0c75085a8c729f5f6fcfb56b61.1626429286.git.matthias.schiffer@ew.tq-group.com>
 <CACRpkdbaE+07ZZigct+JS-MU79U_D2nC82a-LcXm93KW5+xA_A@mail.gmail.com>
In-Reply-To: <CACRpkdbaE+07ZZigct+JS-MU79U_D2nC82a-LcXm93KW5+xA_A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Aug 2021 17:18:06 +0200
Message-ID: <CAMpxmJUdsqYd6P54fdJyigbvDsu8P9QmgVBO06b40YksjArYXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] gpio: tqmx86: really make IRQ optional
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Lee Jones <lee.jones@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 6:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jul 16, 2021 at 12:01 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
>
> > The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
> > causes warnings with newer kernels.
> >
> > Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
> > missing IRQ properly.
> >
> > Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >
> > v2: add Fixes line
> > v3: no changes
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I suppose Lee will merge this into MFD with the rest of the patches?
> I don't see anything stopping Bart from just merging this one patch
> into the GPIO tree though. Only runtime dependencies.
>
> Yours,
> Linus Walleij

I applied this patch for fixes and will shortly send a PR with some
other fixes to Linus.

Bart
