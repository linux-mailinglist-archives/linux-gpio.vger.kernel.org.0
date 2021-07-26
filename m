Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF2D3D60B0
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 18:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbhGZPXy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 11:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237655AbhGZPXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 11:23:43 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32373C061764;
        Mon, 26 Jul 2021 09:04:12 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id g76so15661213ybf.4;
        Mon, 26 Jul 2021 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sonZ5IE9LRRm77PBdwLAm4WORGREpWH9VgasbjikKzc=;
        b=eh06G0zViH3jME560MP6yWXcJk2GN/59qpQ3LnX8rJj2eMalTAMbXKWEwjO/qjvWyO
         ww7xNWA18B9+mTwfte3iYiH01qhWYxFgSw5tozlL5yCS4PCWFGIhfioGurqkM3Rqo/ZT
         JS5AV37V+SwFzkBxBayokEXJ8o+/Q1PzNZzxQ5TBYWFkUIevZGIUYiuWr37+D/gr8f7i
         HFoBhxS/p2A/Z1dT3oVWBGllnyz7j2YHa5PJxi2duRV0mevN7tRjKcz3Io38QR3XmuiQ
         RkOPVPF12D4RXlOQin4mcHBJBHgetW5MypS8rzNYENyDQifsDIYolsVDElHvDx4YMbUB
         A85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sonZ5IE9LRRm77PBdwLAm4WORGREpWH9VgasbjikKzc=;
        b=XbzAAoNN9VJxUEuFlxdxdStPFffq4bbn7Ghvk2k9MMADSjGBs3yodH0yMI05LC8hAg
         boosnDgdLwQ+WnUcZ+u1C6XC5eTACgiCPkMxaZjZ9/JxgLrOhHO3qWr2idD5orWTG9LK
         q3V7rpAG7V6LTatvJccJABhzqwXVeLClvMEsTH4wQfcdbPTmTdqUd++y5C8wkiNRlXDi
         1R6APrCNtdOZHMxAP9vmHNa2BvCaqUNtaPvZ2r/hMO05lM3JuZ2M3csWTwhfXfQTZzhd
         7vmdfq9bFWx1c1yeONTblhl057KBxfMRJE6ZkN4fN/fgOqZs6OcW2ESvBVHXPLDeRvg7
         uZag==
X-Gm-Message-State: AOAM5322ddPre/B6vP39Uifkk2ZRjK5c7yBkMhHZ9BNmAYdpLiW/yx7p
        YB5HfjAesAqBNyRFjIrAqDFVeOabAILEXPxbELM=
X-Google-Smtp-Source: ABdhPJy8a/Sf7kkGFjriNN9jRciI6nS8EFYeeWEqeDrEnwt/B2AGG84WkhjzRxtsyQMOAFl9Eo5axFqTvTZvPLyF/SA=
X-Received: by 2002:a25:ba44:: with SMTP id z4mr4896024ybj.476.1627315451386;
 Mon, 26 Jul 2021 09:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210721191558.22484-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWD+p7w2_KSsM-sYoZfK-7z4BM7yXAOf+5amxkmq4xvPg@mail.gmail.com> <CAHp75VeV0BsgdStTAiH6uwb4FKG4XQg7NqODw7523+s=SS6Fag@mail.gmail.com>
In-Reply-To: <CAHp75VeV0BsgdStTAiH6uwb4FKG4XQg7NqODw7523+s=SS6Fag@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 26 Jul 2021 17:03:45 +0100
Message-ID: <CA+V-a8t82VBJLTHx0KoShi=+ovoORg1e9wgg16UDjL1NpNtrWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: renesas: Add RZ/G2L pin and gpio
 controller driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thank you for the review.

On Mon, Jul 26, 2021 at 2:35 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jul 26, 2021 at 4:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jul 21, 2021 at 9:16 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> ...
>
> > > +#define RZG2L_GPIO_PORT_GET_PINCNT(x)  (((x) >> 28) & 0x7)
> > > +#define RZG2L_GPIO_PORT_GET_INDEX(x)   ((((x) & GENMASK(27, 20)) >> 20) & 0x7f)
>
> It's funny one of them uses style "a" (no GENMASK() use), another
> style "b" (GENMASK() is in use). I suggest being consistent: either
> drop GENMASK() everywhere, or use them in all suitable places.
>
Will use GENMASK() everywhere to be consistent.

> > > +#define RZG2L_SINGLE_PIN_GET_PORT(x)   (((x) >> 24) & 0x7f)
> > > +#define RZG2L_SINGLE_PIN_GET_BIT(x)    ((((x) & GENMASK(23, 20)) >> 20) & 0x7)
>
> Ditto.
>
As mentioned above will use GENMASK()

Cheers,
Prabhakar
