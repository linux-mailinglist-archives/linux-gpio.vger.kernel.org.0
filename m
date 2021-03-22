Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8146B3448E7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 16:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhCVPLf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 22 Mar 2021 11:11:35 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:42927 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhCVPLU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 11:11:20 -0400
Received: by mail-vs1-f47.google.com with SMTP id b5so7633912vsl.9;
        Mon, 22 Mar 2021 08:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4E/nKu74XytERfpDMiR2UM7PmGorcNB1R+b1r8XO1jg=;
        b=e5fJ7sUypC93sQQZhtG39RpJQaSY/cekdDeHjB7mYHarZ4+b06+DXRBKFG4zjFFKle
         enz3ygqAj7bDPgakKY4qWgTzapZFlJvFmJU5sYUzWgnUySW/rhMr+osnnyLbLddhj5Xt
         NRpeB6XxGKH1cxyd6Gi4beGHb/cRIfl4/Optx0yT7AMru23O0L/nqirg/Gu3GE5qrVpE
         U9gvlY2FMn6p4KDnAbmjRTPa7Yfikfl1F4+gYSs4fwyf39CPFYWGcG+B/ikE26w84Yk3
         MLlIwIpBol4GBxCotJknHdy+1JVghsKaGwiWJWG2aD06SpuobkUxs/PAPW0nMCcIXS1A
         0F1g==
X-Gm-Message-State: AOAM5300nBhikpHoq0CeIhr7Mf4K1OUdeGeBJsyEHEUAylG9oh0TWjq9
        TgRYofHHoh9F2D9AWkNRYV038u8Syfa6tkTBW04=
X-Google-Smtp-Source: ABdhPJwbSwGUUEZfNXV2g6ccCJnGAAOOG+ZuHP4su3V26U9cBRrOrY/TwPbPOpTtFEudv6TXc6+2KFE77/s1PyDLLlg=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr223005vsp.3.1616425879745;
 Mon, 22 Mar 2021 08:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210303132619.3938128-1-geert+renesas@glider.be>
 <20210303132619.3938128-6-geert+renesas@glider.be> <YFiyvr30r6O6qFgH@oden.dyn.berto.se>
In-Reply-To: <YFiyvr30r6O6qFgH@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Mar 2021 16:11:08 +0100
Message-ID: <CAMuHMdXVeJC74tGrOER+aJpV5q373inQVEK_N1N=4cKQiQgN_g@mail.gmail.com>
Subject: Re: [PATCH 5/6] pinctrl: renesas: Add support for R-Car SoCs with
 pull-down only pins
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Niklas,

On Mon, Mar 22, 2021 at 4:07 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2021-03-03 14:26:18 +0100, Geert Uytterhoeven wrote:
> > Currently, the common R-Car bias handling supports pin controllers with
> > either:
> >   1. Separate pin Pull-Enable (PUEN) and pin Pull-Up/Down control (PUD)
> >      registers, for controlling both pin pull-up and pin pull-down,
> >   2. A single pin Pull-Up control register (PUPR), for controlling pin
> >      pull-up.
> >
> > Add support for a variant of #2, where some bits in the single pin
>
> s/bits/bit/ ?

I think there can be multiple, in the generic case.

> > Pull-Up control register (PUPR) control pin pull-down instead of pin
> > pull-up.  This is the case for the "ASEBRK#/ACK" pin on R-Car M2-W,
> > M2-N, and E2, and the "ACK" pin on RZ/G1M, RZ/G1N, RZ/G1E, and RZ/G1C.
> > To describe such a register, SoC-specific drivers need to provide two
> > instances of pinmux_bias_reg: a first one with the puen field filled in,
> > listing pins with pull-up functionality, and a second one with the pud
> > field filled in, listing pins with pull-down functionality.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
