Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2B8565A33
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbiGDPom (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiGDPo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:28 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB7112D1F;
        Mon,  4 Jul 2022 08:43:44 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id c137so7025403qkg.5;
        Mon, 04 Jul 2022 08:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1vjGr45PtOxntoTDPs0iM06s3V7Tae/XJ0lCZiCcjHo=;
        b=iALqq/a52HiM8zXgxi7dvnbNQLtlmH5ZExSvrKbWolz4ZwRRkYukair9tAKwUBGkbE
         k7YufNJoGYzHpGMFahF/Fu+BwknD3U2E52YNF4n0x5jxAYt7QcgQbAelkc9i8NJ6fxXz
         su2BRYqL0bNdVVLB3X2lXc10CMA4naDpgRg+q9t6Fjhbz8/7GU9/C2vGdnpcjvWwQfPo
         oqFez8N318ZHUEqPZFOoqRJoZ7Cq/JTRXmgptRiAteFtlkqjuIIvxYo8FlzKDNYn6fUp
         BW0uc4vDkO16ojC38Jo9pI8tVmsdO8e1hOWaSCvcTqZxAECU/Er3uwkQLMmuGByfG/w/
         jEKA==
X-Gm-Message-State: AJIora8rXDGwaJRDqt5l5v3/EsIdxta+kn9jiL5jcMBM+mOFTArXW/uc
        91tHG+qpTrnLikKyldvZsNc4T0YJX70TGFhY
X-Google-Smtp-Source: AGRyM1s0G6fcQ1kw8AWTI+FGr8VN4j0DH1sE7L8qqICOBBUidyyB7VgIDRuvrS7TI8699UfXgPPaiQ==
X-Received: by 2002:a05:620a:b05:b0:6af:2281:6cd5 with SMTP id t5-20020a05620a0b0500b006af22816cd5mr20087899qkg.85.1656949422954;
        Mon, 04 Jul 2022 08:43:42 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id q8-20020a37f708000000b006b1fe4a103dsm10698869qkj.51.2022.07.04.08.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:42 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id o2so12255155yba.7;
        Mon, 04 Jul 2022 08:43:42 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr16112405ybu.604.1656949422324; Mon, 04
 Jul 2022 08:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <8735fltxwg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8735fltxwg.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXE8KG_nqXyMkNxMXvxs4EMY-Yt5bZ5_f0P0tK=sLfSNA@mail.gmail.com>
Message-ID: <CAMuHMdXE8KG_nqXyMkNxMXvxs4EMY-Yt5bZ5_f0P0tK=sLfSNA@mail.gmail.com>
Subject: Re: [PATCH v4 10/23] pinctrl: renesas: r8a779g0: tidyup POC1 voltage
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Fri, Jul 1, 2022 at 3:38 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> According to Rev.0.51 datasheet 004_R-CarV4H_pin_function.xlsx,
> GP1_23 - GP1_28 are 1.8/3.3V. But it aren't on Table 7.28.
> According to HW team, there are no bit assign.
> This patch follows HW team's comment.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -17,7 +17,14 @@
>
>  #define CPU_ALL_GP(fn, sfx)                                                            \
>         PORT_GP_CFG_19(0,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),  \
> -       PORT_GP_CFG_29(1,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),  \
> +       PORT_GP_CFG_23(1,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),  \
> +       PORT_GP_CFG_1(1, 23,    fn, sfx, CFG_FLAGS),                                    \
> +       PORT_GP_CFG_1(1, 24,    fn, sfx, CFG_FLAGS),                                    \
> +       PORT_GP_CFG_1(1, 25,    fn, sfx, CFG_FLAGS),                                    \
> +       PORT_GP_CFG_1(1, 26,    fn, sfx, CFG_FLAGS),                                    \
> +       PORT_GP_CFG_1(1, 27,    fn, sfx, CFG_FLAGS),                                    \
> +       PORT_GP_CFG_1(1, 28,    fn, sfx, CFG_FLAGS),                                    \
> +       PORT_GP_CFG_1(1, 29,    fn, sfx, CFG_FLAGS),                                    \

Oops, one pin too many (29 != 23 + 7).
The checker would have told you:

    Pin 61 is not in bias info list
    WARNING: CPU: 3 PID: 1 at drivers/pinctrl/renesas/pinctrl.c:852
rcar_pin_to_bias_reg+0x54/0xa0
    ....
    r8a779g0_pfc: pin GP_1_29: SH_PFC_PIN_CFG_PULL_UP flag set but pin
not in bias_regs
    r8a779g0_pfc: pin GP_1_29: SH_PFC_PIN_CFG_PULL_DOWN flag set but
pin not in bias_regs
    r8a779g0_pfc: pin GP_1_29: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set
but not in drive_regs

>         PORT_GP_CFG_20(2,       fn, sfx, CFG_FLAGS),                                    \
>         PORT_GP_CFG_13(3,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),  \
>         PORT_GP_CFG_1(3, 13,    fn, sfx, CFG_FLAGS),                                    \
> @@ -3650,7 +3657,7 @@ static int r8a779g0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
>                 return bit;
>
>         *pocctrl = pinmux_ioctrl_regs[POC1].reg;
> -       if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 28))
> +       if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 22))
>                 return bit;
>
>         *pocctrl = pinmux_ioctrl_regs[POC3].reg;

The rest is fine, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20, with the offending
line dropped.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
