Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEFA21831E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgGHJIH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:08:07 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37975 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgGHJIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:08:05 -0400
Received: by mail-oi1-f195.google.com with SMTP id r8so37219670oij.5;
        Wed, 08 Jul 2020 02:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ifhTbenHl4MBKv4jBLn2jEdTHksRw2S6+cnmDHE1U4=;
        b=UV02i6C6Qp3XK7gdGefrk3V/02ouj1GbecjPdyNZ+DFwsdiRkkkhhy+CD+se70RbHl
         pOvnQ7DGJqfJGtwxJrqmSL0bgzNgJs9FDvya/+WZ9GJ6xW+Lyks3rLBgupj3E37+H0hr
         oc8vHEQl5MEBPTwqDtavZjUCS+hrPFecwCyEln6SmlC2CvnNqDxQVOr0QyAxRhTVzwUk
         TJFWv0QyM6E1sDrrz3l+3IjCrxoF0T41e+9O6m13QPOdZpq535ip8+PTaeviL71b3G/J
         MZFTX27QUq1r4J8MQYjH2ebE7J5RMGxOREChf6ym0A5yPMeyBbL7KDqSJWAKkXb06aju
         a1FQ==
X-Gm-Message-State: AOAM531WF7+8bamp2IXkugKtmFJtkx/Bgy9VWjgUO1EZjoHswXySR3So
        iq2Zm4LZVey1ha66qsrhMq4hfxt4WKpYO+xX4Lg=
X-Google-Smtp-Source: ABdhPJwwWyEJLxoYPh5RcN1bL2Wsn47wKpNZSb2k3Td2MU09jjQfJ9847L9jUzg5coiVRc1bcKgI9oGBm2HZFLW42vs=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6127594oib.148.1594199284723;
 Wed, 08 Jul 2020 02:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <1594138368-16449-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138368-16449-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138368-16449-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:07:53 +0200
Message-ID: <CAMuHMdWLp+KHD=kco=AoM94a_D+qAiscyJkv57WoyDGGZM6WXA@mail.gmail.com>
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document RZ/G2H SoC DT bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 6:14 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add device tree binding documentation for the Renesas RZ/G2H (r8a774e1)
> SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
