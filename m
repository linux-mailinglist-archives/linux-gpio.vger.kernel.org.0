Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BDB44E86A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbhKLOUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhKLOUk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:20:40 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB6BC061766;
        Fri, 12 Nov 2021 06:17:50 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 131so24005719ybc.7;
        Fri, 12 Nov 2021 06:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bya5EY6Rtb/Z58QHqc1Yqz/uwIXxrwWi+NWj4OOJwY=;
        b=SNCxVjhxB41VV0TMVB4Yb5O7A/e0usUCGDRJbA59hI9FcV75zusPXOhxjaCOHnY63l
         xzjUA9g20k45C10zi09cCdoXjAR81AdIv70h+PMiRb8d9NsnJZ11a/M6aS8JW+nfioy5
         N114uES71jHbyGZGJbBjEakxL2MohNprJZzunyBMaHQskyYH4VevvjcMg1rXOYjPtisB
         QUxVSxSHEwJZuuf4qd3TdlviYljmtNnQQH1/N2Dzabx5yEdMj2ZvTYd+OxxjT9nQryyU
         4UlwQFoDxK3IV6gX9A81XvZzmuJQux0hQc61Iygkn36ub+ogYuFlHPmev76kwgntQfJW
         /gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bya5EY6Rtb/Z58QHqc1Yqz/uwIXxrwWi+NWj4OOJwY=;
        b=TzZUqW8usNZnEVFhTuZaGTS4873kMAdcG3iOJY2JA1Y4CHT7tQgg1RNjWxoHmhKzI4
         ZatsrFqnKDkWdVFv/db2zBCleEKgrCe6uPsebwWVnKf6aasb76C4u3CpLgtu4xIytCVH
         UCeMmu6ceERRnNw8AaFj47zjqCLqqviA3bRXNTZR8/TSnCkbgVz4obpSC/8a1MuyLEiU
         E7D/7IDj0VF4138zJlhsLvzndWu7Sa3N5m5aYnkmoCRDuIJcmfA5zFR5+Nq3TEbNMKH/
         A1fXAq/SGNzl6N6+lnaUf4pLrH6lgLrmyEuBbwj8l3k1pPCgcCqXM468LEu62A56r17y
         RO8w==
X-Gm-Message-State: AOAM532ArWYBf90HolKE0o1ibd8zJkbShlqV3vdEOHS7A2Dy0bLSmy93
        9osUBMSXkXy1vMN9dQzvJz+0cLxAFNyGIEAinryBTtRNcdoayw==
X-Google-Smtp-Source: ABdhPJx/oBs4d/v2DIBjYFnAf47VgGeIBILgIJFBB1Cko+QVsxWfzKhDpObLW/8dD2e42h2j++Jm/dv4XAFL173djkQ=
X-Received: by 2002:a5b:783:: with SMTP id b3mr16220460ybq.328.1636726669394;
 Fri, 12 Nov 2021 06:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211110224622.16022-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVGeuabyQPYE2JPMzg_Kt0r-MxFr62SobQNLzFoWLo=8g@mail.gmail.com>
In-Reply-To: <CAMuHMdVGeuabyQPYE2JPMzg_Kt0r-MxFr62SobQNLzFoWLo=8g@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 12 Nov 2021 14:17:23 +0000
Message-ID: <CA+V-a8sJuYg5_aSc5toAy10YXDBe4GMcyE8xMJ+TTT0KhPCxeA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] pinctrl: renesas: pinctrl-rzg2l: Add helper
 functions to read/write pin config
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, Nov 12, 2021 at 2:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 10, 2021 at 11:46 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add helper functions to read/read modify write pin config.
> >
> > Switch to use helper functions for pins supporting PIN_CONFIG_INPUT_ENABLE
> > capabilities.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3
> > * Dropped duplicate masking in rzg2l_read_pin_config
> > * Dropped port_pin flag
> > * Dropped spinlocks around read/write
>
> You do need the spinlock in the read-modify-write case.
>
Ouch I mistook your comment of dropping the lock entirely!
> No worries, I'll add it back while applying.
>
Thank you.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl-for-v5.17.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
