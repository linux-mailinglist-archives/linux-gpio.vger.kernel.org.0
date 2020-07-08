Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E055A218DA2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 18:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730402AbgGHQ4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 12:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgGHQ4f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 12:56:35 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB43FC08C5C1;
        Wed,  8 Jul 2020 09:56:35 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 12so31870906oir.4;
        Wed, 08 Jul 2020 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qZmo9U5aXUZDGkqB26q7sUeeEzOZwLyZGd7ARaA8d54=;
        b=csGaN8X3gJ3gBxU3gPZD9ntGLA/y+1SAjQ7SiWOKwGzlFsI1NiGdNrzmqU1Po9Rt0T
         S818ZXcfQYwH13Jmr082uT1HcUeVaCcANOGF2uByM7GCAeaXov6rorHpilfVoVE8WVIr
         cNaw8aV6fFlVjXhUx20qKVUI3/xOcO1hbWetbeUmN3Auqxp0mSPdzKKsm1yfATtOUvfZ
         M8bEWNp5NcTP4S5I7xreICMs3aTRRRtYiCH6LRc61UzuOL3Y/iJU8hxv1Uxf/epXsNA9
         5w6Il6sM2glxaLyl6LxqX9FNrwpgf6JBCR4nMSEq4iNJSiKKA3lEMFknGafDHegmo1uV
         uIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qZmo9U5aXUZDGkqB26q7sUeeEzOZwLyZGd7ARaA8d54=;
        b=QAUJAuAx63ooi57/VzAUagDtR+2lBgABNOMi/MGf95nSjZmkfiKX9K00sV+E1ekcdK
         bOZi4hwvcwWXPlLcfuyVtw0rASzsMtZ1a9U+16DrO29h/N3jOlgkf205weEhVU5Gw5dv
         vhG0QQvJeBlpSuFupyav37nuSmtQRDCI/WR+8Kt2cCLwnXMioUi6Vs23s6ia5XNVNKFN
         EMhBwtEvuwZDPgyXcyOU22fOuyNPgkfC08VlJW6aHU4aWdNIZfjGm7ggt9rjNi+FSETr
         hp3ynbyQcUA0JwR3yhP+uwD1AXT8rk6TGSfr0GoaqBe/tbDY2IwN1ZPk7+f+KRvqFei7
         Pq0A==
X-Gm-Message-State: AOAM533A1DwhqxT2CW2qlfl8T3SkyF3jnTHUo6AaN+llzMSeeNfLhsbJ
        2TPKKwOwFLTVq85fZKrUo+UKw94ou61awSO8K/g=
X-Google-Smtp-Source: ABdhPJxkeMfA/rVy+3SHKGbcPciz/z+GsVPQFvXGJB1w64YRbQ8QzM8XeW6dvu8cJmDU6/eE92nBVFE+t2LzbkOKaXU=
X-Received: by 2002:aca:4fd3:: with SMTP id d202mr8216944oib.142.1594227395102;
 Wed, 08 Jul 2020 09:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWQHnGJCu6zYQwG16xqQmAaQdBTfyw6T1q2OHF3uR-JQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWQHnGJCu6zYQwG16xqQmAaQdBTfyw6T1q2OHF3uR-JQQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 8 Jul 2020 17:56:08 +0100
Message-ID: <CA+V-a8u266t41-SzURjEvsLLgA1j2YCg9egoszZ9XQcqhJuU3A@mail.gmail.com>
Subject: Re: [PATCH 12/14] clk: renesas: cpg-mssr: Add r8a774e1 support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Wed, Jul 8, 2020 at 12:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jul 7, 2020 at 6:18 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Add support for the RZ/G2H (R8A774E1) SoC to the Renesas Clock
> > Pulse Generator / Module Standby and Software Reset driver.
> >
> > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in clk-renesas-for-v5.9.
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
>
> > +static const unsigned int r8a774e1_crit_mod_clks[] __initconst = {
>
> As per commit f23f1101ad0ef1ac ("clk: renesas: rcar-gen3: Mark RWDT
> clocks as critical"), I'll add a line
>
>     MOD_CLK_ID(402),        /* RWDT */
>
> while applying.
>
Thank you for taking care of it.

Cheers,
--Prabhakar Lad

> > +       MOD_CLK_ID(408),        /* INTC-AP (GIC) */
> > +};
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
