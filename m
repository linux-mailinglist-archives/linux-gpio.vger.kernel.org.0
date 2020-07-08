Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A51B21861D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgGHL3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:29:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44795 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGHL3k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:29:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id 5so34645064oty.11;
        Wed, 08 Jul 2020 04:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aZWkJZPjmEGu6QkrDQRtpdm9RrmV8YXuY6RJVeoloW8=;
        b=STCWbR+jcfM8TA721ZniP1oimrI1qnot3QVzWayL41ym8IT+OC6lIHBdRimye2hPi4
         ILcAIQbucHw4karzYQOuulnXg9WkSqtILho3WayDmSpiGbsSqN8G3kCZnsjtpWxuUWyp
         9Aeq1+VqLtBaTDb++4PVYJQcL2L1QOdKfAr/jZBC2hYm97mDlzR9sjEEj7aMuHRcU9yP
         y6mH8hRg+Z7c73Ua80uflv35lQx1VKXtcakxhMH23LFiRhIzlcI4XdceKVIOToLK7kQo
         vO2228oP9zEi9ePvr3rC1ntiLGceGksg7yZX5nW6rI/aWnF/89kWF0HsBbSa4N6LM/fc
         p8Ig==
X-Gm-Message-State: AOAM530Kg9nVeRjQSg2VM/JhSgcj/hzv7NLhDvbjvB5xEq9CDAgImC8I
        Nm3WY42KLpo89bM0XVALLzdH7SwQPsID1koQTsA=
X-Google-Smtp-Source: ABdhPJzfw4e0G7JAOL/fQ/heiizmgAtMS6QL3JhbQJM5wIiE1u6EnJgspqcckTPH5Og3nDusyLxev6j7HbyXZXG6Ykg=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr46434915otb.107.1594207779612;
 Wed, 08 Jul 2020 04:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 13:29:28 +0200
Message-ID: <CAMuHMdWQHnGJCu6zYQwG16xqQmAaQdBTfyw6T1q2OHF3uR-JQQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] clk: renesas: cpg-mssr: Add r8a774e1 support
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
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Tue, Jul 7, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add support for the RZ/G2H (R8A774E1) SoC to the Renesas Clock
> Pulse Generator / Module Standby and Software Reset driver.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.9.

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c

> +static const unsigned int r8a774e1_crit_mod_clks[] __initconst = {

As per commit f23f1101ad0ef1ac ("clk: renesas: rcar-gen3: Mark RWDT
clocks as critical"), I'll add a line

    MOD_CLK_ID(402),        /* RWDT */

while applying.

> +       MOD_CLK_ID(408),        /* INTC-AP (GIC) */
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
