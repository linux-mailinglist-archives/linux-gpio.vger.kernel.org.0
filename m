Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0422BA5DD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 10:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgKTJUD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 04:20:03 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42842 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbgKTJUC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 04:20:02 -0500
Received: by mail-ot1-f67.google.com with SMTP id h16so8110754otq.9;
        Fri, 20 Nov 2020 01:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJewUHE6p75+965cQeTlDxzQfBBQUhBARXGnHtZ1RKs=;
        b=nIOW5+84oL3e59Ld+Pfw4xcI6ODL4+25O7uoC9gOGNnap6jbVja3wM58NLkA/VejXB
         mSQeJGQ+lDWIK9D4oXFRKZy1rc5isxHfJfDc4yK/ivp3GLJrJrLedg44fIJi8Cqf8ODa
         Q3+1ZM4NapGrhZ9zwnxVo139eeMOV3KaYnDsRrP1VPOSTj92J5vTneUwmefFrVuOWH4V
         +hVhJlMgL4YNQClDVDuNqUQoZkO9GDfaSHpfwLt5FXJc27mmQpdQD+DfgIjba7wDvSEP
         uBM7IwDCX9Y2yX6jHIUpAPtK7L9SbukjXt0SBmO1kPzg67jSufknegx2QsGkBjtWziyL
         786g==
X-Gm-Message-State: AOAM531GBGvwLX6SXPWe6MvozFbwGGw5ORT9XeBMYVH51LhX1SC6v40L
        fdls+/XToC72ZkvICsaW9h6DR2RZPsFxAV8Co/o=
X-Google-Smtp-Source: ABdhPJzUE8HiH1psIqepcRhPknSJzKsbMSeAQxAK7iqXJKiphnCemDbPYUyB4q3DQIbwSDvH3Zhh7X2OujFlq0SP+HU=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr13492885oth.250.1605864001782;
 Fri, 20 Nov 2020 01:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201119130926.25692-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201119130926.25692-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 10:19:49 +0100
Message-ID: <CAMuHMdUGqkqZVY9YZ1Xo=uq_4kn3ybh50VMSNBCLOSKWyDd3kw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: renesas: r8a77990: Add QSPI[01] pins, groups
 and functions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 2:09 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins, groups and functions for QSPIO[01].
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11...

> --- a/drivers/pinctrl/renesas/pfc-r8a77990.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
> @@ -2810,6 +2810,57 @@ static const unsigned int pwm6_b_mux[] = {
>         PWM6_B_MARK,
>  };
>
> +/* - QSPI0 ------------------------------------------------------------------ */
> +static const unsigned int qspi0_ctrl_pins[] = {
> +       /* SPCLK, SSL */

... with the missing QSPI0_ prefix added...

> +       RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 5),
> +};
> +static const unsigned int qspi0_ctrl_mux[] = {
> +       QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
> +};
> +static const unsigned int qspi0_data2_pins[] = {
> +       /* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
> +       RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
> +};
> +static const unsigned int qspi0_data2_mux[] = {
> +       QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
> +};
> +static const unsigned int qspi0_data4_pins[] = {
> +       /* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
> +       RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
> +       /*  QSPI0_IO2, QSPI0_IO3 */

... and the bogus space dropped.

> +       RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
