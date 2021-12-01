Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D6B46535C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 17:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243124AbhLAQxX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 11:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243181AbhLAQxW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 11:53:22 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FBFC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 08:50:01 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z5so39345720edd.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uPI4oBIFvzmq/cxN+qXkO+3Ol0C4+ldQTQcUlZ5uzyY=;
        b=h4o6oUseuHo+R7dQBFWuONeo+u8cAJjURUSVX39YEE3unvYkpN1IS7sVHlHv8mY8mz
         KLrkVp1OcpoxPLysxnDx9bkM79bIlm94quw+8jcR8CsxzfKV6vFpysUOQCcME++qfuAg
         jdBOfc4BtkyLGUVDimyd3zyM4dFYwZ1/LiJWQhc9p7m3w+lyxb2P73BWMB8B8ynB6Lts
         XHlIog3DzxyUzGhmnNSccQp95KZy1Y3YUNqoKMN549Ji9FAsc/gIDUdb6oqmtUMk7mKH
         Cua+y/piRYzRNfpc+BTmxOLhmNmEZfsRNklJRprW4fFFROTmbwfV71T75cinyIPAYdH2
         s2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uPI4oBIFvzmq/cxN+qXkO+3Ol0C4+ldQTQcUlZ5uzyY=;
        b=BDxD/br48vorC+QidxKddyNXqTa8lrTqJBKbRBh66rloMBapQiWjkIOgFeIV3/cYBw
         9ttBFWOb7VLVVEongVp4/4tRbzRRRPA1cenUVoZtUiK6Lae4EsOVVUhcEHj/nTcn3cxk
         hKz7YWYdceBuDezFwFxu9r7W/KUFi5JDoylrrfCbiaGwe+JXo9+fl3wrmAJWtuxdbuvA
         MvwHufqFwwwHohkHwZ8Eb9DA4qaLceHczHjX25f4DKHnzW+xeIlZZMwT4+rij4OcXfyX
         n2GzNYIb5460dB8U5n67MSBDuT69LMcfdbuxOJ+GGF1eBnO/wEXsjEE7rlGV7QcVXYfO
         k6Aw==
X-Gm-Message-State: AOAM532OKOQiRwkEAdh2hCXWRNQ4Ox3d6/C8NpgbKyMB257i2ZkC6eLB
        JdIF06GrDXl/s3ZtNyYeotilTjxL57I0UBgu2Ohdr7SEuHcSNQ==
X-Google-Smtp-Source: ABdhPJzilbO4wo997n2KLZ16KakyutryIaX6yq69R5OPEaN1MxAcCu+/t2m3sY3mODn08j1cGyYIIg/otYi3XTlLIDY=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr8619925ejc.77.1638377399579;
 Wed, 01 Dec 2021 08:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20211130195817.2911086-1-robh@kernel.org> <CAMRc=Mc-8--9+N2uGWhY6whwuJKCg1jtnnTYyQJifdSS2Um+qA@mail.gmail.com>
 <CAL_Jsq+4a3FTW1yrM_PjX3_eDwb=Y6GV7PgpxyFiDVARTg5_Ug@mail.gmail.com>
In-Reply-To: <CAL_Jsq+4a3FTW1yrM_PjX3_eDwb=Y6GV7PgpxyFiDVARTg5_Ug@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Dec 2021 17:49:49 +0100
Message-ID: <CAMRc=MeK-q6sb093Jz8mtVrAQfe6G_NXry+tq86GQ1CVGRvyng@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: xlp: Remove Netlogic XLP variants
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 1, 2021 at 4:01 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Dec 1, 2021 at 2:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Tue, Nov 30, 2021 at 8:58 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
> > > support"). With those gone, the single platform left to support is
> > > Cavium ThunderX2. Remove all the Netlogic variants and DT support.
> > >
> > > For simplicity, the existing kconfig name is retained.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Cc: linux-gpio@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v2:
> > >  - Fix !OF and ACPI build errors
> > >
> >
> > Rob,
> >
> > This doesn't apply on top of v5.16-rc1. Anything I'm missing?
>
> It should, that's exactly what it is based on. You dropped v1 that you
> already applied?
>
> Rob

Ah right, didn't see that. Can you send a follow-up that applies on
top of my for-next branch?

Bart
